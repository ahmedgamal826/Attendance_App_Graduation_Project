import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:attendance_app/features/assignments/models/question_model_student.dart';
import 'package:attendance_app/features/assignments/models/student_assignment_response.dart';

class StudentAssignmentDetailViewModel extends ChangeNotifier {
  final String courseId;
  final String assignmentId;

  List<StudentQuestion> _questions = [];
  bool _isLoading = true;
  bool _isSubmitting = false;
  String _errorMessage = '';
  String _successMessage = '';
  int _currentQuestionIndex = 0;
  bool _allQuestionsAnswered = false;

  // Getters
  List<StudentQuestion> get questions => _questions;
  bool get isLoading => _isLoading;
  bool get isSubmitting => _isSubmitting;
  String get errorMessage => _errorMessage;
  String get successMessage => _successMessage;
  int get currentQuestionIndex => _currentQuestionIndex;
  bool get allQuestionsAnswered => _allQuestionsAnswered;
  StudentQuestion? get currentQuestion =>
      _questions.isNotEmpty && _currentQuestionIndex < _questions.length
          ? _questions[_currentQuestionIndex]
          : null;

  // Constructor
  StudentAssignmentDetailViewModel({
    required this.courseId,
    required this.assignmentId,
  }) {
    _loadAssignmentQuestions();
  }

  // Cargar las preguntas de la tarea
  Future<void> _loadAssignmentQuestions() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      // Obtener el documento de la tarea
      final assignmentDoc = await FirebaseFirestore.instance
          .collection('Courses')
          .doc(courseId)
          .collection('assignments')
          .doc(assignmentId)
          .get();

      if (!assignmentDoc.exists) {
        _errorMessage = 'Assignment not found';
        _isLoading = false;
        notifyListeners();
        return;
      }

      final assignmentData = assignmentDoc.data()!;

      // Obtener las preguntas
      final List<dynamic> rawQuestions = assignmentData['questions'] ?? [];

      _questions = List.generate(
        rawQuestions.length,
        (index) {
          final questionData = rawQuestions[index] as Map<String, dynamic>;
          final QuestionModel adminModel = QuestionModel.fromMap(questionData);
          return StudentQuestion.fromAdminModel(adminModel, index);
        },
      );

      // Comprobar si hay una entrega anterior del estudiante
      await _checkPreviousSubmission();

