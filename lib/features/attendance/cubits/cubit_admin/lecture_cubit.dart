// // // // // // // // attendance/cubits/cubit_admin/lecture_cubit.dart
// // // // // // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // // // // // import '../../models/lecture_model_admin.dart';
// // // // // // // import 'lecture_state.dart';

// // // // // // // class LectureCubit extends Cubit<LectureState> {
// // // // // // //   LectureCubit() : super(const LectureState()) {
// // // // // // //     loadLectures();
// // // // // // //   }

// // // // // // //   final List<LectureModel> _mockLectures = [
// // // // // // //     LectureModel(number: 1, name: 'Introduction to Flutter', date: '10-12', time: '09:30 AM', isPresent: true),
// // // // // // //     LectureModel(number: 2, name: 'Dart Programming Basics', date: '10-12', time: '11:00 AM', isPresent: false),
// // // // // // //     LectureModel(number: 3, name: 'Widget Fundamentals', date: '10-12', time: '01:30 PM', isPresent: true),
// // // // // // //     LectureModel(number: 4, name: 'State Management', date: '10-15', time: '10:15 AM', isPresent: true),
// // // // // // //     LectureModel(number: 5, name: 'Working with APIs', date: '10-17', time: '02:45 PM', isPresent: false),
// // // // // // //     LectureModel(number: 6, name: 'Firebase Integration', date: '10-17', time: '02:45 PM', isPresent: false),
// // // // // // //     LectureModel(number: 7, name: 'Advanced UI Components', date: '10-17', time: '02:45 PM', isPresent: false),
// // // // // // //   ];

// // // // // // //   void loadLectures() {
// // // // // // //     emit(state.copyWith(
// // // // // // //       status: LectureStatus.loading,
// // // // // // //     ));

// // // // // // //     try {
// // // // // // //       // In a real app, you would fetch from an API or database
// // // // // // //       emit(state.copyWith(
// // // // // // //         status: LectureStatus.success,
// // // // // // //         lectures: _mockLectures,
// // // // // // //         filteredLectures: _mockLectures,
// // // // // // //       ));
// // // // // // //     } catch (e) {
// // // // // // //       emit(state.copyWith(
// // // // // // //         status: LectureStatus.failure,
// // // // // // //         errorMessage: 'Failed to load lectures: ${e.toString()}',
// // // // // // //       ));
// // // // // // //     }
// // // // // // //   }

// // // // // // //   void searchLectures(String query) {
// // // // // // //     final searchText = query.toLowerCase();

// // // // // // //     if (searchText.isEmpty) {
// // // // // // //       emit(state.copyWith(
// // // // // // //         searchQuery: searchText,
// // // // // // //         filteredLectures: state.lectures,
// // // // // // //       ));
// // // // // // //     } else {
// // // // // // //       final filtered = state.lectures.where((lecture) {
// // // // // // //         return lecture.name.toLowerCase().contains(searchText);
// // // // // // //       }).toList();

// // // // // // //       emit(state.copyWith(
// // // // // // //         searchQuery: searchText,
// // // // // // //         filteredLectures: filtered,
// // // // // // //       ));
// // // // // // //     }
// // // // // // //   }

// // // // // // //   void deleteLecture(int lectureNumber) {
// // // // // // //     try {
// // // // // // //       // In a real app, you would call an API to delete
// // // // // // //       final updatedLectures = state.lectures.where((lecture) => lecture.number != lectureNumber).toList();

// // // // // // //       emit(state.copyWith(
// // // // // // //         lectures: updatedLectures,
// // // // // // //         filteredLectures: state.searchQuery.isEmpty
// // // // // // //             ? updatedLectures
// // // // // // //             : updatedLectures.where((lecture) =>
// // // // // // //             lecture.name.toLowerCase().contains(state.searchQuery.toLowerCase())).toList(),
// // // // // // //       ));
// // // // // // //     } catch (e) {
// // // // // // //       emit(state.copyWith(
// // // // // // //         status: LectureStatus.failure,
// // // // // // //         errorMessage: 'Failed to delete lecture: ${e.toString()}',
// // // // // // //       ));
// // // // // // //     }
// // // // // // //   }

// // // // // // //   void editLecture(LectureModel updatedLecture) {
// // // // // // //     try {
// // // // // // //       // In a real app, you would call an API to update
// // // // // // //       final updatedLectures = state.lectures.map((lecture) {
// // // // // // //         return lecture.number == updatedLecture.number ? updatedLecture : lecture;
// // // // // // //       }).toList();

// // // // // // //       emit(state.copyWith(
// // // // // // //         lectures: updatedLectures,
// // // // // // //         filteredLectures: state.searchQuery.isEmpty
// // // // // // //             ? updatedLectures
// // // // // // //             : updatedLectures.where((lecture) =>
// // // // // // //             lecture.name.toLowerCase().contains(state.searchQuery.toLowerCase())).toList(),
// // // // // // //       ));
// // // // // // //     } catch (e) {
// // // // // // //       emit(state.copyWith(
// // // // // // //         status: LectureStatus.failure,
// // // // // // //         errorMessage: 'Failed to update lecture: ${e.toString()}',
// // // // // // //       ));
// // // // // // //     }
// // // // // // //   }

