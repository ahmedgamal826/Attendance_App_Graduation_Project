// // attendance/models/lecture_model_admin.dart
// class LectureModel {
//   final int number;
//   final String name;
//   final String date;
//   final String time;
//   final bool isPresent;

//   LectureModel({
//     required this.number,
//     required this.name,
//     required this.date,
//     required this.time,
//     required this.isPresent,
//   });

//   // Add copy method for easy state updates
//   LectureModel copyWith({
//     int? number,
//     String? name,
//     String? date,
//     String? time,
//     bool? isPresent,
//   }) {
//     return LectureModel(
//       number: number ?? this.number,
//       name: name ?? this.name,
//       date: date ?? this.date,
//       time: time ?? this.time,
//       isPresent: isPresent ?? this.isPresent,
//     );
//   }
// }

class LectureModel {
  final int number; // lectureNumber من Firestore
  final String name;
  final String date;
  final String time;
  final bool isPresent;

  LectureModel({
    required this.number,
    required this.name,
    required this.date,
    required this.time,
    required this.isPresent,
  });

  // Add copy method for easy state updates
  LectureModel copyWith({
    int? number,
    String? name,
    String? date,
    String? time,
    bool? isPresent,
  }) {
    return LectureModel(
      number: number ?? this.number,
      name: name ?? this.name,
      date: date ?? this.date,
      time: time ?? this.time,
      isPresent: isPresent ?? this.isPresent,
    );
  }
}
