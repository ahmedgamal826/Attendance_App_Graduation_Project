// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'dart:math';
// // import 'package:attendance_app/core/utils/app_colors.dart';
// // import 'package:attendance_app/features/analysis/presentation/views/analysis_view_student.dart';
// // import 'package:attendance_app/features/assignments/presentation/views/assignment_page_admin.dart';
// // import 'package:attendance_app/features/attendance/presentation/views/attendance_view_admin.dart';
// // import 'package:attendance_app/features/materials/presentation/views/material_view_student.dart';
// // import 'package:attendance_app/features/materials/presentation/views/materials_view_admin.dart';
// // import 'package:attendance_app/features/tests/presentation/views/test_page_admin.dart';
// // import 'package:attendance_app/features/analysis/presentation/views/analysis_view_admin.dart';
// // import 'package:attendance_app/features/attendance/presentation/views/attendance_view_student.dart';
// // import 'package:attendance_app/features/assignments/presentation/views/assignment_page_student.dart';
// // import 'package:attendance_app/features/tests/presentation/views/test_page_student.dart';

// // class SubjectScreen extends StatefulWidget {
// //   const SubjectScreen({super.key});

// //   @override
// //   State<SubjectScreen> createState() => _SubjectScreenState();
// // }

// // class _SubjectScreenState extends State<SubjectScreen>
// //     with SingleTickerProviderStateMixin {
// //   String? activeButton;
// //   late AnimationController _animationController;
// //   String? role; // هنا بنخليها nullable لحد ما تتحمل

// //   @override
// //   void initState() {
// //     super.initState();
// //     _animationController = AnimationController(
// //       vsync: this,
// //       duration: const Duration(milliseconds: 300),
// //     );
// //     // جلب قيمة role من Firestore
// //     _fetchUserRole();
// //   }

// //   Future<void> _fetchUserRole() async {
// //     try {
// //       final user = FirebaseAuth.instance.currentUser;
// //       if (user != null) {
// //         final doc = await FirebaseFirestore.instance
// //             .collection('users')
// //             .doc(user.uid)
// //             .get();
// //         if (doc.exists) {
// //           setState(() {
// //             role = doc.data()?['role'] ??
// //                 'student'; // افتراضي Student لو مفيش قيمة
// //           });
// //         } else {
// //           setState(() {
// //             role = 'student'; // قيمة افتراضية لو المستند مش موجود
// //           });
// //         }
// //       }
// //     } catch (e) {
// //       print('Error fetching role: $e');
// //       setState(() {
// //         role = 'student'; // قيمة افتراضية في حالة الخطأ
// //       });
// //     }
// //   }

// //   @override
// //   void dispose() {
// //     _animationController.dispose();
// //     super.dispose();
// //   }

// //   void setActiveButton(String buttonName) {
// //     setState(() {
// //       activeButton = buttonName;
// //       _animationController.reset();
// //       _animationController.forward();
// //     });
// //   }

// //   void navigateBasedOnRole(BuildContext context, String buttonName) {
// //     if (role == null) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text('جاري تحميل بيانات المستخدم...')),
// //       );
// //       return;
// //     }

// //     setActiveButton(buttonName);
// //     Widget destination;

// //     switch (buttonName) {
// //       case 'Analysis':
// //         destination = role == 'Admin'
// //             ? const AnalysisViewAdmin()
// //             : const AnalysisViewStudent();
// //         break;
// //       case 'Attendance':
// //         destination = role == 'Admin'
// //             ? const AttendanceScreenAdmin()
// //             : const AttendanceScreenStudent();
// //         break;
// //       case 'Materials':
// //         destination = role == 'Admin'
// //             ? const MaterialsAdminScreen()
// //             : const MaterialsStudentScreen();
// //         break;
// //       case 'Assignments':
// //         destination = role == 'Admin'
// //             ? const AssignmentsPageAdmin()
// //             : const AssignmentsPageStudent();
// //         break;
// //       case 'Test':
// //         destination =
// //             role == 'Admin' ? const TestPageAdmin() : const TestPageStudent();
// //         break;
// //       default:
// //         return;
// //     }

// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(builder: (context) => destination),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         iconTheme: const IconThemeData(
// //           color: Colors.white,
// //         ),
// //         title: const Text(
// //           'Subject 1',
// //           style: TextStyle(
// //             fontWeight: FontWeight.bold,
// //             fontSize: 25,
// //             color: Colors.white,
// //           ),
// //         ),
// //         centerTitle: true,
// //         // backgroundColor: AppColors.primaryColor,
// //         elevation: 4,
// //       ),
// //       body: role == null
// //           ? const Center(child: CircularProgressIndicator()) // عرض مؤشر تحميل
// //           : Container(
// //               height: max(1, 1000),
// //               color: const Color(0xFFE3F2FD),
// //               child: Padding(
// //                 padding: const EdgeInsets.all(18.0),
// //                 child: SingleChildScrollView(
// //                   child: Column(
// //                     mainAxisSize: MainAxisSize.min,
// //                     children: [
// //                       const SizedBox(height: 10),
// //                       _buildRoundedButton(
// //                         context,
// //                         'Analysis',
// //                         () => navigateBasedOnRole(context, 'Analysis'),
// //                       ),
// //                       _buildRoundedButton(
// //                         context,
// //                         'Attendance',
// //                         () => navigateBasedOnRole(context, 'Attendance'),
// //                       ),
// //                       _buildRoundedButton(
// //                         context,
// //                         'Materials',
// //                         () => navigateBasedOnRole(context, 'Materials'),
// //                       ),
// //                       _buildRoundedButton(
// //                         context,
// //                         'Assignments',
// //                         () => navigateBasedOnRole(context, 'Assignments'),
// //                       ),
// //                       _buildRoundedButton(
// //                         context,
// //                         'Test',
// //                         () => navigateBasedOnRole(context, 'Test'),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ),
// //     );
// //   }

// //   Widget _buildRoundedButton(
// //       BuildContext context, String title, VoidCallback onPressed) {
// //     final bool isActive = activeButton == title;

// //     return AnimatedBuilder(
// //       animation: _animationController,
// //       builder: (context, child) {
// //         final double scale =
// //             isActive ? 1.0 + (_animationController.value * 0.05) : 1.0;

// //         return Padding(
// //           padding: const EdgeInsets.symmetric(vertical: 8.0),
// //           child: Transform.scale(
// //             scale: scale,
// //             child: InkWell(
// //               onTap: onPressed,
// //               borderRadius: BorderRadius.circular(25.0),
// //               child: Container(
// //                 width: double.infinity,
// //                 height: 65,
// //                 decoration: BoxDecoration(
// //                   border: Border.all(
// //                     color: isActive
// //                         ? const Color(0xFF42A5F5)
// //                         : const Color(0xFF90CAF9),
// //                     width: 2.0,
// //                   ),
// //                   borderRadius: BorderRadius.circular(25.0),
// //                   color: isActive ? const Color(0xFF90CAF9) : Colors.white,
// //                   boxShadow: [
// //                     BoxShadow(
// //                       color: isActive ? Colors.black26 : Colors.black12,
// //                       offset: const Offset(0, 3),
// //                       blurRadius: 6,
// //                     ),
// //                   ],
// //                 ),
// //                 child: Center(
// //                   child: Text(
// //                     title,
// //                     style: TextStyle(
// //                       fontSize: 22,
// //                       fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
// //                       color: isActive
// //                           ? const Color(0xFF0D47A1)
// //                           : const Color(0xFF1976D2),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'dart:math';
// import 'package:attendance_app/core/utils/app_colors.dart';
// import 'package:attendance_app/features/analysis/presentation/views/analysis_view_student.dart';
// import 'package:attendance_app/features/assignments/presentation/views/assignment_page_admin.dart';
// import 'package:attendance_app/features/attendance/presentation/views/attendance_view_admin.dart';
// import 'package:attendance_app/features/materials/presentation/views/material_view_student.dart';
// import 'package:attendance_app/features/materials/presentation/views/materials_view_admin.dart';
// import 'package:attendance_app/features/tests/presentation/views/test_page_admin.dart';
// import 'package:attendance_app/features/analysis/presentation/views/analysis_view_admin.dart';
// import 'package:attendance_app/features/attendance/presentation/views/attendance_view_student.dart';
// import 'package:attendance_app/features/assignments/presentation/views/assignment_page_student.dart';
// import 'package:attendance_app/features/tests/presentation/views/test_page_student.dart';

// class SubjectScreen extends StatefulWidget {
//   final String courseId; // استقبال courseId
//   final String courseName; // استقبال اسم المادة
//   const SubjectScreen(
//       {super.key, required this.courseId, required this.courseName});

//   @override
//   State<SubjectScreen> createState() => _SubjectScreenState();
// }

// class _SubjectScreenState extends State<SubjectScreen>
//     with SingleTickerProviderStateMixin {
//   String? activeButton;
//   late AnimationController _animationController;
//   String? role;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 300),
//     );
//     _fetchUserRole();
//   }