// // // // // // //   void addLecture(LectureModel newLecture) {
// // // // // // //     try {
// // // // // // //       // In a real app, you would call an API to create
// // // // // // //       final updatedLectures = [...state.lectures, newLecture];

// // // // // // //       emit(state.copyWith(
// // // // // // //         lectures: updatedLectures,
// // // // // // //         filteredLectures: state.searchQuery.isEmpty
// // // // // // //             ? updatedLectures
// // // // // // //             : updatedLectures.where((lecture) =>
// // // // // // //             lecture.name.toLowerCase().contains(state.searchQuery.toLowerCase())).toList(),
// // // // // // //       ));
// // // // // // //     } catch (e) {
// // // // // // //       emit(state.copyWith(
// // // // // // //         status: LectureStatus.failure,
// // // // // // //         errorMessage: 'Failed to add lecture: ${e.toString()}',
// // // // // // //       ));
// // // // // // //     }
// // // // // // //   }
// // // // // // // }

// // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // // // // import '../../models/lecture_model_admin.dart';
// // // // // // import 'lecture_state.dart';

// // // // // // class LectureCubit extends Cubit<LectureState> {
// // // // // //   final String courseId; // استقبال courseId
// // // // // //   LectureCubit({required this.courseId}) : super(const LectureState()) {
// // // // // //     loadLectures();
// // // // // //   }

// // // // // //   void loadLectures() async {
// // // // // //     emit(state.copyWith(
// // // // // //       status: LectureStatus.loading,
// // // // // //     ));

// // // // // //     try {
// // // // // //       // Fetch lectures from Firestore using courseId
// // // // // //       DocumentReference courseRef =
// // // // // //           FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // // // // //       QuerySnapshot lecturesSnapshot =
// // // // // //           await courseRef.collection('lectures').get();

// // // // // //       List<LectureModel> lectures = [];
// // // // // //       for (var doc in lecturesSnapshot.docs) {
// // // // // //         final data = doc.data() as Map<String, dynamic>;
// // // // // //         lectures.add(LectureModel(
// // // // // //           number: lectures.length + 1,
// // // // // //           name: data['name'] ?? 'Unknown',
// // // // // //           date: data['date'] ?? 'Unknown',
// // // // // //           time: data['time'] ?? 'Unknown',
// // // // // //           isPresent: false,
// // // // // //         ));
// // // // // //       }

// // // // // //       emit(state.copyWith(
// // // // // //         status: LectureStatus.success,
// // // // // //         lectures: lectures,
// // // // // //         filteredLectures: lectures,
// // // // // //       ));
// // // // // //     } catch (e) {
// // // // // //       emit(state.copyWith(
// // // // // //         status: LectureStatus.failure,
// // // // // //         errorMessage: 'Failed to load lectures: ${e.toString()}',
// // // // // //       ));
// // // // // //     }
// // // // // //   }

// // // // // //   void searchLectures(String query) {
// // // // // //     final searchText = query.toLowerCase();

// // // // // //     if (searchText.isEmpty) {
// // // // // //       emit(state.copyWith(
// // // // // //         searchQuery: searchText,
// // // // // //         filteredLectures: state.lectures,
// // // // // //       ));
// // // // // //     } else {
// // // // // //       final filtered = state.lectures.where((lecture) {
// // // // // //         return lecture.name.toLowerCase().contains(searchText);
// // // // // //       }).toList();

// // // // // //       emit(state.copyWith(
// // // // // //         searchQuery: searchText,
// // // // // //         filteredLectures: filtered,
// // // // // //       ));
// // // // // //     }
// // // // // //   }

// // // // // //   void deleteLecture(int lectureNumber) async {
// // // // // //     try {
// // // // // //       DocumentReference courseRef =
// // // // // //           FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // // // // //       QuerySnapshot lecturesSnapshot =
// // // // // //           await courseRef.collection('lectures').get();

// // // // // //       var lectureDoc = lecturesSnapshot.docs[lectureNumber - 1];
// // // // // //       await lectureDoc.reference.delete();

// // // // // //       loadLectures();
// // // // // //     } catch (e) {
// // // // // //       emit(state.copyWith(
// // // // // //         status: LectureStatus.failure,
// // // // // //         errorMessage: 'Failed to delete lecture: ${e.toString()}',
// // // // // //       ));
// // // // // //     }
// // // // // //   }

// // // // // //   void editLecture(LectureModel updatedLecture) async {
// // // // // //     try {
// // // // // //       DocumentReference courseRef =
// // // // // //           FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // // // // //       QuerySnapshot lecturesSnapshot =
// // // // // //           await courseRef.collection('lectures').get();

// // // // // //       var lectureDoc = lecturesSnapshot.docs[updatedLecture.number - 1];
// // // // // //       await lectureDoc.reference.update({
// // // // // //         'name': updatedLecture.name,
// // // // // //         'date': updatedLecture.date,
// // // // // //         'time': updatedLecture.time,
// // // // // //       });

