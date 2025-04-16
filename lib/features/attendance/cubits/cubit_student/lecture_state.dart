// lib/cubits/cubit_student/lecture_state.dart
import '../../models/lecture_model_student.dart';

class LectureState {
  final List<Lecture> lectures;
  final String searchQuery;

  LectureState({
    required this.lectures,
    this.searchQuery = '',
  });

  LectureState copyWith({
    List<Lecture>? lectures,
    String? searchQuery,
  }) {
    return LectureState(
      lectures: lectures ?? this.lectures,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  List<Lecture> get filteredLectures {
    if (searchQuery.isEmpty) return lectures;

    return lectures.where((lecture) =>
    'Lecture ${lecture.number}'.toLowerCase().contains(searchQuery.toLowerCase()) ||
        lecture.date.toLowerCase().contains(searchQuery.toLowerCase()) ||
        lecture.time.toLowerCase().contains(searchQuery.toLowerCase())
    ).toList();
  }

  int get totalLectures => lectures.length;
  int get presentLectures => lectures.where((l) => l.isPresent).length;
  int get absentLectures => lectures.where((l) => !l.isPresent).length;
}