import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:attendance_app/features/assignments/models/student_assignment_response.dart';

class AssignmentSubmissionsViewModel extends ChangeNotifier {
  final String courseId;
  final String assignmentId;

  List<StudentAssignmentSubmission> _submissions = [];
  bool _isLoading = true;
  String _errorMessage = '';
  String _successMessage = '';

  // Getters
  List<StudentAssignmentSubmission> get submissions => _submissions;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  String get successMessage => _successMessage;

  AssignmentSubmissionsViewModel({
    required this.courseId,
    required this.assignmentId,
  }) {
    _loadSubmissions();
  }

  Future<void> _loadSubmissions() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('Courses')
          .doc(courseId)
          .collection('assignments')
          .doc(assignmentId)
          .collection('submissions')
          .get();

      _submissions = snapshot.docs.map((doc) {
        return StudentAssignmentSubmission.fromMap(doc.data());
      }).toList();

      // Ordenar por fecha de entrega (más reciente primero)
      _submissions.sort((a, b) => b.submittedAt.compareTo(a.submittedAt));
    } catch (e) {
      _errorMessage = 'Error loading submissions: $e';
      print(_errorMessage);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Método para calificar una respuesta de archivo
  Future<void> gradeFileResponse(
      String studentId, String questionId, int score, String? comment) async {
    _isLoading = true;
    notifyListeners();

    try {
      // Encontrar la presentación del estudiante
      final submission =
          _submissions.firstWhere((s) => s.studentId == studentId);

      // Encontrar la respuesta específica
      final responseIndex =
          submission.responses.indexWhere((r) => r.questionId == questionId);

      if (responseIndex == -1) {
        throw Exception('Response not found');
      }

      // Crear una nueva lista de respuestas con la actualizada
      final updatedResponses = [...submission.responses];
      updatedResponses[responseIndex] = StudentResponse(
        questionId: questionId,
        questionType: updatedResponses[responseIndex].questionType,
        selectedOption: updatedResponses[responseIndex].selectedOption,
        fileUrl: updatedResponses[responseIndex].fileUrl,
        fileName: updatedResponses[responseIndex].fileName,
        isCorrect: score > 0, // Si tiene puntuación, se considera correcta
        score: score,
        teacherComment: comment,
      );

      // Calcular la nueva puntuación total
      int newTotalScore = 0;
      for (final response in updatedResponses) {
        if (response.score != null) {
          newTotalScore += response.score!;
        }
      }

      // Verificar si todas las respuestas han sido calificadas
      final allGraded = updatedResponses.every((r) =>
          r.questionType != 'file' ||
          (r.questionType == 'file' && r.score != null));

      final status = allGraded ? 'graded' : 'partially_graded';

      // Calculate percentage score for display
      int scorePercentage = submission.maxScore > 0
          ? ((newTotalScore / submission.maxScore) * 100).round()
          : 0;
      String scoreDisplay = "$scorePercentage%";

      // Crear una nueva entrega actualizada
      final updatedSubmission = StudentAssignmentSubmission(
        assignmentId: submission.assignmentId,
        studentId: submission.studentId,
        studentName: submission.studentName,
        responses: updatedResponses,
        totalScore: newTotalScore,
        maxScore: submission.maxScore,
        scorePercentage: scorePercentage,
        scoreDisplay: scoreDisplay,
        status: status,
        submittedAt: submission.submittedAt,
        gradedAt: allGraded ? DateTime.now() : submission.gradedAt,
      );

      // Actualizar en Firestore
      await FirebaseFirestore.instance
          .collection('Courses')
          .doc(courseId)
          .collection('assignments')
          .doc(assignmentId)
          .collection('submissions')
          .doc(studentId)
          .set(updatedSubmission.toMap());

      // Actualizar la lista local
      final index = _submissions.indexWhere((s) => s.studentId == studentId);
      if (index != -1) {
        _submissions[index] = updatedSubmission;
      }

      _successMessage = 'Response graded successfully';
    } catch (e) {
      _errorMessage = 'Error grading response: $e';
      print(_errorMessage);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearMessages() {
    _errorMessage = '';
    _successMessage = '';
    notifyListeners();
  }

  void refreshSubmissions() {
    _loadSubmissions();
  }
}
