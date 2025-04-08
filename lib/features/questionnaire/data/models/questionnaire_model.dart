import 'package:attendance_app/features/questionnaire/data/models/question_model.dart';

class QuestionnaireModel {
  final String name;
  final String date;
  final String doctor;
  final List<QuestionModel> questions;

  QuestionnaireModel({
    required this.name,
    required this.date,
    required this.doctor,
    required this.questions,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'date': date,
      'doctor': doctor,
      'questions': questions.map((q) => q.toMap()).toList(),
    };
  }

  factory QuestionnaireModel.fromMap(Map<String, dynamic> map) {
    return QuestionnaireModel(
      name: map['name'],
      date: map['date'],
      doctor: map['doctor'],
      questions: (map['questions'] as List<dynamic>)
          .map((q) => QuestionModel.fromMap(q as Map<String, dynamic>))
          .toList(),
    );
  }
}
