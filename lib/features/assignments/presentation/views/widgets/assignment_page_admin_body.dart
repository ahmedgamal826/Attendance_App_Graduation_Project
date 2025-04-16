import 'dart:math';
import 'package:attendance_app/features/assignments/cubit/cubit_admin/assignment_cubit.dart';
import 'package:attendance_app/features/assignments/cubit/cubit_admin/assignment_state.dart';
import 'package:attendance_app/features/assignments/presentation/views/assignment_page_details_2_admin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../cubits/assignment_cubit.dart';
// import '../../../states/assignment_state.dart';
// import '../../../../../assignments/presentation/views/widgets/assignment_page_details_2_admin.dart';
import 'assignment_list_item.dart';

class TestPageAdminBody extends StatefulWidget {
  const TestPageAdminBody({Key? key}) : super(key: key);

  @override
  State<TestPageAdminBody> createState() => _TestPageAdminBodyState();
}

class _TestPageAdminBodyState extends State<TestPageAdminBody>
    with SingleTickerProviderStateMixin {
  // Animation controller for list items
  late AnimationController _animationController;
  final List<Animation<double>> _animationsList = [];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    // Animation will be initialized when tests are loaded
    _animationController.forward();
  }

  void _initializeAnimations(int itemCount) {
    _animationsList.clear();
    for (int i = 0; i < itemCount; i++) {
      final Animation<double> animation = Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Interval(i * 0.2, min(1.0, i * 0.2 + 0.6),
              curve: Curves.easeInOut),
        ),
      );
      _animationsList.add(animation);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // Navigate to the AssessmentPage
  void _navigateToAssessmentPage(
    BuildContext context,
    String assignmentTitle,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TestPageDetails2Admin(
          assignmentTitle: assignmentTitle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TestCubit, TestState>(
      listener: (context, state) {
        if (state is TestLoaded) {
          setState(() {
            _initializeAnimations(state.tests.length);
          });
          _animationController.reset();
          _animationController.forward();
        }
      },
      builder: (context, state) {
        if (state is TestLoaded) {
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: state.tests.length,
            itemBuilder: (context, index) {
              // Get animation for this item or create a default one
              Animation<double> animation = index < _animationsList.length
                  ? _animationsList[index]
                  : kAlwaysCompleteAnimation;

              return TestListItem(
                test: state.tests[index],
                animation: animation,
                onDelete: () {
                  context.read<TestCubit>().deleteTest(index);
                },
                onTap: () {
                  // Navigate to AssessmentPage when Test 2 is tapped
                  if (state.tests[index].name == 'Assignment 2') {
                    _navigateToAssessmentPage(context, state.tests[index].name);
                  } else {
                    // For other tests, just print a message for now
                    print('Tapped on ${state.tests[index].name}');
                  }
                },
              );
            },
          );
        } else if (state is TestLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TestError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const Center(child: Text('No tests available'));
        }
      },
    );
  }
}
