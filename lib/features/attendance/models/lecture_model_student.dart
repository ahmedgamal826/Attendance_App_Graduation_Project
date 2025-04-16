// lib/models/lecture_model_student.dart
class Lecture {
  final int number;
  final String date;
  final String time;
  final bool isPresent;

  Lecture({
    required this.number,
    required this.date,
    required this.time,
    required this.isPresent,
  });
}