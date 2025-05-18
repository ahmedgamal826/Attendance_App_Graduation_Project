// // import 'package:attendance_app/features/questionnaire/data/models/question_model.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';

// // class StudentQuestionnaireViewmodel extends ChangeNotifier {
// //   List<QuestionModel> _questions = [];
// //   int _currentQuestionIndex = 0;

// //   // إضافة قاموس لتخزين إجابات المستخدم
// //   Map<int, String> _userAnswers = {};

// //   List<QuestionModel> get questions => _questions;
// //   int get currentQuestionIndex => _currentQuestionIndex;
// //   QuestionModel? get currentQuestion =>
// //       _questions.isNotEmpty ? _questions[_currentQuestionIndex] : null;
// //   Map<int, String> get userAnswers => _userAnswers;

// //   StudentQuestionnaireViewmodel() {
// //     initializeQuestions();
// //   }

// //   void initializeQuestions(
// //       [List<Map<String, dynamic>> customQuestions = const []]) {
// //     if (customQuestions.isNotEmpty) {
// //       // استخدام الأسئلة المخصصة إذا تم توفيرها
// //       _questions = customQuestions
// //           .map((qMap) => QuestionModel(
// //                 type: qMap['type'],
// //                 question: qMap['question'],
// //                 options: qMap['options'] != null
// //                     ? List<String>.from(qMap['options'])
// //                     : [],
// //                 correct: qMap['correct'],
// //               ))
// //           .toList();
// //     } else {
// //       // استخدام الأسئلة الافتراضية
// //       _questions = [
// //         // True/False Questions
// //         QuestionModel(
// //           type: 'TrueFalse',
// //           question: 'The course material was easy to understand.',
// //           options: ['True', 'False'],
// //           correct: 'True',
// //         ),
// //         QuestionModel(
// //           type: 'TrueFalse',
// //           question: 'The instructor was available for questions.',
// //           options: ['True', 'False'],
// //           correct: 'True',
// //         ),
// //         QuestionModel(
// //           type: 'TrueFalse',
// //           question: 'The exams were too difficult.',
// //           options: ['True', 'False'],
// //           correct: 'False',
// //         ),
// //         // MCQ Questions
// //         QuestionModel(
// //           type: 'MCQ',
// //           question: 'How would you rate the course overall?',
// //           options: ['Excellent', 'Good', 'Average', 'Poor'],
// //           correct: 'Good',
// //         ),
// //         QuestionModel(
// //           type: 'MCQ',
// //           question: 'Which topic did you find most interesting?',
// //           options: ['Topic A', 'Topic B', 'Topic C', 'Topic D'],
// //           correct: 'Topic B',
// //         ),
// //         QuestionModel(
// //           type: 'MCQ',
// //           question: 'How often did you attend the lectures?',
// //           options: ['Always', 'Often', 'Sometimes', 'Never'],
// //           correct: 'Often',
// //         ),
// //         QuestionModel(
// //           type: 'MCQ',
// //           question: 'What was the most challenging part of the course?',
// //           options: ['Assignments', 'Exams', 'Projects', 'Lectures'],
// //           correct: 'Exams',
// //         ),
// //         // Essay Questions
// //         QuestionModel(
// //           type: 'Essay',
// //           question: 'What did you like most about the course?',
// //           options: [],
// //         ),
// //         QuestionModel(
// //           type: 'Essay',
// //           question: 'How can the course be improved?',
// //           options: [],
// //         ),
// //         QuestionModel(
// //           type: 'Essay',
// //           question: 'Describe your experience with the instructor.',
// //           options: [],
// //         ),
// //       ];
// //     }

// //     // إعادة تعيين الإجابات عند تهيئة أسئلة جديدة
// //     _userAnswers = {};

// //     if (_questions.isNotEmpty) _currentQuestionIndex = 0;
// //     notifyListeners();
// //   }

// //   void selectQuestion(int index) {
// //     _currentQuestionIndex = index;
// //     notifyListeners();
// //   }