// // // // // //       loadLectures();
// // // // // //     } catch (e) {
// // // // // //       emit(state.copyWith(
// // // // // //         status: LectureStatus.failure,
// // // // // //         errorMessage: 'Failed to update lecture: ${e.toString()}',
// // // // // //       ));
// // // // // //     }
// // // // // //   }

// // // // // //   void addLecture(LectureModel newLecture) async {
// // // // // //     try {
// // // // // //       DocumentReference courseRef =
// // // // // //           FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // // // // //       await courseRef.collection('lectures').add({
// // // // // //         'name': newLecture.name,
// // // // // //         'date': newLecture.date,
// // // // // //         'time': newLecture.time,
// // // // // //         'created_at': Timestamp.now(),
// // // // // //       });

// // // // // //       loadLectures();
// // // // // //     } catch (e) {
// // // // // //       emit(state.copyWith(
// // // // // //         status: LectureStatus.failure,
// // // // // //         errorMessage: 'Failed to add lecture: ${e.toString()}',
// // // // // //       ));
// // // // // //     }
// // // // // //   }
// // // // // // }

// // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // // // import '../../models/lecture_model_admin.dart';
// // // // // import 'lecture_state.dart';

// // // // // class LectureCubit extends Cubit<LectureState> {
// // // // //   final String courseId;
// // // // //   LectureCubit({required this.courseId}) : super(const LectureState()) {
// // // // //     loadLectures();
// // // // //   }

// // // // //   void loadLectures() async {
// // // // //     emit(state.copyWith(
// // // // //       status: LectureStatus.loading,
// // // // //     ));

// // // // //     try {
// // // // //       DocumentReference courseRef =
// // // // //           FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // // // //       QuerySnapshot lecturesSnapshot = await courseRef
// // // // //           .collection('lectures')
// // // // //           .orderBy('lectureNumber',
// // // // //               descending: false) // ترتيب بناءً على lectureNumber
// // // // //           .get();

// // // // //       List<LectureModel> lectures = [];
// // // // //       for (var doc in lecturesSnapshot.docs) {
// // // // //         final data = doc.data() as Map<String, dynamic>;
// // // // //         lectures.add(LectureModel(
// // // // //           number:
// // // // //               data['lectureNumber'] ?? 0, // استرجاع lectureNumber من Firestore
// // // // //           name: data['name'] ?? 'Unknown',
// // // // //           date: data['date'] ?? 'Unknown',
// // // // //           time: data['time'] ?? 'Unknown',
// // // // //           isPresent: false,
// // // // //         ));
// // // // //       }

// // // // //       emit(state.copyWith(
// // // // //         status: LectureStatus.success,
// // // // //         lectures: lectures,
// // // // //         filteredLectures: lectures,
// // // // //       ));
// // // // //     } catch (e) {
// // // // //       emit(state.copyWith(
// // // // //         status: LectureStatus.failure,
// // // // //         errorMessage: 'Failed to load lectures: ${e.toString()}',
// // // // //       ));
// // // // //     }
// // // // //   }

// // // // //   // void searchLectures(String query) {
// // // // //   //   final searchText = query.toLowerCase();

// // // // //   //   if (searchText.isEmpty) {
// // // // //   //     emit(state.copyWith(
// // // // //   //       searchQuery: searchText,
// // // // //   //       filteredLectures: state.lectures,
// // // // //   //     ));
// // // // //   //   } else {
// // // // //   //     final filtered = state.lectures.where((lecture) {
// // // // //   //       return lecture.name.toLowerCase().contains(searchText);
// // // // //   //     }).toList();

// // // // //   //     emit(state.copyWith(
// // // // //   //       searchQuery: searchText,
// // // // //   //       filteredLectures: filtered,
// // // // //   //     ));
// // // // //   //   }
// // // // //   // }

// // // // //   void searchLectures(String query) {
// // // // //     final searchText = query.toLowerCase().trim();

// // // // //     if (searchText.isEmpty) {
// // // // //       emit(state.copyWith(
// // // // //         searchQuery: searchText,
// // // // //         filteredLectures: state.lectures,
// // // // //       ));
// // // // //       return;
// // // // //     }

// // // // //     // استخراج الرقم من النص المدخل (مثل "Lecture 3" أو "3")
// // // // //     int? searchNumber;
// // // // //     final lectureNumberMatch = RegExp(r'\d+').firstMatch(searchText);
// // // // //     if (lectureNumberMatch != null) {
// // // // //       searchNumber = int.tryParse(lectureNumberMatch.group(0)!);
// // // // //     }

// // // // //     final filtered = state.lectures.where((lecture) {
// // // // //       // البحث بناءً على اسم المحاضرة
// // // // //       final matchesName = lecture.name.toLowerCase().contains(searchText);
// // // // //       // البحث بناءً على رقم المحاضرة (مثل "Lecture 3" أو "3")
// // // // //       final matchesNumber =
// // // // //           searchNumber != null && lecture.number == searchNumber;
// // // // //       // البحث في النص المدمج "Lecture X"
// // // // //       final matchesLectureText =
// // // // //           'lecture ${lecture.number}'.toLowerCase().contains(searchText);

// // // // //       return matchesName || matchesNumber || matchesLectureText;
// // // // //     }).toList();

