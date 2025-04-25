// // lib/presentation/views/attendance_view_student.dart
// import 'package:attendance_app/features/attendance/presentation/views/widgets/attendance_view_student_body.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../cubits/cubit_student/lecture_cubit.dart';

// class AttendanceScreenStudent extends StatelessWidget {
//   const AttendanceScreenStudent({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => LectureCubit(),
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blue[600],
//           elevation: 2,
//           title: const Text(
//             'Subject 1 Attendance (Student)',
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back, color: Colors.white),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ),
//         body: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 Colors.blue[100]!,
//                 Colors.white,
//               ],
//             ),
//           ),
//           child: const AttendanceScreenBodyView(),
//         ),
//       ),
//     );
//   }
// }
