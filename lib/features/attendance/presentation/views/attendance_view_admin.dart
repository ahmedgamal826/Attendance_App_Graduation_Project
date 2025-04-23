// attendance/presentation/views/attendance_view_admin.dart
import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/attendance/presentation/views/widgets/add_lecture_screen_admin.dart';
import 'package:attendance_app/features/schedule_open_camera/schedule_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/cubit_admin/lecture_cubit.dart';
import 'widgets/attendance_view_admin_body.dart';

class AttendanceScreenAdmin extends StatelessWidget {
  const AttendanceScreenAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LectureCubit(),
      child: Scaffold(
        // App Bar with back button
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          title: const Text(
            'Admin Subject 1 Attendance',
            style: TextStyle(
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
        body: const AttendanceAdminBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              // MaterialPageRoute(builder: (context) => const AddLectureScreen()),
              MaterialPageRoute(builder: (context) => const ScheduleScreen()),
            );
          },
          backgroundColor: AppColors.primaryColor,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
