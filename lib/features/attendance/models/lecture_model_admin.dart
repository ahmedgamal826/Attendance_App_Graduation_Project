// // class LectureModel {
// //   final int number; // lectureNumber من Firestore
// //   final String name;
// //   final String date;
// //   final String time;
// //   final bool isPresent;

// //   LectureModel({
// //     required this.number,
// //     required this.name,
// //     required this.date,
// //     required this.time,
// //     required this.isPresent,
// //   });

// //   // Add copy method for easy state updates
// //   LectureModel copyWith({
// //     int? number,
// //     String? name,
// //     String? date,
// //     String? time,
// //     bool? isPresent,
// //   }) {
// //     return LectureModel(
// //       number: number ?? this.number,
// //       name: name ?? this.name,
// //       date: date ?? this.date,
// //       time: time ?? this.time,
// //       isPresent: isPresent ?? this.isPresent,
// //     );
// //   }
// // }

// class LectureModel {
//   final int number;
//   final String name;
//   final String date;
//   final String time;
//   final bool isPresent;
//   final int startHour;
//   final int startMinute;
//   final String startPeriod;
//   final int endHour;
//   final int endMinute;
//   final String endPeriod;

//   LectureModel({
//     required this.number,
//     required this.name,
//     required this.date,
//     required this.time,
//     required this.isPresent,
//     this.startHour = 1,
//     this.startMinute = 0,
//     this.startPeriod = 'AM',
//     this.endHour = 1,
//     this.endMinute = 0,
//     this.endPeriod = 'AM',
//   });

//   LectureModel copyWith({
//     int? number,
//     String? name,
//     String? date,
//     String? time,
//     bool? isPresent,
//     int? startHour,
//     int? startMinute,
//     String? startPeriod,
//     int? endHour,
//     int? endMinute,
//     String? endPeriod,
//   }) {
//     return LectureModel(
//       number: number ?? this.number,
//       name: name ?? this.name,
//       date: date ?? this.date,
//       time: time ?? this.time,
//       isPresent: isPresent ?? this.isPresent,
//       startHour: startHour ?? this.startHour,
//       startMinute: startMinute ?? this.startMinute,
//       startPeriod: startPeriod ?? this.startPeriod,
//       endHour: endHour ?? this.endHour,
//       endMinute: endMinute ?? this.endMinute,
//       endPeriod: endPeriod ?? this.endPeriod,
//     );
//   }
// }

class LectureModel {
  final int number;
  final String name;
  final String date;
  final String time;
  final bool isPresent;
  final int startHour;
  final int startMinute;
  final String startPeriod;
  final int endHour;
  final int endMinute;
  final String endPeriod;
  final String cameraStatus;

  LectureModel({
    required this.number,
    required this.name,
    required this.date,
    required this.time,
    required this.isPresent,
    this.startHour = 1,
    this.startMinute = 0,
    this.startPeriod = 'AM',
    this.endHour = 1,
    this.endMinute = 0,
    this.endPeriod = 'AM',
    this.cameraStatus = 'closed',
  });

  LectureModel copyWith({
    int? number,
    String? name,
    String? date,
    String? time,
    bool? isPresent,
    int? startHour,
    int? startMinute,
    String? startPeriod,
    int? endHour,
    int? endMinute,
    String? endPeriod,
    String? cameraStatus,
  }) {
    return LectureModel(
      number: number ?? this.number,
      name: name ?? this.name,
      date: date ?? this.date,
      time: time ?? this.time,
      isPresent: isPresent ?? this.isPresent,
      startHour: startHour ?? this.startHour,
      startMinute: startMinute ?? this.startMinute,
      startPeriod: startPeriod ?? this.startPeriod,
      endHour: endHour ?? this.endHour,
      endMinute: endMinute ?? this.endMinute,
      endPeriod: endPeriod ?? this.endPeriod,
      cameraStatus: cameraStatus ?? this.cameraStatus,
    );
  }
}
