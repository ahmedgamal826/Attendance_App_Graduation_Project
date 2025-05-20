// // import 'dart:io';
// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:firebase_storage/firebase_storage.dart';
// // import 'package:attendance_app/features/assignments/models/question_model_student.dart';
// // import 'package:attendance_app/features/assignments/models/student_assignment_response.dart';

// // class StudentAssignmentDetailViewModel extends ChangeNotifier {
// //   final String courseId;
// //   final String assignmentId;

// //   List<StudentQuestion> _questions = [];
// //   bool _isLoading = true;
// //   bool _isSubmitting = false;
// //   String _errorMessage = '';
// //   String _successMessage = '';
// //   int _currentQuestionIndex = 0;
// //   bool _allQuestionsAnswered = false;

// //   // Getters
// //   List<StudentQuestion> get questions => _questions;
// //   bool get isLoading => _isLoading;
// //   bool get isSubmitting => _isSubmitting;
// //   String get errorMessage => _errorMessage;
// //   String get successMessage => _successMessage;
// //   int get currentQuestionIndex => _currentQuestionIndex;
// //   bool get allQuestionsAnswered => _allQuestionsAnswered;
// //   StudentQuestion? get currentQuestion =>
// //       _questions.isNotEmpty && _currentQuestionIndex < _questions.length
// //           ? _questions[_currentQuestionIndex]
// //           : null;

// //   // Constructor
// //   StudentAssignmentDetailViewModel({
// //     required this.courseId,
// //     required this.assignmentId,
// //   }) {
// //     _loadAssignmentQuestions();
// //   }

// //   // Cargar las preguntas de la tarea
// //   Future<void> _loadAssignmentQuestions() async {
// //     _isLoading = true;
// //     _errorMessage = '';
// //     notifyListeners();

// //     try {
// //       // Obtener el documento de la tarea
// //       final assignmentDoc = await FirebaseFirestore.instance
// //           .collection('Courses')
// //           .doc(courseId)
// //           .collection('assignments')
// //           .doc(assignmentId)
// //           .get();

// //       if (!assignmentDoc.exists) {
// //         _errorMessage = 'Assignment not found';
// //         _isLoading = false;
// //         notifyListeners();
// //         return;
// //       }

// //       final assignmentData = assignmentDoc.data()!;

// //       // Obtener las preguntas
// //       final List<dynamic> rawQuestions = assignmentData['questions'] ?? [];

// //       _questions = List.generate(
// //         rawQuestions.length,
// //         (index) {
// //           final questionData = rawQuestions[index] as Map<String, dynamic>;
// //           final QuestionModel adminModel = QuestionModel.fromMap(questionData);
// //           return StudentQuestion.fromAdminModel(adminModel, index);
// //         },
// //       );

// //       // Comprobar si hay una entrega anterior del estudiante
// //       await _checkPreviousSubmission();

// //       // Verificar si todas las preguntas han sido respondidas
// //       _updateAllQuestionsAnsweredStatus();
// //     } catch (e) {
// //       _errorMessage = 'Error loading assignment: $e';
// //       print(_errorMessage);
// //     } finally {
// //       _isLoading = false;
// //       notifyListeners();
// //     }
// //   }

// //   // Comprobar si hay una entrega anterior
// //   Future<void> _checkPreviousSubmission() async {
// //     try {
// //       final currentUser = FirebaseAuth.instance.currentUser;
// //       if (currentUser == null) {
// //         return;
// //       }

// //       final submissionDoc = await FirebaseFirestore.instance
// //           .collection('Courses')
// //           .doc(courseId)
// //           .collection('assignments')
// //           .doc(assignmentId)
// //           .collection('submissions')
// //           .doc(currentUser.uid)
// //           .get();

// //       if (!submissionDoc.exists) {
// //         return;
// //       }

// //       // Cargar las respuestas anteriores
// //       final submissionData = submissionDoc.data()!;
// //       final List<dynamic> responses = submissionData['responses'] ?? [];

// //       for (final response in responses) {
// //         final questionId = response['questionId'] as String;
// //         final questionIndex = int.tryParse(questionId) ?? 0;

// //         if (questionIndex < _questions.length) {
// //           final question = _questions[questionIndex];

// //           if (question.type == 'multiple_choice' ||
// //               question.type == 'true_false') {
// //             question.selectedOption = response['selectedOption'] as int?;
// //             question.isAnswered = question.selectedOption != null;
// //             question.isCorrect = response['isCorrect'] as bool?;
// //           } else if (question.type == 'file') {
// //             question.uploadedFileUrl = response['fileUrl'] as String?;
// //             question.uploadedFileName = response['fileName'] as String?;
// //             question.isAnswered = question.uploadedFileUrl != null &&
// //                 question.uploadedFileUrl!.isNotEmpty;
// //           }
// //         }
// //       }
// //     } catch (e) {
// //       print('Error checking previous submission: $e');
// //     }
// //   }

// //   // Actualizar la respuesta a una pregunta de opción múltiple o verdadero/falso
// //   void updateSelectedOption(int questionIndex, int optionIndex) {
// //     if (questionIndex < 0 || questionIndex >= _questions.length) return;

// //     final question = _questions[questionIndex];
// //     question.selectedOption = optionIndex;
// //     question.isAnswered = true;

// //     print(
// //         "Question $questionIndex marked as answered with option $optionIndex");
// //     print("isAnswered: ${question.isAnswered}, type: ${question.type}");

// //     // Recalculate whether all questions are answered
// //     _updateAllQuestionsAnsweredStatus();
// //     notifyListeners();
// //   }

