// // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'dart:io'; // أضف هذا لاستخدام File

// // // // // Screen that shows when a student card is tapped
// // // // class StudentDetailsScreen extends StatefulWidget {
// // // //   final Map<String, dynamic> student;

// // // //   const StudentDetailsScreen({
// // // //     Key? key,
// // // //     required this.student,
// // // //   }) : super(key: key);

// // // //   @override
// // // //   State<StudentDetailsScreen> createState() => _StudentDetailsScreenState();
// // // // }

// // // // class _StudentDetailsScreenState extends State<StudentDetailsScreen> {
// // // //   bool showAssignmentDetails = false;
// // // //   bool showTestDetails = false;

// // // //   // Sample data for assignments and tests
// // // //   final List<Map<String, dynamic>> assignments = [
// // // //     {'name': 'Assig 1', 'score': '50/50'},
// // // //     {'name': 'Assig 2', 'score': '40/50'},
// // // //   ];

// // // //   final List<Map<String, dynamic>> tests = [
// // // //     {'name': 'Test 1', 'score': '30/50'},
// // // //   ];

// // // //   // دالة لعرض الصورة في وضع ملء الشاشة
// // // //   void _showFullScreenImage(
// // // //       BuildContext context, bool isLocalImage, String imageUrl) {
// // // //     Navigator.of(context).push(
// // // //       MaterialPageRoute(
// // // //         builder: (context) => Scaffold(
// // // //           backgroundColor: Colors.black,
// // // //           appBar: AppBar(
// // // //             backgroundColor: Colors.black,
// // // //             iconTheme: const IconThemeData(color: Colors.white),
// // // //             title: const Text(
// // // //               'Student Photo',
// // // //               style: TextStyle(color: Colors.white),
// // // //             ),
// // // //           ),
// // // //           body: Center(
// // // //             child: GestureDetector(
// // // //               onTap: () => Navigator.pop(context),
// // // //               child: Hero(
// // // //                 tag: 'studentImage',
// // // //                 child: InteractiveViewer(
// // // //                   minScale: 0.5,
// // // //                   maxScale: 4.0,
// // // //                   child: SizedBox(
// // // //                     width: double.infinity,
// // // //                     height: double.infinity,
// // // //                     child: isLocalImage
// // // //                         ? Image.file(
// // // //                             File(imageUrl),
// // // //                             fit: BoxFit.contain,
// // // //                           )
// // // //                         : Image.network(
// // // //                             imageUrl,
// // // //                             fit: BoxFit.contain,
// // // //                             loadingBuilder: (context, child, loadingProgress) {
// // // //                               if (loadingProgress == null) return child;
// // // //                               return Center(
// // // //                                 child: CircularProgressIndicator(
// // // //                                   value: loadingProgress.expectedTotalBytes !=
// // // //                                           null
// // // //                                       ? loadingProgress.cumulativeBytesLoaded /
// // // //                                           loadingProgress.expectedTotalBytes!
// // // //                                       : null,
// // // //                                   color: Colors.white,
// // // //                                 ),
// // // //                               );
// // // //                             },
// // // //                           ),
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     // تحديد ما إذا كانت الصورة محلية أم من الإنترنت
// // // //     bool isLocalImage = widget.student['isLocalImage'] == true;
// // // //     String imageUrl = widget.student['imageUrl'] ?? 'https://i.pravatar.cc/150';

// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         centerTitle: true,
// // // //         title: const Text(
// // // //           'Student Details',
// // // //           style: TextStyle(
// // // //             color: Colors.white,
// // // //             fontWeight: FontWeight.bold,
// // // //           ),
// // // //         ),
// // // //         backgroundColor: AppColors.primaryColor,
// // // //         leading: IconButton(
// // // //           icon: const Icon(Icons.arrow_back, color: Colors.white),
// // // //           onPressed: () => Navigator.pop(context),
// // // //         ),
// // // //       ),
// // // //       body: Container(
// // // //         decoration: const BoxDecoration(
// // // //           gradient: LinearGradient(
// // // //             begin: Alignment.topCenter,
// // // //             end: Alignment.bottomCenter,
// // // //             colors: [Colors.white, Color(0xFFE3F2FD)],
// // // //           ),
// // // //         ),
// // // //         child: Center(
// // // //           child: SingleChildScrollView(
// // // //             child: Padding(
// // // //               padding: const EdgeInsets.all(16.0),
// // // //               child: Column(
// // // //                 mainAxisAlignment: MainAxisAlignment.center,
// // // //                 children: [
// // // //                   // Student profile section
// // // //                   Column(
// // // //                     children: [
// // // //                       // صورة الطالب مع إمكانية الضغط لعرض الصورة بملء الشاشة
// // // //                       GestureDetector(
// // // //                         onTap: () => _showFullScreenImage(
// // // //                             context, isLocalImage, imageUrl),
// // // //                         child: Hero(
// // // //                           tag: 'studentImage',
// // // //                           child: Container(
// // // //                             width: 150,
// // // //                             height: 150,
// // // //                             decoration: BoxDecoration(
// // // //                               shape: BoxShape.circle,
// // // //                               border: Border.all(
// // // //                                 color: AppColors.primaryColor,
// // // //                                 width: 2,
// // // //                               ),
// // // //                               image: DecorationImage(
// // // //                                 fit: BoxFit.cover,
// // // //                                 image: isLocalImage
// // // //                                     ? FileImage(File(imageUrl)) as ImageProvider
// // // //                                     : NetworkImage(imageUrl),
// // // //                               ),
// // // //                             ),
// // // //                             // أيقونة التكبير في الزاوية السفلى اليمنى
// // // //                             child: Align(
// // // //                               alignment: Alignment.bottomRight,
// // // //                               child: Container(
// // // //                                 padding: const EdgeInsets.all(4),
// // // //                                 decoration: const BoxDecoration(
// // // //                                   color: AppColors.primaryColor,
// // // //                                   shape: BoxShape.circle,
// // // //                                 ),
// // // //                                 child: const Icon(
// // // //                                   Icons.zoom_out_map,
// // // //                                   color: Colors.white,
// // // //                                   size: 18,
// // // //                                 ),
// // // //                               ),
// // // //                             ),
// // // //                           ),
// // // //                         ),
// // // //                       ),
// // // //                       const SizedBox(height: 15),
// // // //                       // Name and Email
// // // //                       Text(
// // // //                         widget.student['name'],
// // // //                         style: const TextStyle(
// // // //                           color: AppColors.primaryColor,
// // // //                           fontWeight: FontWeight.bold,
// // // //                           fontSize: 20,
// // // //                         ),
// // // //                       ),
// // // //                       // const Text(
// // // //                       //   'student@example.com', // Replace with actual email if available
// // // //                       //   style: TextStyle(
// // // //                       //     color: AppColors.primaryColor,
// // // //                       //     fontSize: 16,
// // // //                       //   ),
// // // //                       // ),
// // // //                     ],
// // // //                   ),
// // // //                   const SizedBox(height: 30),

// // // //                   // Info Cards Section
// // // //                   Container(
// // // //                     width: 300,
// // // //                     padding: const EdgeInsets.all(16),
// // // //                     decoration: BoxDecoration(
// // // //                       color: Colors.white,
// // // //                       borderRadius: BorderRadius.circular(15),
// // // //                       boxShadow: [
// // // //                         BoxShadow(
// // // //                           color: Colors.blue.withOpacity(0.2),
// // // //                           spreadRadius: 2,
// // // //                           blurRadius: 8,
// // // //                           offset: const Offset(0, 3),
// // // //                         ),
// // // //                       ],
// // // //                     ),
// // // //                     child: Column(
// // // //                       children: [
// // // //                         // Bonus, Lectures info
// // // //                         infoItem(
// // // //                             'Num of bonus : ${widget.student['hasBonus'] == true ? 1 : 0}'),
// // // //                         const SizedBox(height: 15),
// // // //                         infoItem('Num of Lec : 12'),
// // // //                         const SizedBox(height: 15),

// // // //                         // Assignments section with dropdown
// // // //                         Row(
// // // //                           mainAxisAlignment: MainAxisAlignment.center,
// // // //                           children: [
// // // //                             Text(
// // // //                               'Num of Assig: 10',
// // // //                               style: TextStyle(
// // // //                                 color: Colors.blue.shade800,
// // // //                                 fontWeight: FontWeight.bold,
// // // //                                 fontSize: 16,
// // // //                               ),
// // // //                             ),
// // // //                             const SizedBox(width: 10),
// // // //                             GestureDetector(
// // // //                               onTap: () {
// // // //                                 setState(() {
// // // //                                   showAssignmentDetails =
// // // //                                       !showAssignmentDetails;
// // // //                                 });
// // // //                               },
// // // //                               child: Container(
// // // //                                 padding: const EdgeInsets.all(2),
// // // //                                 decoration: BoxDecoration(
// // // //                                   border: Border.all(
// // // //                                     color: AppColors.primaryColor,
// // // //                                     width: 2,
// // // //                                   ),
// // // //                                   borderRadius: BorderRadius.circular(4),
// // // //                                 ),
// // // //                                 child: Icon(
// // // //                                   showAssignmentDetails
// // // //                                       ? Icons.arrow_drop_up
// // // //                                       : Icons.arrow_drop_down,
// // // //                                   color: AppColors.primaryColor,
// // // //                                 ),
// // // //                               ),
// // // //                             ),
// // // //                           ],
// // // //                         ),
// // // //                       ],
// // // //                     ),
// // // //                   ),

