// // import 'package:attendance_app/features/attendance/cubits/schudle_cubit/schudle_state.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';

// // class ScheduleCubit extends Cubit<ScheduleState> {
// //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// //   final String courseId;

// //   ScheduleCubit({required this.courseId}) : super(const ScheduleState()) {
// //     _loadInitialSchedule();
// //     _listenToCameraStatus();
// //   }

// //   void _loadInitialSchedule() async {
// //     try {
// //       DocumentSnapshot doc =
// //           await _firestore.collection('schedule').doc('daily').get();
// //       if (doc.exists) {
// //         final data = doc.data() as Map<String, dynamic>;
// //         emit(state.copyWith(
// //           cameraStatus: data['camera_status'] ?? 'closed',
// //         ));
// //       }
// //     } catch (e) {
// //       print('Error loading initial schedule: $e');
// //       emit(state.copyWith(errorMessage: 'Error loading initial schedule: $e'));
// //     }
// //   }

// //   void _listenToCameraStatus() {
// //     _firestore.collection('schedule').doc('daily').snapshots().listen(
// //       (snapshot) {
// //         if (snapshot.exists) {
// //           final data = snapshot.data() as Map<String, dynamic>;
// //           emit(state.copyWith(
// //             cameraStatus: data['camera_status'] ?? 'closed',
// //           ));
// //         }
// //       },
// //       onError: (error) {
// //         print('Error listening to camera status: $error');
// //         emit(state.copyWith(
// //             errorMessage: 'Error listening to camera status: $error'));
// //       },
// //     );
// //   }

// //   Future<void> saveSchedule({
// //     required String lectureName,
// //     required String date,
// //     required String time,
// //     required int startHour,
// //     required int startMinute,
// //     required String startPeriod,
// //     required int endHour,
// //     required int endMinute,
// //     required String endPeriod,
// //   }) async {
// //     try {
// //       emit(state.copyWith(isLoading: true));

// //       // التحقق من صحة البيانات
// //       int startHour24 = startHour;
// //       if (startPeriod == 'PM' && startHour != 12) startHour24 += 12;
// //       if (startPeriod == 'AM' && startHour == 12) startHour24 = 0;
// //       int endHour24 = endHour;
// //       if (endPeriod == 'PM' && endHour != 12) endHour24 += 12;
// //       if (endPeriod == 'AM' && endHour == 12) endHour24 = 0;

// //       int startMinutes = startHour24 * 60 + startMinute;
// //       int endMinutes = endHour24 * 60 + endMinute;

// //       if (endMinutes <= startMinutes) {
// //         emit(state.copyWith(
// //           isLoading: false,
// //           errorMessage: 'End time must be after start time',
// //         ));
// //         return;
// //       }

// //       // حفظ بيانات الجدول
// //       await _firestore.collection('schedule').doc('daily').set({
// //         'start_hour_12': startHour,
// //         'start_minute': startMinute,
// //         'start_period': startPeriod,
// //         'end_hour_12': endHour,
// //         'end_minute': endMinute,
// //         'end_period': endPeriod,
// //         'camera_status': 'closed',
// //         'lecture_name': lectureName,
// //         'date': date,
// //         'last_updated': Timestamp.now(),
// //       });

// //       // جلب عدد المحاضرات الحالية لحساب lectureNumber
// //       final lecturesSnapshot = await _firestore
// //           .collection('Courses')
// //           .doc(courseId)
// //           .collection('lectures')
// //           .get();
// //       final lectureCount = lecturesSnapshot.docs.length;
// //       final newLectureNumber = lectureCount + 1;

// //       print('Adding lecture to courseId: $courseId');
// //       print('Total existing lectures: $lectureCount');
// //       print('New lecture number: $newLectureNumber');

