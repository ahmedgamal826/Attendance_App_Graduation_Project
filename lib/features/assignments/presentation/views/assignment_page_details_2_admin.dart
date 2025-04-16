import 'package:attendance_app/features/assignments/presentation/views/widgets/assignment_page_details_2_admin_body.dart';
import 'package:flutter/material.dart';

class TestPageDetails2Admin extends StatefulWidget {
  final String assignmentTitle;

  const TestPageDetails2Admin({Key? key, required this.assignmentTitle})
      : super(key: key);

  @override
  State<TestPageDetails2Admin> createState() => _TestPageDetails2AdminState();
}

class _TestPageDetails2AdminState extends State<TestPageDetails2Admin> {
  @override
  Widget build(BuildContext context) {
    return TestPageDetails2AdminBody(assignmentTitle: widget.assignmentTitle);
  }
}