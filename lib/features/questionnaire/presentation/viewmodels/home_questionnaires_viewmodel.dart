// // // // // // import 'package:attendance_app/features/questionnaire/data/models/question_model.dart';
// // // // // // import 'package:attendance_app/features/questionnaire/data/models/questionnaire_model.dart';
// // // // // // import 'package:attendance_app/features/questionnaire/data/repositories/questionnaire_repository.dart';
// // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // import 'package:flutter/material.dart';

// // // // // // class HomeQuestionnairesViewModel extends ChangeNotifier {
// // // // // //   List<QuestionnaireModel> _questionnaires = [];
// // // // // //   int? _selectedIndex;
// // // // // //   bool _isLoading = true;
// // // // // //   final String courseId;
// // // // // //   final QuestionnaireRepository _repository = QuestionnaireRepository();

// // // // // //   List<QuestionnaireModel> get questionnaires => _questionnaires;
// // // // // //   int? get selectedIndex => _selectedIndex;
// // // // // //   bool get isLoading => _isLoading;

// // // // // //   HomeQuestionnairesViewModel({required this.courseId}) {
// // // // // //     _initializeQuestionnaires();
// // // // // //   }

// // // // // //   void _initializeQuestionnaires() async {
// // // // // //     try {
// // // // // //       _questionnaires = await _repository.getQuestionnaires(courseId);
// // // // // //     } catch (e) {
// // // // // //       print('Error fetching questionnaires: $e');
// // // // // //     } finally {
// // // // // //       _isLoading = false;
// // // // // //       notifyListeners();
// // // // // //     }
// // // // // //   }

// // // // // //   void selectQuestionnaire(int index) {
// // // // // //     _selectedIndex = index;
// // // // // //     notifyListeners();
// // // // // //   }

// // // // // //   void deleteQuestionnaire(int index) async {
// // // // // //     try {
// // // // // //       if (_questionnaires.isNotEmpty && index < _questionnaires.length) {
// // // // // //         await _repository.deleteQuestionnaire(
// // // // // //             courseId, _questionnaires[index].name);
// // // // // //         _questionnaires.removeAt(index);
// // // // // //         _selectedIndex = null;
// // // // // //         notifyListeners();
// // // // // //       }
// // // // // //     } catch (e) {
// // // // // //       print('Error deleting questionnaire: $e');
// // // // // //     }
// // // // // //   }

// // // // // //   void addQuestionnaire(List<QuestionModel> newQuestions) async {
// // // // // //     try {
// // // // // //       final newQuestionnaire =
// // // // // //           await _repository.addQuestionnaire(courseId, newQuestions);
// // // // // //       _questionnaires.add(newQuestionnaire);
// // // // // //       notifyListeners();
// // // // // //     } catch (e) {
// // // // // //       print('Error adding questionnaire: $e');
// // // // // //     }
// // // // // //   }

// // // // // //   void updateQuestionnaire(
// // // // // //       String questionnaireId, List<QuestionModel> updatedQuestions) async {
// // // // // //     try {
// // // // // //       await _repository.updateQuestionnaire(
// // // // // //           courseId, questionnaireId, updatedQuestions);
// // // // // //       final index =
// // // // // //           _questionnaires.indexWhere((q) => q.name == questionnaireId);
// // // // // //       if (index != -1) {
// // // // // //         _questionnaires[index] =
// // // // // //             _questionnaires[index].copyWith(questions: updatedQuestions);
// // // // // //       }
// // // // // //       notifyListeners();
// // // // // //     } catch (e) {
// // // // // //       print('Error updating questionnaire: $e');
// // // // // //     }
// // // // // //   }

// // // // // //   void markQuestionnaireAsCompleted(String questionnaireId) async {
// // // // // //     try {
// // // // // //       final index =
// // // // // //           _questionnaires.indexWhere((q) => q.name == questionnaireId);
// // // // // //       if (index != -1) {
// // // // // //         _questionnaires[index] =
// // // // // //             _questionnaires[index].copyWith(isCompleted: true);
// // // // // //         await FirebaseFirestore.instance
// // // // // //             .collection('Courses')
// // // // // //             .doc(courseId)
// // // // // //             .collection('questionnaires')
// // // // // //             .doc(questionnaireId)
// // // // // //             .update({'isCompleted': true});
// // // // // //         notifyListeners();
// // // // // //       }
// // // // // //     } catch (e) {
// // // // // //       print('Error marking questionnaire as completed: $e');
// // // // // //     }
// // // // // //   }
// // // // // // }

