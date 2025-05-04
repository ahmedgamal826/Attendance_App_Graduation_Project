// // lib/features/attendance/models/student_lecture_model.dart
// class StudentLectureModel {
//   final int number;
//   final String name;
//   final String date;
//   final String time;
//   final bool isPresent; // Whether the student attended this lecture

//   StudentLectureModel({
//     required this.number,
//     required this.name,
//     required this.date,
//     required this.time,
//     required this.isPresent,
//   });

//   @override
//   String toString() {
//     return 'StudentLectureModel(number: $number, name: $name, date: $date, time: $time, isPresent: $isPresent)';
//   }
// }

// lib/features/attendance/models/student_lecture_model.dart
class StudentLectureModel {
  final int number;
  final String name;
  final String date;
  final String time;
  final bool
      hasAttended; // Indicates if the student attended based on attendance collection
  final int bonusCount; // Number of bonus points

  StudentLectureModel({
    required this.number,
    required this.name,
    required this.date,
    required this.time,
    required this.hasAttended,
    required this.bonusCount,
  });

  @override
  String toString() {
    return 'StudentLectureModel(number: $number, name: $name, date: $date, time: $time, hasAttended: $hasAttended, bonusCount: $bonusCount)';
  }
}
