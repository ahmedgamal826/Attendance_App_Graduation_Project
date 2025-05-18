import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/assignments/presentation/viewmodels/student_assignments_viewmodel.dart';
import 'package:attendance_app/features/assignments/presentation/views/student_assignment_detail_view.dart';
import 'package:attendance_app/features/assignments/presentation/views/widgets/assignment_list_item_student.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AssignmentsPageStudent extends StatefulWidget {
  final String courseId;

  const AssignmentsPageStudent({Key? key, required this.courseId})
      : super(key: key);

  @override
  State<AssignmentsPageStudent> createState() => _AssignmentsPageStudentState();
}

class _AssignmentsPageStudentState extends State<AssignmentsPageStudent>
    with WidgetsBindingObserver {
  late StudentAssignmentsViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Refresh when app is resumed
      if (_viewModel != null) {
        _viewModel.refreshAssignments();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (_) => StudentAssignmentsViewModel(courseId: widget.courseId),
      child: Consumer<StudentAssignmentsViewModel>(
        builder: (context, viewModel, child) {
          _viewModel = viewModel; // Store for lifecycle methods

          // إظهار رسائل النجاح
          if (viewModel.successMessage.isNotEmpty) {
            // جدولة رسالة النجاح لتظهر بعد بناء الواجهة
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(viewModel.successMessage),
                  backgroundColor: Colors.green,
                ),
              );
              // مسح الرسالة بعد عرضها
              viewModel.clearMessages();
            });
          }

          // إظهار رسائل الخطأ
          if (viewModel.errorMessage.isNotEmpty) {
            // جدولة رسالة الخطأ لتظهر بعد بناء الواجهة
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(viewModel.errorMessage),
                  backgroundColor: Colors.red,
                ),
              );
              // مسح الرسالة بعد عرضها
              viewModel.clearMessages();
            });
          }

          return Scaffold(
            backgroundColor: const Color(0xFFF0F7FF),
            appBar: AppBar(
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              title: const Text(
                "Student Assignments",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white,
                ),
              ),
              backgroundColor: AppColors.primaryColor,
              elevation: 0,
              centerTitle: true,
              actions: [
                // Add refresh button
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    viewModel.refreshAssignments();
                  },
                ),
              ],
            ),
            body: Stack(
              children: [
                // محتوى الصفحة الرئيسي
                viewModel.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ))
                    : viewModel.assignments.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.assignment,
                                    size: 80, color: Colors.grey),
                                SizedBox(height: screenHeight * 0.03),
                                Text('No Assignments available',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: screenHeight * 0.03,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(height: screenHeight * 0.01),
                                Text('Check back later for new assignments!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: screenHeight * 0.02,
                                        color: Colors.grey)),
                              ],
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.all(screenWidth * 0.04),
                            child: ListView.builder(
                              itemCount: viewModel.assignments.length,
                              itemBuilder: (context, index) {
                                final assignment = viewModel.assignments[index];
                                return TestListItem(
                                  test: assignment,
                                  onTap: () async {
                                    // Navigate to the new assignment detail view
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            StudentAssignmentDetailView(
                                          courseId: widget.courseId,
                                          assignmentId: assignment
                                              .title, // Using title as ID for now
                                          assignmentTitle: assignment.title,
                                        ),
                                      ),
                                    );

                                    // Refresh assignments when returning from detail view
                                    viewModel.refreshAssignments();
                                  },
                                );
                              },
                            ),
                          ),
              ],
            ),
          );
        },
      ),
    );
  }
}