// //   // Actualizar el archivo subido para una pregunta de tipo archivo
// //   Future<void> uploadFile(int questionIndex, File file, String fileName) async {
// //     if (questionIndex < 0 || questionIndex >= _questions.length) return;

// //     try {
// //       final question = _questions[questionIndex];

// //       // Crear una referencia al storage
// //       final storageRef = FirebaseStorage.instance
// //           .ref()
// //           .child('assignments')
// //           .child(courseId)
// //           .child(assignmentId)
// //           .child(
// //               '${FirebaseAuth.instance.currentUser?.uid ?? 'unknown'}_$fileName');

// //       // Subir el archivo
// //       final uploadTask = storageRef.putFile(file);

// //       // Esperar a que termine la subida
// //       await uploadTask.whenComplete(() {});

// //       // Obtener la URL de descarga
// //       final downloadUrl = await storageRef.getDownloadURL();

// //       // Actualizar la pregunta
// //       question.uploadedFileUrl = downloadUrl;
// //       question.uploadedFileName = fileName;
// //       question.isAnswered = true;

// //       _updateAllQuestionsAnsweredStatus();
// //       notifyListeners();
// //     } catch (e) {
// //       _errorMessage = 'Error uploading file: $e';
// //       notifyListeners();
// //     }
// //   }

// //   // Cambiar a la siguiente pregunta
// //   void nextQuestion() {
// //     if (_currentQuestionIndex < _questions.length - 1) {
// //       _currentQuestionIndex++;
// //       notifyListeners();
// //     }

// //     // Check if all questions are answered when navigating
// //     _updateAllQuestionsAnsweredStatus();
// //   }

// //   // Cambiar a la pregunta anterior
// //   void previousQuestion() {
// //     if (_currentQuestionIndex > 0) {
// //       _currentQuestionIndex--;
// //       notifyListeners();
// //     }

// //     // Check if all questions are answered when navigating
// //     _updateAllQuestionsAnsweredStatus();
// //   }

// //   // Ir a una pregunta específica
// //   void goToQuestion(int index) {
// //     if (index >= 0 && index < _questions.length) {
// //       _currentQuestionIndex = index;
// //       _updateAllQuestionsAnsweredStatus();
// //       notifyListeners();
// //     }
// //   }

// //   // Update the status of whether all questions have been answered
// //   void _updateAllQuestionsAnsweredStatus() {
// //     bool allAnswered = true;

// //     for (var question in _questions) {
// //       bool questionAnswered = question.isQuestionAnswered();
// //       print(
// //           'Checking question ${question.id}: answered=$questionAnswered, type=${question.type}, selectedOption=${question.selectedOption}');

// //       allAnswered = allAnswered && questionAnswered;

// //       if (!allAnswered) {
// //         print('Found unanswered question ${question.id}');
// //         break;
// //       }
// //     }

// //     print('All questions answered: $allAnswered');
// //     _allQuestionsAnswered = allAnswered;
// //     notifyListeners();
// //   }

// //   // Enviar la tarea
// //   Future<bool> submitAssignment() async {
// //     if (!_allQuestionsAnswered) {
// //       _errorMessage = 'Please answer all questions before submitting';
// //       notifyListeners();
// //       return false;
// //     }

// //     _isSubmitting = true;
// //     _errorMessage = '';
// //     notifyListeners();

// //     try {
// //       final currentUser = FirebaseAuth.instance.currentUser;
// //       if (currentUser == null) {
// //         _errorMessage = 'User not logged in';
// //         _isSubmitting = false;
// //         notifyListeners();
// //         return false;
// //       }

// //       // Obtener el nombre del estudiante
// //       final userDoc = await FirebaseFirestore.instance
// //           .collection('users')
// //           .doc(currentUser.uid)
// //           .get();

// //       final String studentName = userDoc.exists
// //           ? (userDoc.data()?['name'] ?? 'Unknown Student')
// //           : 'Unknown Student';

// //       // Get assignment details to extract correct answers
// //       final assignmentDoc = await FirebaseFirestore.instance
// //           .collection('Courses')
// //           .doc(courseId)
// //           .collection('assignments')
// //           .doc(assignmentId)
// //           .get();

// //       if (!assignmentDoc.exists) {
// //         throw Exception('Assignment not found');
// //       }

// //       // Prepare data for the new studentSubmits collection
// //       Map<String, dynamic> submissionData = {
// //         // Basic student and submission info
// //         'studentId': currentUser.uid,
// //         'studentName': studentName,
// //         'submittedAt': FieldValue.serverTimestamp(),
// //         'assignmentId': assignmentId,
// //       };

// //       // Add all question answers with text-based comparison
// //       List<Map<String, dynamic>> questionAnswers = [];
// //       int totalScore = 0;
// //       int totalQuestions = _questions.length;

// //       for (int i = 0; i < _questions.length; i++) {
// //         final question = _questions[i];
// //         String questionId = question.id;
// //         bool? isCorrect = false;

// //         // Create a map for this question's data
// //         Map<String, dynamic> questionData = {
// //           'questionId': questionId,
// //           'questionType': question.type,
// //           'questionText': question.question,
// //         };

// //         // Process based on question type
// //         if (question.type == 'multiple_choice' || question.type == 'MCQ') {
// //           // Store question options
// //           questionData['options'] = question.options;

// //           // Store the correct answer text - IMPROVED to ensure exact match
// //           String correctAnswerText = '';
// //           int correctIndex = -1;