// // // // // // extension QuestionnaireModelExtension on QuestionnaireModel {
// // // // // //   QuestionnaireModel copyWith(
// // // // // //       {List<QuestionModel>? questions, bool? isCompleted}) {
// // // // // //     return QuestionnaireModel(
// // // // // //       name: this.name,
// // // // // //       date: this.date,
// // // // // //       doctor: this.doctor,
// // // // // //       questions: questions ?? this.questions,
// // // // // //       isCompleted: isCompleted ?? this.isCompleted,
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // import 'package:attendance_app/features/questionnaire/data/models/question_model.dart';
// // // // // import 'package:attendance_app/features/questionnaire/data/models/questionnaire_model.dart';
// // // // // import 'package:attendance_app/features/questionnaire/data/repositories/questionnaire_repository.dart';
// // // // // import 'package:flutter/material.dart';

// // // // // class HomeQuestionnairesViewModel extends ChangeNotifier {
// // // // //   List<QuestionnaireModel> _questionnaires = [];
// // // // //   int? _selectedIndex;
// // // // //   bool _isLoading = true;
// // // // //   final String courseId;
// // // // //   final QuestionnaireRepository _repository = QuestionnaireRepository();

// // // // //   List<QuestionnaireModel> get questionnaires => _questionnaires;
// // // // //   int? get selectedIndex => _selectedIndex;
// // // // //   bool get isLoading => _isLoading;

// // // // //   HomeQuestionnairesViewModel({required this.courseId}) {
// // // // //     _initializeQuestionnaires();
// // // // //   }

// // // // //   void _initializeQuestionnaires() async {
// // // // //     try {
// // // // //       _questionnaires = await _repository.getQuestionnaires(courseId);
// // // // //     } catch (e) {
// // // // //       print('Error fetching questionnaires: $e');
// // // // //     } finally {
// // // // //       _isLoading = false;
// // // // //       notifyListeners();
// // // // //     }
// // // // //   }

// // // // //   void selectQuestionnaire(int index) {
// // // // //     _selectedIndex = index;
// // // // //     notifyListeners();
// // // // //   }

// // // // //   void deleteQuestionnaire(int index) async {
// // // // //     try {
// // // // //       if (_questionnaires.isNotEmpty && index < _questionnaires.length) {
// // // // //         await _repository.deleteQuestionnaire(
// // // // //             courseId, _questionnaires[index].name);
// // // // //         _questionnaires.removeAt(index);
// // // // //         _selectedIndex = null;
// // // // //         notifyListeners();
// // // // //       }
// // // // //     } catch (e) {
// // // // //       print('Error deleting questionnaire: $e');
// // // // //     }
// // // // //   }

// // // // //   void addQuestionnaire(List<QuestionModel> newQuestions) async {
// // // // //     try {
// // // // //       final newQuestionnaire =
// // // // //           await _repository.addQuestionnaire(courseId, newQuestions);
// // // // //       _questionnaires.add(newQuestionnaire);
// // // // //       notifyListeners();
// // // // //     } catch (e) {
// // // // //       print('Error adding questionnaire: $e');
// // // // //     }
// // // // //   }

// // // // //   void updateQuestionnaire(
// // // // //       String questionnaireId, List<QuestionModel> updatedQuestions) async {
// // // // //     try {
// // // // //       await _repository.updateQuestionnaire(
// // // // //           courseId, questionnaireId, updatedQuestions);
// // // // //       final index =
// // // // //           _questionnaires.indexWhere((q) => q.name == questionnaireId);
// // // // //       if (index != -1) {
// // // // //         _questionnaires[index] = QuestionnaireModel(
// // // // //           name: _questionnaires[index].name,
// // // // //           date: _questionnaires[index].date,
// // // // //           doctor: _questionnaires[index].doctor,
// // // // //           questions: updatedQuestions,
// // // // //         );
// // // // //       }
// // // // //       notifyListeners();
// // // // //     } catch (e) {
// // // // //       print('Error updating questionnaire: $e');
// // // // //     }
// // // // //   }
// // // // // }

// // // // import 'package:attendance_app/features/questionnaire/data/models/questionnaire_model.dart';
// // // // import 'package:attendance_app/features/questionnaire/data/models/question_model.dart';
// // // // import 'package:attendance_app/features/questionnaire/data/repositories/questionnaire_repository.dart';
// // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // import 'package:flutter/material.dart';

// // // // class HomeQuestionnairesViewModel extends ChangeNotifier {
// // // //   List<QuestionnaireModel> _questionnaires = [];
// // // //   int? _selectedIndex;
// // // //   bool _isLoading = true;
// // // //   final String courseId;
// // // //   final QuestionnaireRepository _repository = QuestionnaireRepository();

// // // //   List<QuestionnaireModel> get questionnaires => _questionnaires;
// // // //   int? get selectedIndex => _selectedIndex;
// // // //   bool get isLoading => _isLoading;