// // // // //     emit(state.copyWith(
// // // // //       searchQuery: searchText,
// // // // //       filteredLectures: filtered,
// // // // //     ));
// // // // //   }

// // // // //   void deleteLecture(int lectureNumber) async {
// // // // //     try {
// // // // //       DocumentReference courseRef =
// // // // //           FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // // // //       QuerySnapshot lecturesSnapshot = await courseRef
// // // // //           .collection('lectures')
// // // // //           .where('lectureNumber', isEqualTo: lectureNumber)
// // // // //           .get();

// // // // //       if (lecturesSnapshot.docs.isNotEmpty) {
// // // // //         var lectureDoc = lecturesSnapshot.docs.first;
// // // // //         await lectureDoc.reference.delete();

// // // // //         // إعادة ترتيب lectureNumber للمحاضرات المتبقية
// // // // //         await _reorderLectures();
// // // // //       }

// // // // //       loadLectures();
// // // // //     } catch (e) {
// // // // //       emit(state.copyWith(
// // // // //         status: LectureStatus.failure,
// // // // //         errorMessage: 'Failed to delete lecture: ${e.toString()}',
// // // // //       ));
// // // // //     }
// // // // //   }

// // // // //   void editLecture(LectureModel updatedLecture) async {
// // // // //     try {
// // // // //       DocumentReference courseRef =
// // // // //           FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // // // //       QuerySnapshot lecturesSnapshot = await courseRef
// // // // //           .collection('lectures')
// // // // //           .where('lectureNumber', isEqualTo: updatedLecture.number)
// // // // //           .get();

// // // // //       if (lecturesSnapshot.docs.isNotEmpty) {
// // // // //         var lectureDoc = lecturesSnapshot.docs.first;
// // // // //         await lectureDoc.reference.update({
// // // // //           'name': updatedLecture.name,
// // // // //           'date': updatedLecture.date,
// // // // //           'time': updatedLecture.time,
// // // // //         });
// // // // //       }

// // // // //       loadLectures();
// // // // //     } catch (e) {
// // // // //       emit(state.copyWith(
// // // // //         status: LectureStatus.failure,
// // // // //         errorMessage: 'Failed to update lecture: ${e.toString()}',
// // // // //       ));
// // // // //     }
// // // // //   }

// // // // //   void addLecture(LectureModel newLecture) async {
// // // // //     try {
// // // // //       DocumentReference courseRef =
// // // // //           FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // // // //       QuerySnapshot lecturesSnapshot =
// // // // //           await courseRef.collection('lectures').get();
// // // // //       final lectureCount = lecturesSnapshot.docs.length;
// // // // //       final newLectureNumber = lectureCount + 1;

// // // // //       await courseRef.collection('lectures').add({
// // // // //         'name': newLecture.name,
// // // // //         'date': newLecture.date,
// // // // //         'time': newLecture.time,
// // // // //         'created_at': Timestamp.now(),
// // // // //         'lectureNumber': newLectureNumber,
// // // // //       });

// // // // //       loadLectures();
// // // // //     } catch (e) {
// // // // //       emit(state.copyWith(
// // // // //         status: LectureStatus.failure,
// // // // //         errorMessage: 'Failed to add lecture: ${e.toString()}',
// // // // //       ));
// // // // //     }
// // // // //   }

// // // // //   // دالة لإعادة ترتيب lectureNumber بعد الحذف
// // // // //   Future<void> _reorderLectures() async {
// // // // //     DocumentReference courseRef =
// // // // //         FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // // // //     QuerySnapshot lecturesSnapshot = await courseRef
// // // // //         .collection('lectures')
// // // // //         .orderBy('lectureNumber', descending: false)
// // // // //         .get();

// // // // //     int newNumber = 1;
// // // // //     for (var doc in lecturesSnapshot.docs) {
// // // // //       await doc.reference.update({'lectureNumber': newNumber});
// // // // //       newNumber++;
// // // // //     }
// // // // //   }
// // // // // }

// // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // // import '../../models/lecture_model_admin.dart';
// // // // import 'lecture_state.dart';

// // // // class LectureCubit extends Cubit<LectureState> {
// // // //   final String courseId;

// // // //   LectureCubit({required this.courseId}) : super(const LectureState()) {
// // // //     loadLectures();
// // // //   }

// // // //   // تحميل المحاضرات من Firestore
// // // //   void loadLectures() async {
// // // //     emit(state.copyWith(status: LectureStatus.loading));

// // // //     try {
// // // //       DocumentReference courseRef =
// // // //           FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // // //       QuerySnapshot lecturesSnapshot = await courseRef
// // // //           .collection('lectures')
// // // //           .orderBy('lectureNumber', descending: false)
// // // //           .get();

// // // //       List<LectureModel> lectures = [];
// // // //       for (var doc in lecturesSnapshot.docs) {
// // // //         final data = doc.data() as Map<String, dynamic>;
// // // //         lectures.add(LectureModel(
// // // //           number: data['lectureNumber'] ?? 0,
// // // //           name: data['name'] ?? 'Unknown',
// // // //           date: data['date'] ?? 'Unknown',
// // // //           time: data['time'] ?? 'Unknown',
// // // //           isPresent: false,
// // // //         ));
// // // //       }