// //           if (question.correct != null) {
// //             String correctStr = question.correct!.trim();

// //             // Print the raw correct value for debugging
// //             print("Raw correct value: '$correctStr'");
// //             print("Available options: ${question.options}");

// //             // First check: Is the correct value directly matching any option?
// //             bool foundDirectMatch = false;
// //             for (int j = 0; j < question.options.length; j++) {
// //               String optionText = question.options[j].trim();
// //               // Compare the raw correct value with each option text
// //               if (optionText == correctStr) {
// //                 correctAnswerText = optionText;
// //                 correctIndex = j;
// //                 foundDirectMatch = true;
// //                 print(
// //                     "Found exact option match at index $j: '$correctAnswerText'");
// //                 break;
// //               }
// //             }

// //             // If no direct match found, try to parse as index
// //             if (!foundDirectMatch) {
// //               try {
// //                 correctIndex = int.parse(correctStr);
// //                 if (correctIndex >= 0 &&
// //                     correctIndex < question.options.length) {
// //                   correctAnswerText = question.options[correctIndex];
// //                   print(
// //                       "Using option text from index $correctIndex: '$correctAnswerText'");
// //                 }
// //               } catch (e) {
// //                 // Not a number, use the raw value as correctAnswerText
// //                 correctAnswerText = correctStr;
// //                 print(
// //                     "Using raw correct value as answer text: '$correctAnswerText'");
// //               }
// //             }
// //           }

// //           questionData['correctAnswerText'] = correctAnswerText;

// //           // Store the student's selected option text
// //           String selectedAnswerText = '';
// //           if (question.selectedOption != null &&
// //               question.selectedOption! >= 0 &&
// //               question.selectedOption! < question.options.length) {
// //             selectedAnswerText = question.options[question.selectedOption!];

// //             // Debug output to track mismatches between stored options and selection
// //             print("Selected option index: ${question.selectedOption}");
// //             print("Selected option text: '$selectedAnswerText'");
// //             print("Available options: ${question.options}");
// //           }

// //           questionData['selectedAnswerText'] = selectedAnswerText;
// //           questionData['selectedOptionIndex'] = question.selectedOption;

// //           // Store correctIndex for reference
// //           if (correctIndex >= 0) {
// //             questionData['correctOptionIndex'] = correctIndex;
// //           }

// //           // Text-based comparison for correctness - EXACT MATCH
// //           if (correctAnswerText.isNotEmpty && selectedAnswerText.isNotEmpty) {
// //             isCorrect = selectedAnswerText.trim() == correctAnswerText.trim();
// //             print(
// //                 "Text comparison: '$selectedAnswerText' == '$correctAnswerText' => $isCorrect");
// //           } else {
// //             isCorrect = false;
// //             print("Empty answer texts, marking as incorrect");
// //           }

// //           // Assign score based on correctness
// //           int score = isCorrect ? 1 : 0;
// //           totalScore += score;

// //           questionData['isCorrect'] = isCorrect;
// //           questionData['score'] = score;
// //         } else if (question.type == 'true_false' ||
// //             question.type == 'TrueFalse') {
// //           // For true/false, the options are always "True" and "False"
// //           questionData['options'] = ["True", "False"];

// //           // Determine correct answer text (True or False) - IMPROVED for exact match
// //           String correctAnswerText = '';
// //           if (question.correct != null) {
// //             String correctStr = question.correct!.toLowerCase().trim();

// //             // Normalize based on different possible formats
// //             if (correctStr == "true" ||
// //                 correctStr == "0" ||
// //                 correctStr == "\"true\"" ||
// //                 correctStr == "'true'" ||
// //                 correctStr == "t") {
// //               correctAnswerText = "True";
// //             } else if (correctStr == "false" ||
// //                 correctStr == "1" ||
// //                 correctStr == "\"false\"" ||
// //                 correctStr == "'false'" ||
// //                 correctStr == "f") {
// //               correctAnswerText = "False";
// //             } else {
// //               // Try to parse as number (0=True, 1=False)
// //               try {
// //                 int index = int.parse(correctStr);
// //                 correctAnswerText = index == 0 ? "True" : "False";
// //               } catch (e) {
// //                 // If all else fails, capitalize first letter
// //                 correctAnswerText = correctStr.isNotEmpty
// //                     ? correctStr[0].toUpperCase() + correctStr.substring(1)
// //                     : "";
// //               }
// //             }
// //           }

// //           questionData['correctAnswerText'] = correctAnswerText;

// //           // Get student's selected answer text - EXACT MATCH format
// //           String selectedAnswerText =
// //               question.selectedOption == 0 ? "True" : "False";
// //           questionData['selectedAnswerText'] = selectedAnswerText;
// //           questionData['selectedOptionIndex'] = question.selectedOption;

// //           // Exact text comparison
// //           isCorrect = selectedAnswerText == correctAnswerText &&
// //               !correctAnswerText.isEmpty;

// //           // Assign score
// //           int score = isCorrect ? 1 : 0;
// //           totalScore += score;

// //           questionData['isCorrect'] = isCorrect;
// //           questionData['score'] = score;
// //         } else if (question.type == 'file') {
// //           // For file upload questions
// //           questionData['fileUrl'] = question.uploadedFileUrl;
// //           questionData['fileName'] = question.uploadedFileName;
// //           questionData['isGraded'] = false; // Files need manual grading
// //           questionData['score'] = 0; // Initial score is 0 until graded
// //         }

// //         questionAnswers.add(questionData);
// //       }