// // // //   HomeQuestionnairesViewModel({required this.courseId}) {
// // // //     _initializeQuestionnaires();
// // // //   }

// // // //   void _initializeQuestionnaires() async {
// // // //     try {
// // // //       _questionnaires = await _repository.getQuestionnaires(courseId);
// // // //     } catch (e) {
// // // //       print('Error fetching questionnaires: $e');
// // // //     } finally {
// // // //       _isLoading = false;
// // // //       notifyListeners();
// // // //     }
// // // //   }

// // // //   void selectQuestionnaire(int index) {
// // // //     _selectedIndex = index;
// // // //     notifyListeners();
// // // //   }

// // // //   void deleteQuestionnaire(int index) async {
// // // //     try {
// // // //       if (_questionnaires.isNotEmpty && index < _questionnaires.length) {
// // // //         await _repository.deleteQuestionnaire(
// // // //             courseId, _questionnaires[index].name);
// // // //         _questionnaires.removeAt(index);
// // // //         _selectedIndex = null;
// // // //         notifyListeners();
// // // //       }
// // // //     } catch (e) {
// // // //       print('Error deleting questionnaire: $e');
// // // //     }
// // // //   }

// // // //   void addQuestionnaire(List<QuestionModel> newQuestions) async {
// // // //     try {
// // // //       final newQuestionnaire =
// // // //           await _repository.addQuestionnaire(courseId, newQuestions);
// // // //       _questionnaires.add(newQuestionnaire);
// // // //       notifyListeners();
// // // //     } catch (e) {
// // // //       print('Error adding questionnaire: $e');
// // // //     }
// // // //   }

// // // //   void updateQuestionnaire(
// // // //       String questionnaireId, List<QuestionModel> updatedQuestions) async {
// // // //     try {
// // // //       await _repository.updateQuestionnaire(
// // // //           courseId, questionnaireId, updatedQuestions);
// // // //       final index =
// // // //           _questionnaires.indexWhere((q) => q.name == questionnaireId);
// // // //       if (index != -1) {
// // // //         _questionnaires[index] = QuestionnaireModel(
// // // //           name: _questionnaires[index].name,
// // // //           date: _questionnaires[index].date,
// // // //           doctor: _questionnaires[index].doctor,
// // // //           questions: updatedQuestions,
// // // //         );
// // // //       }
// // // //       notifyListeners();
// // // //     } catch (e) {
// // // //       print('Error updating questionnaire: $e');
// // // //     }
// // // //   }

// // // //   // دالة جديدة لتحديث حالة الإكمال في filledBy
// // // //   void markQuestionnaireAsCompleted(String questionnaireId) async {
// // // //     final user = FirebaseAuth.instance.currentUser;
// // // //     if (user != null) {
// // // //       await FirebaseFirestore.instance
// // // //           .collection('Courses')
// // // //           .doc(courseId)
// // // //           .collection('questionnaires')
// // // //           .doc(questionnaireId)
// // // //           .collection('filledBy')
// // // //           .doc(user.uid)
// // // //           .set({
// // // //         'uid': user.uid,
// // // //         'timestamp': FieldValue.serverTimestamp(),
// // // //       }, SetOptions(merge: true));
// // // //       notifyListeners(); // لتحديث الـ UI لو فيه حاجة تعتمد على الدالة
// // // //     }
// // // //   }
// // // // }

// // // import 'package:attendance_app/features/questionnaire/data/models/questionnaire_model.dart';
// // // import 'package:attendance_app/features/questionnaire/data/models/question_model.dart';
// // // import 'package:attendance_app/features/questionnaire/data/repositories/questionnaire_repository.dart';
// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:firebase_auth/firebase_auth.dart';
// // // import 'package:flutter/material.dart';

// // // class HomeQuestionnairesViewModel extends ChangeNotifier {
// // //   List<QuestionnaireModel> _questionnaires = [];
// // //   List<bool> _isCompletedList = []; // لتخزين حالة الإكمال لكل questionnaire
// // //   int? _selectedIndex;
// // //   bool _isLoading = true;
// // //   final String courseId;
// // //   final QuestionnaireRepository _repository = QuestionnaireRepository();

// // //   List<QuestionnaireModel> get questionnaires => _questionnaires;
// // //   List<bool> get isCompletedList => _isCompletedList;
// // //   int? get selectedIndex => _selectedIndex;
// // //   bool get isLoading => _isLoading;

// // //   HomeQuestionnairesViewModel({required this.courseId}) {
// // //     _initializeQuestionnaires();
// // //   }