// // // //                   // Assignment details when expanded
// // // //                   if (showAssignmentDetails)
// // // //                     Container(
// // // //                       width: 300,
// // // //                       margin: const EdgeInsets.only(top: 15),
// // // //                       child: Column(
// // // //                         children: assignments.map((assignment) {
// // // //                           return Padding(
// // // //                             padding: const EdgeInsets.only(top: 10),
// // // //                             child: Container(
// // // //                               width: double.infinity,
// // // //                               padding: const EdgeInsets.symmetric(
// // // //                                   vertical: 12, horizontal: 16),
// // // //                               decoration: BoxDecoration(
// // // //                                 color: Colors.white,
// // // //                                 border: Border.all(
// // // //                                   color: AppColors.primaryColor,
// // // //                                   width: 1,
// // // //                                 ),
// // // //                                 borderRadius: BorderRadius.circular(8),
// // // //                                 boxShadow: [
// // // //                                   BoxShadow(
// // // //                                     color: Colors.blue.withOpacity(0.1),
// // // //                                     spreadRadius: 1,
// // // //                                     blurRadius: 4,
// // // //                                     offset: const Offset(0, 2),
// // // //                                   ),
// // // //                                 ],
// // // //                               ),
// // // //                               child: Row(
// // // //                                 mainAxisAlignment:
// // // //                                     MainAxisAlignment.spaceBetween,
// // // //                                 children: [
// // // //                                   Text(
// // // //                                     assignment['name'],
// // // //                                     style: const TextStyle(
// // // //                                       color: AppColors.primaryColor,
// // // //                                       fontWeight: FontWeight.bold,
// // // //                                       fontSize: 16,
// // // //                                     ),
// // // //                                   ),
// // // //                                   Text(
// // // //                                     assignment['score'],
// // // //                                     style: const TextStyle(
// // // //                                       color: AppColors.primaryColor,
// // // //                                       fontWeight: FontWeight.bold,
// // // //                                       fontSize: 16,
// // // //                                     ),
// // // //                                   ),
// // // //                                 ],
// // // //                               ),
// // // //                             ),
// // // //                           );
// // // //                         }).toList(),
// // // //                       ),
// // // //                     ),

// // // //                   const SizedBox(height: 20),

// // // //                   // Tests section
// // // //                   Container(
// // // //                     width: 300,
// // // //                     padding: const EdgeInsets.all(16),
// // // //                     decoration: BoxDecoration(
// // // //                       color: Colors.white,
// // // //                       borderRadius: BorderRadius.circular(15),
// // // //                       boxShadow: [
// // // //                         BoxShadow(
// // // //                           color: Colors.blue.withOpacity(0.2),
// // // //                           spreadRadius: 2,
// // // //                           blurRadius: 8,
// // // //                           offset: const Offset(0, 3),
// // // //                         ),
// // // //                       ],
// // // //                     ),
// // // //                     child: Row(
// // // //                       mainAxisAlignment: MainAxisAlignment.center,
// // // //                       children: [
// // // //                         Text(
// // // //                           'Num of Tests: 3',
// // // //                           style: TextStyle(
// // // //                             color: Colors.blue.shade800,
// // // //                             fontWeight: FontWeight.bold,
// // // //                             fontSize: 16,
// // // //                           ),
// // // //                         ),
// // // //                         const SizedBox(width: 10),
// // // //                         GestureDetector(
// // // //                           onTap: () {
// // // //                             setState(() {
// // // //                               showTestDetails = !showTestDetails;
// // // //                             });
// // // //                           },
// // // //                           child: Container(
// // // //                             padding: const EdgeInsets.all(2),
// // // //                             decoration: BoxDecoration(
// // // //                               border: Border.all(
// // // //                                 color: AppColors.primaryColor,
// // // //                                 width: 2,
// // // //                               ),
// // // //                               borderRadius: BorderRadius.circular(4),
// // // //                             ),
// // // //                             child: Icon(
// // // //                               showTestDetails
// // // //                                   ? Icons.arrow_drop_up
// // // //                                   : Icons.arrow_drop_down,
// // // //                               color: AppColors.primaryColor,
// // // //                             ),
// // // //                           ),
// // // //                         ),
// // // //                       ],
// // // //                     ),
// // // //                   ),

// // // //                   // Test details when expanded
// // // //                   if (showTestDetails)
// // // //                     Container(
// // // //                       width: 300,
// // // //                       margin: const EdgeInsets.only(top: 15),
// // // //                       child: Column(
// // // //                         children: tests.map((test) {
// // // //                           return Padding(
// // // //                             padding: const EdgeInsets.only(top: 10),
// // // //                             child: Container(
// // // //                               width: double.infinity,
// // // //                               padding: const EdgeInsets.symmetric(
// // // //                                   vertical: 12, horizontal: 16),
// // // //                               decoration: BoxDecoration(
// // // //                                 color: Colors.white,
// // // //                                 border: Border.all(
// // // //                                   color: AppColors.primaryColor,
// // // //                                   width: 1,
// // // //                                 ),
// // // //                                 borderRadius: BorderRadius.circular(8),
// // // //                                 boxShadow: [
// // // //                                   BoxShadow(
// // // //                                     color:
// // // //                                         AppColors.primaryColor.withOpacity(0.1),
// // // //                                     spreadRadius: 1,
// // // //                                     blurRadius: 4,
// // // //                                     offset: const Offset(0, 2),
// // // //                                   ),
// // // //                                 ],
// // // //                               ),
// // // //                               child: Row(
// // // //                                 mainAxisAlignment:
// // // //                                     MainAxisAlignment.spaceBetween,
// // // //                                 children: [
// // // //                                   Text(
// // // //                                     test['name'],
// // // //                                     style: const TextStyle(
// // // //                                       color: AppColors.primaryColor,
// // // //                                       fontWeight: FontWeight.bold,
// // // //                                       fontSize: 16,
// // // //                                     ),
// // // //                                   ),
// // // //                                   Text(
// // // //                                     test['score'],
// // // //                                     style: const TextStyle(
// // // //                                       color: AppColors.primaryColor,
// // // //                                       fontWeight: FontWeight.bold,
// // // //                                       fontSize: 16,
// // // //                                     ),
// // // //                                   ),
// // // //                                 ],
// // // //                               ),
// // // //                             ),
// // // //                           );
// // // //                         }).toList(),
// // // //                       ),
// // // //                     ),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   // Helper method to create consistent info items
// // // //   Widget infoItem(String text) {
// // // //     return Container(
// // // //       width: double.infinity,
// // // //       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
// // // //       decoration: BoxDecoration(
// // // //         color: Colors.blue.withOpacity(0.1),
// // // //         borderRadius: BorderRadius.circular(8),
// // // //       ),
// // // //       child: Text(
// // // //         text,
// // // //         textAlign: TextAlign.center,
// // // //         style: const TextStyle(
// // // //           color: AppColors.primaryColor,
// // // //           fontWeight: FontWeight.bold,
// // // //           fontSize: 16,
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // import 'package:flutter/material.dart';
// // // import 'dart:io';
// // // import 'package:cloud_firestore/cloud_firestore.dart';

// // // // Screen that shows when a student card is tapped
// // // class StudentDetailsScreen extends StatefulWidget {
// // //   final Map<String, dynamic> student;
// // //   final String courseId; // إضافة courseId لاسترجاع بيانات المحاضرات

// // //   const StudentDetailsScreen({
// // //     Key? key,
// // //     required this.student,
// // //     required this.courseId, // إضافة courseId كمعامل
// // //   }) : super(key: key);

// // //   @override
// // //   State<StudentDetailsScreen> createState() => _StudentDetailsScreenState();
// // // }

// // // class _StudentDetailsScreenState extends State<StudentDetailsScreen> {
// // //   bool showAssignmentDetails = false;
// // //   bool showTestDetails = false;

// // //   // Sample data for assignments and tests
// // //   final List<Map<String, dynamic>> assignments = [
// // //     {'name': 'Assig 1', 'score': '50/50'},
// // //     {'name': 'Assig 2', 'score': '40/50'},
// // //   ];

// // //   final List<Map<String, dynamic>> tests = [
// // //     {'name': 'Test 1', 'score': '30/50'},
// // //   ];

// // //   // دالة لاسترجاع عدد المحاضرات التي حضرها الطالب
// // //   Future<int> getAttendedLecturesCount() async {
// // //     try {
// // //       // استرجاع كل المحاضرات في المادة
// // //       QuerySnapshot lectureSnapshot = await FirebaseFirestore.instance
// // //           .collection('Courses')
// // //           .doc(widget.courseId)
// // //           .collection('lectures')
// // //           .get();

// // //       int attendedLectures = 0;

// // //       // فحص كل محاضرة
// // //       for (var lectureDoc in lectureSnapshot.docs) {
// // //         DocumentSnapshot studentDoc = await lectureDoc.reference
// // //             .collection('attendance')
// // //             .doc(widget.student['id'])
// // //             .get();

