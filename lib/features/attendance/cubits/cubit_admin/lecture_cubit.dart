// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import '../../models/lecture_model_admin.dart';
// // import 'lecture_state.dart';

// // class LectureCubit extends Cubit<LectureState> {
// //   final String courseId;

// //   LectureCubit({required this.courseId}) : super(const LectureState()) {
// //     loadLectures();
// //   }

// //   // تحميل المحاضرات من Firestore
// //   void loadLectures() async {
// //     emit(state.copyWith(status: LectureStatus.loading, isUpdating: false));

// //     try {
// //       DocumentReference courseRef =
// //           FirebaseFirestore.instance.collection('Courses').doc(courseId);
// //       QuerySnapshot lecturesSnapshot = await courseRef
// //           .collection('lectures')
// //           .orderBy('lectureNumber', descending: false)
// //           .get();

// //       List<LectureModel> lectures = [];
// //       for (var doc in lecturesSnapshot.docs) {
// //         final data = doc.data() as Map<String, dynamic>;
// //         lectures.add(LectureModel(
// //           number: data['lectureNumber'] ?? 0,
// //           name: data['name'] ?? 'Unknown',
// //           date: data['date'] ?? 'Unknown',
// //           time: data['time'] ?? 'Unknown',
// //           isPresent: false,
// //         ));
// //       }
// //       print(
// //           'Loaded lectures: ${lectures.map((l) => l.name).toList()}'); // للتصحيح
// //       emit(state.copyWith(
// //         status: LectureStatus.success,
// //         lectures: lectures,
// //         filteredLectures: lectures,
// //         isUpdating: false,
// //       ));
// //     } catch (e) {
// //       emit(state.copyWith(
// //         status: LectureStatus.failure,
// //         errorMessage: 'Failed to load lectures: ${e.toString()}',
// //         isUpdating: false,
// //       ));
// //     }
// //   }

// //   // البحث في المحاضرات
// //   void searchLectures(String query) {
// //     final searchText = query.toLowerCase().trim();

// //     if (searchText.isEmpty) {
// //       emit(state.copyWith(
// //         searchQuery: searchText,
// //         filteredLectures: state.lectures,
// //         isUpdating: false,
// //       ));
// //       return;
// //     }

// //     int? searchNumber;
// //     final lectureNumberMatch = RegExp(r'\d+').firstMatch(searchText);
// //     if (lectureNumberMatch != null) {
// //       searchNumber = int.tryParse(lectureNumberMatch.group(0)!);
// //     }

// //     final filtered = state.lectures.where((lecture) {
// //       final matchesName = lecture.name.toLowerCase().contains(searchText);
// //       final matchesNumber =
// //           searchNumber != null && lecture.number == searchNumber;
// //       final matchesLectureText =
// //           'lecture ${lecture.number}'.toLowerCase().contains(searchText);

// //       return matchesName || matchesNumber || matchesLectureText;
// //     }).toList();

// //     emit(state.copyWith(
// //       searchQuery: searchText,
// //       filteredLectures: filtered,
// //       isUpdating: false,
// //     ));
// //   }

// //   void deleteLecture(int lectureNumber) async {
// //     try {
// //       emit(state.copyWith(status: LectureStatus.loading, isUpdating: false));

// //       DocumentReference courseRef =
// //           FirebaseFirestore.instance.collection('Courses').doc(courseId);
// //       QuerySnapshot lecturesSnapshot = await courseRef
// //           .collection('lectures')
// //           .where('lectureNumber', isEqualTo: lectureNumber)
// //           .get();

// //       print('Deleting lecture with lectureNumber: $lectureNumber'); // للتصحيح

// //       if (lecturesSnapshot.docs.isNotEmpty) {
// //         var lectureDoc = lecturesSnapshot.docs.first;
// //         print('Lecture found with ID: ${lectureDoc.id}'); // للتصحيح

// //         // جلب الـ Attendance collection الخاصة بالمحاضرة
// //         CollectionReference attendanceRef =
// //             lectureDoc.reference.collection('Attendance');
// //         QuerySnapshot attendanceSnapshot = await attendanceRef.get();

// //         print(
// //             'Deleting Attendance collection for lecture: ${lectureDoc.id}'); // للتصحيح

