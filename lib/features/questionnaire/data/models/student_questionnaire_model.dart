// import 'package:flutter/material.dart';

// class StudentQuestionnaireModel {
//   final String id;
//   final String name;
//   final String date;
//   final String doctor;
//   bool isCompleted;

//   StudentQuestionnaireModel({
//     required this.id,
//     required this.name,
//     required this.date,
//     required this.doctor,
//     this.isCompleted = false,
//   });
// }

// class StudentHomeQuestionnairesViewModel extends ChangeNotifier {
//   final List<StudentQuestionnaireModel> _questionnaires = [
//     StudentQuestionnaireModel(
//       id: '1',
//       name: 'Course Evaluation',
//       date: '2023-11-10',
//       doctor: 'Dr. Ahmed Elnemr',
//       isCompleted: false,
//     ),
//     StudentQuestionnaireModel(
//       id: '2',
//       name: 'Teaching Quality',
//       date: '2025-04-07',
//       doctor: 'Dr. Ahmed Beherry',
//       isCompleted: false,
//     ),
//     StudentQuestionnaireModel(
//       id: '3',
//       name: 'Semester Feedback',
//       date: '2023-11-05',
//       doctor: 'Dr. Ahmed Tiger',
//       isCompleted: false,
//     ),
//   ];

//   List<StudentQuestionnaireModel> get questionnaires => _questionnaires;

//   void markQuestionnaireAsCompleted(String id) {
//     final index = _questionnaires.indexWhere((q) => q.id == id);
//     if (index != -1) {
//       _questionnaires[index].isCompleted = true;
//       notifyListeners();
//     }
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StudentQuestionnaireModel {
  final String id;
  final String name;
  final String date;
  final String doctor;
  final bool isCompleted; // سيتم تحديده ديناميكيًا

  StudentQuestionnaireModel({
    required this.id,
    required this.name,
    required this.date,
    required this.doctor,
    required this.isCompleted,
  });

  static Future<StudentQuestionnaireModel> fromFirestore(
      Map<String, dynamic> data, String courseId) async {
    final user = FirebaseAuth.instance.currentUser;
    bool isCompleted = false;

    if (user != null) {
      final doc = await FirebaseFirestore.instance
          .collection('Courses')
          .doc(courseId)
          .collection('questionnaires')
          .doc(data['id'])
          .collection('filledBy')
          .doc(user.uid)
          .get();
      isCompleted = doc.exists;
    }

    return StudentQuestionnaireModel(
      id: data['id'],
      name: data['name'],
      date: data['date'],
      doctor: data['doctor'],
      isCompleted: isCompleted,
    );
  }
}