// // //   void _initializeQuestionnaires() async {
// // //     try {
// // //       _isLoading = true;
// // //       notifyListeners();

// // //       _questionnaires = await _repository.getQuestionnaires(courseId);

// // //       // التحقق من حالة الإكمال لكل questionnaire
// // //       final user = FirebaseAuth.instance.currentUser;
// // //       if (user != null) {
// // //         _isCompletedList = [];
// // //         for (var questionnaire in _questionnaires) {
// // //           final docSnapshot = await FirebaseFirestore.instance
// // //               .collection('Courses')
// // //               .doc(courseId)
// // //               .collection('questionnaires')
// // //               .doc(questionnaire.name)
// // //               .collection('filledBy')
// // //               .doc(user.uid)
// // //               .get();
// // //           _isCompletedList.add(docSnapshot.exists);
// // //         }
// // //       } else {
// // //         _isCompletedList = List.filled(_questionnaires.length, false);
// // //       }
// // //     } catch (e) {
// // //       print('Error fetching questionnaires: $e');
// // //     } finally {
// // //       _isLoading = false;
// // //       notifyListeners();
// // //     }
// // //   }

// // //   void selectQuestionnaire(int index) {
// // //     _selectedIndex = index;
// // //     notifyListeners();
// // //   }

// // //   void deleteQuestionnaire(int index) async {
// // //     try {
// // //       if (_questionnaires.isNotEmpty && index < _questionnaires.length) {
// // //         await _repository.deleteQuestionnaire(
// // //             courseId, _questionnaires[index].name);
// // //         _questionnaires.removeAt(index);
// // //         _isCompletedList.removeAt(index);
// // //         _selectedIndex = null;
// // //         notifyListeners();
// // //       }
// // //     } catch (e) {
// // //       print('Error deleting questionnaire: $e');
// // //     }
// // //   }

// // //   void addQuestionnaire(List<QuestionModel> newQuestions) async {
// // //     try {
// // //       final newQuestionnaire =
// // //           await _repository.addQuestionnaire(courseId, newQuestions);
// // //       _questionnaires.add(newQuestionnaire);
// // //       _isCompletedList.add(false); // افتراضيًا لم يتم الإكمال
// // //       notifyListeners();
// // //     } catch (e) {
// // //       print('Error adding questionnaire: $e');
// // //     }
// // //   }

// // //   void updateQuestionnaire(
// // //       String questionnaireId, List<QuestionModel> updatedQuestions) async {
// // //     try {
// // //       await _repository.updateQuestionnaire(
// // //           courseId, questionnaireId, updatedQuestions);
// // //       final index =
// // //           _questionnaires.indexWhere((q) => q.name == questionnaireId);
// // //       if (index != -1) {
// // //         _questionnaires[index] = QuestionnaireModel(
// // //           name: _questionnaires[index].name,
// // //           date: _questionnaires[index].date,
// // //           doctor: _questionnaires[index].doctor,
// // //           questions: updatedQuestions,
// // //         );
// // //       }
// // //       notifyListeners();
// // //     } catch (e) {
// // //       print('Error updating questionnaire: $e');
// // //     }
// // //   }

// // //   void markQuestionnaireAsCompleted(String questionnaireId) async {
// // //     try {
// // //       final user = FirebaseAuth.instance.currentUser;
// // //       if (user != null) {
// // //         await FirebaseFirestore.instance
// // //             .collection('Courses')
// // //             .doc(courseId)
// // //             .collection('questionnaires')
// // //             .doc(questionnaireId)
// // //             .collection('filledBy')
// // //             .doc(user.uid)
// // //             .set({
// // //           'uid': user.uid,
// // //           'timestamp': FieldValue.serverTimestamp(),
// // //         }, SetOptions(merge: true));
// // //         // تحديث قائمة isCompletedList
// // //         final index =
// // //             _questionnaires.indexWhere((q) => q.name == questionnaireId);
// // //         if (index != -1) {
// // //           _isCompletedList[index] = true;
// // //         }
// // //         notifyListeners();
// // //       }
// // //     } catch (e) {
// // //       print('Error marking questionnaire as completed: $e');
// // //     }
// // //   }
// // // }

// // import 'package:attendance_app/features/questionnaire/data/models/question_model.dart';
// // import 'package:attendance_app/features/questionnaire/data/models/questionnaire_model.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';

// // class HomeQuestionnairesViewModel extends ChangeNotifier {
// //   final String courseId;
// //   List<QuestionnaireModel> _questionnaires = [];
// //   List<bool> _isCompletedList = [];
// //   List<bool> _isModifiedList = []; // لتتبع التعديلات
// //   bool isLoading = false;

// //   HomeQuestionnairesViewModel({required this.courseId}) {
// //     _initializeQuestionnaires();
// //   }