// //         // حذف كل الوثائق في الـ Attendance collection
// //         for (var doc in attendanceSnapshot.docs) {
// //           await doc.reference.delete();
// //           print('Deleted document ${doc.id} from Attendance'); // للتصحيح
// //         }

// //         // حذف المحاضرة نفسها
// //         await lectureDoc.reference.delete();
// //         print('Lecture deleted: ${lectureDoc.id}'); // للتصحيح

// //         await _reorderLectures();
// //       } else {
// //         print('No lecture found with lectureNumber: $lectureNumber'); // للتصحيح
// //       }

// //       loadLectures();
// //     } catch (e) {
// //       print('Error deleting lecture: $e'); // للتصحيح
// //       emit(state.copyWith(
// //         status: LectureStatus.failure,
// //         errorMessage: 'Failed to delete lecture: ${e.toString()}',
// //         isUpdating: false,
// //       ));
// //     }
// //   }

// //   Future<void> refreshLectures() async {
// //     loadLectures(); // إعادة تحميل المحاضرات
// //   }

// //   // تحديث محاضرة
// //   void updateLecture(LectureModel updatedLecture) async {
// //     try {
// //       emit(state.copyWith(status: LectureStatus.loading, isUpdating: true));

// //       DocumentReference courseRef =
// //           FirebaseFirestore.instance.collection('Courses').doc(courseId);
// //       QuerySnapshot lecturesSnapshot = await courseRef
// //           .collection('lectures')
// //           .where('lectureNumber', isEqualTo: updatedLecture.number)
// //           .get();

// //       if (lecturesSnapshot.docs.isNotEmpty) {
// //         var lectureDoc = lecturesSnapshot.docs.first;
// //         await lectureDoc.reference.update({
// //           'name': updatedLecture.name,
// //           'date': updatedLecture.date,
// //           'time': updatedLecture.time,
// //         });
// //         print(
// //             'Updated lecture in Firestore: ${updatedLecture.name}'); // للتصحيح
// //         // إضافة تأخير لضمان تحديث Firestore
// //         await Future.delayed(const Duration(milliseconds: 500));
// //       } else {
// //         throw Exception('Lecture not found');
// //       }

// //       loadLectures();
// //       emit(state.copyWith(
// //         status: LectureStatus.success,
// //         isUpdating: false, // إعادة تعيين isUpdating
// //       ));
// //     } catch (e) {
// //       emit(state.copyWith(
// //         status: LectureStatus.failure,
// //         errorMessage: 'Failed to update lecture: ${e.toString()}',
// //         isUpdating: false,
// //       ));
// //     }
// //   }

// //   // إعادة ترتيب lectureNumber بعد الحذف
// //   Future<void> _reorderLectures() async {
// //     DocumentReference courseRef =
// //         FirebaseFirestore.instance.collection('Courses').doc(courseId);
// //     QuerySnapshot lecturesSnapshot = await courseRef
// //         .collection('lectures')
// //         .orderBy('lectureNumber', descending: false)
// //         .get();

// //     int newNumber = 1;
// //     for (var doc in lecturesSnapshot.docs) {
// //       await doc.reference.update({'lectureNumber': newNumber});
// //       newNumber++;
// //     }
// //   }
// // }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../models/lecture_model_admin.dart';
// import 'lecture_state.dart';

// class LectureCubit extends Cubit<LectureState> {
//   final String courseId;

//   LectureCubit({required this.courseId}) : super(const LectureState()) {
//     loadLectures();
//   }

//   void loadLectures() async {
//     emit(state.copyWith(status: LectureStatus.loading, isUpdating: false));

//     try {
//       DocumentReference courseRef =
//           FirebaseFirestore.instance.collection('Courses').doc(courseId);
//       QuerySnapshot lecturesSnapshot = await courseRef
//           .collection('lectures')
//           .orderBy('lectureNumber', descending: false)
//           .get();