// //       // Add questions and score data to submission
// //       submissionData['questions'] = questionAnswers;
// //       submissionData['totalScore'] = totalScore;
// //       submissionData['maxScore'] = totalQuestions;
// //       submissionData['scorePercentage'] = totalQuestions > 0
// //           ? ((totalScore / totalQuestions) * 100).round()
// //           : 0;
// //       submissionData['status'] = 'submitted';

// //       // Save to the new studentSubmits collection
// //       await FirebaseFirestore.instance
// //           .collection('Courses')
// //           .doc(courseId)
// //           .collection('assignments')
// //           .doc(assignmentId)
// //           .collection('studentSubmits')
// //           .doc(currentUser.uid)
// //           .set(submissionData);

// //       // Update student status
// //       await FirebaseFirestore.instance
// //           .collection('Courses')
// //           .doc(courseId)
// //           .collection('assignments')
// //           .doc(assignmentId)
// //           .collection('studentStatus')
// //           .doc(currentUser.uid)
// //           .set({
// //         'isCompleted': true,
// //         'isGraded': true,
// //         'score': '${submissionData['scorePercentage']}%',
// //         'lastUpdated': DateTime.now().toIso8601String(),
// //       });

// //       _successMessage = 'Assignment submitted successfully';
// //       notifyListeners();
// //       return true;
// //     } catch (e) {
// //       _errorMessage = 'Error submitting assignment: $e';
// //       print(_errorMessage);
// //       notifyListeners();
// //       return false;
// //     } finally {
// //       _isSubmitting = false;
// //       notifyListeners();
// //     }
// //   }

// //   void clearMessages() {
// //     _errorMessage = '';
// //     _successMessage = '';
// //     notifyListeners();
// //   }

// //   // Reset file upload for a question and update answered status
// //   void resetFileUpload(int questionIndex) {
// //     if (questionIndex < 0 || questionIndex >= _questions.length) return;

// //     final question = _questions[questionIndex];
// //     question.uploadedFileUrl = null;
// //     question.uploadedFileName = null;
// //     question.isAnswered = false;

// //     _updateAllQuestionsAnsweredStatus();
// //     notifyListeners();
// //   }
// // }

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:attendance_app/features/assignments/models/question_model_student.dart';

// class StudentAssignmentDetailViewModel extends ChangeNotifier {
//   final String courseId;
//   final String assignmentId;

//   List<StudentQuestion> _questions = [];
//   bool _isLoading = true;
//   bool _isSubmitting = false;
//   String _errorMessage = '';
//   String _successMessage = '';
//   int _currentQuestionIndex = 0;
//   bool _allQuestionsAnswered = false;
//   bool _isUploading = false;
//   double _uploadProgress = 0.0;

//   // Getters
//   List<StudentQuestion> get questions => _questions;
//   bool get isLoading => _isLoading;
//   bool get isSubmitting => _isSubmitting;
//   String get errorMessage => _errorMessage;
//   String get successMessage => _successMessage;
//   int get currentQuestionIndex => _currentQuestionIndex;
//   bool get allQuestionsAnswered => _allQuestionsAnswered;
//   bool get isUploading => _isUploading;
//   double get uploadProgress => _uploadProgress;
//   StudentQuestion? get currentQuestion =>
//       _questions.isNotEmpty && _currentQuestionIndex < _questions.length
//           ? _questions[_currentQuestionIndex]
//           : null;

//   // Constructor
//   StudentAssignmentDetailViewModel({
//     required this.courseId,
//     required this.assignmentId,
//   }) {
//     _loadAssignmentQuestions();
//   }

//   // Cargar las preguntas de la tarea
//   Future<void> _loadAssignmentQuestions() async {
//     _isLoading = true;
//     _errorMessage = '';
//     notifyListeners();

//     try {
//       final assignmentDoc = await FirebaseFirestore.instance
//           .collection('Courses')
//           .doc(courseId)
//           .collection('assignments')
//           .doc(assignmentId)
//           .get();

//       if (!assignmentDoc.exists) {
//         _errorMessage = 'Assignment not found';
//         _isLoading = false;
//         notifyListeners();
//         return;
//       }

//       final assignmentData = assignmentDoc.data()!;

//       final List<dynamic> rawQuestions = assignmentData['questions'] ?? [];

//       _questions = List.generate(
//         rawQuestions.length,
//         (index) {
//           final questionData = rawQuestions[index] as Map<String, dynamic>;
//           final QuestionModel adminModel = QuestionModel.fromMap(questionData);
//           return StudentQuestion.fromAdminModel(adminModel, index);
//         },
//       );

//       await _checkPreviousSubmission();
//       _updateAllQuestionsAnsweredStatus();
//     } catch (e) {
//       _errorMessage = 'Error loading assignment: $e';
//       print(_errorMessage);
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }

//   Future<void> _checkPreviousSubmission() async {
//     try {
//       final currentUser = FirebaseAuth.instance.currentUser;
//       if (currentUser == null) {
//         return;
//       }

//       final submissionDoc = await FirebaseFirestore.instance
//           .collection('Courses')
//           .doc(courseId)
//           .collection('assignments')
//           .doc(assignmentId)
//           .collection('submissions')
//           .doc(currentUser.uid)
//           .get();

//       if (!submissionDoc.exists) {
//         return;
//       }

//       final submissionData = submissionDoc.data()!;
//       final List<dynamic> responses = submissionData['responses'] ?? [];

//       for (final response in responses) {
//         final questionId = response['questionId'] as String;
//         final questionIndex = int.tryParse(questionId) ?? 0;

