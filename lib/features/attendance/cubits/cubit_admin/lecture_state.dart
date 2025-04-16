// attendance/cubits/cubit_admin/lecture_state.dart
import 'package:equatable/equatable.dart';
import '../../models/lecture_model_admin.dart';

enum LectureStatus { initial, loading, success, failure }

class LectureState extends Equatable {
  final List<LectureModel> lectures;
  final List<LectureModel> filteredLectures;
  final String searchQuery;
  final LectureStatus status;
  final String? errorMessage;

  const LectureState({
    this.lectures = const [],
    this.filteredLectures = const [],
    this.searchQuery = '',
    this.status = LectureStatus.initial,
    this.errorMessage,
  });

  LectureState copyWith({
    List<LectureModel>? lectures,
    List<LectureModel>? filteredLectures,
    String? searchQuery,
    LectureStatus? status,
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
  List<Object?> get props => [lectures, filteredLectures, searchQuery, status, errorMessage];
}
