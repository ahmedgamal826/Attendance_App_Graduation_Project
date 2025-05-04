import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/questionnaire/presentation/viewmodels/home_questionnaires_viewmodel.dart';
import 'package:attendance_app/features/questionnaire/presentation/views/widgets/custom_student_card_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentHomeQuestionnairesView extends StatelessWidget {
  final String courseId;

  const StudentHomeQuestionnairesView({Key? key, required this.courseId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeQuestionnairesViewModel(courseId: courseId),
      child: Consumer<HomeQuestionnairesViewModel>(
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
            body: viewModel.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ))
                : viewModel.questionnaires.isEmpty
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
                            final questionnaire =
                                viewModel.questionnaires[index];
                            return CustomStudentCardHome(
                              viewModel: viewModel,
                              questionnaire: questionnaire,
                              courseId: courseId,
                              index: index,
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
