// attendance/presentation/views/widgets/attendance_view_admin_body.dart
import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../lecture_attendance_screen.dart';
import '../../../cubits/cubit_admin/lecture_cubit.dart';
import '../../../cubits/cubit_admin/lecture_state.dart';
import '../../../models/lecture_model_admin.dart';
import 'add_lecture_screen_admin.dart';

class AttendanceAdminBody extends StatefulWidget {
  const AttendanceAdminBody({Key? key}) : super(key: key);

  @override
  State<AttendanceAdminBody> createState() => _AttendanceAdminBodyState();
}

class _AttendanceAdminBodyState extends State<AttendanceAdminBody> {
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

  void _handleListItemAction(BuildContext context, int lectureNumber) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Lecture $lectureNumber Options',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.edit, color: Colors.blue[600]),
                title: const Text('Edit Lecture'),
                onTap: () {
                  Navigator.pop(context);
                  // Here you would navigate to an edit screen
                  // For now we'll just show a snackbar
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Editing Lecture $lectureNumber')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: const Text('Delete Lecture'),
                onTap: () {
                  context.read<LectureCubit>().deleteLecture(lectureNumber);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Deleting Lecture $lectureNumber')),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _handleAddLecture(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddLectureScreen()),
    );
  }

  void _navigateToLectureAttendance(BuildContext context, int lectureNumber) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LectureAttendanceScreen(
          lectureNumber: lectureNumber,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue[100]!,
            Colors.white,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                cursorColor: AppColors.primaryColor,
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search by lecture name',
                  prefixIcon: Icon(Icons.search, color: Colors.blue[600]),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _searchController.clear();
                          },
                        )
                      : null,
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Lectures List with BlocBuilder
            Expanded(
              child: BlocBuilder<LectureCubit, LectureState>(
                builder: (context, state) {
                  if (state.status == LectureStatus.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.status == LectureStatus.failure) {
                    return Center(
                      child: Text(
                        state.errorMessage ?? 'An error occurred',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.red[600],
                        ),
                      ),
                    );
                  } else if (state.filteredLectures.isEmpty) {
                    return Center(
                      child: Text(
                        'No lectures found',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: state.filteredLectures.length,
                      itemBuilder: (context, index) {
                        final lecture = state.filteredLectures[index];
                        return _buildLectureItem(context, lecture);
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLectureItem(BuildContext context, LectureModel lecture) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          _navigateToLectureAttendance(context, lecture.number);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.blue[300]!,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lecture ${lecture.number}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800],
                        ),
                      ),
                      const SizedBox(height: 4),
                      // Lecture name
                      Text(
                        lecture.name,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      // Date row with icon
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 16,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Date: ',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[700],
                            ),
                          ),
                          Text(
                            lecture.date,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      // Time row with icon
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            size: 16,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Time: ',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[700],
                            ),
                          ),
                          Text(
                            lecture.time,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // More Options
                IconButton(
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    _handleListItemAction(context, lecture.number);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
