// lib/cubits/cubit_student/lecture_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/lecture_model_student.dart';
import 'lecture_state.dart';

class LectureCubit extends Cubit<LectureState> {
  LectureCubit() : super(LectureState(lectures: _getInitialLectures()));

  static List<Lecture> _getInitialLectures() {
    return [
      Lecture(number: 1, date: '10-12', time: '09:30 AM', isPresent: true),
      Lecture(number: 2, date: '10-12', time: '11:00 AM', isPresent: false),
      Lecture(number: 3, date: '10-12', time: '01:30 PM', isPresent: true),
      Lecture(number: 4, date: '10-15', time: '10:15 AM', isPresent: true),
      Lecture(number: 5, date: '10-17', time: '02:45 PM', isPresent: false),
    ];
  }

  void searchLectures(String query) {
    emit(state.copyWith(searchQuery: query));
  }

// You can add more methods here like addLecture, updateAttendance, etc.
}