// // //         if (studentDoc.exists) {
// // //           var studentData = studentDoc.data() as Map<String, dynamic>;
// // //           // فحص كل التواريخ في بيانات الطالب
// // //           for (var entry in studentData.entries) {
// // //             if (entry.key != 'name' &&
// // //                 entry.key != 'imageUrl' &&
// // //                 entry.key != 'isStarred') {
// // //               var attendanceData = entry.value as Map<String, dynamic>;
// // //               // إذا كان Check-out ليس '--'، يعني الطالب حضر المحاضرة
// // //               if (attendanceData['Check-out'] != '--') {
// // //                 attendedLectures++;
// // //                 break; // كل يوم يُحسب مرة واحدة فقط لكل محاضرة
// // //               }
// // //             }
// // //           }
// // //         }
// // //       }

// // //       return attendedLectures;
// // //     } catch (e) {
// // //       print('Error fetching attended lectures: $e');
// // //       return 0; // في حالة الخطأ، نرجع 0
// // //     }
// // //   }

// // //   // دالة لعرض الصورة في وضع ملء الشاشة
// // //   void _showFullScreenImage(
// // //       BuildContext context, bool isLocalImage, String imageUrl) {
// // //     Navigator.of(context).push(
// // //       MaterialPageRoute(
// // //         builder: (context) => Scaffold(
// // //           backgroundColor: Colors.black,
// // //           appBar: AppBar(
// // //             backgroundColor: Colors.black,
// // //             iconTheme: const IconThemeData(color: Colors.white),
// // //             title: const Text(
// // //               'Student Photo',
// // //               style: TextStyle(color: Colors.white),
// // //             ),
// // //           ),
// // //           body: Center(
// // //             child: GestureDetector(
// // //               onTap: () => Navigator.pop(context),
// // //               child: Hero(
// // //                 tag: 'studentImage',
// // //                 child: InteractiveViewer(
// // //                   minScale: 0.5,
// // //                   maxScale: 4.0,
// // //                   child: SizedBox(
// // //                     width: double.infinity,
// // //                     height: double.infinity,
// // //                     child: isLocalImage
// // //                         ? Image.file(
// // //                             File(imageUrl),
// // //                             fit: BoxFit.contain,
// // //                           )
// // //                         : Image.network(
// // //                             imageUrl,
// // //                             fit: BoxFit.contain,
// // //                             loadingBuilder: (context, child, loadingProgress) {
// // //                               if (loadingProgress == null) return child;
// // //                               return Center(
// // //                                 child: CircularProgressIndicator(
// // //                                   value: loadingProgress.expectedTotalBytes !=
// // //                                           null
// // //                                       ? loadingProgress.cumulativeBytesLoaded /
// // //                                           loadingProgress.expectedTotalBytes!
// // //                                       : null,
// // //                                   color: Colors.white,
// // //                                 ),
// // //                               );
// // //                             },
// // //                           ),
// // //                   ),
// // //                 ),
// // //               ),
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     // تحديد ما إذا كانت الصورة محلية أم من الإنترنت
// // //     bool isLocalImage = widget.student['isLocalImage'] == true;
// // //     String imageUrl = widget.student['imageUrl'] ?? 'https://i.pravatar.cc/150';

// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         centerTitle: true,
// // //         title: const Text(
// // //           'Student Details',
// // //           style: TextStyle(
// // //             color: Colors.white,
// // //             fontWeight: FontWeight.bold,
// // //           ),
// // //         ),
// // //         backgroundColor: AppColors.primaryColor,
// // //         leading: IconButton(
// // //           icon: const Icon(Icons.arrow_back, color: Colors.white),
// // //           onPressed: () => Navigator.pop(context),
// // //         ),
// // //       ),
// // //       body: Container(
// // //         decoration: const BoxDecoration(
// // //           gradient: LinearGradient(
// // //             begin: Alignment.topCenter,
// // //             end: Alignment.bottomCenter,
// // //             colors: [Colors.white, Color(0xFFE3F2FD)],
// // //           ),
// // //         ),
// // //         child: Center(
// // //           child: SingleChildScrollView(
// // //             child: Padding(
// // //               padding: const EdgeInsets.all(16.0),
// // //               child: Column(
// // //                 mainAxisAlignment: MainAxisAlignment.center,
// // //                 children: [
// // //                   // Student profile section
// // //                   Column(
// // //                     children: [
// // //                       // صورة الطالب مع إمكانية الضغط لعرض الصورة بملء الشاشة
// // //                       GestureDetector(
// // //                         onTap: () => _showFullScreenImage(
// // //                             context, isLocalImage, imageUrl),
// // //                         child: Hero(
// // //                           tag: 'studentImage',
// // //                           child: Container(
// // //                             width: 150,
// // //                             height: 150,
// // //                             decoration: BoxDecoration(
// // //                               shape: BoxShape.circle,
// // //                               border: Border.all(
// // //                                 color: AppColors.primaryColor,
// // //                                 width: 2,
// // //                               ),
// // //                               image: DecorationImage(
// // //                                 fit: BoxFit.cover,
// // //                                 image: isLocalImage
// // //                                     ? FileImage(File(imageUrl)) as ImageProvider
// // //                                     : NetworkImage(imageUrl),
// // //                               ),
// // //                             ),
// // //                             // أيقونة التكبير في الزاوية السفلى اليمنى
// // //                             child: Align(
// // //                               alignment: Alignment.bottomRight,
// // //                               child: Container(
// // //                                 padding: const EdgeInsets.all(4),
// // //                                 decoration: const BoxDecoration(
// // //                                   color: AppColors.primaryColor,
// // //                                   shape: BoxShape.circle,
// // //                                 ),
// // //                                 child: const Icon(
// // //                                   Icons.zoom_out_map,
// // //                                   color: Colors.white,
// // //                                   size: 18,
// // //                                 ),
// // //                               ),
// // //                             ),
// // //                           ),
// // //                         ),
// // //                       ),
// // //                       const SizedBox(height: 15),
// // //                       // Name
// // //                       Text(
// // //                         widget.student['name'],
// // //                         style: const TextStyle(
// // //                           color: AppColors.primaryColor,
// // //                           fontWeight: FontWeight.bold,
// // //                           fontSize: 20,
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                   const SizedBox(height: 30),

// // //                   // Info Cards Section
// // //                   Container(
// // //                     width: 300,
// // //                     padding: const EdgeInsets.all(16),
// // //                     decoration: BoxDecoration(
// // //                       color: Colors.white,
// // //                       borderRadius: BorderRadius.circular(15),
// // //                       boxShadow: [
// // //                         BoxShadow(
// // //                           color: Colors.blue.withOpacity(0.2),
// // //                           spreadRadius: 2,
// // //                           blurRadius: 8,
// // //                           offset: const Offset(0, 3),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                     child: Column(
// // //                       children: [
// // //                         // Bonus info
// // //                         infoItem(
// // //                             'Num of bonus : ${widget.student['hasBonus'] == true ? 1 : 0}'),
// // //                         const SizedBox(height: 15),
// // //                         // Lectures attended info
// // //                         FutureBuilder<int>(
// // //                           future: getAttendedLecturesCount(),
// // //                           builder: (context, snapshot) {
// // //                             if (snapshot.connectionState ==
// // //                                 ConnectionState.waiting) {
// // //                               return infoItem('Num of Lec : Loading...');
// // //                             }
// // //                             if (snapshot.hasError) {
// // //                               return infoItem('Num of Lec : Error');
// // //                             }
// // //                             return infoItem(
// // //                                 'Num of Lec : ${snapshot.data ?? 0}');
// // //                           },
// // //                         ),
// // //                         const SizedBox(height: 15),

// // //                         // Assignments section with dropdown
// // //                         Row(
// // //                           mainAxisAlignment: MainAxisAlignment.center,
// // //                           children: [
// // //                             Text(
// // //                               'Num of Assig: 10',
// // //                               style: TextStyle(
// // //                                 color: Colors.blue.shade800,
// // //                                 fontWeight: FontWeight.bold,
// // //                                 fontSize: 16,
// // //                               ),
// // //                             ),
// // //                             const SizedBox(width: 10),
// // //                             GestureDetector(
// // //                               onTap: () {
// // //                                 setState(() {
// // //                                   showAssignmentDetails =
// // //                                       !showAssignmentDetails;
// // //                                 });
// // //                               },
// // //                               child: Container(
// // //                                 padding: const EdgeInsets.all(2),
// // //                                 decoration: BoxDecoration(
// // //                                   border: Border.all(
// // //                                     color: AppColors.primaryColor,
// // //                                     width: 2,
// // //                                   ),
// // //                                   borderRadius: BorderRadius.circular(4),
// // //                                 ),
// // //                                 child: Icon(
// // //                                   showAssignmentDetails
// // //                                       ? Icons.arrow_drop_up
// // //                                       : Icons.arrow_drop_down,
// // //                                   color: AppColors.primaryColor,
// // //                                 ),
// // //                               ),
// // //                             ),
// // //                           ],
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ),