// //   List<QuestionnaireModel> get questionnaires => _questionnaires;
// //   List<bool> get isCompletedList => _isCompletedList;
// //   List<bool> get isModifiedList => _isModifiedList;

// //   Future<void> _initializeQuestionnaires() async {
// //     try {
// //       isLoading = true;
// //       notifyListeners();

// //       final user = FirebaseAuth.instance.currentUser;
// //       final snapshot = await FirebaseFirestore.instance
// //           .collection('Courses')
// //           .doc(courseId)
// //           .collection('questionnaires')
// //           .get();

// //       _questionnaires = snapshot.docs
// //           .map((doc) => QuestionnaireModel.fromMap({
// //                 ...doc.data(),
// //                 'name': doc.id,
// //               }))
// //           .toList();

// //       _isCompletedList = [];
// //       _isModifiedList = [];

// //       if (user != null) {
// //         for (final questionnaire in _questionnaires) {
// //           final filledSnapshot = await FirebaseFirestore.instance
// //               .collection('Courses')
// //               .doc(courseId)
// //               .collection('questionnaires')
// //               .doc(questionnaire.name)
// //               .collection('filledBy')
// //               .doc(user.uid)
// //               .get();

// //           bool isCompleted = filledSnapshot.exists;
// //           bool isModified = false;

// //           if (isCompleted) {
// //             final filledData = filledSnapshot.data() as Map<String, dynamic>;
// //             final completedVersion =
// //                 filledData['completedVersion'] as int? ?? 1;
// //             isModified = completedVersion < questionnaire.version;
// //             isCompleted = completedVersion >= questionnaire.version;
// //           }

// //           _isCompletedList.add(isCompleted);
// //           _isModifiedList.add(isModified);
// //         }
// //       } else {
// //         _isCompletedList = List.filled(_questionnaires.length, false);
// //         _isModifiedList = List.filled(_questionnaires.length, false);
// //       }

// //       isLoading = false;
// //       notifyListeners();
// //     } catch (e) {
// //       print('Error initializing questionnaires: $e');
// //       isLoading = false;
// //       notifyListeners();
// //     }
// //   }

// //   Future<void> updateQuestionnaire(
// //       String questionnaireId, List<QuestionModel> newQuestions) async {
// //     try {
// //       // جلب الـ Questionnaire الحالي لمعرفة الإصدار
// //       final doc = await FirebaseFirestore.instance
// //           .collection('Courses')
// //           .doc(courseId)
// //           .collection('questionnaires')
// //           .doc(questionnaireId)
// //           .get();

// //       if (!doc.exists) {
// //         throw Exception('Questionnaire not found');
// //       }

// //       final currentData = doc.data() as Map<String, dynamic>;
// //       final currentVersion = currentData['version'] as int? ?? 1;

// //       // تحديث الـ Questionnaire مع الأسئلة الجديدة وزيادة الإصدار
// //       await FirebaseFirestore.instance
// //           .collection('Courses')
// //           .doc(courseId)
// //           .collection('questionnaires')
// //           .doc(questionnaireId)
// //           .set({
// //         'questions': newQuestions.map((q) => q.toMap()).toList(),
// //         'version': currentVersion + 1, // زيادة الإصدار تلقائيًا
// //         'name': currentData['name'],
// //         'date': currentData['date'],
// //         'doctor': currentData['doctor'],
// //       }, SetOptions(merge: true));

// //       // تحديث القائمة المحلية
// //       final index =
// //           _questionnaires.indexWhere((q) => q.name == questionnaireId);
// //       if (index != -1) {
// //         _questionnaires[index] = QuestionnaireModel(
// //           name: questionnaireId,
// //           questions: newQuestions,
// //           date: currentData['date'],
// //           doctor: currentData['doctor'],
// //           version: currentVersion + 1,
// //         );
// //         _isCompletedList[index] = false; // إعادة فتح للطلاب
// //         _isModifiedList[index] = true; // إشارة إلى التعديل
// //       }
// //       notifyListeners();
// //     } catch (e) {
// //       print('Error updating questionnaire: $e');
// //       rethrow;
// //     }
// //   }

// //   void markQuestionnaireAsCompleted(String questionnaireId) async {
// //     try {
// //       final user = FirebaseAuth.instance.currentUser;
// //       if (user != null) {
// //         final doc = await FirebaseFirestore.instance
// //             .collection('Courses')
// //             .doc(courseId)
// //             .collection('questionnaires')
// //             .doc(questionnaireId)
// //             .get();

// //         if (!doc.exists) {
// //           throw Exception('Questionnaire not found');
// //         }

