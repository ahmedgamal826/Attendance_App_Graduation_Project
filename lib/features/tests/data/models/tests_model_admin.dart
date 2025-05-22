import 'package:attendance_app/features/tests/data/models/tests_question_model_admin.dart';

class TestsAssignmentModel {
  final String name;
  final List<TestsQuestionModel> questions;
  final String date;
  final String doctor;
  final int version;
  final String? examDate;
  final String? startTime;
  final String? endTime;

  TestsAssignmentModel({
    required this.name,
    required this.questions,
    required this.date,
    required this.doctor,
    this.version = 1,
    this.examDate,
    this.startTime,
    this.endTime,
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
      examDate: map['examDate'],
      startTime: map['startTime'],
      endTime: map['endTime'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'questions': questions.map((q) => q.toMap()).toList(),
      'date': date,
      'doctor': doctor,
      'version': version,
      'examDate': examDate,
      'startTime': startTime,
      'endTime': endTime,
    };
  }
}
