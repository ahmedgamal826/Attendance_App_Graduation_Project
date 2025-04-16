// lib/presentation/views/attendance_view_student_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/cubit_student/lecture_cubit.dart';
import '../../../cubits/cubit_student/lecture_state.dart';
import 'attendance_statistics_student.dart';
import 'lecture_item_student.dart';
// import '../../cubits/cubit_student/lecture_cubit.dart';
// import '../../cubits/cubit_student/lecture_state.dart';
// import '../widgets/attendance_statistics.dart';
// import '../widgets/lecture_item.dart';

class AttendanceScreenBodyView extends StatefulWidget {
  const AttendanceScreenBodyView({Key? key}) : super(key: key);

  @override
  State<AttendanceScreenBodyView> createState() => _AttendanceScreenBodyViewState();
}

class _AttendanceScreenBodyViewState extends State<AttendanceScreenBodyView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    context.read<LectureCubit>().searchLectures(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Search Bar
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search lectures...',
                prefixIcon: Icon(Icons.search, color: Colors.blue[600]),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Attendance Statistics
          const AttendanceStatistics(),

          const SizedBox(height: 20),

          // Lectures List
          Expanded(
            child: BlocBuilder<LectureCubit, LectureState>(
              builder: (context, state) {
                final lectures = state.filteredLectures;
                return ListView.builder(
                  itemCount: lectures.length,
                  itemBuilder: (context, index) {
                    return LectureItem(lecture: lectures[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}