// // // //       emit(state.copyWith(
// // // //         status: LectureStatus.success,
// // // //         lectures: lectures,
// // // //         filteredLectures: lectures,
// // // //       ));
// // // //     } catch (e) {
// // // //       emit(state.copyWith(
// // // //         status: LectureStatus.failure,
// // // //         errorMessage: 'Failed to load lectures: ${e.toString()}',
// // // //       ));
// // // //     }
// // // //   }

// // // //   // البحث في المحاضرات
// // // //   void searchLectures(String query) {
// // // //     final searchText = query.toLowerCase().trim();

// // // //     if (searchText.isEmpty) {
// // // //       emit(state.copyWith(
// // // //         searchQuery: searchText,
// // // //         filteredLectures: state.lectures,
// // // //       ));
// // // //       return;
// // // //     }

// // // //     int? searchNumber;
// // // //     final lectureNumberMatch = RegExp(r'\d+').firstMatch(searchText);
// // // //     if (lectureNumberMatch != null) {
// // // //       searchNumber = int.tryParse(lectureNumberMatch.group(0)!);
// // // //     }

// // // //     final filtered = state.lectures.where((lecture) {
// // // //       final matchesName = lecture.name.toLowerCase().contains(searchText);
// // // //       final matchesNumber =
// // // //           searchNumber != null && lecture.number == searchNumber;
// // // //       final matchesLectureText =
// // // //           'lecture ${lecture.number}'.toLowerCase().contains(searchText);

// // // //       return matchesName || matchesNumber || matchesLectureText;
// // // //     }).toList();

// // // //     emit(state.copyWith(
// // // //       searchQuery: searchText,
// // // //       filteredLectures: filtered,
// // // //     ));
// // // //   }

// // // //   // حذف محاضرة
// // // //   void deleteLecture(int lectureNumber) async {
// // // //     try {
// // // //       emit(state.copyWith(status: LectureStatus.loading));

// // // //       DocumentReference courseRef =
// // // //           FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // // //       QuerySnapshot lecturesSnapshot = await courseRef
// // // //           .collection('lectures')
// // // //           .where('lectureNumber', isEqualTo: lectureNumber)
// // // //           .get();

// // // //       if (lecturesSnapshot.docs.isNotEmpty) {
// // // //         var lectureDoc = lecturesSnapshot.docs.first;
// // // //         await lectureDoc.reference.delete();

// // // //         await _reorderLectures();
// // // //       }

// // // //       loadLectures();
// // // //     } catch (e) {
// // // //       emit(state.copyWith(
// // // //         status: LectureStatus.failure,
// // // //         errorMessage: 'Failed to delete lecture: ${e.toString()}',
// // // //       ));
// // // //     }
// // // //   }

// // // //   // تحديث محاضرة (تغيير الاسم من editLecture إلى updateLecture)
// // // //   void updateLecture(LectureModel updatedLecture) async {
// // // //     try {
// // // //       emit(state.copyWith(status: LectureStatus.loading));

// // // //       DocumentReference courseRef =
// // // //           FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // // //       QuerySnapshot lecturesSnapshot = await courseRef
// // // //           .collection('lectures')
// // // //           .where('lectureNumber', isEqualTo: updatedLecture.number)
// // // //           .get();

// // // //       if (lecturesSnapshot.docs.isNotEmpty) {
// // // //         var lectureDoc = lecturesSnapshot.docs.first;
// // // //         await lectureDoc.reference.update({
// // // //           'name': updatedLecture.name,
// // // //           'date': updatedLecture.date,
// // // //           'time': updatedLecture.time,
// // // //         });
// // // //       } else {
// // // //         throw Exception('Lecture not found');
// // // //       }

// // // //       loadLectures();
// // // //     } catch (e) {
// // // //       emit(state.copyWith(
// // // //         status: LectureStatus.failure,
// // // //         errorMessage: 'Failed to update lecture: ${e.toString()}',
// // // //       ));
// // // //     }
// // // //   }

// // // //   // إضافة محاضرة جديدة
// // // //   void addLecture(LectureModel newLecture) async {
// // // //     try {
// // // //       emit(state.copyWith(status: LectureStatus.loading));

// // // //       DocumentReference courseRef =
// // // //           FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // // //       QuerySnapshot lecturesSnapshot =
// // // //           await courseRef.collection('lectures').get();
// // // //       final lectureCount = lecturesSnapshot.docs.length;
// // // //       final newLectureNumber = lectureCount + 1;

// // // //       await courseRef.collection('lectures').add({
// // // //         'name': newLecture.name,
// // // //         'date': newLecture.date,
// // // //         'time': newLecture.time,
// // // //         'created_at': Timestamp.now(),
// // // //         'lectureNumber': newLectureNumber,
// // // //       });

// // // //       loadLectures();
// // // //     } catch (e) {
// // // //       emit(state.copyWith(
// // // //         status: LectureStatus.failure,
// // // //         errorMessage: 'Failed to add lecture: ${e.toString()}',
// // // //       ));
// // // //     }
// // // //   }

