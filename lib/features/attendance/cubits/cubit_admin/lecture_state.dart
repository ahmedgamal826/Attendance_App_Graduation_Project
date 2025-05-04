// // import 'package:equatable/equatable.dart';
// // import '../../models/lecture_model_admin.dart';

// // enum LectureStatus { initial, loading, success, failure }

// // class LectureState extends Equatable {
// //   final LectureStatus status;
// //   final List<LectureModel> lectures;
// //   final List<LectureModel> filteredLectures;
// //   final String? searchQuery;
// //   final String? errorMessage;
// //   final bool
// //       isUpdating; // Flag to indicate if the state is for an update operation

// //   const LectureState({
// //     this.status = LectureStatus.initial,
// //     this.lectures = const [],
// //     this.filteredLectures = const [],
// //     this.searchQuery,
// //     this.errorMessage,
// //     this.isUpdating = false,
// //   });

// //   LectureState copyWith({
// //     LectureStatus? status,
// //     List<LectureModel>? lectures,
// //     List<LectureModel>? filteredLectures,
// //     String? searchQuery,
// //     String? errorMessage,
// //     bool? isUpdating,
// //   }) {
// //     return LectureState(
// //       status: status ?? this.status,
// //       lectures: lectures ?? this.lectures,
// //       filteredLectures: filteredLectures ?? this.filteredLectures,
// //       searchQuery: searchQuery ?? this.searchQuery,
// //       errorMessage: errorMessage ?? this.errorMessage,
// //       isUpdating: isUpdating ?? this.isUpdating,
// //     );
// //   }

// //   @override
// //   List<Object?> get props => [
// //         status,
// //         lectures,
// //         filteredLectures,
// //         searchQuery,
// //         errorMessage,
// //         isUpdating,
// //       ];
// // }

// import 'package:equatable/equatable.dart';
// import '../../models/lecture_model_admin.dart';

// enum LectureStatus { initial, loading, success, failure }

// class LectureState extends Equatable {
//   final LectureStatus status;
//   final List<LectureModel> lectures;
//   final List<LectureModel> filteredLectures;
//   final String? searchQuery;
//   final String? errorMessage;
//   final bool isUpdating;

//   const LectureState({
//     this.status = LectureStatus.initial,
//     this.lectures = const [],
//     this.filteredLectures = const [],
//     this.searchQuery,
//     this.errorMessage,
//     this.isUpdating = false,
//   });

//   LectureState copyWith({
//     LectureStatus? status,
//     List<LectureModel>? lectures,
//     List<LectureModel>? filteredLectures,
//     String? searchQuery,
//     String? errorMessage,
//     bool? isUpdating,
//   }) {
//     return LectureState(
//       status: status ?? this.status,
//       lectures: lectures ?? this.lectures,
//       filteredLectures: filteredLectures ?? this.filteredLectures,
//       searchQuery: searchQuery ?? this.searchQuery,
//       errorMessage: errorMessage ?? this.errorMessage,
//       isUpdating: isUpdating ?? this.isUpdating,
//     );
//   }

//   @override
//   List<Object?> get props => [
//         status,
//         lectures,
//         filteredLectures,
//         searchQuery,
//         errorMessage,
//         isUpdating,
//       ];
// }

import 'package:equatable/equatable.dart';
import '../../models/lecture_model_admin.dart';

enum LectureStatus { initial, loading, success, failure }

class LectureState extends Equatable {
  final LectureStatus status;
  final List<LectureModel> lectures;
  final List<LectureModel> filteredLectures;
  final String? searchQuery;
  final String? errorMessage;
  final bool isUpdating;

  const LectureState({
    this.status = LectureStatus.initial,
    this.lectures = const [],
    this.filteredLectures = const [],
    this.searchQuery,
    this.errorMessage,
    this.isUpdating = false,
  });

  LectureState copyWith({
    LectureStatus? status,
    List<LectureModel>? lectures,
    List<LectureModel>? filteredLectures,
    String? searchQuery,
    String? errorMessage,
    bool? isUpdating,
  }) {
    return LectureState(
      status: status ?? this.status,
      lectures: lectures ?? this.lectures,
      filteredLectures: filteredLectures ?? this.filteredLectures,
      searchQuery: searchQuery ?? this.searchQuery,
      errorMessage: errorMessage ?? this.errorMessage,
      isUpdating: isUpdating ?? this.isUpdating,
    );
  }

  @override
  List<Object?> get props => [
        status,
        lectures,
        filteredLectures,
        searchQuery,
        errorMessage,
        isUpdating,
      ];
}
