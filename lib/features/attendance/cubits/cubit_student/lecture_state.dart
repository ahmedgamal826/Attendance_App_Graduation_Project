// lib/features/attendance/cubits/cubit_student/student_lecture_state.dart
import 'package:attendance_app/features/attendance/models/lecture_model_student.dart';

enum StudentLectureStatus { initial, loading, success, failure }

class StudentLectureState {
  final StudentLectureStatus status;
  final List<StudentLectureModel> lectures;
  final List<StudentLectureModel> filteredLectures;
  final String? errorMessage;
  final String searchQuery;

  const StudentLectureState({
    this.status = StudentLectureStatus.initial,
    this.lectures = const [],
    this.filteredLectures = const [],
    this.errorMessage,
    this.searchQuery = '',
  });

  StudentLectureState copyWith({
    StudentLectureStatus? status,
    List<StudentLectureModel>? lectures,
    List<StudentLectureModel>? filteredLectures,
    String? errorMessage,
    String? searchQuery,
  }) {
    return StudentLectureState(
      status: status ?? this.status,
      lectures: lectures ?? this.lectures,
      filteredLectures: filteredLectures ?? this.filteredLectures,
      errorMessage: errorMessage ?? this.errorMessage,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}