//         if (questionIndex < _questions.length) {
//           final question = _questions[questionIndex];

//           if (question.type == 'multiple_choice' ||
//               question.type == 'true_false') {
//             question.selectedOption = response['selectedOption'] as int?;
//             question.isAnswered = question.selectedOption != null;
//             question.isCorrect = response['isCorrect'] as bool?;
//           } else if (question.type == 'Upload File') {
//             question.uploadedFileUrl = response['fileUrl'] as String?;
//             question.uploadedFileName = response['fileName'] as String?;
//             question.isAnswered = question.uploadedFileUrl != null &&
//                 question.uploadedFileUrl!.isNotEmpty;
//           }
//         }
//       }
//     } catch (e) {
//       print('Error checking previous submission: $e');
//     }
//   }

//   void updateSelectedOption(int questionIndex, int optionIndex) {
//     if (questionIndex < 0 || questionIndex >= _questions.length) return;

//     final question = _questions[questionIndex];
//     question.selectedOption = optionIndex;
//     question.isAnswered = true;

//     print(
//         "Question $questionIndex marked as answered with option $optionIndex");
//     print("isAnswered: ${question.isAnswered}, type: ${question.type}");

//     _updateAllQuestionsAnsweredStatus();
//     notifyListeners();
//   }

//   Future<void> uploadFile(int questionIndex, File file, String fileName) async {
//     if (questionIndex < 0 || questionIndex >= _questions.length) return;

//     _isUploading = true;
//     _uploadProgress = 0.0;
//     notifyListeners();

//     try {
//       final question = _questions[questionIndex];

//       final storageRef = FirebaseStorage.instance
//           .ref()
//           .child('assignments')
//           .child(courseId)
//           .child(assignmentId)
//           .child(
//               '${FirebaseAuth.instance.currentUser?.uid ?? 'unknown'}_$fileName');

//       final uploadTask = storageRef.putFile(file);

//       uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
//         _uploadProgress = snapshot.bytesTransferred / snapshot.totalBytes;
//         notifyListeners();
//       });

//       await uploadTask.whenComplete(() {});

//       final downloadUrl = await storageRef.getDownloadURL();

//       question.uploadedFileUrl = downloadUrl;
//       question.uploadedFileName = fileName;
//       question.isAnswered = true;

//       _updateAllQuestionsAnsweredStatus();
//       notifyListeners();
//     } catch (e) {
//       _errorMessage = 'Error uploading file: $e';
//       notifyListeners();
//     } finally {
//       _isUploading = false;
//       notifyListeners();
//     }
//   }

//   void nextQuestion() {
//     if (_currentQuestionIndex < _questions.length - 1) {
//       _currentQuestionIndex++;
//       notifyListeners();
//     }
//     _updateAllQuestionsAnsweredStatus();
//   }

//   void previousQuestion() {
//     if (_currentQuestionIndex > 0) {
//       _currentQuestionIndex--;
//       notifyListeners();
//     }
//     _updateAllQuestionsAnsweredStatus();
//   }

//   void goToQuestion(int index) {
//     if (index >= 0 && index < _questions.length) {
//       _currentQuestionIndex = index;
//       _updateAllQuestionsAnsweredStatus();
//       notifyListeners();
//     }
//   }

//   void _updateAllQuestionsAnsweredStatus() {
//     bool allAnswered = true;

//     for (var question in _questions) {
//       bool questionAnswered = question.isQuestionAnswered();
//       print(
//           'Checking question ${question.id}: answered=$questionAnswered, type=${question.type}, selectedOption=${question.selectedOption}');

//       allAnswered = allAnswered && questionAnswered;

//       if (!allAnswered) {
//         print('Found unanswered question ${question.id}');
//         break;
//       }
//     }

//     print('All questions answered: $allAnswered');
//     _allQuestionsAnswered = allAnswered;
//     notifyListeners();
//   }

//   Future<bool> submitAssignment() async {
//     if (!_allQuestionsAnswered) {
//       _errorMessage = 'Please answer all questions before submitting';
//       notifyListeners();
//       return false;
//     }

//     _isSubmitting = true;
//     _errorMessage = '';
//     notifyListeners();

//     try {
//       final currentUser = FirebaseAuth.instance.currentUser;
//       if (currentUser == null) {
//         _errorMessage = 'User not logged in';
//         _isSubmitting = false;
//         notifyListeners();
//         return false;
//       }

//       final userDoc = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(currentUser.uid)
//           .get();

//       final String studentName = userDoc.exists
//           ? (userDoc.data()?['name'] ?? 'Unknown Student')
//           : 'Unknown Student';

//       final assignmentDoc = await FirebaseFirestore.instance
//           .collection('Courses')
//           .doc(courseId)
//           .collection('assignments')
//           .doc(assignmentId)
//           .get();

//       if (!assignmentDoc.exists) {
//         throw Exception('Assignment not found');
//       }

//       Map<String, dynamic> submissionData = {
//         'studentId': currentUser.uid,
//         'studentName': studentName,
//         'submittedAt': FieldValue.serverTimestamp(),
//         'assignmentId': assignmentId,
//       };

//       List<Map<String, dynamic>> questionAnswers = [];
//       int totalScore = 0;
//       int totalQuestions = _questions.length;

//       for (int i = 0; i < _questions.length; i++) {
//         final question = _questions[i];
//         String questionId = question.id;
//         bool? isCorrect = false;

//         Map<String, dynamic> questionData = {
//           'questionId': questionId,
//           'questionType': question.type,
//           'questionText': question.question,
//         };

