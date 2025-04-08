import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/questionnaire/presentation/viewmodels/student_questionnaire_viewmode.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.allQuestionsAnswered,
    required this.onSubmit,
    required this.viewModel,
  });

  final bool allQuestionsAnswered;
  final VoidCallback onSubmit;
  final StudentQuestionnaireViewmodel viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: viewModel.questions.isEmpty || !allQuestionsAnswered
            ? null
            : () {
                onSubmit();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Answers submitted successfully!'),
                  ),
                );
                Navigator.pop(context);
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          disabledBackgroundColor: Colors.grey,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          'Submit',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