// // //                   // Assignment details when expanded
// // //                   if (showAssignmentDetails)
// // //                     Container(
// // //                       width: 300,
// // //                       margin: const EdgeInsets.only(top: 15),
// // //                       child: Column(
// // //                         children: assignments.map((assignment) {
// // //                           return Padding(
// // //                             padding: const EdgeInsets.only(top: 10),
// // //                             child: Container(
// // //                               width: double.infinity,
// // //                               padding: const EdgeInsets.symmetric(
// // //                                   vertical: 12, horizontal: 16),
// // //                               decoration: BoxDecoration(
// // //                                 color: Colors.white,
// // //                                 border: Border.all(
// // //                                   color: AppColors.primaryColor,
// // //                                   width: 1,
// // //                                 ),
// // //                                 borderRadius: BorderRadius.circular(8),
// // //                                 boxShadow: [
// // //                                   BoxShadow(
// // //                                     color: Colors.blue.withOpacity(0.1),
// // //                                     spreadRadius: 1,
// // //                                     blurRadius: 4,
// // //                                     offset: const Offset(0, 2),
// // //                                   ),
// // //                                 ],
// // //                               ),
// // //                               child: Row(
// // //                                 mainAxisAlignment:
// // //                                     MainAxisAlignment.spaceBetween,
// // //                                 children: [
// // //                                   Text(
// // //                                     assignment['name'],
// // //                                     style: const TextStyle(
// // //                                       color: AppColors.primaryColor,
// // //                                       fontWeight: FontWeight.bold,
// // //                                       fontSize: 16,
// // //                                     ),
// // //                                   ),
// // //                                   Text(
// // //                                     assignment['score'],
// // //                                     style: const TextStyle(
// // //                                       color: AppColors.primaryColor,
// // //                                       fontWeight: FontWeight.bold,
// // //                                       fontSize: 16,
// // //                                     ),
// // //                                   ),
// // //                                 ],
// // //                               ),
// // //                             ),
// // //                           );
// // //                         }).toList(),
// // //                       ),
// // //                     ),

// // //                   const SizedBox(height: 20),

// // //                   // Tests section
// // //                   Container(
// // //                     width: 300,
// // //                     padding: const EdgeInsets.all(16),
// // //                     decoration: BoxDecoration(
// // //                       color: Colors.white,
// // //                       borderRadius: BorderRadius.circular(15),
// // //                       boxShadow: [
// // //                         BoxShadow(
// // //                           color: Colors.blue.withOpacity(0.2),
// // //                           spreadRadius: 2,
// // //                           blurRadius: 8,
// // //                           offset: const Offset(0, 3),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                     child: Row(
// // //                       mainAxisAlignment: MainAxisAlignment.center,
// // //                       children: [
// // //                         Text(
// // //                           'Num of Tests: 3',
// // //                           style: TextStyle(
// // //                             color: Colors.blue.shade800,
// // //                             fontWeight: FontWeight.bold,
// // //                             fontSize: 16,
// // //                           ),
// // //                         ),
// // //                         const SizedBox(width: 10),
// // //                         GestureDetector(
// // //                           onTap: () {
// // //                             setState(() {
// // //                               showTestDetails = !showTestDetails;
// // //                             });
// // //                           },
// // //                           child: Container(
// // //                             padding: const EdgeInsets.all(2),
// // //                             decoration: BoxDecoration(
// // //                               border: Border.all(
// // //                                 color: AppColors.primaryColor,
// // //                                 width: 2,
// // //                               ),
// // //                               borderRadius: BorderRadius.circular(4),
// // //                             ),
// // //                             child: Icon(
// // //                               showTestDetails
// // //                                   ? Icons.arrow_drop_up
// // //                                   : Icons.arrow_drop_down,
// // //                               color: AppColors.primaryColor,
// // //                             ),
// // //                           ),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ),

// // //                   // Test details when expanded
// // //                   if (showTestDetails)
// // //                     Container(
// // //                       width: 300,
// // //                       margin: const EdgeInsets.only(top: 15),
// // //                       child: Column(
// // //                         children: tests.map((test) {
// // //                           return Padding(
// // //                             padding: const EdgeInsets.only(top: 10),
// // //                             child: Container(
// // //                               width: double.infinity,
// // //                               padding: const EdgeInsets.symmetric(
// // //                                   vertical: 12, horizontal: 16),
// // //                               decoration: BoxDecoration(
// // //                                 color: Colors.white,
// // //                                 border: Border.all(
// // //                                   color: AppColors.primaryColor,
// // //                                   width: 1,
// // //                                 ),
// // //                                 borderRadius: BorderRadius.circular(8),
// // //                                 boxShadow: [
// // //                                   BoxShadow(
// // //                                     color:
// // //                                         AppColors.primaryColor.withOpacity(0.1),
// // //                                     spreadRadius: 1,
// // //                                     blurRadius: 4,
// // //                                     offset: const Offset(0, 2),
// // //                                   ),
// // //                                 ],
// // //                               ),
// // //                               child: Row(
// // //                                 mainAxisAlignment:
// // //                                     MainAxisAlignment.spaceBetween,
// // //                                 children: [
// // //                                   Text(
// // //                                     test['name'],
// // //                                     style: const TextStyle(
// // //                                       color: AppColors.primaryColor,
// // //                                       fontWeight: FontWeight.bold,
// // //                                       fontSize: 16,
// // //                                     ),
// // //                                   ),
// // //                                   Text(
// // //                                     test['score'],
// // //                                     style: const TextStyle(
// // //                                       color: AppColors.primaryColor,
// // //                                       fontWeight: FontWeight.bold,
// // //                                       fontSize: 16,
// // //                                     ),
// // //                                   ),
// // //                                 ],
// // //                               ),
// // //                             ),
// // //                           );
// // //                         }).toList(),
// // //                       ),
// // //                     ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   // Helper method to create consistent info items
// // //   Widget infoItem(String text) {
// // //     return Container(
// // //       width: double.infinity,
// // //       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
// // //       decoration: BoxDecoration(
// // //         color: Colors.blue.withOpacity(0.1),
// // //         borderRadius: BorderRadius.circular(8),
// // //       ),
// // //       child: Text(
// // //         text,
// // //         textAlign: TextAlign.center,
// // //         style: const TextStyle(
// // //           color: AppColors.primaryColor,
// // //           fontWeight: FontWeight.bold,
// // //           fontSize: 16,
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:attendance_app/core/utils/app_colors.dart';
// // import 'package:flutter/material.dart';
// // import 'dart:io';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:attendance_app/features/attendance/presentation/manager/lecture_attendance_student_provider.dart';
// // import 'package:provider/provider.dart';

// // class StudentDetailsScreen extends StatefulWidget {
// //   final Map<String, dynamic> student;
// //   final String courseId;

// //   const StudentDetailsScreen({
// //     Key? key,
// //     required this.student,
// //     required this.courseId,
// //   }) : super(key: key);

// //   @override
// //   State<StudentDetailsScreen> createState() => _StudentDetailsScreenState();
// // }

// // class _StudentDetailsScreenState extends State<StudentDetailsScreen> {
// //   bool showAssignmentDetails = false;
// //   bool showTestDetails = false;

// //   // Sample data for assignments and tests
// //   final List<Map<String, dynamic>> assignments = [
// //     {'name': 'Assig 1', 'score': '50/50'},
// //     {'name': 'Assig 2', 'score': '40/50'},
// //   ];

// //   final List<Map<String, dynamic>> tests = [
// //     {'name': 'Test 1', 'score': '30/50'},
// //   ];

// //   // دالة لاسترجاع عدد المحاضرات التي حضرها الطالب
// //   Stream<int> getAttendedLecturesCount() {
// //     return FirebaseFirestore.instance
// //         .collection('Courses')
// //         .doc(widget.courseId)
// //         .collection('lectures')
// //         .snapshots()
// //         .asyncMap((lectureSnapshot) async {
// //       int attendedLectures = 0;

// //       for (var lectureDoc in lectureSnapshot.docs) {
// //         DocumentSnapshot studentDoc = await lectureDoc.reference
// //             .collection('attendance')
// //             .doc(widget.student['id'])
// //             .get();

// //         if (studentDoc.exists) {
// //           var studentData = studentDoc.data() as Map<String, dynamic>;
// //           for (var entry in studentData.entries) {
// //             // تجاهل الحقول غير المتعلقة بالتواريخ
// //             if (entry.key != 'name' &&
// //                 entry.key != 'imageUrl' &&
// //                 entry.key != 'isStarred' &&
// //                 entry.key != 'bonusCount') {
// //               var attendanceData = entry.value as Map<String, dynamic>;
// //               if (attendanceData['Check-out'] != '--') {
// //                 attendedLectures++;
// //                 break;
// //               }
// //             }
// //           }
// //         }
// //       }
// //       return attendedLectures;
// //     });
// //   }

