// // lib/cubits/cubit_student/lecture_state.dart
// import '../../models/lecture_model_student.dart';

// class LectureState {
//   final List<Lecture> lectures;
//   final String searchQuery;

//   LectureState({
//     required this.lectures,
//     this.searchQuery = '',
//   });

//   LectureState copyWith({
//     List<Lecture>? lectures,
//     String? searchQuery,
//   }) {
//     return LectureState(
//       lectures: lectures ?? this.lectures,
//       searchQuery: searchQuery ?? this.searchQuery,
//     );
//   }

//   List<Lecture> get filteredLectures {
//     if (searchQuery.isEmpty) return lectures;

//     return lectures.where((lecture) =>
//     'Lecture ${lecture.number}'.toLowerCase().contains(searchQuery.toLowerCase()) ||
//         lecture.date.toLowerCase().contains(searchQuery.toLowerCase()) ||
//         lecture.time.toLowerCase().contains(searchQuery.toLowerCase())
//     ).toList();
//   }

//   int get totalLectures => lectures.length;
//   int get presentLectures => lectures.where((l) => l.isPresent).length;
//   int get absentLectures => lectures.where((l) => !l.isPresent).length;
// }

import 'package:equatable/equatable.dart';
import '../../models/lecture_model_admin.dart';

enum StudentLectureStatus { initial, loading, success, failure }

class LectureState extends Equatable {
  final List<LectureModel> lectures;
  final List<LectureModel> filteredLectures;
  final String searchQuery;
  final StudentLectureStatus status;
  final String? errorMessage;

  const LectureState({
    this.lectures = const [],
    this.filteredLectures = const [],
    this.searchQuery = '',
    this.status = StudentLectureStatus.initial,
    this.errorMessage,
  });

  LectureState copyWith({
    List<LectureModel>? lectures,
    List<LectureModel>? filteredLectures,
    String? searchQuery,
    StudentLectureStatus? status,
    String? errorMessage,
  }) {
    return LectureState(
      lectures: lectures ?? this.lectures,
      filteredLectures: filteredLectures ?? this.filteredLectures,
      searchQuery: searchQuery ?? this.searchQuery,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [lectures, filteredLectures, searchQuery, status, errorMessage];
}