// //       // إضافة المحاضرة الجديدة
// //       DocumentReference courseRef =
// //           _firestore.collection('Courses').doc(courseId);
// //       DocumentReference lectureRef =
// //           await courseRef.collection('lectures').add({
// //         'name': lectureName,
// //         'date': date,
// //         'time': time,
// //         'created_at': Timestamp.now(),
// //         'lectureNumber': newLectureNumber,
// //       });

// //       print('Lecture added with ID: ${lectureRef.id}');
// //       print('Lecture path: ${lectureRef.path}');

// //       // إنشاء attendance collection فارغة (سيتم ملؤها لاحقًا ببيانات الطلاب)
// //       CollectionReference attendanceRef = lectureRef.collection('attendance');
// //       print('Attendance collection reference created: ${attendanceRef.path}');

// //       emit(state.copyWith(isLoading: false));
// //     } catch (e) {
// //       print('Error saving schedule: $e');
// //       emit(state.copyWith(
// //         isLoading: false,
// //         errorMessage: 'Error saving schedule: $e',
// //       ));
// //     }
// //   }

// //   Future<void> closeCamera() async {
// //     try {
// //       emit(state.copyWith(isLoading: true));
// //       await _firestore.collection('schedule').doc('daily').update({
// //         'camera_status': 'stopped',
// //       });
// //       emit(state.copyWith(isLoading: false));
// //     } catch (e) {
// //       print('Error closing camera: $e');
// //       emit(state.copyWith(
// //         isLoading: false,
// //         errorMessage: 'Error closing camera: $e',
// //       ));
// //     }
// //   }

// //   Future<void> openCamera() async {
// //     try {
// //       emit(state.copyWith(isLoading: true));
// //       await _firestore.collection('schedule').doc('daily').update({
// //         'camera_status': 'open',
// //       });
// //       emit(state.copyWith(isLoading: false));
// //     } catch (e) {
// //       print('Error opening camera: $e');
// //       emit(state.copyWith(
// //         isLoading: false,
// //         errorMessage: 'Error opening camera: $e',
// //       ));
// //     }
// //   }
// // }

// import 'package:attendance_app/features/attendance/cubits/schudle_cubit/schudle_state.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ScheduleCubit extends Cubit<ScheduleState> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final String courseId;

//   ScheduleCubit({required this.courseId}) : super(const ScheduleState()) {
//     _loadInitialSchedule();
//     _listenToCameraStatus();
//   }

//   void _loadInitialSchedule() async {
//     try {
//       DocumentSnapshot doc =
//           await _firestore.collection('schedule').doc('daily').get();
//       if (doc.exists) {
//         final data = doc.data() as Map<String, dynamic>;
//         emit(state.copyWith(
//           cameraStatus: data['camera_status'] ?? 'closed',
//         ));
//       }
//     } catch (e) {
//       print('Error loading initial schedule: $e');
//       emit(state.copyWith(errorMessage: 'Error loading initial schedule: $e'));
//     }
//   }

//   void _listenToCameraStatus() {
//     _firestore.collection('schedule').doc('daily').snapshots().listen(
//       (snapshot) {
//         if (snapshot.exists) {
//           final data = snapshot.data() as Map<String, dynamic>;
//           emit(state.copyWith(
//             cameraStatus: data['camera_status'] ?? 'closed',
//           ));
//         }
//       },
//       onError: (error) {
//         print('Error listening to camera status: $error');
//         emit(state.copyWith(
//             errorMessage: 'Error listening to camera status: $error'));
//       },
//     );
//   }

//   Future<void> saveSchedule({
//     required String lectureName,
//     required String date,
//     required String time,
//     required int startHour,
//     required int startMinute,
//     required String startPeriod,
//     required int endHour,
//     required int endMinute,
//     required String endPeriod,
//   }) async {
//     try {
//       emit(state.copyWith(isLoading: true));

//       // التحقق من صحة البيانات
//       int startHour24 = startHour;
//       if (startPeriod == 'PM' && startHour != 12) startHour24 += 12;
//       if (startPeriod == 'AM' && startHour == 12) startHour24 = 0;

