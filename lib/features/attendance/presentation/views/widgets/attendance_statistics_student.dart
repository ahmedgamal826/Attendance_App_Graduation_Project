// lib/presentation/widgets/attendance_statistics_student.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/cubit_student/lecture_cubit.dart';
import '../../../cubits/cubit_student/lecture_state.dart';
// import '../../cubits/cubit_student/lecture_cubit.dart';
// import '../../cubits/cubit_student/lecture_state.dart';

class AttendanceStatistics extends StatelessWidget {
  const AttendanceStatistics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LectureCubit, LectureState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blue[100]!),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem(
                'Total',
                state.totalLectures.toString(),
                Icons.calendar_today,
                Colors.blue[700]!,
              ),
              _buildStatItem(
                'Present',
                state.presentLectures.toString(),
                Icons.check_circle,
                Colors.green[600]!,
              ),
              _buildStatItem(
                'Absent',
                state.absentLectures.toString(),
                Icons.cancel,
                Colors.red[600]!,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStatItem(String title, String value, IconData icon, Color color) {
    return Column(
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}