//   Future<void> _fetchUserRole() async {
//     try {
//       final user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         final doc = await FirebaseFirestore.instance
//             .collection('users')
//             .doc(user.uid)
//             .get();
//         if (doc.exists) {
//           setState(() {
//             role = doc.data()?['role'] ?? 'student';
//           });
//         } else {
//           setState(() {
//             role = 'student';
//           });
//         }
//       }
//     } catch (e) {
//       print('Error fetching role: $e');
//       setState(() {
//         role = 'student';
//       });
//     }
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   void setActiveButton(String buttonName) {
//     setState(() {
//       activeButton = buttonName;
//       _animationController.reset();
//       _animationController.forward();
//     });
//   }

//   void navigateBasedOnRole(BuildContext context, String buttonName) {
//     if (role == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('جاري تحميل بيانات المستخدم...')),
//       );
//       return;
//     }

//     setActiveButton(buttonName);
//     Widget destination;

//     switch (buttonName) {
//       case 'Analysis':
//         destination = role == 'Admin'
//             ? const AnalysisViewAdmin()
//             : const AnalysisViewStudent();
//         break;
//       case 'Attendance':
//         destination = role == 'Admin'
//             ? AttendanceScreenAdmin(
//                 courseId: widget.courseId, // تمرير courseId
//                 courseName: widget.courseName, // تمرير اسم المادة
//               )
//             : AttendanceScreenAdmin(
//                 courseId: widget.courseId, // تمرير courseId
//                 courseName: widget.courseName, // تمرير اسم المادة
//               );
//         // const AttendanceScreenStudent();
//         break;
//       case 'Materials':
//         destination = role == 'Admin'
//             ? const MaterialsAdminScreen()
//             : const MaterialsStudentScreen();
//         break;
//       case 'Assignments':
//         destination = role == 'Admin'
//             ? const AssignmentsPageAdmin()
//             : const AssignmentsPageStudent();
//         break;
//       case 'Test':
//         destination =
//             role == 'Admin' ? const TestPageAdmin() : const TestPageStudent();
//         break;
//       default:
//         return;
//     }

//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => destination),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(
//           color: Colors.white,
//         ),
//         title: Text(
//           widget.courseName, // عرض اسم المادة
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 25,
//             color: Colors.white,
//           ),
//         ),
//         centerTitle: true,
//         elevation: 4,
//       ),
//       body: role == null
//           ? const Center(child: CircularProgressIndicator())
//           : Container(
//               height: max(1, 1000),
//               color: const Color(0xFFE3F2FD),
//               child: Padding(
//                 padding: const EdgeInsets.all(18.0),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       const SizedBox(height: 10),
//                       _buildRoundedButton(
//                         context,
//                         'Analysis',
//                         () => navigateBasedOnRole(context, 'Analysis'),
//                       ),
//                       _buildRoundedButton(
//                         context,
//                         'Attendance',
//                         () => navigateBasedOnRole(context, 'Attendance'),
//                       ),
//                       _buildRoundedButton(
//                         context,
//                         'Materials',
//                         () => navigateBasedOnRole(context, 'Materials'),
//                       ),
//                       _buildRoundedButton(
//                         context,
//                         'Assignments',
//                         () => navigateBasedOnRole(context, 'Assignments'),
//                       ),
//                       _buildRoundedButton(
//                         context,
//                         'Test',
//                         () => navigateBasedOnRole(context, 'Test'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//     );
//   }

//   Widget _buildRoundedButton(
//       BuildContext context, String title, VoidCallback onPressed) {
//     final bool isActive = activeButton == title;

//     return AnimatedBuilder(
//       animation: _animationController,
//       builder: (context, child) {
//         final double scale =
//             isActive ? 1.0 + (_animationController.value * 0.05) : 1.0;

//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8.0),
//           child: Transform.scale(
//             scale: scale,
//             child: InkWell(
//               onTap: onPressed,
//               borderRadius: BorderRadius.circular(25.0),
//               child: Container(
//                 width: double.infinity,
//                 height: 65,
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: isActive
//                         ? const Color(0xFF42A5F5)
//                         : const Color(0xFF90CAF9),
//                     width: 2.0,
//                   ),
//                   borderRadius: BorderRadius.circular(25.0),
//                   color: isActive ? const Color(0xFF90CAF9) : Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                       color: isActive ? Colors.black26 : Colors.black12,
//                       offset: const Offset(0, 3),
//                       blurRadius: 6,
//                     ),
//                   ],
//                 ),
//                 child: Center(
//                   child: Text(
//                     title,
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
//                       color: isActive
//                           ? const Color(0xFF0D47A1)
//                           : const Color(0xFF1976D2),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/analysis/presentation/views/analysis_view_student.dart';
import 'package:attendance_app/features/assignments/presentation/views/assignment_page_admin.dart';
import 'package:attendance_app/features/attendance/presentation/views/attendance_view_admin.dart';
import 'package:attendance_app/features/materials/presentation/views/material_view_student.dart';
import 'package:attendance_app/features/materials/presentation/views/materials_view_admin.dart';
import 'package:attendance_app/features/tests/presentation/views/test_page_admin.dart';
import 'package:attendance_app/features/analysis/presentation/views/analysis_view_admin.dart';
import 'package:attendance_app/features/attendance/presentation/views/attendance_view_student.dart';
import 'package:attendance_app/features/assignments/presentation/views/assignment_page_student.dart';
import 'package:attendance_app/features/tests/presentation/views/test_page_student.dart';

class SubjectScreen extends StatefulWidget {
  final String courseId;
  final String courseName;

  const SubjectScreen({
    super.key,
    required this.courseId,
    required this.courseName,
  });

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen>
    with SingleTickerProviderStateMixin {
  String? activeButton;
  late AnimationController _animationController;
  String? role;
  int selectedLectureNumber =
      1; // قيمة افتراضية، ممكن تعمل شاشة لاختيار الـ lecture

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _fetchUserRole();
  }

  Future<void> _fetchUserRole() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final doc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        if (doc.exists) {
          setState(() {
            role = doc.data()?['role'] ?? 'student';
          });
        } else {
          setState(() {
            role = 'student';
          });
        }
      }
    } catch (e) {
      print('Error fetching role: $e');
      setState(() {
        role = 'student';
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void setActiveButton(String buttonName) {
    setState(() {
      activeButton = buttonName;
      _animationController.reset();
      _animationController.forward();
    });
  }

  void navigateBasedOnRole(BuildContext context, String buttonName) {
    if (role == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('جاري تحميل بيانات المستخدم...')),
      );
      return;
    }

    setActiveButton(buttonName);
    Widget destination;

    switch (buttonName) {
      case 'Analysis':
        destination = role == 'Admin'
            ? const AnalysisViewAdmin()
            : const AnalysisViewStudent();
        break;
      case 'Attendance':
        destination = role == 'Admin'
            ? AttendanceScreenAdmin(
                courseId: widget.courseId,
                courseName: widget.courseName,
              )
            : AttendanceScreenAdmin(
                courseId: widget.courseId,
                courseName: widget.courseName,
              );
        //  : const AttendanceScreenStudent();
        break;
      case 'Materials':
        destination = role == 'Admin'
            ? MaterialsAdminScreen(
                courseId: widget.courseId,
                lectureNumber: selectedLectureNumber,
              )
            : const MaterialsStudentScreen();
        break;
      case 'Assignments':
        destination = role == 'Admin'
            ? const AssignmentsPageAdmin()
            : const AssignmentsPageStudent();
        break;
      case 'Test':
        destination =
            role == 'Admin' ? const TestPageAdmin() : const TestPageStudent();
        break;
      default:
        return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => destination),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          widget.courseName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 4,
      ),
      body: role == null
          ? const Center(child: CircularProgressIndicator())
          : Container(
              height: max(1, 1000),
              color: const Color(0xFFE3F2FD),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 10),
                      _buildRoundedButton(
                        context,
                        'Analysis',
                        () => navigateBasedOnRole(context, 'Analysis'),
                      ),
                      _buildRoundedButton(
                        context,
                        'Attendance',
                        () => navigateBasedOnRole(context, 'Attendance'),
                      ),
                      _buildRoundedButton(
                        context,
                        'Materials',
                        () => navigateBasedOnRole(context, 'Materials'),
                      ),
                      _buildRoundedButton(
                        context,
                        'Assignments',
                        () => navigateBasedOnRole(context, 'Assignments'),
                      ),
                      _buildRoundedButton(
                        context,
                        'Test',
                        () => navigateBasedOnRole(context, 'Test'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildRoundedButton(
      BuildContext context, String title, VoidCallback onPressed) {
    final bool isActive = activeButton == title;

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        final double scale =
            isActive ? 1.0 + (_animationController.value * 0.05) : 1.0;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Transform.scale(
            scale: scale,
            child: InkWell(
              onTap: onPressed,
              borderRadius: BorderRadius.circular(25.0),
              child: Container(
                width: double.infinity,
                height: 65,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isActive
                        ? const Color(0xFF42A5F5)
                        : const Color(0xFF90CAF9),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(25.0),
                  color: isActive ? const Color(0xFF90CAF9) : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: isActive ? Colors.black26 : Colors.black12,
                      offset: const Offset(0, 3),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                      color: isActive
                          ? const Color(0xFF0D47A1)
                          : const Color(0xFF1976D2),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