// //         final version = doc.data()!['version'] as int? ?? 1;

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
// //           'completedVersion': version,
// //         }, SetOptions(merge: true));

// //         final index =
// //             _questionnaires.indexWhere((q) => q.name == questionnaireId);
// //         if (index != -1) {
// //           _isCompletedList[index] = true;
// //           _isModifiedList[index] = false;
// //         }
// //         notifyListeners();
// //       }
// //     } catch (e) {
// //       print('Error marking questionnaire as completed: $e');
// //     }
// //   }
// // }

// import 'package:attendance_app/features/questionnaire/data/models/question_model.dart';
// import 'package:attendance_app/features/questionnaire/data/models/questionnaire_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class HomeQuestionnairesViewModel extends ChangeNotifier {
//   final String courseId;
//   List<QuestionnaireModel> _questionnaires = [];
//   List<bool> _isCompletedList = [];
//   List<bool> _isModifiedList = [];
//   bool isLoading = false;
//   int _selectedQuestionnaireIndex = -1; // لتتبع الـ Questionnaire المختار للحذف

//   HomeQuestionnairesViewModel({required this.courseId}) {
//     _initializeQuestionnaires();
//   }

//   List<QuestionnaireModel> get questionnaires => _questionnaires;
//   List<bool> get isCompletedList => _isCompletedList;
//   List<bool> get isModifiedList => _isModifiedList;

//   Future<void> _initializeQuestionnaires() async {
//     try {
//       isLoading = true;
//       notifyListeners();

//       final user = FirebaseAuth.instance.currentUser;
//       final snapshot = await FirebaseFirestore.instance
//           .collection('Courses')
//           .doc(courseId)
//           .collection('questionnaires')
//           .get();

//       _questionnaires = snapshot.docs
//           .map((doc) => QuestionnaireModel.fromMap({
//                 ...doc.data(),
//                 'name': doc.id,
//               }))
//           .toList();

//       _isCompletedList = [];
//       _isModifiedList = [];

//       if (user != null) {
//         for (final questionnaire in _questionnaires) {
//           final filledSnapshot = await FirebaseFirestore.instance
//               .collection('Courses')
//               .doc(courseId)
//               .collection('questionnaires')
//               .doc(questionnaire.name)
//               .collection('filledBy')
//               .doc(user.uid)
//               .get();

//           bool isCompleted = filledSnapshot.exists;
//           bool isModified = false;

//           if (isCompleted) {
//             final filledData = filledSnapshot.data() as Map<String, dynamic>;
//             final completedVersion = filledData['completedVersion'] as int? ?? 1;
//             isModified = completedVersion < questionnaire.version;
//             isCompleted = completedVersion >= questionnaire.version;
//           }

//           _isCompletedList.add(isCompleted);
//           _isModifiedList.add(isModified);
//         }
//       } else {
//         _isCompletedList = List.filled(_questionnaires.length, false);
//         _isModifiedList = List.filled(_questionnaires.length, false);
//       }

//       isLoading = false;
//       notifyListeners();
//     } catch (e) {
//       print('Error initializing questionnaires: $e');
//       isLoading = false;
//       notifyListeners();
//     }
//   }

//   Future<void> addQuestionnaire(List<QuestionModel> questions) async {
//     try {
//       final now = DateTime.now();
//       final formattedDate = DateFormat('dd-MM-yyyy HH:mm').format(now);
//       final user = FirebaseAuth.instance.currentUser;
//       final doctor = user != null ? (await FirebaseFirestore.instance
//           .collection('users')
//           .doc(user.uid)
//           .get())
//           .data()?['name'] ?? 'Unknown' : 'Unknown';

//       final newQuestionnaireId = FirebaseFirestore.instance
//           .collection('Courses')
//           .doc(courseId)
//           .collection('questionnaires')
//           .doc()
//           .id;

//       await FirebaseFirestore.instance
//           .collection('Courses')
//           .doc(courseId)
//           .collection('questionnaires')
//           .doc(newQuestionnaireId)
//           .set({
//         'name': 'Questionnaire ${newQuestionnaireId}',
//         'questions': questions.map((q) => q.toMap()).toList(),
//         'version': 1,
//         'date': formattedDate,
//         'doctor': doctor,
//       });

//       _questionnaires.add(QuestionnaireModel(
//         name: newQuestionnaireId,
//         questions: questions,
//         date: formattedDate,
//         doctor: doctor,
//         version: 1,
//       ));
//       _isCompletedList.add(false);
//       _isModifiedList.add(false);
//       notifyListeners();
//     } catch (e) {
//       print('Error adding questionnaire: $e');
//       rethrow;
//     }
//   }

