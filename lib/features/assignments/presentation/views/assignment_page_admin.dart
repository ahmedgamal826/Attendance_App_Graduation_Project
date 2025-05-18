import 'package:attendance_app/features/assignments/presentation/views/home_assignments_view.dart';
import 'package:flutter/material.dart';

class AssignmentsPageAdmin extends StatelessWidget {
  final String courseId;

  const AssignmentsPageAdmin({Key? key, required this.courseId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeAssignmentsView(courseId: courseId);
  }
}