//       List<LectureModel> lectures = [];
//       for (var doc in lecturesSnapshot.docs) {
//         final data = doc.data() as Map<String, dynamic>;
//         lectures.add(LectureModel(
//           number: data['lectureNumber'] ?? 0,
//           name: data['name'] ?? 'Unknown',
//           date: data['date'] ?? 'Unknown',
//           time: data['time'] ?? 'Unknown',
//           isPresent: false,
//           startHour: data['start_hour_12'] ?? 1,
//           startMinute: data['start_minute'] ?? 0,
//           startPeriod: data['start_period'] ?? 'AM',
//           endHour: data['end_hour_12'] ?? 1,
//           endMinute: data['end_minute'] ?? 0,
//           endPeriod: data['end_period'] ?? 'AM',
//         ));
//       }
//       print('Loaded lectures: ${lectures.map((l) => l.name).toList()}');
//       emit(state.copyWith(
//         status: LectureStatus.success,
//         lectures: lectures,
//         filteredLectures: lectures,
//         isUpdating: false,
//       ));
//     } catch (e) {
//       emit(state.copyWith(
//         status: LectureStatus.failure,
//         errorMessage: 'Failed to load lectures: ${e.toString()}',
//         isUpdating: false,
//       ));
//     }
//   }

//   void searchLectures(String query) {
//     final searchText = query.toLowerCase().trim();

//     if (searchText.isEmpty) {
//       emit(state.copyWith(
//         searchQuery: searchText,
//         filteredLectures: state.lectures,
//         isUpdating: false,
//       ));
//       return;
//     }

//     int? searchNumber;
//     final lectureNumberMatch = RegExp(r'\d+').firstMatch(searchText);
//     if (lectureNumberMatch != null) {
//       searchNumber = int.tryParse(lectureNumberMatch.group(0)!);
//     }

//     final filtered = state.lectures.where((lecture) {
//       final matchesName = lecture.name.toLowerCase().contains(searchText);
//       final matchesNumber =
//           searchNumber != null && lecture.number == searchNumber;
//       final matchesLectureText =
//           'lecture ${lecture.number}'.toLowerCase().contains(searchText);

//       return matchesName || matchesNumber || matchesLectureText;
//     }).toList();

//     emit(state.copyWith(
//       searchQuery: searchText,
//       filteredLectures: filtered,
//       isUpdating: false,
//     ));
//   }

//   void deleteLecture(int lectureNumber) async {
//     try {
//       emit(state.copyWith(status: LectureStatus.loading, isUpdating: false));

//       DocumentReference courseRef =
//           FirebaseFirestore.instance.collection('Courses').doc(courseId);
//       QuerySnapshot lecturesSnapshot = await courseRef
//           .collection('lectures')
//           .where('lectureNumber', isEqualTo: lectureNumber)
//           .get();

//       print('Deleting lecture with lectureNumber: $lectureNumber');

//       if (lecturesSnapshot.docs.isNotEmpty) {
//         var lectureDoc = lecturesSnapshot.docs.first;
//         print('Lecture found with ID: ${lectureDoc.id}');

//         CollectionReference attendanceRef =
//             lectureDoc.reference.collection('Attendance');
//         QuerySnapshot attendanceSnapshot = await attendanceRef.get();

//         print('Deleting Attendance collection for lecture: ${lectureDoc.id}');

//         for (var doc in attendanceSnapshot.docs) {
//           await doc.reference.delete();
//           print('Deleted document ${doc.id} from Attendance');
//         }

//         await lectureDoc.reference.delete();
//         print('Lecture deleted: ${lectureDoc.id}');

//         await _reorderLectures();
//       } else {
//         print('No lecture found with lectureNumber: $lectureNumber');
//       }

//       loadLectures();
//     } catch (e) {
//       print('Error deleting lecture: $e');
//       emit(state.copyWith(
//         status: LectureStatus.failure,
//         errorMessage: 'Failed to delete lecture: ${e.toString()}',
//         isUpdating: false,
//       ));
//     }
//   }

//   Future<void> refreshLectures() async {
//     loadLectures();
//   }

//   void updateLecture(LectureModel updatedLecture) async {
//     try {
//       emit(state.copyWith(status: LectureStatus.loading, isUpdating: true));

//       DocumentReference courseRef =
//           FirebaseFirestore.instance.collection('Courses').doc(courseId);
//       QuerySnapshot lecturesSnapshot = await courseRef
//           .collection('lectures')
//           .where('lectureNumber', isEqualTo: updatedLecture.number)
//           .get();

