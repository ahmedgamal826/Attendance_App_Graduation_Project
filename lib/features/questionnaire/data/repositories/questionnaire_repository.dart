// import 'package:attendance_app/features/questionnaire/data/models/question_model.dart';
// import 'package:attendance_app/features/questionnaire/data/models/questionnaire_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:intl/intl.dart';

// class QuestionnaireRepository {
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;

//   Future<List<QuestionnaireModel>> getQuestionnaires(String courseId) async {
//     final querySnapshot = await firestore
//         .collection('Courses')
//         .doc(courseId)
//         .collection('questionnaires')
//         .get();
//     return querySnapshot.docs.map((doc) {
//       final data = doc.data();
//       data['id'] = doc.id;
//       return QuestionnaireModel.fromMap(data);
//     }).toList();
//   }

//   Future<void> deleteQuestionnaire(
//       String courseId, String questionnaireId) async {
//     await firestore
//         .collection('Courses')
//         .doc(courseId)
//         .collection('questionnaires')
//         .doc(questionnaireId)
//         .delete();
//   }

//   Future<QuestionnaireModel> addQuestionnaire(
//       String courseId, List<QuestionModel> questions) async {
//     final user = FirebaseAuth.instance.currentUser;
//     final userDoc = await firestore.collection('users').doc(user?.uid).get();
//     final doctorName = userDoc.data()?['name'] ?? 'Unknown Admin';
//     final formattedDate = DateFormat('dd-MM-yyyy HH:mm').format(DateTime.now());
//     final newDocRef = firestore
//         .collection('Courses')
//         .doc(courseId)
//         .collection('questionnaires')
//         .doc();
//     final newQuestionnaire = QuestionnaireModel(
//       name: newDocRef.id, // استخدام ID المستند كاسم للاستبيان
//       date: formattedDate,
//       doctor: doctorName,
//       questions: questions,
//     );
//     await newDocRef.set(newQuestionnaire.toMap());
//     return newQuestionnaire;
//   }

//   Future<void> updateQuestionnaire(String courseId, String questionnaireId,
//       List<QuestionModel> questions) async {
//     final user = FirebaseAuth.instance.currentUser;
//     final userDoc = await firestore.collection('users').doc(user?.uid).get();
//     final doctorName = userDoc.data()?['name'] ?? 'Unknown Admin';
//     final formattedDate = DateFormat('dd-MM-yyyy HH:mm').format(DateTime.now());
//     final docRef = firestore
//         .collection('Courses')
//         .doc(courseId)
//         .collection('questionnaires')
//         .doc(questionnaireId);
//     await docRef.update({
//       'questions': questions.map((q) => q.toMap()).toList(),
//       'date': formattedDate,
//       'doctor': doctorName,
//     });
//   }
// }

import 'package:attendance_app/features/questionnaire/data/models/question_model.dart';
import 'package:attendance_app/features/questionnaire/data/models/questionnaire_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class QuestionnaireRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<QuestionnaireModel>> getQuestionnaires(String courseId) async {
    final querySnapshot = await firestore
        .collection('Courses')
        .doc(courseId)
        .collection('questionnaires')
        .get();
    return querySnapshot.docs.map((doc) {
      final data = doc.data();
      data['id'] = doc.id;
      return QuestionnaireModel.fromMap(data);
    }).toList();
  }

  Future<void> deleteQuestionnaire(
      String courseId, String questionnaireId) async {
    await firestore
        .collection('Courses')
        .doc(courseId)
        .collection('questionnaires')
        .doc(questionnaireId)
        .delete();
  }

  Future<QuestionnaireModel> addQuestionnaire(
      String courseId, List<QuestionModel> questions) async {
    final user = FirebaseAuth.instance.currentUser;
    final userDoc = await firestore.collection('users').doc(user?.uid).get();
    final doctorName = userDoc.data()?['name'] ?? 'Unknown Admin';
    final formattedDate = DateFormat('dd-MM-yyyy HH:mm').format(DateTime.now());
    final newDocRef = firestore
        .collection('Courses')
        .doc(courseId)
        .collection('questionnaires')
        .doc();
    final newQuestionnaire = QuestionnaireModel(
      name: newDocRef.id,
      date: formattedDate,
      doctor: doctorName,
      questions: questions,
    );
    await newDocRef.set(newQuestionnaire.toMap());
    return newQuestionnaire;
  }

  Future<void> updateQuestionnaire(String courseId, String questionnaireId,
      List<QuestionModel> questions) async {
    final user = FirebaseAuth.instance.currentUser;
    final userDoc = await firestore.collection('users').doc(user?.uid).get();
    final doctorName = userDoc.data()?['name'] ?? 'Unknown Admin';
    final formattedDate = DateFormat('dd-MM-yyyy HH:mm').format(DateTime.now());
    final docRef = firestore
        .collection('Courses')
        .doc(courseId)
        .collection('questionnaires')
        .doc(questionnaireId);
    await docRef.update({
      'questions': questions.map((q) => q.toMap()).toList(),
      'date': formattedDate,
      'doctor': doctorName,
    });
  }
}
