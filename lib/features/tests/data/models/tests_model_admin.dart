import 'package:attendance_app/features/tests/data/models/tests_question_model_admin.dart';

class TestsAssignmentModel {
  final String name;
  final List<TestsQuestionModel> questions;
  final String date;
  final String doctor;
  final int version;
  final String? deadline;

  TestsAssignmentModel({
    required this.name,
    required this.questions,
    required this.date,
    required this.doctor,
    this.version = 1,
    this.deadline,
  });

  factory TestsAssignmentModel.fromMap(Map<String, dynamic> map) {
    return TestsAssignmentModel(
      name: map['name'] ?? '',
      questions: (map['questions'] as List)
          .map((q) => TestsQuestionModel.fromMap(q))
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