      // Verificar si todas las preguntas han sido respondidas
      _updateAllQuestionsAnsweredStatus();
    } catch (e) {
      _errorMessage = 'Error loading assignment: $e';
      print(_errorMessage);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Comprobar si hay una entrega anterior
  Future<void> _checkPreviousSubmission() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        return;
      }

      final submissionDoc = await FirebaseFirestore.instance
          .collection('Courses')
          .doc(courseId)
          .collection('assignments')
          .doc(assignmentId)
          .collection('submissions')
          .doc(currentUser.uid)
          .get();

      if (!submissionDoc.exists) {
        return;
      }

      // Cargar las respuestas anteriores
      final submissionData = submissionDoc.data()!;
      final List<dynamic> responses = submissionData['responses'] ?? [];

      for (final response in responses) {
        final questionId = response['questionId'] as String;
        final questionIndex = int.tryParse(questionId) ?? 0;

        if (questionIndex < _questions.length) {
          final question = _questions[questionIndex];

          if (question.type == 'multiple_choice' ||
              question.type == 'true_false') {
            question.selectedOption = response['selectedOption'] as int?;
            question.isAnswered = question.selectedOption != null;
            question.isCorrect = response['isCorrect'] as bool?;
          } else if (question.type == 'file') {
            question.uploadedFileUrl = response['fileUrl'] as String?;
            question.uploadedFileName = response['fileName'] as String?;
            question.isAnswered = question.uploadedFileUrl != null &&
                question.uploadedFileUrl!.isNotEmpty;
          }
        }
      }
    } catch (e) {
      print('Error checking previous submission: $e');
    }
  }

  // Actualizar la respuesta a una pregunta de opción múltiple o verdadero/falso
  void updateSelectedOption(int questionIndex, int optionIndex) {
    if (questionIndex < 0 || questionIndex >= _questions.length) return;

    final question = _questions[questionIndex];
    question.selectedOption = optionIndex;
    question.isAnswered = true;

    print(
        "Question $questionIndex marked as answered with option $optionIndex");
    print("isAnswered: ${question.isAnswered}, type: ${question.type}");

    // Recalculate whether all questions are answered
    _updateAllQuestionsAnsweredStatus();
    notifyListeners();
  }

  // Actualizar el archivo subido para una pregunta de tipo archivo
  Future<void> uploadFile(int questionIndex, File file, String fileName) async {
    if (questionIndex < 0 || questionIndex >= _questions.length) return;

    try {
      final question = _questions[questionIndex];

      // Crear una referencia al storage
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('assignments')
          .child(courseId)
          .child(assignmentId)
          .child(
              '${FirebaseAuth.instance.currentUser?.uid ?? 'unknown'}_$fileName');

      // Subir el archivo
      final uploadTask = storageRef.putFile(file);

      // Esperar a que termine la subida
      await uploadTask.whenComplete(() {});

      // Obtener la URL de descarga
      final downloadUrl = await storageRef.getDownloadURL();

      // Actualizar la pregunta
      question.uploadedFileUrl = downloadUrl;
      question.uploadedFileName = fileName;
      question.isAnswered = true;

      _updateAllQuestionsAnsweredStatus();
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Error uploading file: $e';
      notifyListeners();
    }
  }

  // Cambiar a la siguiente pregunta
  void nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
      notifyListeners();
    }

    // Check if all questions are answered when navigating
    _updateAllQuestionsAnsweredStatus();
  }

  // Cambiar a la pregunta anterior
  void previousQuestion() {
    if (_currentQuestionIndex > 0) {
      _currentQuestionIndex--;
      notifyListeners();
    }

    // Check if all questions are answered when navigating
    _updateAllQuestionsAnsweredStatus();
  }

  // Ir a una pregunta específica
  void goToQuestion(int index) {
    if (index >= 0 && index < _questions.length) {
      _currentQuestionIndex = index;
      _updateAllQuestionsAnsweredStatus();
      notifyListeners();
    }
  }

  // Verificar si todas las preguntas han sido respondidas
  void _updateAllQuestionsAnsweredStatus() {
    bool allAnswered = true;

    for (var question in _questions) {
      bool questionAnswered = false;

      if (question.type == 'multiple_choice' || question.type == 'MCQ') {
        questionAnswered = question.selectedOption != null;
      } else if (question.type == 'true_false' ||
          question.type == 'TrueFalse') {
        questionAnswered = question.selectedOption != null;
      } else if (question.type == 'file') {
        questionAnswered = question.uploadedFileUrl != null &&
            question.uploadedFileUrl!.isNotEmpty;
      }

      // Update the question's answered status
      if (questionAnswered) {
        question.isAnswered = true; // Ensure this is explicitly set
        print(
            "Marked question ${question.id} as answered with type ${question.type}");
      } else {
        question.isAnswered = false;
        print(
            "Question ${question.id} is not answered with type ${question.type}");
      }

      // Update the overall status
      allAnswered = allAnswered && questionAnswered;

      if (!allAnswered) break;
    }

    _allQuestionsAnswered = allAnswered;
    notifyListeners();
  }

  // Enviar la tarea
  Future<bool> submitAssignment() async {
    if (!_allQuestionsAnswered) {
      _errorMessage = 'Please answer all questions before submitting';
      notifyListeners();
      return false;
    }

    _isSubmitting = true;
    _errorMessage = '';
    notifyListeners();

    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        _errorMessage = 'User not logged in';
        _isSubmitting = false;
        notifyListeners();
        return false;
      }

      // Obtener el nombre del estudiante
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();

      final String studentName = userDoc.exists
          ? (userDoc.data()?['name'] ?? 'Unknown Student')
          : 'Unknown Student';

      // Calcular puntajes para preguntas de opción múltiple y verdadero/falso
      int totalScore = 0;
      int maxScore = 0;

      // Crear respuestas
      List<StudentResponse> responses = [];

      for (int i = 0; i < _questions.length; i++) {
        final question = _questions[i];
        bool? isCorrect;
        int? score;

        if (question.type == 'multiple_choice' || question.type == 'MCQ') {
          // Verificar si la respuesta es correcta
          isCorrect = question.selectedOption.toString() == question.correct;

          print(
              "MCQ Question: ${question.question}, Selected: ${question.selectedOption}, Correct: ${question.correct}, Is Correct: $isCorrect");

          // Asignar puntaje
          score = isCorrect ? 1 : 0;
          maxScore += 1;
          totalScore += score;
        } else if (question.type == 'true_false' ||
            question.type == 'TrueFalse') {
          // For true/false questions, "true" = 0 and "false" = 1 in the UI
          // But in Firebase, correct might be stored as "True" or "False"
          String selectedAnswer =
              question.selectedOption == 0 ? "True" : "False";

          // Handle various formats of correct answer
          isCorrect = false;
          if (question.correct != null) {
            final correctLower = question.correct!.toLowerCase();
            if (correctLower == "true" ||
                correctLower == "0" ||
                correctLower == "\"true\"") {
              isCorrect = question.selectedOption == 0;
            } else if (correctLower == "false" ||
                correctLower == "1" ||
                correctLower == "\"false\"") {
              isCorrect = question.selectedOption == 1;
            } else {
              isCorrect = selectedAnswer.toLowerCase() == correctLower;
            }
          }

          print(
              "TF Question: ${question.question}, Selected: ${question.selectedOption} ($selectedAnswer), Correct: ${question.correct}, Is Correct: $isCorrect");

          // Asignar puntaje
          score = isCorrect ? 1 : 0;
          maxScore += 1;
          totalScore += score;
        } else if (question.type == 'file') {
          // Las preguntas de archivo necesitan calificación manual
          maxScore += 1;
          // No se asigna puntaje aún
        }

        // Crear respuesta
        responses.add(StudentResponse(
          questionId: question.id,
          questionType: question.type,
          selectedOption: question.selectedOption,
          fileUrl: question.uploadedFileUrl,
          fileName: question.uploadedFileName,
          isCorrect: isCorrect,
          score: score,
        ));
      }

      // Calculate percentage score for display
      int scorePercentage =
          maxScore > 0 ? ((totalScore / maxScore) * 100).round() : 0;
      String scoreDisplay = "$scorePercentage%";

      print("Final score: $totalScore/$maxScore = $scoreDisplay");

      // Crear objeto de entrega
      final submission = StudentAssignmentSubmission(
        assignmentId: assignmentId,
        studentId: currentUser.uid,
        studentName: studentName,
        responses: responses,
        totalScore: totalScore,
        maxScore: maxScore,
        scorePercentage: scorePercentage,
        scoreDisplay: scoreDisplay,
        status: 'submitted',
        submittedAt: DateTime.now(),
      );

      // Guardar en Firestore
      await FirebaseFirestore.instance
          .collection('Courses')
          .doc(courseId)
          .collection('assignments')
          .doc(assignmentId)
          .collection('submissions')
          .doc(currentUser.uid)
          .set(submission.toMap());

      // Update the assignment in the course to mark it as completed for this student
      await FirebaseFirestore.instance
          .collection('Courses')
          .doc(courseId)
          .collection('assignments')
          .doc(assignmentId)
          .collection('studentStatus')
          .doc(currentUser.uid)
          .set({
        'isCompleted': true,
        'score': scoreDisplay,
        'lastUpdated': DateTime.now(),
      });

      _successMessage = 'Assignment submitted successfully';
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = 'Error submitting assignment: $e';
      print(_errorMessage);
      notifyListeners();
      return false;
    } finally {
      _isSubmitting = false;
      notifyListeners();
    }
  }

  void clearMessages() {
    _errorMessage = '';
    _successMessage = '';
    notifyListeners();
  }

  // Reset file upload for a question and update answered status
  void resetFileUpload(int questionIndex) {
    if (questionIndex < 0 || questionIndex >= _questions.length) return;

    final question = _questions[questionIndex];
    question.uploadedFileUrl = null;
    question.uploadedFileName = null;
    question.isAnswered = false;

    _updateAllQuestionsAnsweredStatus();
    notifyListeners();
  }
}
