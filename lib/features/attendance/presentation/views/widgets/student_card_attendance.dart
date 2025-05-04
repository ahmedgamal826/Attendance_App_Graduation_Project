// // // // import 'package:attendance_app/features/attendance/presentation/views/student_details_screen.dart';
// // // // import 'package:cached_network_image/cached_network_image.dart';
// // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // import 'package:flutter/material.dart';

// // // // class StudentCardAttendance extends StatelessWidget {
// // // //   final Map<String, dynamic> student;
// // // //   final Map<String, dynamic>? attendanceData;
// // // //   final String imageUrl;
// // // //   final int index;
// // // //   final List students;
// // // //   final String courseId;
// // // //   final int lectureNumber;
// // // //   final Function(BuildContext, Map<String, dynamic>, int, List)
// // // //       showOptionsBottomSheet;

// // // //   const StudentCardAttendance({
// // // //     Key? key,
// // // //     required this.student,
// // // //     required this.attendanceData,
// // // //     required this.imageUrl,
// // // //     required this.index,
// // // //     required this.students,
// // // //     required this.courseId,
// // // //     required this.lectureNumber,
// // // //     required this.showOptionsBottomSheet,
// // // //   }) : super(key: key);

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return GestureDetector(
// // // //       onTap: () {
// // // //         Navigator.push(
// // // //           context,
// // // //           MaterialPageRoute(
// // // //             builder: (context) => StudentDetailsScreen(student: student),
// // // //           ),
// // // //         );
// // // //       },
// // // //       child: Stack(
// // // //         children: [
// // // //           Container(
// // // //             height: 100,
// // // //             decoration: BoxDecoration(
// // // //               color: Colors.white,
// // // //               borderRadius: BorderRadius.circular(12),
// // // //               border: Border.all(
// // // //                 color: student['isStarred'] == true
// // // //                     ? Colors.amber[600]!
// // // //                     : Colors.green,
// // // //                 width: 1.5,
// // // //               ),
// // // //               boxShadow: [
// // // //                 BoxShadow(
// // // //                   color: Colors.black.withOpacity(0.05),
// // // //                   blurRadius: 4,
// // // //                   offset: const Offset(0, 2),
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //             child: Padding(
// // // //               padding:
// // // //                   const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
// // // //               child: Row(
// // // //                 children: [
// // // //                   CircleAvatar(
// // // //                     radius: 25,
// // // //                     backgroundColor: Colors.grey[300],
// // // //                     child: imageUrl.isNotEmpty
// // // //                         ? CachedNetworkImage(
// // // //                             imageUrl: imageUrl,
// // // //                             imageBuilder: (context, imageProvider) => Container(
// // // //                               decoration: BoxDecoration(
// // // //                                 shape: BoxShape.circle,
// // // //                                 image: DecorationImage(
// // // //                                   image: imageProvider,
// // // //                                   fit: BoxFit.cover,
// // // //                                 ),
// // // //                                 border: Border.all(
// // // //                                   color: Colors.blue[700]!,
// // // //                                   width: 2,
// // // //                                 ),
// // // //                               ),
// // // //                             ),
// // // //                             placeholder: (context, url) =>
// // // //                                 const CircularProgressIndicator(),
// // // //                             errorWidget: (context, url, error) {
// // // //                               print(
// // // //                                   'Error loading image for ${student['name']}: $error');
// // // //                               print('Failed URL: $url');
// // // //                               return const Icon(
// // // //                                 Icons.person,
// // // //                                 size: 30,
// // // //                                 color: Colors.grey,
// // // //                               );
// // // //                             },
// // // //                           )
// // // //                         : const Icon(
// // // //                             Icons.person,
// // // //                             size: 30,
// // // //                             color: Colors.grey,
// // // //                           ),
// // // //                   ),
// // // //                   const SizedBox(width: 12),
// // // //                   Expanded(
// // // //                     child: Column(
// // // //                       crossAxisAlignment: CrossAxisAlignment.start,
// // // //                       mainAxisAlignment: MainAxisAlignment.center,
// // // //                       children: [
// // // //                         Text(
// // // //                           student['name'] ?? 'Unnamed Student',
// // // //                           maxLines: 1,
// // // //                           overflow: TextOverflow.ellipsis,
// // // //                           style: TextStyle(
// // // //                             fontSize: 16,
// // // //                             fontWeight: FontWeight.w500,
// // // //                             color: Colors.blue[700],
// // // //                           ),
// // // //                         ),
// // // //                         const SizedBox(height: 4),
// // // //                         Text(
// // // //                           'Check-in: ${attendanceData?['Check-in'] ?? '--'}',
// // // //                           maxLines: 1,
// // // //                           overflow: TextOverflow.ellipsis,
// // // //                           style: TextStyle(
// // // //                             fontSize: 12,
// // // //                             color: Colors.grey[600],
// // // //                           ),
// // // //                         ),
// // // //                         Text(
// // // //                           'Check-out: ${attendanceData?['Check-out'] ?? '--'}',
// // // //                           maxLines: 1,
// // // //                           overflow: TextOverflow.ellipsis,
// // // //                           style: TextStyle(
// // // //                             fontSize: 12,
// // // //                             color: Colors.grey[600],
// // // //                           ),
// // // //                         ),
// // // //                       ],
// // // //                     ),
// // // //                   ),
// // // //                   IconButton(
// // // //                     icon: Icon(
// // // //                       Icons.more_vert,
// // // //                       color: Colors.blue[700],
// // // //                     ),
// // // //                     onPressed: () => showOptionsBottomSheet(
// // // //                         context, student, index, students),
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //           ),
// // // //           Positioned(
// // // //             top: 5,
// // // //             right: 10,
// // // //             child: GestureDetector(
// // // //               onTap: () async {
// // // //                 try {
// // // //                   DocumentReference courseRef = FirebaseFirestore.instance
// // // //                       .collection('Courses')
// // // //                       .doc(courseId);
// // // //                   QuerySnapshot lectureSnapshot = await courseRef
// // // //                       .collection('lectures')
// // // //                       .where('lectureNumber', isEqualTo: lectureNumber)
// // // //                       .get();

// // // //                   if (lectureSnapshot.docs.isNotEmpty) {
// // // //                     var lectureDoc = lectureSnapshot.docs.first;
// // // //                     await lectureDoc.reference
// // // //                         .collection('attendance')
// // // //                         .doc(student['id'])
// // // //                         .update({
// // // //                       'isStarred': !(student['isStarred'] == true),
// // // //                     });

// // // //                     ScaffoldMessenger.of(context).showSnackBar(
// // // //                       SnackBar(
// // // //                         content: Text(
// // // //                           student['isStarred'] == true
// // // //                               ? '${student["name"]} marked as important'
// // // //                               : '${student["name"]} unmarked',
// // // //                         ),
// // // //                       ),
// // // //                     );
// // // //                   }
// // // //                 } catch (e) {
// // // //                   ScaffoldMessenger.of(context).showSnackBar(
// // // //                     SnackBar(
// // // //                       content: Text('Error updating star status: $e'),
// // // //                       backgroundColor: Colors.red,
// // // //                     ),
// // // //                   );
// // // //                 }
// // // //               },
// // // //               child: Icon(
// // // //                 student['isStarred'] == true ? Icons.star : Icons.star_border,
// // // //                 color: Colors.amber[600],
// // // //                 size: 30,
// // // //               ),
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // import 'package:attendance_app/features/attendance/presentation/views/student_details_screen.dart';
// // // import 'package:cached_network_image/cached_network_image.dart';
// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:flutter/material.dart';

// // // class StudentCardAttendance extends StatelessWidget {
// // //   final Map<String, dynamic> student;
// // //   final Map<String, dynamic>? attendanceData;
// // //   final String? imageUrl; // تعديل ليكون String? بدلاً من String
// // //   final int index;
// // //   final List<Map<String, dynamic>>
// // //       students; // تعديل من List إلى List<Map<String, dynamic>>
// // //   final String courseId;
// // //   final int lectureNumber;
// // //   final Function(
// // //           BuildContext, Map<String, dynamic>, int, List<Map<String, dynamic>>)
// // //       showOptionsBottomSheet; // تعديل نوع الدالة

// // //   const StudentCardAttendance({
// // //     Key? key,
// // //     required this.student,
// // //     required this.attendanceData,
// // //     required this.imageUrl,
// // //     required this.index,
// // //     required this.students,
// // //     required this.courseId,
// // //     required this.lectureNumber,
// // //     required this.showOptionsBottomSheet,
// // //   }) : super(key: key);

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return GestureDetector(
// // //       onTap: () {
// // //         Navigator.push(
// // //           context,
// // //           MaterialPageRoute(
// // //             builder: (context) => StudentDetailsScreen(
// // //               student: student,
// // //               courseId: courseId,
// // //             ),
// // //           ),
// // //         );
// // //       },
// // //       child: Stack(
// // //         children: [
// // //           Container(
// // //             height: 100,
// // //             decoration: BoxDecoration(
// // //               color: Colors.white,
// // //               borderRadius: BorderRadius.circular(12),
// // //               border: Border.all(
// // //                 color: student['isStarred'] == true
// // //                     ? Colors.amber[600]!
// // //                     : Colors.green,
// // //                 width: 1.5,
// // //               ),
// // //               boxShadow: [
// // //                 BoxShadow(
// // //                   color: Colors.black.withOpacity(0.05),
// // //                   blurRadius: 4,
// // //                   offset: const Offset(0, 2),
// // //                 ),
// // //               ],
// // //             ),
// // //             child: Padding(
// // //               padding:
// // //                   const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
// // //               child: Row(
// // //                 children: [
// // //                   CircleAvatar(
// // //                     radius: 25,
// // //                     backgroundColor: Colors.grey[300],
// // //                     child: imageUrl != null &&
// // //                             imageUrl!.isNotEmpty // التعامل مع null
// // //                         ? CachedNetworkImage(
// // //                             imageUrl: imageUrl!,
// // //                             imageBuilder: (context, imageProvider) => Container(
// // //                               decoration: BoxDecoration(
// // //                                 shape: BoxShape.circle,
// // //                                 image: DecorationImage(
// // //                                   image: imageProvider,
// // //                                   fit: BoxFit.cover,
// // //                                 ),
// // //                                 border: Border.all(
// // //                                   color: Colors.blue[700]!,
// // //                                   width: 2,
// // //                                 ),
// // //                               ),
// // //                             ),
// // //                             placeholder: (context, url) =>
// // //                                 const CircularProgressIndicator(),
// // //                             errorWidget: (context, url, error) {
// // //                               print(
// // //                                   'Error loading image for ${student['name']}: $error');
// // //                               print('Failed URL: $url');
// // //                               return const Icon(
// // //                                 Icons.person,
// // //                                 size: 30,
// // //                                 color: Colors.grey,
// // //                               );
// // //                             },
// // //                           )
// // //                         : const Icon(
// // //                             Icons.person,
// // //                             size: 30,
// // //                             color: Colors.grey,
// // //                           ),
// // //                   ),
// // //                   const SizedBox(width: 12),
// // //                   Expanded(
// // //                     child: Column(
// // //                       crossAxisAlignment: CrossAxisAlignment.start,
// // //                       mainAxisAlignment: MainAxisAlignment.center,
// // //                       children: [
// // //                         Text(
// // //                           student['name'] ?? 'Unnamed Student',
// // //                           maxLines: 1,
// // //                           overflow: TextOverflow.ellipsis,
// // //                           style: TextStyle(
// // //                             fontSize: 16,
// // //                             fontWeight: FontWeight.w500,
// // //                             color: Colors.blue[700],
// // //                           ),
// // //                         ),
// // //                         const SizedBox(height: 4),
// // //                         Text(
// // //                           'Check-in: ${attendanceData?['Check-in'] ?? '--'}',
// // //                           maxLines: 1,
// // //                           overflow: TextOverflow.ellipsis,
// // //                           style: TextStyle(
// // //                             fontSize: 12,
// // //                             color: Colors.grey[600],
// // //                           ),
// // //                         ),
// // //                         Text(
// // //                           'Check-out: ${attendanceData?['Check-out'] ?? '--'}',
// // //                           maxLines: 1,
// // //                           overflow: TextOverflow.ellipsis,
// // //                           style: TextStyle(
// // //                             fontSize: 12,
// // //                             color: Colors.grey[600],
// // //                           ),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                   IconButton(
// // //                     icon: Icon(
// // //                       Icons.more_vert,
// // //                       color: Colors.blue[700],
// // //                     ),
// // //                     onPressed: () => showOptionsBottomSheet(
// // //                         context, student, index, students),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),
// // //           Positioned(
// // //             top: 5,
// // //             right: 10,
// // //             child: GestureDetector(
// // //               onTap: () async {
// // //                 try {
// // //                   DocumentReference courseRef = FirebaseFirestore.instance
// // //                       .collection('Courses')
// // //                       .doc(courseId);
// // //                   QuerySnapshot lectureSnapshot = await courseRef
// // //                       .collection('lectures')
// // //                       .where('lectureNumber', isEqualTo: lectureNumber)
// // //                       .get();

// // //                   if (lectureSnapshot.docs.isNotEmpty) {
// // //                     var lectureDoc = lectureSnapshot.docs.first;
// // //                     await lectureDoc.reference
// // //                         .collection('attendance')
// // //                         .doc(student['id'])
// // //                         .update({
// // //                       'isStarred': !(student['isStarred'] == true),
// // //                     });

// // //                     ScaffoldMessenger.of(context).showSnackBar(
// // //                       SnackBar(
// // //                         content: Text(
// // //                           student['isStarred'] == true
// // //                               ? '${student["name"]} marked as important'
// // //                               : '${student["name"]} unmarked',
// // //                         ),
// // //                       ),
// // //                     );
// // //                   }
// // //                 } catch (e) {
// // //                   ScaffoldMessenger.of(context).showSnackBar(
// // //                     SnackBar(
// // //                       content: Text('Error updating star status: $e'),
// // //                       backgroundColor: Colors.red,
// // //                     ),
// // //                   );
// // //                 }
// // //               },
// // //               child: Icon(
// // //                 student['isStarred'] == true ? Icons.star : Icons.star_border,
// // //                 color: Colors.amber[600],
// // //                 size: 30,
// // //               ),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:attendance_app/core/utils/app_colors.dart';
// // import 'package:cached_network_image/cached_network_image.dart';
// // import 'package:flutter/material.dart';
// // import 'dart:io';
// // import 'package:provider/provider.dart';
// // import 'package:attendance_app/features/attendance/presentation/manager/lecture_attendance_student_provider.dart';

// // class StudentCardAttendance extends StatelessWidget {
// //   final Map<String, dynamic> student;
// //   final Map<String, dynamic> attendanceDates; // تغيير إلى Map لجميع التواريخ
// //   final String imageUrl;
// //   final int index;
// //   final List<Map<String, dynamic>> students;
// //   final String courseId;
// //   final int lectureNumber;
// //   final Function(
// //           BuildContext, Map<String, dynamic>, int, List<Map<String, dynamic>>)
// //       showOptionsBottomSheet;
// //   final VoidCallback? onTap;

// //   const StudentCardAttendance({
// //     Key? key,
// //     required this.student,
// //     required this.attendanceDates,
// //     required this.imageUrl,
// //     required this.index,
// //     required this.students,
// //     required this.courseId,
// //     required this.lectureNumber,
// //     required this.showOptionsBottomSheet,
// //     this.onTap,
// //   }) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     bool isStarred = student['isStarred'] ?? false;

// //     return GestureDetector(
// //       onTap: onTap,
// //       child: Container(
// //         padding: const EdgeInsets.all(12),
// //         decoration: BoxDecoration(
// //           color: Colors.white,
// //           borderRadius: BorderRadius.circular(15),
// //           boxShadow: [
// //             BoxShadow(
// //               color: Colors.blue.withOpacity(0.2),
// //               spreadRadius: 2,
// //               blurRadius: 8,
// //               offset: const Offset(0, 3),
// //             ),
// //           ],
// //         ),
// //         child: Row(
// //           children: [
// //             // صورة الطالب
// //             ClipOval(
// //               child: Container(
// //                 width: 60,
// //                 height: 60,
// //                 decoration: BoxDecoration(
// //                   border: Border.all(
// //                     color: AppColors.primaryColor,
// //                     width: 2,
// //                   ),
// //                 ),
// //                 child: imageUrl.isNotEmpty
// //                     ? CachedNetworkImage(
// //                         imageUrl: imageUrl,
// //                         fit: BoxFit.cover,
// //                         placeholder: (context, url) =>
// //                             const CircularProgressIndicator(),
// //                         errorWidget: (context, url, error) => const Icon(
// //                           Icons.person,
// //                           size: 30,
// //                           color: Colors.grey,
// //                         ),
// //                       )
// //                     : const Icon(
// //                         Icons.person,
// //                         size: 30,
// //                         color: Colors.grey,
// //                       ),
// //               ),
// //             ),
// //             const SizedBox(width: 12),
// //             // تفاصيل الطالب
// //             Expanded(
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       Text(
// //                         student['name'] ?? 'Unknown',
// //                         style: const TextStyle(
// //                           fontSize: 16,
// //                           fontWeight: FontWeight.bold,
// //                           color: AppColors.primaryColor,
// //                         ),
// //                       ),
// //                       Row(
// //                         children: [
// //                           // أيقونة النجمة
// //                           IconButton(
// //                             icon: Icon(
// //                               isStarred ? Icons.star : Icons.star_border,
// //                               color: isStarred
// //                                   ? AppColors
// //                                       .primaryColor // تغيير اللون إلى الأزرق
// //                                   : AppColors.primaryColor,
// //                             ),
// //                             onPressed: () async {
// //                               final provider = Provider.of<AttendanceProvider>(
// //                                   context,
// //                                   listen: false);
// //                               await provider.toggleStarStatus(
// //                                 context,
// //                                 courseId,
// //                                 lectureNumber,
// //                                 student['id'],
// //                                 isStarred,
// //                               );
// //                             },
// //                           ),
// //                           // أيقونة الخيارات
// //                           GestureDetector(
// //                             onTap: () => showOptionsBottomSheet(
// //                                 context, student, index, students),
// //                             child: const Icon(
// //                               Icons.more_vert,
// //                               color: AppColors.primaryColor,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                   const SizedBox(height: 8),
// //                   // عرض Check-in و Check-out تحت بعض
// //                   Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text(
// //                         'Check-in: ${attendanceDates['Check-in'] ?? '--'}',
// //                         style: const TextStyle(
// //                           color: Colors.grey,
// //                           fontSize: 14,
// //                         ),
// //                       ),
// //                       Text(
// //                         'Check-out: ${attendanceDates['Check-out'] ?? '--'}',
// //                         style: const TextStyle(
// //                           color: Colors.grey,
// //                           fontSize: 14,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:attendance_app/core/utils/app_colors.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:attendance_app/features/attendance/presentation/manager/lecture_attendance_student_provider.dart';

// class StudentCardAttendance extends StatelessWidget {
//   final Map<String, dynamic> student;
//   final Map<String, dynamic> attendanceDates; // Map لجميع التواريخ
//   final String imageUrl;
//   final int index;
//   final List<Map<String, dynamic>> students;
//   final String courseId;
//   final int lectureNumber;
//   final Function(
//           BuildContext, Map<String, dynamic>, int, List<Map<String, dynamic>>)
//       showOptionsBottomSheet;
//   final VoidCallback? onTap;

//   const StudentCardAttendance({
//     Key? key,
//     required this.student,
//     required this.attendanceDates,
//     required this.imageUrl,
//     required this.index,
//     required this.students,
//     required this.courseId,
//     required this.lectureNumber,
//     required this.showOptionsBottomSheet,
//     this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     bool isStarred = student['isStarred'] ?? false;

//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.all(12),
//         margin: const EdgeInsets.symmetric(vertical: 4),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(15),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.blue.withOpacity(0.2),
//               spreadRadius: 2,
//               blurRadius: 8,
//               offset: const Offset(0, 3),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // الجزء العلوي: صورة الطالب وتفاصيله
//             Row(
//               children: [
//                 // صورة الطالب
//                 ClipOval(
//                   child: Container(
//                     width: 60,
//                     height: 60,
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: AppColors.primaryColor,
//                         width: 2,
//                       ),
//                     ),
//                     child: imageUrl.isNotEmpty
//                         ? CachedNetworkImage(
//                             imageUrl: imageUrl,
//                             fit: BoxFit.cover,
//                             placeholder: (context, url) =>
//                                 const CircularProgressIndicator(),
//                             errorWidget: (context, url, error) => const Icon(
//                               Icons.person,
//                               size: 30,
//                               color: Colors.grey,
//                             ),
//                           )
//                         : const Icon(
//                             Icons.person,
//                             size: 30,
//                             color: Colors.grey,
//                           ),
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 // تفاصيل الطالب
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             student['name'] ?? 'Unknown',
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: AppColors.primaryColor,
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               // أيقونة النجمة
//                               IconButton(
//                                 icon: Icon(
//                                   isStarred ? Icons.star : Icons.star_border,
//                                   color: isStarred
//                                       ? AppColors.primaryColor
//                                       : AppColors.primaryColor,
//                                 ),
//                                 onPressed: () async {
//                                   final provider =
//                                       Provider.of<AttendanceProvider>(context,
//                                           listen: false);
//                                   await provider.toggleStarStatus(
//                                     context,
//                                     courseId,
//                                     lectureNumber,
//                                     student['id'],
//                                     isStarred,
//                                   );
//                                 },
//                               ),
//                               // أيقونة الخيارات
//                               GestureDetector(
//                                 onTap: () => showOptionsBottomSheet(
//                                     context, student, index, students),
//                                 child: const Icon(
//                                   Icons.more_vert,
//                                   color: AppColors.primaryColor,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             // عرض جميع تواريخ الحضور
//             if (attendanceDates.isNotEmpty)
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Attendance Records:',
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       color: AppColors.primaryColor,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   // عرض التواريخ في قائمة قابلة للتمرير
//                   SizedBox(
//                     height: 100,
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: attendanceDates.length,
//                       itemBuilder: (context, index) {
//                         String date = attendanceDates.keys.elementAt(index);
//                         var data =
//                             attendanceDates[date] as Map<String, dynamic>;
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 4),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Date: $date',
//                                 style: const TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.black87,
//                                 ),
//                               ),
//                               Text(
//                                 'Check-in: ${data['Check-in'] ?? '--'}',
//                                 style: const TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                               Text(
//                                 'Check-out: ${data['Check-out'] ?? '--'}',
//                                 style: const TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               )
//             else
//               const Text(
//                 'No attendance records found',
//                 style: TextStyle(
//                   color: Colors.grey,
//                   fontSize: 14,
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:attendance_app/features/attendance/presentation/manager/lecture_attendance_student_provider.dart';

class StudentCardAttendance extends StatelessWidget {
  final Map<String, dynamic> student;
  final Map<String, dynamic> attendanceDates; // Map لجميع التواريخ
  final String imageUrl;
  final int index;
  final List<Map<String, dynamic>> students;
  final String courseId;
  final int lectureNumber;
  final Function(
          BuildContext, Map<String, dynamic>, int, List<Map<String, dynamic>>)
      showOptionsBottomSheet;
  final VoidCallback? onTap;

  const StudentCardAttendance({
    Key? key,
    required this.student,
    required this.attendanceDates,
    required this.imageUrl,
    required this.index,
    required this.students,
    required this.courseId,
    required this.lectureNumber,
    required this.showOptionsBottomSheet,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isStarred = student['isStarred'] ?? false;

    // اختيار أحدث تاريخ من attendanceDates
    String? latestDate;
    Map<String, dynamic>? latestAttendanceData;
    if (attendanceDates.isNotEmpty) {
      // فرز التواريخ واختيار الأحدث
      var sortedDates = attendanceDates.keys.toList()
        ..sort((a, b) => b.compareTo(a));
      latestDate = sortedDates.first;
      latestAttendanceData =
          attendanceDates[latestDate] as Map<String, dynamic>;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            // صورة الطالب
            ClipOval(
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.primaryColor,
                    width: 2,
                  ),
                ),
                child: imageUrl.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.grey,
                        ),
                      )
                    : const Icon(
                        Icons.person,
                        size: 30,
                        color: Colors.grey,
                      ),
              ),
            ),
            const SizedBox(width: 12),
            // تفاصيل الطالب
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        student['name'] ?? 'Unknown',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Row(
                        children: [
                          // أيقونة النجمة
                          IconButton(
                            icon: Icon(
                              isStarred ? Icons.star : Icons.star_border,
                              color: isStarred
                                  ? AppColors.primaryColor
                                  : AppColors.primaryColor,
                            ),
                            onPressed: () async {
                              final provider = Provider.of<AttendanceProvider>(
                                  context,
                                  listen: false);
                              await provider.toggleStarStatus(
                                context,
                                courseId,
                                lectureNumber,
                                student['id'],
                                isStarred,
                              );
                            },
                          ),
                          // أيقونة الخيارات
                          GestureDetector(
                            onTap: () => showOptionsBottomSheet(
                                context, student, index, students),
                            child: const Icon(
                              Icons.more_vert,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // عرض Check-in و Check-out تحت بعض
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Check-in: ${latestAttendanceData?['Check-in'] ?? '--'}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Check-out: ${latestAttendanceData?['Check-out'] ?? '--'}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