//       int endHour24 = endHour;
//       if (endPeriod == 'PM' && endHour != 12) endHour24 += 12;
//       if (endPeriod == 'AM' && endHour == 12) endHour24 = 0;

//       int startMinutes = startHour24 * 60 + startMinute;
//       int endMinutes = endHour24 * 60 + endMinute;

//       // إذا كان endMinutes أقل من startMinutes، افترض إن الـ end time في اليوم التالي
//       bool isNextDay = endMinutes <= startMinutes;
//       if (isNextDay) {
//         endMinutes += 24 * 60; // أضف 24 ساعة (يوم كامل) للـ end time
//       }

//       // التحقق من إن الـ end time بعد الـ start time
//       if (endMinutes <= startMinutes) {
//         emit(state.copyWith(
//           isLoading: false,
//           errorMessage: 'End time must be after start time',
//         ));
//         return;
//       }

//       // حفظ بيانات الجدول
//       await _firestore.collection('schedule').doc('daily').set({
//         'start_hour_12': startHour,
//         'start_minute': startMinute,
//         'start_period': startPeriod,
//         'end_hour_12': endHour,
//         'end_minute': endMinute,
//         'end_period': endPeriod,
//         'camera_status': 'closed',
//         'lecture_name': lectureName,
//         'date': date,
//         'last_updated': Timestamp.now(),
//       });

//       // جلب عدد المحاضرات الحالية لحساب lectureNumber
//       final lecturesSnapshot = await _firestore
//           .collection('Courses')
//           .doc(courseId)
//           .collection('lectures')
//           .get();
//       final lectureCount = lecturesSnapshot.docs.length;
//       final newLectureNumber = lectureCount + 1;

//       print('Adding lecture to courseId: $courseId');
//       print('Total existing lectures: $lectureCount');
//       print('New lecture number: $newLectureNumber');

//       // إضافة المحاضرة الجديدة
//       DocumentReference courseRef =
//           _firestore.collection('Courses').doc(courseId);
//       DocumentReference lectureRef =
//           await courseRef.collection('lectures').add({
//         'name': lectureName,
//         'date': date,
//         'time': time,
//         'created_at': Timestamp.now(),
//         'lectureNumber': newLectureNumber,
//       });

//       print('Lecture added with ID: ${lectureRef.id}');
//       print('Lecture path: ${lectureRef.path}');

//       // إنشاء attendance collection فارغة (سيتم ملؤها لاحقًا ببيانات الطلاب)
//       CollectionReference attendanceRef = lectureRef.collection('attendance');
//       print('Attendance collection reference created: ${attendanceRef.path}');

//       emit(state.copyWith(isLoading: false));
//     } catch (e) {
//       print('Error saving schedule: $e');
//       emit(state.copyWith(
//         isLoading: false,
//         errorMessage: 'Error saving schedule: $e',
//       ));
//     }
//   }

//   Future<void> closeCamera() async {
//     try {
//       emit(state.copyWith(isLoading: true));
//       await _firestore.collection('schedule').doc('daily').update({
//         'camera_status': 'stopped',
//       });
//       emit(state.copyWith(isLoading: false));
//     } catch (e) {
//       print('Error closing camera: $e');
//       emit(state.copyWith(
//         isLoading: false,
//         errorMessage: 'Error closing camera: $e',
//       ));
//     }
//   }

//   Future<void> openCamera() async {
//     try {
//       emit(state.copyWith(isLoading: true));
//       await _firestore.collection('schedule').doc('daily').update({
//         'camera_status': 'open',
//       });
//       emit(state.copyWith(isLoading: false));
//     } catch (e) {
//       print('Error opening camera: $e');
//       emit(state.copyWith(
//         isLoading: false,
//         errorMessage: 'Error opening camera: $e',
//       ));
//     }
//   }
// }
