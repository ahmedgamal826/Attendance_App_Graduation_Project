import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class StudentQuestionnaireView extends StatelessWidget {
  const StudentQuestionnaireView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Questionnaires',
          style: TextStyle(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