// //   // دالة لعرض الصورة في وضع ملء الشاشة
// //   void _showFullScreenImage(BuildContext context, bool isLocalImage, String imageUrl) {
// //     Navigator.of(context).push(
// //       MaterialPageRoute(
// //         builder: (context) => Scaffold(
// //           backgroundColor: Colors.black,
// //           appBar: AppBar(
// //             backgroundColor: Colors.black,
// //             iconTheme: const IconThemeData(color: Colors.white),
// //             title: const Text(
// //               'Student Photo',
// //               style: TextStyle(color: Colors.white),
// //             ),
// //           ),
// //           body: Center(
// //             child: GestureDetector(
// //               onTap: () => Navigator.pop(context),
// //               child: Hero(
// //                 tag: 'studentImage',
// //                 child: InteractiveViewer(
// //                   minScale: 0.5,
// //                   maxScale: 4.0,
// //                   child: SizedBox(
// //                     width: double.infinity,
// //                     height: double.infinity,
// //                     child: isLocalImage
// //                         ? Image.file(
// //                             File(imageUrl),
// //                             fit: BoxFit.contain,
// //                           )
// //                         : Image.network(
// //                             imageUrl,
// //                             fit: BoxFit.contain,
// //                             loadingBuilder: (context, child, loadingProgress) {
// //                               if (loadingProgress == null) return child;
// //                               return Center(
// //                                 child: CircularProgressIndicator(
// //                                   value: loadingProgress.expectedTotalBytes != null
// //                                       ? loadingProgress.cumulativeBytesLoaded /
// //                                           loadingProgress.expectedTotalBytes!
// //                                       : null,
// //                                   color: Colors.white,
// //                                 ),
// //                               );
// //                             },
// //                             errorBuilder: (context, error, stackTrace) {
// //                               return const Icon(
// //                                 Icons.error,
// //                                 color: Colors.white,
// //                                 size: 50,
// //                               );
// //                             },
// //                           ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     // تحديد ما إذا كانت الصورة محلية أم من الإنترنت
// //     bool isLocalImage = widget.student['isLocalImage'] == true;
// //     String imageUrl = widget.student['imageUrl'] ?? 'https://i.pravatar.cc/150';

// //     return Scaffold(
// //       appBar: AppBar(
// //         centerTitle: true,
// //         title: const Text(
// //           'Student Details',
// //           style: TextStyle(
// //             color: Colors.white,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //         backgroundColor: AppColors.primaryColor,
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back, color: Colors.white),
// //           onPressed: () => Navigator.pop(context),
// //         ),
// //       ),
// //       body: Container(
// //         decoration: const BoxDecoration(
// //           gradient: LinearGradient(
// //             begin: Alignment.topCenter,
// //             end: Alignment.bottomCenter,
// //             colors: [Colors.white, Color(0xFFE3F2FD)],
// //           ),
// //         ),
// //         child: Center(
// //           child: SingleChildScrollView(
// //             child: Padding(
// //               padding: const EdgeInsets.all(16.0),
// //               child: Column(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   // Student profile section
// //                   Column(
// //                     children: [
// //                       // صورة الطالب مع إمكانية الضغط لعرض الصورة بملء الشاشة
// //                       GestureDetector(
// //                         onTap: () => _showFullScreenImage(context, isLocalImage, imageUrl),
// //                         child: Hero(
// //                           tag: 'studentImage',
// //                           child: Container(
// //                             width: 150,
// //                             height: 150,
// //                             decoration: BoxDecoration(
// //                               shape: BoxShape.circle,
// //                               border: Border.all(
// //                                 color: AppColors.primaryColor,
// //                                 width: 2,
// //                               ),
// //                               image: DecorationImage(
// //                                 fit: BoxFit.cover,
// //                                 image: isLocalImage
// //                                     ? FileImage(File(imageUrl)) as ImageProvider
// //                                     : NetworkImage(imageUrl),
// //                               ),
// //                             ),
// //                             child: Align(
// //                               alignment: Alignment.bottomRight,
// //                               child: Container(
// //                                 padding: const EdgeInsets.all(4),
// //                                 decoration: const BoxDecoration(
// //                                   color: AppColors.primaryColor,
// //                                   shape: BoxShape.circle,
// //                                 ),
// //                                 child: const Icon(
// //                                   Icons.zoom_out_map,
// //                                   color: Colors.white,
// //                                   size: 18,
// //                                 ),
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                       const SizedBox(height: 15),
// //                       // Name
// //                       Text(
// //                         widget.student['name'],
// //                         style: const TextStyle(
// //                           color: AppColors.primaryColor,
// //                           fontWeight: FontWeight.bold,
// //                           fontSize: 20,
// //                         ),
// //                       ),
// //                       // زر النجمة لتفعيل/إلغاء البونص
// //                       StreamBuilder<DocumentSnapshot>(
// //                         stream: FirebaseFirestore.instance
// //                             .collection('Courses')
// //                             .doc(widget.courseId)
// //                             .collection('lectures')
// //                             .doc('lecture_${widget.student['lectureNumber']}')
// //                             .collection('attendance')
// //                             .doc(widget.student['id'])
// //                             .snapshots(),
// //                         builder: (context, snapshot) {
// //                           if (snapshot.connectionState == ConnectionState.waiting) {
// //                             return const CircularProgressIndicator();
// //                           }
// //                           if (snapshot.hasError) {
// //                             return const Text('Error loading star status');
// //                           }
// //                           if (!snapshot.hasData || !snapshot.data!.exists) {
// //                             return const Text('Student data not found');
// //                           }
// //                           var studentData = snapshot.data!.data() as Map<String, dynamic>;
// //                           bool isStarred = studentData['isStarred'] ?? false;

// //                           return IconButton(
// //                             icon: Icon(
// //                               isStarred ? Icons.star : Icons.star_border,
// //                               color: isStarred ? Colors.yellow : AppColors.primaryColor,
// //                             ),
// //                             onPressed: () async {
// //                               final provider = Provider.of<AttendanceProvider>(context, listen: false);
// //                               await provider.toggleStarStatus(
// //                                 context,
// //                                 widget.courseId,
// //                                 widget.student['lectureNumber'] ?? 1,
// //                                 widget.student['id'],
// //                                 isStarred,
// //                               );
// //                             },
// //                           );
// //                         },
// //                       ),
// //                     ],
// //                   ),
// //                   const SizedBox(height: 30),

// //                   // Info Cards Section
// //                   Container(
// //                     width: 300,
// //                     padding: const EdgeInsets.all(16),
// //                     decoration: BoxDecoration(
// //                       color: Colors.white,
// //                       borderRadius: BorderRadius.circular(15),
// //                       boxShadow: [
// //                         BoxShadow(
// //                           color: Colors.blue.withOpacity(0.2),
// //                           spreadRadius: 2,
// //                           blurRadius: 8,
// //                           offset: const Offset(0, 3),
// //                         ),
// //                       ],
// //                     ),
// //                     child: Column(
// //                       children: [
// //                         // Bonus info
// //                         StreamBuilder<DocumentSnapshot>(
// //                           stream: FirebaseFirestore.instance
// //                               .collection('Courses')
// //                               .doc(widget.courseId)
// //                               .collection('lectures')
// //                               .doc('lecture_${widget.student['lectureNumber']}')
// //                               .collection('attendance')
// //                               .doc(widget.student['id'])
// //                               .snapshots(),
// //                           builder: (context, snapshot) {
// //                             if (snapshot.connectionState == ConnectionState.waiting) {
// //                               return infoItem('Num of bonus: Loading...');
// //                             }
// //                             if (snapshot.hasError) {
// //                               return infoItem('Num of bonus: Error');
// //                             }
// //                             if (!snapshot.hasData || !snapshot.data!.exists) {
// //                               return infoItem('Num of bonus: 0');
// //                             }
// //                             var studentData = snapshot.data!.data() as Map<String, dynamic>;
// //                             int bonusCount = studentData['bonusCount'] ?? 0;
// //                             return infoItem('Num of bonus: $bonusCount');
// //                           },
// //                         ),
// //                         const SizedBox(height: 15),
// //                         // Lectures attended info
// //                         StreamBuilder<int>(
// //                           stream: getAttendedLecturesCount(),
// //                           builder: (context, snapshot) {
// //                             if (snapshot.connectionState == ConnectionState.waiting) {
// //                               return infoItem('Num of Lec: Loading...');
// //                             }
// //                             if (snapshot.hasError) {
// //                               return infoItem('Num of Lec: Error');
// //                             }
// //                             return infoItem('Num of Lec: ${snapshot.data ?? 0}');
// //                           },
// //                         ),
// //                         const SizedBox(height: 15),
// //                         // Assignments section with dropdown
// //                         Row(
// //                           mainAxisAlignment: MainAxisAlignment.center,
// //                           children: [
// //                             Text(
// //                               'Num of Assig: 10',
// //                               style: TextStyle(
// //                                 color: Colors.blue.shade800,
// //                                 fontWeight: FontWeight.bold,
// //                                 fontSize: 16,
// //                               ),
// //                             ),
// //                             const SizedBox(width: 10),
// //                             GestureDetector(
// //                               onTap: () {
// //                                 setState(() {
// //                                   showAssignmentDetails = !showAssignmentDetails;
// //                                 });
// //                               },
// //                               child: Container(
// //                                 padding: const EdgeInsets.all(2),
// //                                 decoration: BoxDecoration(
// //                                   border: Border.all(
// //                                     color: AppColors.primaryColor,
// //                                     width: 2,
// //                                   ),
// //                                   borderRadius: BorderRadius.circular(4),
// //                                 ),
// //                                 child: Icon(
// //                                   showAssignmentDetails
// //                                       ? Icons.arrow_drop_up
// //                                       : Icons.arrow_drop_down,
// //                                   color: AppColors.primaryColor,
// //                                 ),
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       ],
// //                     ),
// //                   ),