// // // //   // إعادة ترتيب lectureNumber بعد الحذف
// // // //   Future<void> _reorderLectures() async {
// // // //     DocumentReference courseRef =
// // // //         FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // // //     QuerySnapshot lecturesSnapshot = await courseRef
// // // //         .collection('lectures')
// // // //         .orderBy('lectureNumber', descending: false)
// // // //         .get();

// // // //     int newNumber = 1;
// // // //     for (var doc in lecturesSnapshot.docs) {
// // // //       await doc.reference.update({'lectureNumber': newNumber});
// // // //       newNumber++;
// // // //     }
// // // //   }
// // // // }

// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // import '../../models/lecture_model_admin.dart';
// // // import 'lecture_state.dart';

// // // class LectureCubit extends Cubit<LectureState> {
// // //   final String courseId;

// // //   LectureCubit({required this.courseId}) : super(const LectureState()) {
// // //     loadLectures();
// // //   }

// // //   // تحميل المحاضرات من Firestore
// // //   void loadLectures() async {
// // //     emit(state.copyWith(status: LectureStatus.loading, isUpdating: false));

// // //     try {
// // //       DocumentReference courseRef =
// // //           FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // //       QuerySnapshot lecturesSnapshot = await courseRef
// // //           .collection('lectures')
// // //           .orderBy('lectureNumber', descending: false)
// // //           .get();

// // //       List<LectureModel> lectures = [];
// // //       for (var doc in lecturesSnapshot.docs) {
// // //         final data = doc.data() as Map<String, dynamic>;
// // //         lectures.add(LectureModel(
// // //           number: data['lectureNumber'] ?? 0,
// // //           name: data['name'] ?? 'Unknown',
// // //           date: data['date'] ?? 'Unknown',
// // //           time: data['time'] ?? 'Unknown',
// // //           isPresent: false,
// // //         ));
// // //       }

// // //       emit(state.copyWith(
// // //         status: LectureStatus.success,
// // //         lectures: lectures,
// // //         filteredLectures: lectures,
// // //         isUpdating: false,
// // //       ));
// // //     } catch (e) {
// // //       emit(state.copyWith(
// // //         status: LectureStatus.failure,
// // //         errorMessage: 'Failed to load lectures: ${e.toString()}',
// // //         isUpdating: false,
// // //       ));
// // //     }
// // //   }

// // //   // البحث في المحاضرات
// // //   void searchLectures(String query) {
// // //     final searchText = query.toLowerCase().trim();

// // //     if (searchText.isEmpty) {
// // //       emit(state.copyWith(
// // //         searchQuery: searchText,
// // //         filteredLectures: state.lectures,
// // //         isUpdating: false,
// // //       ));
// // //       return;
// // //     }

// // //     int? searchNumber;
// // //     final lectureNumberMatch = RegExp(r'\d+').firstMatch(searchText);
// // //     if (lectureNumberMatch != null) {
// // //       searchNumber = int.tryParse(lectureNumberMatch.group(0)!);
// // //     }

// // //     final filtered = state.lectures.where((lecture) {
// // //       final matchesName = lecture.name.toLowerCase().contains(searchText);
// // //       final matchesNumber =
// // //           searchNumber != null && lecture.number == searchNumber;
// // //       final matchesLectureText =
// // //           'lecture ${lecture.number}'.toLowerCase().contains(searchText);

// // //       return matchesName || matchesNumber || matchesLectureText;
// // //     }).toList();

// // //     emit(state.copyWith(
// // //       searchQuery: searchText,
// // //       filteredLectures: filtered,
// // //       isUpdating: false,
// // //     ));
// // //   }

// // //   // حذف محاضرة
// // //   void deleteLecture(int lectureNumber) async {
// // //     try {
// // //       emit(state.copyWith(status: LectureStatus.loading, isUpdating: false));

// // //       DocumentReference courseRef =
// // //           FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // //       QuerySnapshot lecturesSnapshot = await courseRef
// // //           .collection('lectures')
// // //           .where('lectureNumber', isEqualTo: lectureNumber)
// // //           .get();

// // //       if (lecturesSnapshot.docs.isNotEmpty) {
// // //         var lectureDoc = lecturesSnapshot.docs.first;
// // //         await lectureDoc.reference.delete();

// // //         await _reorderLectures();
// // //       }

// // //       loadLectures();
// // //     } catch (e) {
// // //       emit(state.copyWith(
// // //         status: LectureStatus.failure,
// // //         errorMessage: 'Failed to delete lecture: ${e.toString()}',
// // //         isUpdating: false,
// // //       ));
// // //     }
// // //   }

// // //   // تحديث محاضرة
// // //   void updateLecture(LectureModel updatedLecture) async {
// // //     try {
// // //       emit(state.copyWith(status: LectureStatus.loading, isUpdating: true));

// // //       DocumentReference courseRef =
// // //           FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // //       QuerySnapshot lecturesSnapshot = await courseRef
// // //           .collection('lectures')
// // //           .where('lectureNumber', isEqualTo: updatedLecture.number)
// // //           .get();