//       if (lecturesSnapshot.docs.isNotEmpty) {
//         var lectureDoc = lecturesSnapshot.docs.first;
//         await lectureDoc.reference.update({
//           'name': updatedLecture.name,
//           'date': updatedLecture.date,
//           'time': updatedLecture.time,
//           'start_hour_12': updatedLecture.startHour,
//           'start_minute': updatedLecture.startMinute,
//           'start_period': updatedLecture.startPeriod,
//           'end_hour_12': updatedLecture.endHour,
//           'end_minute': updatedLecture.endMinute,
//           'end_period': updatedLecture.endPeriod,
//         });

//         // تحديث جدول المحاضرة في schedule/daily
//         await FirebaseFirestore.instance
//             .collection('schedule')
//             .doc('daily')
//             .set({
//           'lecture_name': updatedLecture.name,
//           'date': updatedLecture.date,
//           'start_hour_12': updatedLecture.startHour,
//           'start_minute': updatedLecture.startMinute,
//           'start_period': updatedLecture.startPeriod,
//           'end_hour_12': updatedLecture.endHour,
//           'end_minute': updatedLecture.endMinute,
//           'end_period': updatedLecture.endPeriod,
//           'last_updated': Timestamp.now(),
//         }, SetOptions(merge: true));

//         print('Updated lecture in Firestore: ${updatedLecture.name}');
//         await Future.delayed(const Duration(milliseconds: 500));
//       } else {
//         throw Exception('Lecture not found');
//       }

//       loadLectures();
//       emit(state.copyWith(
//         status: LectureStatus.success,
//         isUpdating: false,
//       ));
//     } catch (e) {
//       emit(state.copyWith(
//         status: LectureStatus.failure,
//         errorMessage: 'Failed to update lecture: ${e.toString()}',
//         isUpdating: false,
//       ));
//     }
//   }

//   Future<void> _reorderLectures() async {
//     DocumentReference courseRef =
//         FirebaseFirestore.instance.collection('Courses').doc(courseId);
//     QuerySnapshot lecturesSnapshot = await courseRef
//         .collection('lectures')
//         .orderBy('lectureNumber', descending: false)
//         .get();

//     int newNumber = 1;
//     for (var doc in lecturesSnapshot.docs) {
//       await doc.reference.update({'lectureNumber': newNumber});
//       newNumber++;
//     }
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/lecture_model_admin.dart';
import 'lecture_state.dart';

class LectureCubit extends Cubit<LectureState> {
  final String courseId;

  LectureCubit({required this.courseId}) : super(const LectureState()) {
    loadLectures();
  }

  void loadLectures() async {
    emit(state.copyWith(status: LectureStatus.loading, isUpdating: false));

    try {
      DocumentReference courseRef =
          FirebaseFirestore.instance.collection('Courses').doc(courseId);
      QuerySnapshot lecturesSnapshot = await courseRef
          .collection('lectures')
          .orderBy('lectureNumber', descending: false)
          .get();

      List<LectureModel> lectures = [];
      for (var doc in lecturesSnapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        lectures.add(LectureModel(
          number: data['lectureNumber'] ?? 0,
          name: data['name'] ?? 'Unknown',
          date: data['date'] ?? 'Unknown',
          time: data['time'] ?? 'Unknown',
          isPresent: false,
          startHour: data['start_hour_12'] ?? 1,
          startMinute: data['start_minute'] ?? 0,
          startPeriod: data['start_period'] ?? 'AM',
          endHour: data['end_hour_12'] ?? 1,
          endMinute: data['end_minute'] ?? 0,
          endPeriod: data['end_period'] ?? 'AM',
          cameraStatus: data['camera_status'] ?? 'closed',
        ));
      }
      print('Loaded lectures: ${lectures.map((l) => l.name).toList()}');
      emit(state.copyWith(
        status: LectureStatus.success,
        lectures: lectures,
        filteredLectures: lectures,
        isUpdating: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: LectureStatus.failure,
        errorMessage: 'Failed to load lectures: ${e.toString()}',
        isUpdating: false,
      ));
    }
  }

