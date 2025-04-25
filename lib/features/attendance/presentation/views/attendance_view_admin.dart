// // // // attendance/presentation/views/attendance_view_admin.dart
// // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // import 'package:attendance_app/features/attendance/presentation/views/widgets/add_lecture_screen_admin.dart';
// // // import 'package:attendance_app/features/schedule_open_camera/schedule_screen.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // import '../../cubits/cubit_admin/lecture_cubit.dart';
// // // import 'widgets/attendance_view_admin_body.dart';

// // // class AttendanceScreenAdmin extends StatelessWidget {
// // //   const AttendanceScreenAdmin({Key? key}) : super(key: key);

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return BlocProvider(
// // //       create: (context) => LectureCubit(),
// // //       child: Scaffold(
// // //         // App Bar with back button
// // //         appBar: AppBar(
// // //           backgroundColor: AppColors.primaryColor,
// // //           elevation: 0,
// // //           title: const Text(
// // //             'Admin Subject 1 Attendance',
// // //             style: TextStyle(
// // //               color: Colors.white,
// // //               fontWeight: FontWeight.bold,
// // //             ),
// // //           ),
// // //           leading: IconButton(
// // //             icon: const Icon(Icons.arrow_back, color: Colors.white),
// // //             onPressed: () {
// // //               Navigator.of(context).pop();
// // //             },
// // //           ),
// // //         ),
// // //         body: const AttendanceAdminBody(),
// // //         floatingActionButton: FloatingActionButton(
// // //           onPressed: () {
// // //             Navigator.push(
// // //               context,
// // //               // MaterialPageRoute(builder: (context) => const AddLectureScreen()),
// // //               MaterialPageRoute(builder: (context) => const ScheduleScreen()),
// // //             );
// // //           },
// // //           backgroundColor: AppColors.primaryColor,
// // //           child: const Icon(Icons.add, color: Colors.white),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:attendance_app/core/utils/app_colors.dart';
// // import 'package:attendance_app/features/attendance/presentation/views/widgets/add_lecture_screen_admin.dart';
// // import 'package:attendance_app/features/schedule_open_camera/schedule_screen.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import '../../cubits/cubit_admin/lecture_cubit.dart';
// // import 'widgets/attendance_view_admin_body.dart';

// // class AttendanceScreenAdmin extends StatelessWidget {
// //   final String courseId; // استقبال courseId
// //   final String courseName; // استقبال اسم المادة
// //   const AttendanceScreenAdmin({
// //     Key? key,
// //     required this.courseId,
// //     required this.courseName,
// //   }) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocProvider(
// //       create: (context) =>
// //           LectureCubit(courseId: courseId), // تمرير courseId إلى LectureCubit
// //       child: Scaffold(
// //         appBar: AppBar(
// //           backgroundColor: AppColors.primaryColor,
// //           elevation: 0,
// //           title: Text(
// //             'Admin ${courseName} Attendance', // عرض اسم المادة
// //             style: const TextStyle(
// //               color: Colors.white,
// //               fontWeight: FontWeight.bold,
// //             ),
// //           ),
// //           leading: IconButton(
// //             icon: const Icon(Icons.arrow_back, color: Colors.white),
// //             onPressed: () {
// //               Navigator.of(context).pop();
// //             },
// //           ),
// //         ),
// //         body: const AttendanceAdminBody(),
// //         floatingActionButton: FloatingActionButton(
// //           onPressed: () {
// //             Navigator.push(
// //               context,
// //               MaterialPageRoute(
// //                 builder: (context) => ScheduleScreen(
// //                   courseId: courseId, // تمرير courseId
// //                 ),
// //               ),
// //             );
// //           },
// //           backgroundColor: AppColors.primaryColor,
// //           child: const Icon(Icons.add, color: Colors.white),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:attendance_app/core/utils/app_colors.dart';
// import 'package:attendance_app/features/attendance/cubits/cubit_admin/lecture_state.dart';
// import 'package:attendance_app/features/attendance/presentation/views/widgets/add_lecture_screen_admin.dart';
// import 'package:attendance_app/features/schedule_open_camera/schedule_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../cubits/cubit_admin/lecture_cubit.dart';
// import 'widgets/attendance_view_admin_body.dart';

// class AttendanceScreenAdmin extends StatelessWidget {
//   final String courseId;
//   final String courseName;
//   const AttendanceScreenAdmin({
//     Key? key,
//     required this.courseId,
//     required this.courseName,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => LectureCubit(courseId: courseId),
//       child: BlocBuilder<LectureCubit, LectureState>(
//         builder: (context, state) {
//           final lectureCubit =
//               context.read<LectureCubit>(); // الحصول على LectureCubit
//           return Scaffold(
//             appBar: AppBar(
//               backgroundColor: AppColors.primaryColor,
//               elevation: 0,
//               title: Text(
//                 'Admin ${courseName} Attendance',
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               leading: IconButton(
//                 icon: const Icon(Icons.arrow_back, color: Colors.white),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ),
//             body: const AttendanceAdminBody(
//               courseId: ,
//             ),
//             floatingActionButton: FloatingActionButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ScheduleScreen(
//                       courseId: courseId,
//                       lectureCubit: lectureCubit, // تمرير LectureCubit
//                     ),
//                   ),
//                 );
//               },
//               backgroundColor: AppColors.primaryColor,
//               child: const Icon(Icons.add, color: Colors.white),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// import 'package:attendance_app/core/utils/app_colors.dart';
// import 'package:attendance_app/features/attendance/cubits/cubit_admin/lecture_state.dart';
// import 'package:attendance_app/features/attendance/presentation/views/widgets/add_lecture_screen_admin.dart';
// import 'package:attendance_app/features/attendance/presentation/views/schedule_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../cubits/cubit_admin/lecture_cubit.dart';
// import 'widgets/attendance_view_admin_body.dart';

// class AttendanceScreenAdmin extends StatelessWidget {
//   final String courseId;
//   final String courseName;
//   const AttendanceScreenAdmin({
//     Key? key,
//     required this.courseId,
//     required this.courseName,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => LectureCubit(courseId: courseId),
//       child: BlocBuilder<LectureCubit, LectureState>(
//         builder: (context, state) {
//           final lectureCubit =
//               context.read<LectureCubit>(); // الحصول على LectureCubit
//           return Scaffold(
//             appBar: AppBar(
//               backgroundColor: AppColors.primaryColor,
//               elevation: 0,
//               title: Text(
//                 'Admin ${courseName} Attendance',
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               leading: IconButton(
//                 icon: const Icon(Icons.arrow_back, color: Colors.white),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ),
//             body: AttendanceAdminBody(courseId: courseId),
//             floatingActionButton: FloatingActionButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ScheduleScreen(
//                       courseId: courseId,
//                       lectureCubit: lectureCubit, // تمرير LectureCubit
//                     ),
//                   ),
//                 );
//               },
//               backgroundColor: AppColors.primaryColor,
//               child: const Icon(Icons.add, color: Colors.white),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/attendance/cubits/cubit_admin/lecture_state.dart';
import 'package:attendance_app/features/attendance/presentation/views/widgets/add_lecture_screen_admin.dart';
import 'package:attendance_app/features/attendance/presentation/views/schedule_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/cubit_admin/lecture_cubit.dart';
import 'widgets/attendance_view_admin_body.dart';

class AttendanceScreenAdmin extends StatelessWidget {
  final String courseId;
  final String courseName;

  const AttendanceScreenAdmin({
    Key? key,
    required this.courseId,
    required this.courseName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LectureCubit(courseId: courseId),
      child: BlocBuilder<LectureCubit, LectureState>(
        builder: (context, state) {
          final lectureCubit = context.read<LectureCubit>();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.primaryColor,
              elevation: 0,
              title: Text(
                'Admin ${courseName} Attendance',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: AttendanceAdminBody(courseId: courseId),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScheduleScreen(
                      courseId: courseId,
                      lectureCubit: lectureCubit,
                    ),
                  ),
                );
              },
              backgroundColor: AppColors.primaryColor,
              child: const Icon(Icons.add, color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