// // //       if (lecturesSnapshot.docs.isNotEmpty) {
// // //         var lectureDoc = lecturesSnapshot.docs.first;
// // //         await lectureDoc.reference.update({
// // //           'name': updatedLecture.name,
// // //           'date': updatedLecture.date,
// // //           'time': updatedLecture.time,
// // //         });
// // //       } else {
// // //         throw Exception('Lecture not found');
// // //       }

// // //       loadLectures();
// // //     } catch (e) {
// // //       emit(state.copyWith(
// // //         status: LectureStatus.failure,
// // //         errorMessage: 'Failed to update lecture: ${e.toString()}',
// // //         isUpdating: true,
// // //       ));
// // //     }
// // //   }

// // //   // إضافة محاضرة جديدة
// // //   void addLecture(LectureModel newLecture) async {
// // //     try {
// // //       emit(state.copyWith(status: LectureStatus.loading, isUpdating: false));

// // //       DocumentReference courseRef =
// // //           FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // //       QuerySnapshot lecturesSnapshot =
// // //           await courseRef.collection('lectures').get();
// // //       final lectureCount = lecturesSnapshot.docs.length;
// // //       final newLectureNumber = lectureCount + 1;

// // //       await courseRef.collection('lectures').add({
// // //         'name': newLecture.name,
// // //         'date': newLecture.date,
// // //         'time': newLecture.time,
// // //         'created_at': Timestamp.now(),
// // //         'lectureNumber': newLectureNumber,
// // //       });

// // //       loadLectures();
// // //     } catch (e) {
// // //       emit(state.copyWith(
// // //         status: LectureStatus.failure,
// // //         errorMessage: 'Failed to add lecture: ${e.toString()}',
// // //         isUpdating: false,
// // //       ));
// // //     }
// // //   }

// // //   // إعادة ترتيب lectureNumber بعد الحذف
// // //   Future<void> _reorderLectures() async {
// // //     DocumentReference courseRef =
// // //         FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // //     QuerySnapshot lecturesSnapshot = await courseRef
// // //         .collection('lectures')
// // //         .orderBy('lectureNumber', descending: false)
// // //         .get();

// // //     int newNumber = 1;
// // //     for (var doc in lecturesSnapshot.docs) {
// // //       await doc.reference.update({'lectureNumber': newNumber});
// // //       newNumber++;
// // //     }
// // //   }
// // // }

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

// //   // حذف محاضرة
// //   void deleteLecture(int lectureNumber) async {
// //     try {
// //       emit(state.copyWith(status: LectureStatus.loading, isUpdating: false));

// //       DocumentReference courseRef =
// //           FirebaseFirestore.instance.collection('Courses').doc(courseId);
// //       QuerySnapshot lecturesSnapshot = await courseRef
// //           .collection('lectures')
// //           .where('lectureNumber', isEqualTo: lectureNumber)
// //           .get();

// //       if (lecturesSnapshot.docs.isNotEmpty) {
// //         var lectureDoc = lecturesSnapshot.docs.first;
// //         await lectureDoc.reference.delete();

// //         await _reorderLectures();
// //       }

// //       loadLectures();
// //     } catch (e) {
// //       emit(state.copyWith(
// //         status: LectureStatus.failure,
// //         errorMessage: 'Failed to delete lecture: ${e.toString()}',
// //         isUpdating: false,
// //       ));
// //     }
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
// //       } else {
// //         throw Exception('Lecture not found');
// //       }

// //       loadLectures();
// //     } catch (e) {
// //       emit(state.copyWith(
// //         status: LectureStatus.failure,
// //         errorMessage: 'Failed to update lecture: ${e.toString()}',
// //         isUpdating: true,
// //       ));
// //     }
// //   }

// //   // إضافة محاضرة جديدة
// //   void addLecture(LectureModel newLecture) async {
// //     try {
// //       emit(state.copyWith(status: LectureStatus.loading, isUpdating: false));

// //       DocumentReference courseRef =
// //           FirebaseFirestore.instance.collection('Courses').doc(courseId);
// //       QuerySnapshot lecturesSnapshot =
// //           await courseRef.collection('lectures').get();
// //       final lectureCount = lecturesSnapshot.docs.length;
// //       final newLectureNumber = lectureCount + 1;

// //       await courseRef.collection('lectures').add({
// //         'name': newLecture.name,
// //         'date': newLecture.date,
// //         'time': newLecture.time,
// //         'created_at': Timestamp.now(),
// //         'lectureNumber': newLectureNumber,
// //       });

// //       loadLectures();
// //     } catch (e) {
// //       emit(state.copyWith(
// //         status: LectureStatus.failure,
// //         errorMessage: 'Failed to add lecture: ${e.toString()}',
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

//   // تحميل المحاضرات من Firestore
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
//         ));
//       }
//       print(
//           'Loaded lectures: ${lectures.map((l) => l.name).toList()}'); // للتصحيح
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

//   // البحث في المحاضرات
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

//   // حذف محاضرة
//   void deleteLecture(int lectureNumber) async {
//     try {
//       emit(state.copyWith(status: LectureStatus.loading, isUpdating: false));

//       DocumentReference courseRef =
//           FirebaseFirestore.instance.collection('Courses').doc(courseId);
//       QuerySnapshot lecturesSnapshot = await courseRef
//           .collection('lectures')
//           .where('lectureNumber', isEqualTo: lectureNumber)
//           .get();