//   Future<void> updateQuestionnaire(
//       String questionnaireId, List<QuestionModel> newQuestions) async {
//     try {
//       final doc = await FirebaseFirestore.instance
//           .collection('Courses')
//           .doc(courseId)
//           .collection('questionnaires')
//           .doc(questionnaireId)
//           .get();

//       if (!doc.exists) {
//         throw Exception('Questionnaire not found');
//       }

//       final currentData = doc.data() as Map<String, dynamic>;
//       final currentVersion = currentData['version'] as int? ?? 1;

//       await FirebaseFirestore.instance
//           .collection('Courses')
//           .doc(courseId)
//           .collection('questionnaires')
//           .doc(questionnaireId)
//           .set({
//         'questions': newQuestions.map((q) => q.toMap()).toList(),
//         'version': currentVersion + 1,
//         'name': currentData['name'],
//         'date': currentData['date'],
//         'doctor': currentData['doctor'],
//       }, SetOptions(merge: true));

//       final index = _questionnaires.indexWhere((q) => q.name == questionnaireId);
//       if (index != -1) {
//         _questionnaires[index] = QuestionnaireModel(
//           name: questionnaireId,
//           questions: newQuestions,
//           date: currentData['date'],
//           doctor: currentData['doctor'],
//           version: currentVersion + 1,
//         );
//         _isCompletedList[index] = false;
//         _isModifiedList[index] = true;
//       }
//       notifyListeners();
//     } catch (e) {
//       print('Error updating questionnaire: $e');
//       rethrow;
//     }
//   }

//   Future<void> deleteQuestionnaire(int index) async {
//     try {
//       final questionnaireId = _questionnaires[index].name;
//       await FirebaseFirestore.instance
//           .collection('Courses')
//           .doc(courseId)
//           .collection('questionnaires')
//           .doc(questionnaireId)
//           .delete();

//       _questionnaires.removeAt(index);
//       _isCompletedList.removeAt(index);
//       _isModifiedList.removeAt(index);
//       _selectedQuestionnaireIndex = -1;
//       notifyListeners();
//     } catch (e) {
//       print('Error deleting questionnaire: $e');
//       rethrow;
//     }
//   }

//   void selectQuestionnaire(int index) {
//     _selectedQuestionnaireIndex = index;
//     notifyListeners();
//   }

//   void markQuestionnaireAsCompleted(String questionnaireId) async {
//     try {
//       final user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         final doc = await FirebaseFirestore.instance
//             .collection('Courses')
//             .doc(courseId)
//             .collection('questionnaires')
//             .doc(questionnaireId)
//             .get();

//         if (!doc.exists) {
//           throw Exception('Questionnaire not found');
//         }

//         final version = doc.data()!['version'] as int? ?? 1;

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
//           'completedVersion': version,
//         }, SetOptions(merge: true));

//         final index = _questionnaires.indexWhere((q) => q.name == questionnaireId);
//         if (index != -1) {
//           _isCompletedList[index] = true;
//           _isModifiedList[index] = false;
//         }
//         notifyListeners();
//       }
//     } catch (e) {
//       print('Error marking questionnaire as completed: $e');
//     }
//   }
// }