// //                   // Assignment details when expanded
// //                   if (showAssignmentDetails)
// //                     Container(
// //                       width: 300,
// //                       margin: const EdgeInsets.only(top: 15),
// //                       child: Column(
// //                         children: assignments.map((assignment) {
// //                           return Padding(
// //                             padding: const EdgeInsets.only(top: 10),
// //                             child: Container(
// //                               width: double.infinity,
// //                               padding: const EdgeInsets.symmetric(
// //                                   vertical: 12, horizontal: 16),
// //                               decoration: BoxDecoration(
// //                                 color: Colors.white,
// //                                 border: Border.all(
// //                                   color: AppColors.primaryColor,
// //                                   width: 1,
// //                                 ),
// //                                 borderRadius: BorderRadius.circular(8),
// //                                 boxShadow: [
// //                                   BoxShadow(
// //                                     color: Colors.blue.withOpacity(0.1),
// //                                     spreadRadius: 1,
// //                                     blurRadius: 4,
// //                                     offset: const Offset(0, 2),
// //                                   ),
// //                                 ],
// //                               ),
// //                               child: Row(
// //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                                 children: [
// //                                   Text(
// //                                     assignment['name'],
// //                                     style: const TextStyle(
// //                                       color: AppColors.primaryColor,
// //                                       fontWeight: FontWeight.bold,
// //                                       fontSize: 16,
// //                                     ),
// //                                   ),
// //                                   Text(
// //                                     assignment['score'],
// //                                     style: const TextStyle(
// //                                       color: AppColors.primaryColor,
// //                                       fontWeight: FontWeight.bold,
// //                                       fontSize: 16,
// //                                     ),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           );
// //                         }).toList(),
// //                       ),
// //                     ),

// //                   const SizedBox(height: 20),

// //                   // Tests section
// //                   Container(
// //                     width: 300,
// //                     padding: const EdgeInsets.all(16),
// //                     decoration: BoxDecoration(
// //                       color: Colors.white,
// //                       borderRadius: BorderRadius.circular(15),
// //                       boxShadow: [
// //                         BoxShadow(
// //                           color: Colors.blue.withOpacity(0.2),
// //                           spreadRadius: 2,
// //                           blurRadius: 8,
// //                           offset: const Offset(0, 3),
// //                         ),
// //                       ],
// //                     ),
// //                     child: Row(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: [
// //                         Text(
// //                           'Num of Tests: 3',
// //                           style: TextStyle(
// //                             color: Colors.blue.shade800,
// //                             fontWeight: FontWeight.bold,
// //                             fontSize: 16,
// //                           ),
// //                         ),
// //                         const SizedBox(width: 10),
// //                         GestureDetector(
// //                           onTap: () {
// //                             setState(() {
// //                               showTestDetails = !showTestDetails;
// //                             });
// //                           },
// //                           child: Container(
// //                             padding: const EdgeInsets.all(2),
// //                             decoration: BoxDecoration(
// //                               border: Border.all(
// //                                 color: AppColors.primaryColor,
// //                                 width: 2,
// //                               ),
// //                               borderRadius: BorderRadius.circular(4),
// //                             ),
// //                             child: Icon(
// //                               showTestDetails
// //                                   ? Icons.arrow_drop_up
// //                                   : Icons.arrow_drop_down,
// //                               color: AppColors.primaryColor,
// //                             ),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),

// //                   // Test details when expanded
// //                   if (showTestDetails)
// //                     Container(
// //                       width: 300,
// //                       margin: const EdgeInsets.only(top: 15),
// //                       child: Column(
// //                         children: tests.map((test) {
// //                           return Padding(
// //                             padding: const EdgeInsets.only(top: 10),
// //                             child: Container(
// //                               width: double.infinity,
// //                               padding: const EdgeInsets.symmetric(
// //                                   vertical: 12, horizontal: 16),
// //                               decoration: BoxDecoration(
// //                                 color: Colors.white,
// //                                 border: Border.all(
// //                                   color: AppColors.primaryColor,
// //                                   width: 1,
// //                                 ),
// //                                 borderRadius: BorderRadius.circular(8),
// //                                 boxShadow: [
// //                                   BoxShadow(
// //                                     color: AppColors.primaryColor.withOpacity(0.1),
// //                                     spreadRadius: 1,
// //                                     blurRadius: 4,
// //                                     offset: const Offset(0, 2),
// //                                   ),
// //                                 ],
// //                               ),
// //                               child: Row(
// //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                                 children: [
// //                                   Text(
// //                                     test['name'],
// //                                     style: const TextStyle(
// //                                       color: AppColors.primaryColor,
// //                                       fontWeight: FontWeight.bold,
// //                                       fontSize: 16,
// //                                     ),
// //                                   ),
// //                                   Text(
// //                                     test['score'],
// //                                     style: const TextStyle(
// //                                       color: AppColors.primaryColor,
// //                                       fontWeight: FontWeight.bold,
// //                                       fontSize: 16,
// //                                     ),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           );
// //                         }).toList(),
// //                       ),
// //                     ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   // Helper method to create consistent info items
// //   Widget infoItem(String text) {
// //     return Container(
// //       width: double.infinity,
// //       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
// //       decoration: BoxDecoration(
// //         color: Colors.blue.withOpacity(0.1),
// //         borderRadius: BorderRadius.circular(8),
// //       ),
// //       child: Text(
// //         text,
// //         textAlign: TextAlign.center,
// //         style: const TextStyle(
// //           color: AppColors.primaryColor,
// //           fontWeight: FontWeight.bold,
// //           fontSize: 16,
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:attendance_app/core/utils/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:attendance_app/features/attendance/presentation/manager/lecture_attendance_student_provider.dart';
// import 'package:provider/provider.dart';

// class StudentDetailsScreen extends StatefulWidget {
//   final Map<String, dynamic> student;
//   final String courseId;
//   final int lectureNumber; // إضافة lectureNumber كمعامل

//   const StudentDetailsScreen({
//     Key? key,
//     required this.student,
//     required this.courseId,
//     required this.lectureNumber, // إضافة lectureNumber
//   }) : super(key: key);

//   @override
//   State<StudentDetailsScreen> createState() => _StudentDetailsScreenState();
// }

// class _StudentDetailsScreenState extends State<StudentDetailsScreen> {
//   bool showAssignmentDetails = false;
//   bool showTestDetails = false;

//   // Sample data for assignments and tests
//   final List<Map<String, dynamic>> assignments = [
//     {'name': 'Assig 1', 'score': '50/50'},
//     {'name': 'Assig 2', 'score': '40/50'},
//   ];

//   final List<Map<String, dynamic>> tests = [
//     {'name': 'Test 1', 'score': '30/50'},
//   ];

//   // دالة لاسترجاع عدد المحاضرات التي حضرها الطالب
//   Stream<int> getAttendedLecturesCount() {
//     return FirebaseFirestore.instance
//         .collection('Courses')
//         .doc(widget.courseId)
//         .collection('lectures')
//         .snapshots()
//         .asyncMap((lectureSnapshot) async {
//       int attendedLectures = 0;

//       for (var lectureDoc in lectureSnapshot.docs) {
//         DocumentSnapshot studentDoc = await lectureDoc.reference
//             .collection('attendance')
//             .doc(widget.student['id'])
//             .get();

//         if (studentDoc.exists) {
//           var studentData = studentDoc.data() as Map<String, dynamic>;
//           for (var entry in studentData.entries) {
//             // تجاهل الحقول غير المتعلقة بالتواريخ
//             if (entry.key != 'name' &&
//                 entry.key != 'imageUrl' &&
//                 entry.key != 'isStarred' &&
//                 entry.key != 'bonusCount') {
//               var attendanceData = entry.value as Map<String, dynamic>;
//               if (attendanceData['Check-out'] != '--') {
//                 attendedLectures++;
//                 break;
//               }
//             }
//           }
//         }
//       }
//       return attendedLectures;
//     });
//   }

//   // دالة لعرض الصورة في وضع ملء الشاشة
//   void _showFullScreenImage(
//       BuildContext context, bool isLocalImage, String imageUrl) {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => Scaffold(
//           backgroundColor: Colors.black,
//           appBar: AppBar(
//             backgroundColor: Colors.black,
//             iconTheme: const IconThemeData(color: Colors.white),
//             title: const Text(
//               'Student Photo',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//           body: Center(
//             child: GestureDetector(
//               onTap: () => Navigator.pop(context),
//               child: Hero(
//                 tag: 'studentImage',
//                 child: InteractiveViewer(
//                   minScale: 0.5,
//                   maxScale: 4.0,
//                   child: SizedBox(
//                     width: double.infinity,
//                     height: double.infinity,
//                     child: isLocalImage
//                         ? Image.file(
//                             File(imageUrl),
//                             fit: BoxFit.contain,
//                           )
//                         : Image.network(
//                             imageUrl,
//                             fit: BoxFit.contain,
//                             loadingBuilder: (context, child, loadingProgress) {
//                               if (loadingProgress == null) return child;
//                               return Center(
//                                 child: CircularProgressIndicator(
//                                   value: loadingProgress.expectedTotalBytes !=
//                                           null
//                                       ? loadingProgress.cumulativeBytesLoaded /
//                                           loadingProgress.expectedTotalBytes!
//                                       : null,
//                                   color: Colors.white,
//                                 ),
//                               );
//                             },
//                             errorBuilder: (context, error, stackTrace) {
//                               return const Icon(
//                                 Icons.error,
//                                 color: Colors.white,
//                                 size: 50,
//                               );
//                             },
//                           ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // تحديد ما إذا كانت الصورة محلية أم من الإنترنت
//     bool isLocalImage = widget.student['isLocalImage'] == true;
//     String imageUrl = widget.student['imageUrl'] ?? 'https://i.pravatar.cc/150';