// //   // دالة جديدة لحفظ إجابة المستخدم
// //   void setAnswer(int questionIndex, String answer) {
// //     _userAnswers[questionIndex] = answer;
// //     notifyListeners();
// //   }

// //   // دالة للحصول على إجابة لسؤال معين
// //   String? getAnswer(int questionIndex) {
// //     if (_userAnswers.containsKey(questionIndex)) {
// //       return _userAnswers[questionIndex];
// //     }
// //     return null;
// //   }

// //   // دالة للتحقق مما إذا كان السؤال قد تمت الإجابة عليه
// //   bool isQuestionAnswered(int questionIndex) {
// //     return _userAnswers.containsKey(questionIndex) &&
// //         _userAnswers[questionIndex]!.isNotEmpty;
// //   }

// //   // دالة للتحقق مما إذا كانت جميع الأسئلة قد تمت الإجابة عليها
// //   bool areAllQuestionsAnswered() {
// //     if (_questions.isEmpty) return false;

// //     for (int i = 0; i < _questions.length; i++) {
// //       if (!isQuestionAnswered(i)) {
// //         return false;
// //       }
// //     }
// //     return true;
// //   }

// //   // Future<void> markAsCompleted(String courseId, String questionnaireId) async {
// //   //   final user = FirebaseAuth.instance.currentUser;
// //   //   if (user != null) {
// //   //     await FirebaseFirestore.instance
// //   //         .collection('Courses')
// //   //         .doc(courseId)
// //   //         .collection('questionnaires')
// //   //         .doc(questionnaireId)
// //   //         .collection('filledBy')
// //   //         .doc(user.uid)
// //   //         .set({
// //   //       'uid': user.uid,
// //   //       'timestamp': FieldValue.serverTimestamp(),
// //   //       'answers': _userAnswers,
// //   //     }, SetOptions(merge: true));
// //   //   }
// //   // }

// //   Future<void> markAsCompleted(String courseId, String questionnaireId) async {
// //     try {
// //       final user = FirebaseAuth.instance.currentUser;
// //       if (user != null) {
// //         // تحويل مفاتيح _userAnswers من int إلى String
// //         final answersWithStringKeys =
// //             _userAnswers.map((key, value) => MapEntry(key.toString(), value));

// //         await FirebaseFirestore.instance
// //             .collection('Courses')
// //             .doc(courseId)
// //             .collection('questionnaires')
// //             .doc(questionnaireId)
// //             .collection('filledBy')
// //             .doc(user.uid)
// //             .set({
// //           'uid': user.uid,
// //           'timestamp': FieldValue.serverTimestamp(),
// //           'answers': answersWithStringKeys, // استخدام القاموس المحوّل
// //         }, SetOptions(merge: true));
// //       }
// //     } catch (e) {
// //       print('Error saving answers to Firestore: $e');
// //       // يمكن إضافة SnackBar لإظهار الخطأ للمستخدم إذا لزم الأمر
// //     }
// //   }
// // }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class StudentQuestionnaireViewmodel extends ChangeNotifier {
//   List<Map<String, dynamic>> _questions = [];
//   int _currentQuestionIndex = 0;
//   Map<int, dynamic> _userAnswers = {};

//   List<Map<String, dynamic>> get questions => _questions;
//   int get currentQuestionIndex => _currentQuestionIndex;
//   Map<String, dynamic> get currentQuestion => _questions[_currentQuestionIndex];

//   void initializeQuestions(List<Map<String, dynamic>> questions) {
//     _questions = questions;
//     _userAnswers = {};
//     _currentQuestionIndex = 0;
//     notifyListeners();
//   }

//   void selectQuestion(int index) {
//     _currentQuestionIndex = index;
//     notifyListeners();
//   }

//   void setAnswer(int questionIndex, dynamic answer) {
//     _userAnswers[questionIndex] = answer;
//     notifyListeners();
//   }

//   dynamic getAnswer(int questionIndex) {
//     return _userAnswers[questionIndex];
//   }