import 'package:attendance_app/features/questionnaire/data/models/question_model.dart';
import 'package:attendance_app/features/questionnaire/data/models/questionnaire_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeQuestionnairesViewModel extends ChangeNotifier {
  final String courseId;
  List<QuestionnaireModel> _questionnaires = [];
  List<bool> _isCompletedList = [];
  List<bool> _isModifiedList = [];
  bool isLoading = false;
  int _selectedQuestionnaireIndex = -1;

  HomeQuestionnairesViewModel({required this.courseId}) {
    _initializeQuestionnaires();
  }

  List<QuestionnaireModel> get questionnaires => _questionnaires;
  List<bool> get isCompletedList => _isCompletedList;
  List<bool> get isModifiedList => _isModifiedList;

  Future<void> _initializeQuestionnaires() async {
    try {
      isLoading = true;
      notifyListeners();

      final user = FirebaseAuth.instance.currentUser;
      final snapshot = await FirebaseFirestore.instance
          .collection('Courses')
          .doc(courseId)
          .collection('questionnaires')
          .get();

      _questionnaires = snapshot.docs
          .map((doc) => QuestionnaireModel.fromMap({
                ...doc.data(),
                'name': doc.id,
              }))
          .toList();

      _isCompletedList = [];
      _isModifiedList = [];

      if (user != null) {
        for (final questionnaire in _questionnaires) {
          final filledSnapshot = await FirebaseFirestore.instance
              .collection('Courses')
              .doc(courseId)
              .collection('questionnaires')
              .doc(questionnaire.name)
              .collection('filledBy')
              .doc(user.uid)
              .get();

          bool isCompleted = filledSnapshot.exists;
          bool isModified = false;

          if (isCompleted) {
            final filledData = filledSnapshot.data() as Map<String, dynamic>;
            final completedVersion =
                filledData['completedVersion'] as int? ?? 1;
            isModified = completedVersion < questionnaire.version;
            isCompleted = completedVersion >= questionnaire.version;
          }

          _isCompletedList.add(isCompleted);
          _isModifiedList.add(isModified);
        }
      } else {
        _isCompletedList = List.filled(_questionnaires.length, false);
        _isModifiedList = List.filled(_questionnaires.length, false);
      }

      isLoading = false;
      notifyListeners();
    } catch (e) {
      print('Error initializing questionnaires: $e');
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addQuestionnaire(List<QuestionModel> questions) async {
    try {
      final now = DateTime.now();
      final formattedDate = DateFormat('dd-MM-yyyy HH:mm').format(now);
      final user = FirebaseAuth.instance.currentUser;
      String doctor = 'Unknown';

      if (user != null) {
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        doctor = userDoc.data()?['name'] ?? 'Unknown';
      }

      final newQuestionnaireId = FirebaseFirestore.instance
          .collection('Courses')
          .doc(courseId)
          .collection('questionnaires')
          .doc()
          .id;

      await FirebaseFirestore.instance
          .collection('Courses')
          .doc(courseId)
          .collection('questionnaires')
          .doc(newQuestionnaireId)
          .set({
        'name': 'Questionnaire ${newQuestionnaireId}',
        'questions': questions.map((q) => q.toMap()).toList(),
        'version': 1,
        'date': formattedDate,
        'doctor': doctor,
      });

      _questionnaires.add(QuestionnaireModel(
        name: newQuestionnaireId,
        questions: questions,
        date: formattedDate,
        doctor: doctor,
        version: 1,
      ));
      _isCompletedList.add(false);
      _isModifiedList.add(false);
      notifyListeners();
    } catch (e) {
      print('Error adding questionnaire: $e');
      rethrow;
    }
  }

  Future<void> updateQuestionnaire(
      String questionnaireId, List<QuestionModel> newQuestions) async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection('Courses')
          .doc(courseId)
          .collection('questionnaires')
          .doc(questionnaireId)
          .get();

      if (!doc.exists) {
        throw Exception('Questionnaire not found');
      }

      final currentData = doc.data() as Map<String, dynamic>;
      final currentVersion = currentData['version'] as int? ?? 1;

      await FirebaseFirestore.instance
          .collection('Courses')
          .doc(courseId)
          .collection('questionnaires')
          .doc(questionnaireId)
          .set({
        'questions': newQuestions.map((q) => q.toMap()).toList(),
        'version': currentVersion + 1,
        'name': currentData['name'],
        'date': currentData['date'],
        'doctor': currentData['doctor'],
      }, SetOptions(merge: true));

      final index =
          _questionnaires.indexWhere((q) => q.name == questionnaireId);
      if (index != -1) {
        _questionnaires[index] = QuestionnaireModel(
          name: questionnaireId,
          questions: newQuestions,
          date: currentData['date'],
          doctor: currentData['doctor'],
          version: currentVersion + 1,
        );
        _isCompletedList[index] = false;
        _isModifiedList[index] = true;
      }
      notifyListeners();
    } catch (e) {
      print('Error updating questionnaire: $e');
      rethrow;
    }
  }

  Future<void> deleteQuestionnaire(int index) async {
    try {
      final questionnaireId = _questionnaires[index].name;
      await FirebaseFirestore.instance
          .collection('Courses')
          .doc(courseId)
          .collection('questionnaires')
          .doc(questionnaireId)
          .delete();

      _questionnaires.removeAt(index);
      _isCompletedList.removeAt(index);
      _isModifiedList.removeAt(index);
      _selectedQuestionnaireIndex = -1;
      notifyListeners();
    } catch (e) {
      print('Error deleting questionnaire: $e');
      rethrow;
    }
  }

  void selectQuestionnaire(int index) {
    _selectedQuestionnaireIndex = index;
    notifyListeners();
  }

  void markQuestionnaireAsCompleted(String questionnaireId) async {
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

        final version = doc.data()!['version'] as int? ?? 1;

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
          'completedVersion': version,
        }, SetOptions(merge: true));

        final index =
            _questionnaires.indexWhere((q) => q.name == questionnaireId);
        if (index != -1) {
          _isCompletedList[index] = true;
          _isModifiedList[index] = false;
        }
        notifyListeners();
      }
    } catch (e) {
      print('Error marking questionnaire as completed: $e');
    }
  }
}