//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           'Student Details',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         backgroundColor: AppColors.primaryColor,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Colors.white, Color(0xFFE3F2FD)],
//           ),
//         ),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Student profile section
//                   Column(
//                     children: [
//                       // صورة الطالب مع إمكانية الضغط لعرض الصورة بملء الشاشة
//                       GestureDetector(
//                         onTap: () => _showFullScreenImage(
//                             context, isLocalImage, imageUrl),
//                         child: Hero(
//                           tag: 'studentImage',
//                           child: Container(
//                             width: 150,
//                             height: 150,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               border: Border.all(
//                                 color: AppColors.primaryColor,
//                                 width: 2,
//                               ),
//                               image: DecorationImage(
//                                 fit: BoxFit.cover,
//                                 image: isLocalImage
//                                     ? FileImage(File(imageUrl)) as ImageProvider
//                                     : NetworkImage(imageUrl),
//                               ),
//                             ),
//                             child: Align(
//                               alignment: Alignment.bottomRight,
//                               child: Container(
//                                 padding: const EdgeInsets.all(4),
//                                 decoration: const BoxDecoration(
//                                   color: AppColors.primaryColor,
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: const Icon(
//                                   Icons.zoom_out_map,
//                                   color: Colors.white,
//                                   size: 18,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 15),
//                       // Name
//                       Text(
//                         widget.student['name'],
//                         style: const TextStyle(
//                           color: AppColors.primaryColor,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                         ),
//                       ),
//                       // زر النجمة لتفعيل/إلغاء البونص
//                       StreamBuilder<DocumentSnapshot>(
//                         stream: FirebaseFirestore.instance
//                             .collection('Courses')
//                             .doc(widget.courseId)
//                             .collection('lectures')
//                             .where('lectureNumber',
//                                 isEqualTo: widget.lectureNumber)
//                             .snapshots()
//                             .asyncMap((snapshot) async {
//                           // if (snapshot.docs.isEmpty) {
//                           //   return null;
//                           // }
//                           var lectureDoc = snapshot.docs.first;
//                           return await lectureDoc.reference
//                               .collection('attendance')
//                               .doc(widget.student['id'])
//                               .get();
//                         }),
//                         builder: (context, snapshot) {
//                           if (snapshot.connectionState ==
//                               ConnectionState.waiting) {
//                             return const CircularProgressIndicator();
//                           }
//                           if (snapshot.hasError) {
//                             return const Text('Error loading star status');
//                           }
//                           // إذا لم يتم العثور على بيانات الطالب، نعرض القيم الافتراضية
//                           bool isStarred = false;
//                           if (snapshot.hasData &&
//                               snapshot.data != null &&
//                               snapshot.data!.exists) {
//                             var studentData =
//                                 snapshot.data!.data() as Map<String, dynamic>;
//                             isStarred = studentData['isStarred'] ?? false;
//                           }

//                           return Icon(
//                             isStarred ? Icons.star : Icons.star_border,
//                             color: isStarred
//                                 ? Colors.yellow
//                                 : AppColors.primaryColor,

//                             // onPressed: () async {
//                             //   final provider = Provider.of<AttendanceProvider>(
//                             //       context,
//                             //       listen: false);
//                             //   await provider.toggleStarStatus(
//                             //     context,
//                             //     widget.courseId,
//                             //     widget.lectureNumber,
//                             //     widget.student['id'],
//                             //     isStarred,
//                             //   );
//                             // },
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 30),

//                   // Info Cards Section
//                   Container(
//                     width: 300,
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(15),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.blue.withOpacity(0.2),
//                           spreadRadius: 2,
//                           blurRadius: 8,
//                           offset: const Offset(0, 3),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       children: [
//                         // Bonus info
//                         StreamBuilder<DocumentSnapshot>(
//                           stream: FirebaseFirestore.instance
//                               .collection('Courses')
//                               .doc(widget.courseId)
//                               .collection('lectures')
//                               .where('lectureNumber',
//                                   isEqualTo: widget.lectureNumber)
//                               .snapshots()
//                               .asyncMap((snapshot) async {
//                             // if (snapshot.docs.isEmpty) {
//                             //   return Future.value(DocumentSnapshotMock());
//                             // }
//                             var lectureDoc = snapshot.docs.first;
//                             return await lectureDoc.reference
//                                 .collection('attendance')
//                                 .doc(widget.student['id'])
//                                 .get();
//                           }),
//                           builder: (context, snapshot) {
//                             if (snapshot.connectionState ==
//                                 ConnectionState.waiting) {
//                               return infoItem('Num of bonus: Loading...');
//                             }
//                             if (snapshot.hasError) {
//                               return infoItem('Num of bonus: Error');
//                             }
//                             // إذا لم يتم العثور على بيانات الطالب، نعرض القيمة الافتراضية
//                             int bonusCount = 0;
//                             if (snapshot.hasData &&
//                                 snapshot.data != null &&
//                                 snapshot.data!.exists) {
//                               var studentData =
//                                   snapshot.data!.data() as Map<String, dynamic>;
//                               bonusCount = studentData['bonusCount'] ?? 0;
//                             }
//                             return infoItem('Num of bonus: $bonusCount');
//                           },
//                         ),
//                         const SizedBox(height: 15),
//                         // Lectures attended info
//                         StreamBuilder<int>(
//                           stream: getAttendedLecturesCount(),
//                           builder: (context, snapshot) {
//                             if (snapshot.connectionState ==
//                                 ConnectionState.waiting) {
//                               return infoItem('Num of Lec: Loading...');
//                             }
//                             if (snapshot.hasError) {
//                               return infoItem('Num of Lec: Error');
//                             }
//                             return infoItem(
//                                 'Num of Lec: ${snapshot.data ?? 0}');
//                           },
//                         ),
//                         const SizedBox(height: 15),
//                         // Assignments section with dropdown
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'Num of Assig: 10',
//                               style: TextStyle(
//                                 color: Colors.blue.shade800,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   showAssignmentDetails =
//                                       !showAssignmentDetails;
//                                 });
//                               },
//                               child: Container(
//                                 padding: const EdgeInsets.all(2),
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                     color: AppColors.primaryColor,
//                                     width: 2,
//                                   ),
//                                   borderRadius: BorderRadius.circular(4),
//                                 ),
//                                 child: Icon(
//                                   showAssignmentDetails
//                                       ? Icons.arrow_drop_up
//                                       : Icons.arrow_drop_down,
//                                   color: AppColors.primaryColor,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),

