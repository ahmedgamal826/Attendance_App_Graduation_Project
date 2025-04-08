import 'package:flutter/material.dart';

class StudentQuestionnaireModel {
  final String id;
  final String name;
  final String date;
  final String doctor;
  bool isCompleted;

  StudentQuestionnaireModel({
    required this.id,
    required this.name,
    required this.date,
    required this.doctor,
    this.isCompleted = false,
  });
}

class StudentHomeQuestionnairesViewModel extends ChangeNotifier {
  final List<StudentQuestionnaireModel> _questionnaires = [
    StudentQuestionnaireModel(
      id: '1',
      name: 'Course Evaluation',
      date: '2023-11-10',
      doctor: 'Dr. Ahmed Elnemr',
      isCompleted: false,
    ),
    StudentQuestionnaireModel(
      id: '2',
      name: 'Teaching Quality',
      date: '2025-04-07',
      doctor: 'Dr. Ahmed Beherry',
      isCompleted: false,
    ),
    StudentQuestionnaireModel(
      id: '3',
      name: 'Semester Feedback',
      date: '2023-11-05',
      doctor: 'Dr. Ahmed Tiger',
      isCompleted: false,
    ),
  ];

  List<StudentQuestionnaireModel> get questionnaires => _questionnaires;

  void markQuestionnaireAsCompleted(String id) {
    final index = _questionnaires.indexWhere((q) => q.id == id);
    if (index != -1) {
      _questionnaires[index].isCompleted = true;
      notifyListeners();
    }
  }
}