//         if (question.type == 'multiple_choice' || question.type == 'MCQ') {
//           questionData['options'] = question.options;

//           String correctAnswerText = '';
//           int correctIndex = -1;

//           if (question.correct != null) {
//             String correctStr = question.correct!.trim();
//             print("Raw correct value: '$correctStr'");
//             print("Available options: ${question.options}");

//             bool foundDirectMatch = false;
//             for (int j = 0; j < question.options.length; j++) {
//               String optionText = question.options[j].trim();
//               if (optionText == correctStr) {
//                 correctAnswerText = optionText;
//                 correctIndex = j;
//                 foundDirectMatch = true;
//                 print(
//                     "Found exact option match at index $j: '$correctAnswerText'");
//                 break;
//               }
//             }

//             if (!foundDirectMatch) {
//               try {
//                 correctIndex = int.parse(correctStr);
//                 if (correctIndex >= 0 &&
//                     correctIndex < question.options.length) {
//                   correctAnswerText = question.options[correctIndex];
//                   print(
//                       "Using option text from index $correctIndex: '$correctAnswerText'");
//                 }
//               } catch (e) {
//                 correctAnswerText = correctStr;
//                 print(
//                     "Using raw correct value as answer text: '$correctAnswerText'");
//               }
//             }
//           }

//           questionData['correctAnswerText'] = correctAnswerText;

//           String selectedAnswerText = '';
//           if (question.selectedOption != null &&
//               question.selectedOption! >= 0 &&
//               question.selectedOption! < question.options.length) {
//             selectedAnswerText = question.options[question.selectedOption!];
//             print("Selected option index: ${question.selectedOption}");
//             print("Selected option text: '$selectedAnswerText'");
//             print("Available options: ${question.options}");
//           }

//           questionData['selectedAnswerText'] = selectedAnswerText;
//           questionData['selectedOptionIndex'] = question.selectedOption;

//           if (correctIndex >= 0) {
//             questionData['correctOptionIndex'] = correctIndex;
//           }

//           if (correctAnswerText.isNotEmpty && selectedAnswerText.isNotEmpty) {
//             isCorrect = selectedAnswerText.trim() == correctAnswerText.trim();
//             print(
//                 "Text comparison: '$selectedAnswerText' == '$correctAnswerText' => $isCorrect");
//           } else {
//             isCorrect = false;
//             print("Empty answer texts, marking as incorrect");
//           }

//           int score = isCorrect ? 1 : 0;
//           totalScore += score;

//           questionData['isCorrect'] = isCorrect;
//           questionData['score'] = score;
//         } else if (question.type == 'true_false' ||
//             question.type == 'TrueFalse') {
//           questionData['options'] = ["True", "False"];

//           String correctAnswerText = '';
//           if (question.correct != null) {
//             String correctStr = question.correct!.toLowerCase().trim();

//             if (correctStr == "true" ||
//                 correctStr == "0" ||
//                 correctStr == "\"true\"" ||
//                 correctStr == "'true'" ||
//                 correctStr == "t") {
//               correctAnswerText = "True";
//             } else if (correctStr == "false" ||
//                 correctStr == "1" ||
//                 correctStr == "\"false\"" ||
//                 correctStr == "'false'" ||
//                 correctStr == "f") {
//               correctAnswerText = "False";
//             } else {
//               try {
//                 int index = int.parse(correctStr);
//                 correctAnswerText = index == 0 ? "True" : "False";
//               } catch (e) {
//                 correctAnswerText = correctStr.isNotEmpty
//                     ? correctStr[0].toUpperCase() + correctStr.substring(1)
//                     : "";
//               }
//             }
//           }

//           questionData['correctAnswerText'] = correctAnswerText;

//           String selectedAnswerText =
//               question.selectedOption == 0 ? "True" : "False";
//           questionData['selectedAnswerText'] = selectedAnswerText;
//           questionData['selectedOptionIndex'] = question.selectedOption;

//           isCorrect = selectedAnswerText == correctAnswerText &&
//               !correctAnswerText.isEmpty;

//           int score = isCorrect ? 1 : 0;
//           totalScore += score;

//           questionData['isCorrect'] = isCorrect;
//           questionData['score'] = score;
//         } else if (question.type == 'Upload File') {
//           questionData['fileUrl'] = question.uploadedFileUrl;
//           questionData['fileName'] = question.uploadedFileName;
//           questionData['isGraded'] = false;
//           questionData['score'] = 0;
//         }

//         questionAnswers.add(questionData);
//       }

//       submissionData['questions'] = questionAnswers;
//       submissionData['totalScore'] = totalScore;
//       submissionData['maxScore'] = totalQuestions;
//       submissionData['scorePercentage'] = totalQuestions > 0
//           ? ((totalScore / totalQuestions) * 100).round()
//           : 0;
//       submissionData['status'] = 'submitted';

//       await FirebaseFirestore.instance
//           .collection('Courses')
//           .doc(courseId)
//           .collection('assignments')
//           .doc(assignmentId)
//           .collection('studentSubmits')
//           .doc(currentUser.uid)
//           .set(submissionData);

//       await FirebaseFirestore.instance
//           .collection('Courses')
//           .doc(courseId)
//           .collection('assignments')
//           .doc(assignmentId)
//           .collection('studentStatus')
//           .doc(currentUser.uid)
//           .set({
//         'isCompleted': true,
//         'isGraded': true,
//         'score': '${submissionData['scorePercentage']}%',
//         'lastUpdated': DateTime.now().toIso8601String(),
//       });