//                   // Assignment details when expanded
//                   if (showAssignmentDetails)
//                     Container(
//                       width: 300,
//                       margin: const EdgeInsets.only(top: 15),
//                       child: Column(
//                         children: assignments.map((assignment) {
//                           return Padding(
//                             padding: const EdgeInsets.only(top: 10),
//                             child: Container(
//                               width: double.infinity,
//                               padding: const EdgeInsets.symmetric(
//                                   vertical: 12, horizontal: 16),
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 border: Border.all(
//                                   color: AppColors.primaryColor,
//                                   width: 1,
//                                 ),
//                                 borderRadius: BorderRadius.circular(8),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.blue.withOpacity(0.1),
//                                     spreadRadius: 1,
//                                     blurRadius: 4,
//                                     offset: const Offset(0, 2),
//                                   ),
//                                 ],
//                               ),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     assignment['name'],
//                                     style: const TextStyle(
//                                       color: AppColors.primaryColor,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                   Text(
//                                     assignment['score'],
//                                     style: const TextStyle(
//                                       color: AppColors.primaryColor,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         }).toList(),
//                       ),
//                     ),

//                   const SizedBox(height: 20),

//                   // Tests section
//                   Container(
//                     width: 300,
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(15),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.blue.withOpacity(0.2),
//                           spreadRadius: 2,
//                           blurRadius: 8,
//                           offset: const Offset(0, 3),
//                         ),
//                       ],
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Num of Tests: 3',
//                           style: TextStyle(
//                             color: Colors.blue.shade800,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               showTestDetails = !showTestDetails;
//                             });
//                           },
//                           child: Container(
//                             padding: const EdgeInsets.all(2),
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                 color: AppColors.primaryColor,
//                                 width: 2,
//                               ),
//                               borderRadius: BorderRadius.circular(4),
//                             ),
//                             child: Icon(
//                               showTestDetails
//                                   ? Icons.arrow_drop_up
//                                   : Icons.arrow_drop_down,
//                               color: AppColors.primaryColor,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   // Test details when expanded
//                   if (showTestDetails)
//                     Container(
//                       width: 300,
//                       margin: const EdgeInsets.only(top: 15),
//                       child: Column(
//                         children: tests.map((test) {
//                           return Padding(
//                             padding: const EdgeInsets.only(top: 10),
//                             child: Container(
//                               width: double.infinity,
//                               padding: const EdgeInsets.symmetric(
//                                   vertical: 12, horizontal: 16),
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 border: Border.all(
//                                   color: AppColors.primaryColor,
//                                   width: 1,
//                                 ),
//                                 borderRadius: BorderRadius.circular(8),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color:
//                                         AppColors.primaryColor.withOpacity(0.1),
//                                     spreadRadius: 1,
//                                     blurRadius: 4,
//                                     offset: const Offset(0, 2),
//                                   ),
//                                 ],
//                               ),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     test['name'],
//                                     style: const TextStyle(
//                                       color: AppColors.primaryColor,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                   Text(
//                                     test['score'],
//                                     style: const TextStyle(
//                                       color: AppColors.primaryColor,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         }).toList(),
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Helper method to create consistent info items
//   Widget infoItem(String text) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//       decoration: BoxDecoration(
//         color: Colors.blue.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Text(
//         text,
//         textAlign: TextAlign.center,
//         style: const TextStyle(
//           color: AppColors.primaryColor,
//           fontWeight: FontWeight.bold,
//           fontSize: 16,
//         ),
//       ),
//     );
//   }
// }

import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';

class StudentDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> student;
  final String courseId;
  final int lectureNumber;

  const StudentDetailsScreen({
    Key? key,
    required this.student,
    required this.courseId,
    required this.lectureNumber,
  }) : super(key: key);

  @override
  State<StudentDetailsScreen> createState() => _StudentDetailsScreenState();
}

class _StudentDetailsScreenState extends State<StudentDetailsScreen> {
  bool showAssignmentDetails = false;
  bool showTestDetails = false;

  // Sample data for assignments and tests
  final List<Map<String, dynamic>> assignments = [
    {'name': 'Assig 1', 'score': '50/50'},
    {'name': 'Assig 2', 'score': '40/50'},
  ];

  final List<Map<String, dynamic>> tests = [
    {'name': 'Test 1', 'score': '30/50'},
  ];

  // دالة لاسترجاع عدد المحاضرات التي حضرها الطالب
  Stream<int> getAttendedLecturesCount() {
    return FirebaseFirestore.instance
        .collection('Courses')
        .doc(widget.courseId)
        .collection('lectures')
        .snapshots()
        .asyncMap((lectureSnapshot) async {
      int attendedLectures = 0;

      for (var lectureDoc in lectureSnapshot.docs) {
        DocumentSnapshot studentDoc = await lectureDoc.reference
            .collection('attendance')
            .doc(widget.student['id'])
            .get();

        if (studentDoc.exists) {
          var studentData = studentDoc.data() as Map<String, dynamic>;
          for (var entry in studentData.entries) {
            if (entry.key != 'name' &&
                entry.key != 'imageUrl' &&
                entry.key != 'isStarred' &&
                entry.key != 'bonusCount') {
              var attendanceData = entry.value as Map<String, dynamic>;
              if (attendanceData['Check-out'] != '--') {
                attendedLectures++;
                break;
              }
            }
          }
        }
      }
      return attendedLectures;
    });
  }

  // دالة لعرض الصورة في وضع ملء الشاشة
  void _showFullScreenImage(BuildContext context, String imageUrl) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            iconTheme: const IconThemeData(color: Colors.white),
            title: const Text(
              'Student Photo',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Center(
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Hero(
                tag: 'studentImage',
                child: InteractiveViewer(
                  minScale: 0.5,
                  maxScale: 4.0,
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.contain,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Student Details',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color(0xFFE3F2FD)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Courses')
                    .doc(widget.courseId)
                    .collection('lectures')
                    .where('lectureNumber', isEqualTo: widget.lectureNumber)
                    .snapshots()
                    .asyncMap((snapshot) async {
                  if (snapshot.docs.isEmpty) {
                    throw Exception('Lecture not found');
                  }
                  var lectureDoc = snapshot.docs.first;
                  return await lectureDoc.reference
                      .collection('attendance')
                      .doc(widget.student['id'])
                      .get();
                }),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return const Center(
                        child: Text('Error loading student data'));
                  }
                  if (!snapshot.hasData || !snapshot.data!.exists) {
                    return const Center(child: Text('Student data not found'));
                  }

                  var studentData =
                      snapshot.data!.data() as Map<String, dynamic>;

                  // استرجاع imageUrl بنفس الطريقة المستخدمة في LectureAttendanceScreen
                  Map<String, dynamic> attendanceDates = {};
                  String? latestDate;
                  Map<String, dynamic>? latestAttendanceData;

                  studentData.forEach((key, value) {
                    if (key.startsWith('20') && value is Map<String, dynamic>) {
                      attendanceDates[key] = value;
                    }
                  });

                  String imageUrl;
                  if (attendanceDates.isNotEmpty) {
                    var sortedDates = attendanceDates.keys.toList()
                      ..sort((a, b) => b.compareTo(a));
                    latestDate = sortedDates.first;
                    latestAttendanceData = attendanceDates[latestDate];
                    imageUrl = latestAttendanceData?['imageUrl'] ??
                        studentData['imageUrl'] ??
                        'https://i.pravatar.cc/150';
                  } else {
                    imageUrl =
                        studentData['imageUrl'] ?? 'https://i.pravatar.cc/150';
                  }

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Student profile section
                      Column(
                        children: [
                          // صورة الطالب مع إمكانية الضغط لعرض الصورة بملء الشاشة
                          GestureDetector(
                            onTap: () =>
                                _showFullScreenImage(context, imageUrl),
                            child: Hero(
                              tag: 'studentImage',
                              child: Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.primaryColor,
                                    width: 2,
                                  ),
                                ),
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: imageUrl,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(
                                      Icons.person,
                                      size: 50,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          // Name
                          Text(
                            studentData['name'] ?? widget.student['name'],
                            style: const TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          // زر النجمة لتفعيل/إلغاء البونص
                          StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('Courses')
                                .doc(widget.courseId)
                                .collection('lectures')
                                .where('lectureNumber',
                                    isEqualTo: widget.lectureNumber)
                                .snapshots()
                                .asyncMap((snapshot) async {
                              var lectureDoc = snapshot.docs.first;
                              return await lectureDoc.reference
                                  .collection('attendance')
                                  .doc(widget.student['id'])
                                  .get();
                            }),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              }
                              if (snapshot.hasError) {
                                return const Text('Error loading star status');
                              }
                              bool isStarred = false;
                              if (snapshot.hasData &&
                                  snapshot.data != null &&
                                  snapshot.data!.exists) {
                                var studentData = snapshot.data!.data()
                                    as Map<String, dynamic>;
                                isStarred = studentData['isStarred'] ?? false;
                              }

                              return Icon(
                                isStarred ? Icons.star : Icons.star_border,
                                color: AppColors.primaryColor,
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),

                      // Info Cards Section
                      Container(
                        width: 300,
                        padding: const EdgeInsets.all(16),
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
                        child: Column(
                          children: [
                            // Bonus info
                            StreamBuilder<DocumentSnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('Courses')
                                  .doc(widget.courseId)
                                  .collection('lectures')
                                  .where('lectureNumber',
                                      isEqualTo: widget.lectureNumber)
                                  .snapshots()
                                  .asyncMap((snapshot) async {
                                var lectureDoc = snapshot.docs.first;
                                return await lectureDoc.reference
                                    .collection('attendance')
                                    .doc(widget.student['id'])
                                    .get();
                              }),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return infoItem('Num of bonus: Loading...');
                                }
                                if (snapshot.hasError) {
                                  return infoItem('Num of bonus: Error');
                                }
                                int bonusCount = 0;
                                if (snapshot.hasData &&
                                    snapshot.data != null &&
                                    snapshot.data!.exists) {
                                  var studentData = snapshot.data!.data()
                                      as Map<String, dynamic>;
                                  bonusCount = studentData['bonusCount'] ?? 0;
                                }
                                return infoItem('Num of bonus: $bonusCount');
                              },
                            ),
                            const SizedBox(height: 15),
                            // Lectures attended info
                            StreamBuilder<int>(
                              stream: getAttendedLecturesCount(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return infoItem('Num of Lec: Loading...');
                                }
                                if (snapshot.hasError) {
                                  return infoItem('Num of Lec: Error');
                                }
                                return infoItem(
                                    'Num of Lec: ${snapshot.data ?? 0}');
                              },
                            ),
                            const SizedBox(height: 15),
                            // Assignments section with dropdown
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Num of Assig: 10',
                                  style: TextStyle(
                                    color: Colors.blue.shade800,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showAssignmentDetails =
                                          !showAssignmentDetails;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.primaryColor,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Icon(
                                      showAssignmentDetails
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Assignment details when expanded
                      if (showAssignmentDetails)
                        Container(
                          width: 300,
                          margin: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: assignments.map((assignment) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: AppColors.primaryColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.blue.withOpacity(0.1),
                                        spreadRadius: 1,
                                        blurRadius: 4,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        assignment['name'],
                                        style: const TextStyle(
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        assignment['score'],
                                        style: const TextStyle(
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),

                      const SizedBox(height: 20),

                      // Tests section
                      Container(
                        width: 300,
                        padding: const EdgeInsets.all(16),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Num of Tests: 3',
                              style: TextStyle(
                                color: Colors.blue.shade800,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  showTestDetails = !showTestDetails;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.primaryColor,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Icon(
                                  showTestDetails
                                      ? Icons.arrow_drop_up
                                      : Icons.arrow_drop_down,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Test details when expanded
                      if (showTestDetails)
                        Container(
                          width: 300,
                          margin: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: tests.map((test) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: AppColors.primaryColor,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.primaryColor
                                            .withOpacity(0.1),
                                        spreadRadius: 1,
                                        blurRadius: 4,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        test['name'],
                                        style: const TextStyle(
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        test['score'],
                                        style: const TextStyle(
                                          color: AppColors.primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to create consistent info items
  Widget infoItem(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
