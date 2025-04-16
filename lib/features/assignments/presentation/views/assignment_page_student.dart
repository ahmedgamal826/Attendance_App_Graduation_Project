import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/assignments/presentation/views/assignment_page_details_2_student.dart';
import 'package:attendance_app/features/assignments/presentation/views/assignment_page_details_student.dart';
import 'package:attendance_app/features/assignments/presentation/views/widgets/assignment_list_item_student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cubit_student/assignment_cubit.dart';
import '../../cubit/cubit_student/assignment_state.dart';

class AssignmentsPageStudent extends StatelessWidget {
  const AssignmentsPageStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TestCubit()..loadTests(),
      child: Scaffold(
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
        ),
        body: BlocBuilder<TestCubit, TestState>(
          builder: (context, state) {
            if (state is TestLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TestError) {
              return Center(child: Text('Error: ${state.message}'));
            } else if (state is TestLoaded) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemCount: state.tests.length,
                  itemBuilder: (context, index) {
                    final test = state.tests[index];
                    return TestListItem(
                      test: test,
                      onTap: () {
                        // Navigate based on test index/title
                        if (index == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const TestPageDetailsStudent(
                                assignmentTitle: "Assignment 1",
                              ),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const TestPageDetails2Student(
                                assignmentTitle: 'Assignment 2',
                              ),
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
              );
            }
            // Default return for TestInitial or any unhandled state
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