  void searchLectures(String query) {
    final searchText = query.toLowerCase().trim();

    if (searchText.isEmpty) {
      emit(state.copyWith(
        searchQuery: searchText,
        filteredLectures: state.lectures,
        isUpdating: false,
      ));
      return;
    }

    int? searchNumber;
    final lectureNumberMatch = RegExp(r'\d+').firstMatch(searchText);
    if (lectureNumberMatch != null) {
      searchNumber = int.tryParse(lectureNumberMatch.group(0)!);
    }

    final filtered = state.lectures.where((lecture) {
      final matchesName = lecture.name.toLowerCase().contains(searchText);
      final matchesNumber =
          searchNumber != null && lecture.number == searchNumber;
      final matchesLectureText =
          'lecture ${lecture.number}'.toLowerCase().contains(searchText);

      return matchesName || matchesNumber || matchesLectureText;
    }).toList();

    emit(state.copyWith(
      searchQuery: searchText,
      filteredLectures: filtered,
      isUpdating: false,
    ));
  }

  void deleteLecture(int lectureNumber) async {
    try {
      emit(state.copyWith(status: LectureStatus.loading, isUpdating: false));

      DocumentReference courseRef =
          FirebaseFirestore.instance.collection('Courses').doc(courseId);
      QuerySnapshot lecturesSnapshot = await courseRef
          .collection('lectures')
          .where('lectureNumber', isEqualTo: lectureNumber)
          .get();

      print('Deleting lecture with lectureNumber: $lectureNumber');

      if (lecturesSnapshot.docs.isNotEmpty) {
        var lectureDoc = lecturesSnapshot.docs.first;
        print('Lecture found with ID: ${lectureDoc.id}');

        CollectionReference attendanceRef =
            lectureDoc.reference.collection('Attendance');
        QuerySnapshot attendanceSnapshot = await attendanceRef.get();

        print('Deleting Attendance collection for lecture: ${lectureDoc.id}');

        for (var doc in attendanceSnapshot.docs) {
          await doc.reference.delete();
          print('Deleted document ${doc.id} from Attendance');
        }

        await lectureDoc.reference.delete();
        print('Lecture deleted: ${lectureDoc.id}');

        await _reorderLectures();
      } else {
        print('No lecture found with lectureNumber: $lectureNumber');
      }

      loadLectures();
    } catch (e) {
      print('Error deleting lecture: $e');
      emit(state.copyWith(
        status: LectureStatus.failure,
        errorMessage: 'Failed to delete lecture: ${e.toString()}',
        isUpdating: false,
      ));
    }
  }

  Future<void> refreshLectures() async {
    loadLectures();
  }

  void updateLecture(LectureModel updatedLecture) async {
    try {
      emit(state.copyWith(status: LectureStatus.loading, isUpdating: true));

      DocumentReference courseRef =
          FirebaseFirestore.instance.collection('Courses').doc(courseId);
      QuerySnapshot lecturesSnapshot = await courseRef
          .collection('lectures')
          .where('lectureNumber', isEqualTo: updatedLecture.number)
          .get();

      if (lecturesSnapshot.docs.isNotEmpty) {
        var lectureDoc = lecturesSnapshot.docs.first;
        await lectureDoc.reference.update({
          'name': updatedLecture.name,
          'date': updatedLecture.date,
          'time': updatedLecture.time,
          'start_hour_12': updatedLecture.startHour,
          'start_minute': updatedLecture.startMinute,
          'start_period': updatedLecture.startPeriod,
          'end_hour_12': updatedLecture.endHour,
          'end_minute': updatedLecture.endMinute,
          'end_period': updatedLecture.endPeriod,
          'camera_status': updatedLecture.cameraStatus,
          'last_updated': Timestamp.now(),
        });

        print('Updated lecture in Firestore: ${updatedLecture.name}');
        await Future.delayed(const Duration(milliseconds: 500));
      } else {
        throw Exception('Lecture not found');
      }

      loadLectures();
      emit(state.copyWith(
        status: LectureStatus.success,
        isUpdating: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: LectureStatus.failure,
        errorMessage: 'Failed to update lecture: ${e.toString()}',
        isUpdating: false,
      ));
    }
  }

  Future<void> _reorderLectures() async {
    DocumentReference courseRef =
        FirebaseFirestore.instance.collection('Courses').doc(courseId);
    QuerySnapshot lecturesSnapshot = await courseRef
        .collection('lectures')
        .orderBy('lectureNumber', descending: false)
        .get();

    int newNumber = 1;
    for (var doc in lecturesSnapshot.docs) {
      await doc.reference.update({'lectureNumber': newNumber});
      newNumber++;
    }
  }
}