//   bool isQuestionAnswered(int index) {
//     return _userAnswers.containsKey(index);
//   }

//   bool areAllQuestionsAnswered() {
//     return _questions
//         .asMap()
//         .keys
//         .every((index) => _userAnswers.containsKey(index));
//   }

//   Future<void> markAsCompleted(String courseId, String questionnaireId) async {
//     try {
//       final user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         // جلب إصدار الـ Questionnaire
//         final doc = await FirebaseFirestore.instance
//             .collection('Courses')
//             .doc(courseId)
//             .collection('questionnaires')
//             .doc(questionnaireId)
//             .get();

//         if (!doc.exists) {
//           throw Exception('Questionnaire not found');
//         }

//         final questionnaireData = doc.data() as Map<String, dynamic>;
//         final version = questionnaireData['version'] as int? ?? 1;

//         // تحويل مفاتيح _userAnswers من int إلى String
//         final answersWithStringKeys =
//             _userAnswers.map((key, value) => MapEntry(key.toString(), value));

//         await FirebaseFirestore.instance
//             .collection('Courses')
//             .doc(courseId)
//             .collection('questionnaires')
//             .doc(questionnaireId)
//             .collection('filledBy')
//             .doc(user.uid)
//             .set({
//           'uid': user.uid,
//           'timestamp': FieldValue.serverTimestamp(),
//           'answers': answersWithStringKeys,
//           'completedVersion': version, // تخزين إصدار الـ Questionnaire
//         }, SetOptions(merge: true));
//       }
//     } catch (e) {
//       print('Error saving answers to Firestore: $e');
//       rethrow;
//     }
//   }
// }

import 'package:attendance_app/features/questionnaire/data/models/question_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StudentQuestionnaireViewmodel extends ChangeNotifier {
  List<QuestionModel> _questions = [];
  int _currentQuestionIndex = 0;
  Map<int, dynamic> _userAnswers = {};

  List<QuestionModel> get questions => _questions;
  int get currentQuestionIndex => _currentQuestionIndex;
  QuestionModel get currentQuestion => _questions[_currentQuestionIndex];

  void initializeQuestions(List<QuestionModel> questions) {
    _questions = questions;
    _userAnswers = {};
    _currentQuestionIndex = 0;
    notifyListeners();
  }

  void selectQuestion(int index) {
    _currentQuestionIndex = index;
    notifyListeners();
  }

  void setAnswer(int questionIndex, dynamic answer) {
    _userAnswers[questionIndex] = answer;
    notifyListeners();
  }

  dynamic getAnswer(int questionIndex) {
    return _userAnswers[questionIndex];
  }

  bool isQuestionAnswered(int index) {
    return _userAnswers.containsKey(index);
  }

  bool areAllQuestionsAnswered() {
    return _questions
        .asMap()
        .keys
        .every((index) => _userAnswers.containsKey(index));
  }

  Future<void> markAsCompleted(String courseId, String questionnaireId) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final doc = await FirebaseFirestore.instance
            .collection('Courses')
            .doc(courseId)
            .collection('questionnaires')
            .doc(questionnaireId)
            .get();

        if (!doc.exists) {
          throw Exception('Questionnaire not found');
        }

        final questionnaireData = doc.data() as Map<String, dynamic>;
        final version = questionnaireData['version'] as int? ?? 1;

        final answersWithStringKeys =
            _userAnswers.map((key, value) => MapEntry(key.toString(), value));

        await FirebaseFirestore.instance
            .collection('Courses')
            .doc(courseId)
            .collection('questionnaires')
            .doc(questionnaireId)
            .collection('filledBy')
            .doc(user.uid)
            .set({
          'uid': user.uid,
          'timestamp': FieldValue.serverTimestamp(),
          'answers': answersWithStringKeys,
          'completedVersion': version,
        }, SetOptions(merge: true));
      }
    } catch (e) {
      print('Error saving answers to Firestore: $e');
      rethrow;
    }
  }
}
