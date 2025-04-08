import 'package:attendance_app/features/questionnaire/data/models/student_question_model.dart';
import 'package:attendance_app/features/questionnaire/presentation/views/student_questionnaire_view.dart';
import 'package:flutter/material.dart';

class CustomStudentCardHome extends StatelessWidget {
  const CustomStudentCardHome({
    super.key,
    required this.questionnaire,
    required this.viewModel,
  });

  final StudentQuestionnaireModel questionnaire;
  final StudentHomeQuestionnairesViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StudentQuestionnaireView(
                questionnaireId: questionnaire.id,
                onSubmit: () {
                  viewModel.markQuestionnaireAsCompleted(questionnaire.id);
                },
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                questionnaire.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Date: ${questionnaire.date}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'By: ${questionnaire.doctor}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
