import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/questionnaire/data/models/student_question_model.dart';
import 'package:attendance_app/features/questionnaire/presentation/views/widgets/custom_student_card_home.dart';
import 'package:attendance_app/features/questionnaire/presentation/views/widgets/true_complete_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentHomeQuestionnairesView extends StatelessWidget {
  const StudentHomeQuestionnairesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => StudentHomeQuestionnairesViewModel(),
      child: Consumer<StudentHomeQuestionnairesViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'My Questionnaires',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: AppColors.primaryColor,
            ),
            body: viewModel.questionnaires.isEmpty
                ? const Center(
                    child: Text(
                      'No questionnaires available yet!',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView.builder(
                      itemCount: viewModel.questionnaires.length,
                      itemBuilder: (context, index) {
                        final questionnaire = viewModel.questionnaires[index];
                        return Stack(
                          children: [
                            CustomStudentCardHome(
                              viewModel: viewModel,
                              questionnaire: questionnaire,
                            ),
                            if (questionnaire.isCompleted)
                              const TrueCompleteWidget(),
                          ],
                        );
                      },
                    ),
                  ),
          );
        },
      ),
    );
  }
}