//       _successMessage = 'Assignment submitted successfully';
//       notifyListeners();
//       return true;
//     } catch (e) {
//       _errorMessage = 'Error submitting assignment: $e';
//       print(_errorMessage);
//       notifyListeners();
//       return false;
//     } finally {
//       _isSubmitting = false;
//       notifyListeners();
//     }
//   }

//   void clearMessages() {
//     _errorMessage = '';
//     _successMessage = '';
//     notifyListeners();
//   }

//   void resetFileUpload(int questionIndex) {
//     if (questionIndex < 0 || questionIndex >= _questions.length) return;

//     final question = _questions[questionIndex];
//     question.uploadedFileUrl = null;
//     question.uploadedFileName = null;
//     question.isAnswered = false;

//     _updateAllQuestionsAnsweredStatus();
//     notifyListeners();
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:attendance_app/features/assignments/data/models/question_model_student.dart';

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
  bool _isUploading = false;
  double _uploadProgress = 0.0;

  // Getters
  List<StudentQuestion> get questions => _questions;
  bool get isLoading => _isLoading;
  bool get isSubmitting => _isSubmitting;
  String get errorMessage => _errorMessage;
  String get successMessage => _successMessage;
  int get currentQuestionIndex => _currentQuestionIndex;
  bool get allQuestionsAnswered => _allQuestionsAnswered;
  bool get isUploading => _isUploading;
  double get uploadProgress => _uploadProgress;
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

      final List<dynamic> rawQuestions = assignmentData['questions'] ?? [];

      _questions = List.generate(
        rawQuestions.length,
        (index) {
          final questionData = rawQuestions[index] as Map<String, dynamic>;
          final QuestionModel adminModel = QuestionModel.fromMap(questionData);
          return StudentQuestion.fromAdminModel(adminModel, index);
        },
      );

      await _checkPreviousSubmission();
      _updateAllQuestionsAnsweredStatus();
    } catch (e) {
      _errorMessage = 'Error loading assignment: $e';
      print(_errorMessage);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

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
          } else if (question.type == 'Upload File') {
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

  void updateSelectedOption(int questionIndex, int optionIndex) {
    if (questionIndex < 0 || questionIndex >= _questions.length) return;

    final question = _questions[questionIndex];
    question.selectedOption = optionIndex;
    question.isAnswered = true;

    print(
        "Question $questionIndex marked as answered with option $optionIndex");
    print("isAnswered: ${question.isAnswered}, type: ${question.type}");

    _updateAllQuestionsAnsweredStatus();
    notifyListeners();
  }

  Future<void> uploadFile(int questionIndex, File file, String fileName) async {
    if (questionIndex < 0 || questionIndex >= _questions.length) return;

    _isUploading = true;
    _uploadProgress = 0.0;
    notifyListeners();

    try {
      final question = _questions[questionIndex];

      final storageRef = FirebaseStorage.instance
          .ref()
          .child('assignments')
          .child(courseId)
          .child(assignmentId)
          .child(
              '${FirebaseAuth.instance.currentUser?.uid ?? 'unknown'}_$fileName');

      final uploadTask = storageRef.putFile(file);

      uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
        _uploadProgress = snapshot.bytesTransferred / snapshot.totalBytes;
        notifyListeners();
      });

      await uploadTask.whenComplete(() {});

      final downloadUrl = await storageRef.getDownloadURL();

      question.uploadedFileUrl = downloadUrl;
      question.uploadedFileName = fileName;
      question.isAnswered = true; // تأكيد إن الإجابة مكتملة
      print(
          "File uploaded for question $questionIndex, isAnswered: ${question.isAnswered}");

      _updateAllQuestionsAnsweredStatus();
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Error uploading file: $e';
      notifyListeners();
    } finally {
      _isUploading = false;
      notifyListeners();
    }
  }

  void nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
      notifyListeners();
    }
    _updateAllQuestionsAnsweredStatus();
  }

  void previousQuestion() {
    if (_currentQuestionIndex > 0) {
      _currentQuestionIndex--;
      notifyListeners();
    }
    _updateAllQuestionsAnsweredStatus();
  }

  void goToQuestion(int index) {
    if (index >= 0 && index < _questions.length) {
      _currentQuestionIndex = index;
      _updateAllQuestionsAnsweredStatus();
      notifyListeners();
    }
  }

  void _updateAllQuestionsAnsweredStatus() {
    bool allAnswered = true;

    for (var question in _questions) {
      bool questionAnswered = question.isQuestionAnswered();
      print(
          'Checking question ${question.id}: answered=$questionAnswered, type=${question.type}, uploadedFileUrl=${question.uploadedFileUrl}, selectedOption=${question.selectedOption}');

      allAnswered = allAnswered && questionAnswered;

      if (!allAnswered) {
        print('Found unanswered question ${question.id}');
        break;
      }
    }

    print('All questions answered: $allAnswered');
    _allQuestionsAnswered = allAnswered;
    notifyListeners();
  }

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

      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();

      final String studentName = userDoc.exists
          ? (userDoc.data()?['name'] ?? 'Unknown Student')
          : 'Unknown Student';

      final assignmentDoc = await FirebaseFirestore.instance
          .collection('Courses')
          .doc(courseId)
          .collection('assignments')
          .doc(assignmentId)
          .get();

      if (!assignmentDoc.exists) {
        throw Exception('Assignment not found');
      }

      Map<String, dynamic> submissionData = {
        'studentId': currentUser.uid,
        'studentName': studentName,
        'submittedAt': FieldValue.serverTimestamp(),
        'assignmentId': assignmentId,
      };

      List<Map<String, dynamic>> questionAnswers = [];
      int totalScore = 0;
      int totalQuestions = _questions.length;

      for (int i = 0; i < _questions.length; i++) {
        final question = _questions[i];
        String questionId = question.id;
        bool? isCorrect = false;

        Map<String, dynamic> questionData = {
          'questionId': questionId,
          'questionType': question.type,
          'questionText': question.question,
        };

        if (question.type == 'multiple_choice' || question.type == 'MCQ') {
          questionData['options'] = question.options;

          String correctAnswerText = '';
          int correctIndex = -1;

          if (question.correct != null) {
            String correctStr = question.correct!.trim();
            print("Raw correct value: '$correctStr'");
            print("Available options: ${question.options}");

            bool foundDirectMatch = false;
            for (int j = 0; j < question.options.length; j++) {
              String optionText = question.options[j].trim();
              if (optionText == correctStr) {
                correctAnswerText = optionText;
                correctIndex = j;
                foundDirectMatch = true;
                print(
                    "Found exact option match at index $j: '$correctAnswerText'");
                break;
              }
            }

            if (!foundDirectMatch) {
              try {
                correctIndex = int.parse(correctStr);
                if (correctIndex >= 0 &&
                    correctIndex < question.options.length) {
                  correctAnswerText = question.options[correctIndex];
                  print(
                      "Using option text from index $correctIndex: '$correctAnswerText'");
                }
              } catch (e) {
                correctAnswerText = correctStr;
                print(
                    "Using raw correct value as answer text: '$correctAnswerText'");
              }
            }
          }

          questionData['correctAnswerText'] = correctAnswerText;

          String selectedAnswerText = '';
          if (question.selectedOption != null &&
              question.selectedOption! >= 0 &&
              question.selectedOption! < question.options.length) {
            selectedAnswerText = question.options[question.selectedOption!];
            print("Selected option index: ${question.selectedOption}");
            print("Selected option text: '$selectedAnswerText'");
            print("Available options: ${question.options}");
          }

          questionData['selectedAnswerText'] = selectedAnswerText;
          questionData['selectedOptionIndex'] = question.selectedOption;

          if (correctIndex >= 0) {
            questionData['correctOptionIndex'] = correctIndex;
          }

          if (correctAnswerText.isNotEmpty && selectedAnswerText.isNotEmpty) {
            isCorrect = selectedAnswerText.trim() == correctAnswerText.trim();
            print(
                "Text comparison: '$selectedAnswerText' == '$correctAnswerText' => $isCorrect");
          } else {
            isCorrect = false;
            print("Empty answer texts, marking as incorrect");
          }

          int score = isCorrect ? 1 : 0;
          totalScore += score;

          questionData['isCorrect'] = isCorrect;
          questionData['score'] = score;
        } else if (question.type == 'true_false' ||
            question.type == 'TrueFalse') {
          questionData['options'] = ["True", "False"];

          String correctAnswerText = '';
          if (question.correct != null) {
            String correctStr = question.correct!.toLowerCase().trim();

            if (correctStr == "true" ||
                correctStr == "0" ||
                correctStr == "\"true\"" ||
                correctStr == "'true'" ||
                correctStr == "t") {
              correctAnswerText = "True";
            } else if (correctStr == "false" ||
                correctStr == "1" ||
                correctStr == "\"false\"" ||
                correctStr == "'false'" ||
                correctStr == "f") {
              correctAnswerText = "False";
            } else {
              try {
                int index = int.parse(correctStr);
                correctAnswerText = index == 0 ? "True" : "False";
              } catch (e) {
                correctAnswerText = correctStr.isNotEmpty
                    ? correctStr[0].toUpperCase() + correctStr.substring(1)
                    : "";
              }
            }
          }

          questionData['correctAnswerText'] = correctAnswerText;

          String selectedAnswerText =
              question.selectedOption == 0 ? "True" : "False";
          questionData['selectedAnswerText'] = selectedAnswerText;
          questionData['selectedOptionIndex'] = question.selectedOption;

          isCorrect = selectedAnswerText == correctAnswerText &&
              !correctAnswerText.isEmpty;

          int score = isCorrect ? 1 : 0;
          totalScore += score;

          questionData['isCorrect'] = isCorrect;
          questionData['score'] = score;
        } else if (question.type == 'Upload File') {
          questionData['fileUrl'] = question.uploadedFileUrl;
          questionData['fileName'] = question.uploadedFileName;
          questionData['isGraded'] = false;
          questionData['score'] = 0;
        }

        questionAnswers.add(questionData);
      }

      submissionData['questions'] = questionAnswers;
      submissionData['totalScore'] = totalScore;
      submissionData['maxScore'] = totalQuestions;
      submissionData['scorePercentage'] = totalQuestions > 0
          ? ((totalScore / totalQuestions) * 100).round()
          : 0;
      submissionData['status'] = 'submitted';

      await FirebaseFirestore.instance
          .collection('Courses')
          .doc(courseId)
          .collection('assignments')
          .doc(assignmentId)
          .collection('studentSubmits')
          .doc(currentUser.uid)
          .set(submissionData);

      await FirebaseFirestore.instance
          .collection('Courses')
          .doc(courseId)
          .collection('assignments')
          .doc(assignmentId)
          .collection('studentStatus')
          .doc(currentUser.uid)
          .set({
        'isCompleted': true,
        'isGraded': true,
        'score': '${submissionData['scorePercentage']}%',
        'lastUpdated': DateTime.now().toIso8601String(),
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
