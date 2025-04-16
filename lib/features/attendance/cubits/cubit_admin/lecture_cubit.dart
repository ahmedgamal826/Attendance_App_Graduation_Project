// attendance/cubits/cubit_admin/lecture_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/lecture_model_admin.dart';
import 'lecture_state.dart';

class LectureCubit extends Cubit<LectureState> {
  LectureCubit() : super(const LectureState()) {
    loadLectures();
  }

  final List<LectureModel> _mockLectures = [
    LectureModel(number: 1, name: 'Introduction to Flutter', date: '10-12', time: '09:30 AM', isPresent: true),
    LectureModel(number: 2, name: 'Dart Programming Basics', date: '10-12', time: '11:00 AM', isPresent: false),
    LectureModel(number: 3, name: 'Widget Fundamentals', date: '10-12', time: '01:30 PM', isPresent: true),
    LectureModel(number: 4, name: 'State Management', date: '10-15', time: '10:15 AM', isPresent: true),
    LectureModel(number: 5, name: 'Working with APIs', date: '10-17', time: '02:45 PM', isPresent: false),
    LectureModel(number: 6, name: 'Firebase Integration', date: '10-17', time: '02:45 PM', isPresent: false),
    LectureModel(number: 7, name: 'Advanced UI Components', date: '10-17', time: '02:45 PM', isPresent: false),
  ];

  void loadLectures() {
    emit(state.copyWith(
      status: LectureStatus.loading,
    ));

    try {
      // In a real app, you would fetch from an API or database
      emit(state.copyWith(
        status: LectureStatus.success,
        lectures: _mockLectures,
        filteredLectures: _mockLectures,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: LectureStatus.failure,
        errorMessage: 'Failed to load lectures: ${e.toString()}',
      ));
    }
  }

  void searchLectures(String query) {
    final searchText = query.toLowerCase();

    if (searchText.isEmpty) {
      emit(state.copyWith(
        searchQuery: searchText,
        filteredLectures: state.lectures,
      ));
    } else {
      final filtered = state.lectures.where((lecture) {
        return lecture.name.toLowerCase().contains(searchText);
      }).toList();

      emit(state.copyWith(
        searchQuery: searchText,
        filteredLectures: filtered,
      ));
    }
  }

  void deleteLecture(int lectureNumber) {
    try {
      // In a real app, you would call an API to delete
      final updatedLectures = state.lectures.where((lecture) => lecture.number != lectureNumber).toList();

      emit(state.copyWith(
        lectures: updatedLectures,
        filteredLectures: state.searchQuery.isEmpty
            ? updatedLectures
            : updatedLectures.where((lecture) =>
            lecture.name.toLowerCase().contains(state.searchQuery.toLowerCase())).toList(),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: LectureStatus.failure,
        errorMessage: 'Failed to delete lecture: ${e.toString()}',
      ));
    }
  }

  void editLecture(LectureModel updatedLecture) {
    try {
      // In a real app, you would call an API to update
      final updatedLectures = state.lectures.map((lecture) {
        return lecture.number == updatedLecture.number ? updatedLecture : lecture;
      }).toList();

      emit(state.copyWith(
        lectures: updatedLectures,
        filteredLectures: state.searchQuery.isEmpty
            ? updatedLectures
            : updatedLectures.where((lecture) =>
            lecture.name.toLowerCase().contains(state.searchQuery.toLowerCase())).toList(),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: LectureStatus.failure,
        errorMessage: 'Failed to update lecture: ${e.toString()}',
      ));
    }
  }

  void addLecture(LectureModel newLecture) {
    try {
      // In a real app, you would call an API to create
      final updatedLectures = [...state.lectures, newLecture];

      emit(state.copyWith(
        lectures: updatedLectures,
        filteredLectures: state.searchQuery.isEmpty
            ? updatedLectures
            : updatedLectures.where((lecture) =>
            lecture.name.toLowerCase().contains(state.searchQuery.toLowerCase())).toList(),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: LectureStatus.failure,
        errorMessage: 'Failed to add lecture: ${e.toString()}',
      ));
    }
  }
}