//       if (lecturesSnapshot.docs.isNotEmpty) {
//         var lectureDoc = lecturesSnapshot.docs.first;
//         await lectureDoc.reference.delete();

//         await _reorderLectures();
//       }

//       loadLectures();
//     } catch (e) {
//       emit(state.copyWith(
//         status: LectureStatus.failure,
//         errorMessage: 'Failed to delete lecture: ${e.toString()}',
//         isUpdating: false,
//       ));
//     }
//   }

//   // تحديث محاضرة
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
//         });
//         print(
//             'Updated lecture in Firestore: ${updatedLecture.name}'); // للتصحيح
//         // إضافة تأخير لضمان تحديث Firestore
//         await Future.delayed(const Duration(milliseconds: 500));
//       } else {
//         throw Exception('Lecture not found');
//       }

//       loadLectures();
//       emit(state.copyWith(
//         status: LectureStatus.success,
//         isUpdating: false, // إعادة تعيين isUpdating لضمان الخروج
//       ));
//     } catch (e) {
//       emit(state.copyWith(
//         status: LectureStatus.failure,
//         errorMessage: 'Failed to update lecture: ${e.toString()}',
//         isUpdating: false,
//       ));
//     }
//   }

//   // إضافة محاضرة جديدة
//   void addLecture(LectureModel newLecture) async {
//     try {
//       emit(state.copyWith(status: LectureStatus.loading, isUpdating: false));

//       DocumentReference courseRef =
//           FirebaseFirestore.instance.collection('Courses').doc(courseId);
//       QuerySnapshot lecturesSnapshot =
//           await courseRef.collection('lectures').get();
//       final lectureCount = lecturesSnapshot.docs.length;
//       final newLectureNumber = lectureCount + 1;

//       await courseRef.collection('lectures').add({
//         'name': newLecture.name,
//         'date': newLecture.date,
//         'time': newLecture.time,
//         'created_at': Timestamp.now(),
//         'lectureNumber': newLectureNumber,
//       });

//       loadLectures();
//     } catch (e) {
//       emit(state.copyWith(
//         status: LectureStatus.failure,
//         errorMessage: 'Failed to add lecture: ${e.toString()}',
//         isUpdating: false,
//       ));
//     }
//   }

//   // إعادة ترتيب lectureNumber بعد الحذف
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

  // تحميل المحاضرات من Firestore
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
        ));
      }
      print(
          'Loaded lectures: ${lectures.map((l) => l.name).toList()}'); // للتصحيح
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

  // البحث في المحاضرات
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

  // حذف محاضرة
  void deleteLecture(int lectureNumber) async {
    try {
      emit(state.copyWith(status: LectureStatus.loading, isUpdating: false));

      DocumentReference courseRef =
          FirebaseFirestore.instance.collection('Courses').doc(courseId);
      QuerySnapshot lecturesSnapshot = await courseRef
          .collection('lectures')
          .where('lectureNumber', isEqualTo: lectureNumber)
          .get();

      if (lecturesSnapshot.docs.isNotEmpty) {
        var lectureDoc = lecturesSnapshot.docs.first;
        await lectureDoc.reference.delete();

        await _reorderLectures();
      }

      loadLectures();
    } catch (e) {
      emit(state.copyWith(
        status: LectureStatus.failure,
        errorMessage: 'Failed to delete lecture: ${e.toString()}',
        isUpdating: false,
      ));
    }
  }

  // تحديث محاضرة
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
        });
        print(
            'Updated lecture in Firestore: ${updatedLecture.name}'); // للتصحيح
        // إضافة تأخير لضمان تحديث Firestore
        await Future.delayed(const Duration(milliseconds: 500));
      } else {
        throw Exception('Lecture not found');
      }

       loadLectures();
      emit(state.copyWith(
        status: LectureStatus.success,
        isUpdating: false, // إعادة تعيين isUpdating
      ));
    } catch (e) {
      emit(state.copyWith(
        status: LectureStatus.failure,
        errorMessage: 'Failed to update lecture: ${e.toString()}',
        isUpdating: false,
      ));
    }
  }

  // إضافة محاضرة جديدة
  void addLecture(LectureModel newLecture) async {
    try {
      emit(state.copyWith(status: LectureStatus.loading, isUpdating: false));

      DocumentReference courseRef =
          FirebaseFirestore.instance.collection('Courses').doc(courseId);
      QuerySnapshot lecturesSnapshot =
          await courseRef.collection('lectures').get();
      final lectureCount = lecturesSnapshot.docs.length;
      final newLectureNumber = lectureCount + 1;

      await courseRef.collection('lectures').add({
        'name': newLecture.name,
        'date': newLecture.date,
        'time': newLecture.time,
        'created_at': Timestamp.now(),
        'lectureNumber': newLectureNumber,
      });

      loadLectures();
    } catch (e) {
      emit(state.copyWith(
        status: LectureStatus.failure,
        errorMessage: 'Failed to add lecture: ${e.toString()}',
        isUpdating: false,
      ));
    }
  }

  // إعادة ترتيب lectureNumber بعد الحذف
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
