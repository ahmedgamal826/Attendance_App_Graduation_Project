// // import 'package:attendance_app/features/attendance/presentation/views/student_attendance_view.dart';
// // import 'package:attendance_app/features/auth/presentations/views/admin_or_student.dart';
// // import 'package:attendance_app/features/home/data/months_data.dart';
// // import 'package:attendance_app/features/home/presentation/views/days_view.dart';
// // import 'package:attendance_app/features/attendance/data/student_data.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';

// // class MonthSelectionScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     DateTime now = DateTime.now();
// //     String currentMonth = "${_monthToString(now.month)} ${now.year}";
// //     User? currentUser = FirebaseAuth.instance.currentUser;

// //     Map<String, String>? currentStudent;
// //     if (currentUser != null) {
// //       try {
// //         currentStudent = students.firstWhere(
// //           (student) => student['email'] == currentUser.email,
// //         );
// //       } catch (e) {
// //         currentStudent = null;
// //       }
// //     }

// //     return Scaffold(
// //       drawer: Drawer(
// //         child: ListView(
// //           padding: EdgeInsets.zero,
// //           children: [
// //             DrawerHeader(
// //               decoration: const BoxDecoration(
// //                 gradient: LinearGradient(
// //                   colors: [Color(0xff70ACF4), Color(0xff5A9EE0)],
// //                   begin: Alignment.topLeft,
// //                   end: Alignment.bottomRight,
// //                 ),
// //               ),
// //               child: Column(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   CircleAvatar(
// //                     radius: 40,
// //                     backgroundColor: Colors.white,
// //                     backgroundImage: currentStudent != null
// //                         ? AssetImage(currentStudent['image']!)
// //                         : null,
// //                     child: currentStudent == null
// //                         ? const Icon(
// //                             Icons.person,
// //                             size: 50,
// //                             color: Color(0xff70ACF4),
// //                           )
// //                         : null,
// //                   ),
// //                   Text(
// //                     "Welcome, ${currentStudent?['name']}",
// //                     style: const TextStyle(
// //                       color: Colors.white,
// //                       fontSize: 20,
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                     maxLines: 1,
// //                     overflow: TextOverflow.ellipsis,
// //                   ),
// //                   const SizedBox(height: 5),
// //                   Text(
// //                     currentUser?.email ?? "",
// //                     style: const TextStyle(
// //                       color: Colors.white70,
// //                       fontSize: 16,
// //                     ),
// //                     maxLines: 1,
// //                     overflow: TextOverflow.ellipsis,
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             ListTile(
// //               leading: const Icon(Icons.home, color: Color(0xff70ACF4)),
// //               title: const Text("Home"),
// //               onTap: () {
// //                 Navigator.pop(context);
// //               },
// //             ),
// //             ListTile(
// //               leading: const Icon(Icons.check_circle, color: Color(0xff70ACF4)),
// //               title: const Text("Attendance"),
// //               onTap: () {
// //                 Navigator.pop(context);
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(
// //                     builder: (context) => StudentAttendanceView(
// //                       date: DateTime.now(),
// //                     ),
// //                   ),
// //                 );
// //               },
// //             ),
// //             const Divider(),
// //             ListTile(
// //               leading: const Icon(Icons.logout, color: Color(0xff70ACF4)),
// //               title: const Text("Log Out"),
// //               onTap: () async {
// //                 await FirebaseAuth.instance.signOut();
// //                 Navigator.pushReplacement(
// //                   context,
// //                   MaterialPageRoute(
// //                     builder: (context) => const AdminOrStudent(),
// //                   ),
// //                 );
// //               },
// //             ),
// //           ],
// //         ),
// //       ),
// //       appBar: AppBar(
// //         iconTheme: const IconThemeData(color: Colors.white),
// //         centerTitle: true,
// //         title: const Text(
// //           "Months - 2025",
// //           style: TextStyle(
// //             fontSize: 25,
// //             color: Colors.white,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //         flexibleSpace: Container(
// //           decoration: const BoxDecoration(
// //             gradient: LinearGradient(
// //               colors: [Color(0xff70ACF4), Color(0xff5A9EE0)],
// //               begin: Alignment.topLeft,
// //               end: Alignment.bottomRight,
// //             ),
// //           ),
// //         ),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             const Text(
// //               "Select a Month",
// //               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
// //             ),
// //             const SizedBox(height: 20),
// //             Expanded(
// //               child: GridView.builder(
// //                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //                   crossAxisCount: 2,
// //                   crossAxisSpacing: 15,
// //                   mainAxisSpacing: 15,
// //                   childAspectRatio: 1.5,
// //                 ),
// //                 itemCount: months.length,
// //                 itemBuilder: (context, index) {
// //                   String month = months.keys.elementAt(index);
// //                   bool isSelected = month == currentMonth;

// //                   return GestureDetector(
// //                     onTap: () {
// //                       Navigator.push(
// //                         context,
// //                         MaterialPageRoute(
// //                           builder: (context) => DaysScreen(
// //                             month: month,
// //                             daysInMonth: months[month]!,
// //                           ),
// //                         ),
// //                       );
// //                     },
// //                     child: Container(
// //                       decoration: BoxDecoration(
// //                         gradient: isSelected
// //                             ? const LinearGradient(
// //                                 colors: [Color(0xff4CAF50), Color(0xff66BB6A)],
// //                                 begin: Alignment.topLeft,
// //                                 end: Alignment.bottomRight,
// //                               )
// //                             : const LinearGradient(
// //                                 colors: [Color(0xff70ACF4), Color(0xff5A9EE0)],
// //                                 begin: Alignment.topLeft,
// //                                 end: Alignment.bottomRight,
// //                               ),
// //                         borderRadius: BorderRadius.circular(15),
// //                         boxShadow: [
// //                           BoxShadow(
// //                             color: Colors.black.withOpacity(0.2),
// //                             blurRadius: 6,
// //                             offset: const Offset(0, 3),
// //                           ),
// //                         ],
// //                       ),
// //                       child: Column(
// //                         mainAxisAlignment: MainAxisAlignment.center,
// //                         children: [
// //                           const Icon(
// //                             Icons.calendar_today,
// //                             color: Colors.white,
// //                             size: 35,
// //                           ),
// //                           const SizedBox(height: 10),
// //                           Text(
// //                             month,
// //                             style: const TextStyle(
// //                               fontSize: 25,
// //                               fontWeight: FontWeight.bold,
// //                               color: Colors.white,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   String _monthToString(int monthNumber) {
// //     switch (monthNumber) {
// //       case 1:
// //         return "Jan";
// //       case 2:
// //         return "Feb";
// //       case 3:
// //         return "Mar";
// //       case 4:
// //         return "Apr";
// //       case 5:
// //         return "May";
// //       case 6:
// //         return "Jun";
// //       case 7:
// //         return "Jul";
// //       case 8:
// //         return "Aug";
// //       case 9:
// //         return "Sep";
// //       case 10:
// //         return "Oct";
// //       case 11:
// //         return "Nov";
// //       case 12:
// //         return "Dec";
// //       default:
// //         return "";
// //     }
// //   }
// // }

// import 'package:attendance_app/features/home/data/months_data.dart';
// import 'package:attendance_app/features/home/presentation/views/days_view.dart';
// import 'package:attendance_app/features/home/presentation/views/widgets/admin_drawer.dart';
// import 'package:attendance_app/features/home/presentation/views/widgets/student_drawer.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class MonthSelectionScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     User? currentUser = FirebaseAuth.instance.currentUser;
//     DateTime now = DateTime.now();
//     String currentMonth = "${_monthToString(now.month)} ${now.year}";

//     return FutureBuilder<DocumentSnapshot>(
//       future: FirebaseFirestore.instance
//           .collection("users")
//           .doc(currentUser?.uid)
//           .get(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Scaffold(
//             body: Center(
//                 child: CircularProgressIndicator(
//               color: Color(0xff70ACF4),
//             )),
//           );
//         }
//         if (snapshot.hasError) {
//           return Scaffold(
//             body: Center(child: Text("Error: ${snapshot.error}")),
//           );
//         }
//         // تحويل البيانات إلى Map
//         Map<String, dynamic> userData =
//             snapshot.data!.data() as Map<String, dynamic>;
//         String role = userData["role"] ?? "student";

//         return Scaffold(
//           drawer: role == "admin" ? const AdminDrawer() : const StudentDrawer(),
//           appBar: AppBar(
//             iconTheme: const IconThemeData(color: Colors.white),
//             centerTitle: true,
//             title: const Text(
//               "Months - 2025",
//               style: TextStyle(
//                 fontSize: 25,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             flexibleSpace: Container(
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Color(0xff70ACF4), Color(0xff5A9EE0)],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//             ),
//           ),
//           body: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 const Text(
//                   "Select a Masdadonth",
//                   style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 20),
//                 Expanded(
//                   child: GridView.builder(
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 15,
//                       mainAxisSpacing: 15,
//                       childAspectRatio: 1.5,
//                     ),
//                     itemCount: months.length,
//                     itemBuilder: (context, index) {
//                       String month = months.keys.elementAt(index);
//                       bool isSelected = month == currentMonth;

//                       return GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => DaysScreen(
//                                 month: month,
//                                 daysInMonth: months[month]!,
//                               ),
//                             ),
//                           );
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             gradient: isSelected
//                                 ? const LinearGradient(
//                                     colors: [
//                                       Color(0xff4CAF50),
//                                       Color(0xff66BB6A)
//                                     ],
//                                     begin: Alignment.topLeft,
//                                     end: Alignment.bottomRight,
//                                   )
//                                 : const LinearGradient(
//                                     colors: [
//                                       Color(0xff70ACF4),
//                                       Color(0xff5A9EE0)
//                                     ],
//                                     begin: Alignment.topLeft,
//                                     end: Alignment.bottomRight,
//                                   ),
//                             borderRadius: BorderRadius.circular(15),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.2),
//                                 blurRadius: 6,
//                                 offset: const Offset(0, 3),
//                               ),
//                             ],
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               const Icon(
//                                 Icons.calendar_today,
//                                 color: Colors.white,
//                                 size: 35,
//                               ),
//                               const SizedBox(height: 10),
//                               Text(
//                                 month,
//                                 style: const TextStyle(
//                                   fontSize: 25,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   String _monthToString(int monthNumber) {
//     switch (monthNumber) {
//       case 1:
//         return "Jan";
//       case 2:
//         return "Feb";
//       case 3:
//         return "Mar";
//       case 4:
//         return "Apr";
//       case 5:
//         return "May";
//       case 6:
//         return "Jun";
//       case 7:
//         return "Jul";
//       case 8:
//         return "Aug";
//       case 9:
//         return "Sep";
//       case 10:
//         return "Oct";
//       case 11:
//         return "Nov";
//       case 12:
//         return "Dec";
//       default:
//         return "";
//     }
//   }
// }
