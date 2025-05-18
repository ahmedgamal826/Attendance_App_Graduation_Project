import 'package:attendance_app/features/assignments/models/question_model_admin.dart';

class AssignmentModel {
  final String name;
  final List<QuestionModel> questions;
  final String date;
  final String doctor;
  final int version;
  final String? deadline;

  AssignmentModel({
    required this.name,
    required this.questions,
    required this.date,
    required this.doctor,
    this.version = 1,
    this.deadline,
  });

  factory AssignmentModel.fromMap(Map<String, dynamic> map) {
    return AssignmentModel(
      name: map['name'] ?? '',
      questions: (map['questions'] as List)
          .map((q) => QuestionModel.fromMap(q))
          .toList(),
      date: map['date'] ?? '',
      doctor: map['doctor'] ?? '',
      version: map['version'] as int? ?? 1,
      deadline: map['deadline'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'questions': questions.map((q) => q.toMap()).toList(),
      'date': date,
      'doctor': doctor,
      'version': version,
      'deadline': deadline,
    };
  }
}
