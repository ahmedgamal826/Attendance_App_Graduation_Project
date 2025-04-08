import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/questionnaire/presentation/views/admin_questionnaire_view.dart';
import 'package:attendance_app/features/questionnaire/presentation/views/student_filled_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../viewmodels/home_questionnaires_viewmodel.dart';
import '../../data/models/question_model.dart';

class HomeQuestionnairesView extends StatelessWidget {
  const HomeQuestionnairesView({Key? key}) : super(key: key);

  void _deleteQuestionnaire(
      BuildContext context, HomeQuestionnairesViewModel viewModel, int index) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.bottomSlide,
      title: 'Confirm Deletion',
      desc:
          'Are you sure you want to delete ${viewModel.questionnaires[index].name}?',
      btnCancelOnPress: () =>
          viewModel.selectQuestionnaire(-1), // Reset selection
      btnOkOnPress: () => viewModel.deleteQuestionnaire(index),
      btnOkText: 'Confirm',
      btnCancelText: 'Cancel',
      btnOkColor: Colors.red,
      btnCancelColor: Colors.grey,
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeQuestionnairesViewModel(),
      child: Consumer<HomeQuestionnairesViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home Questionnaires',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              backgroundColor: AppColors.primaryColor,
              actions: [
                IconButton(
                  icon: const Icon(Icons.people, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StudentsFilledView()));
                  },
                  tooltip: 'View Students Who Filled',
                ),
              ],
            ),
            body: viewModel.questionnaires.isEmpty
                ? const Center(
                    child: Text('No questionnaires available. Add a new one!',
                        style: TextStyle(fontSize: 18, color: Colors.grey)))
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView.builder(
                      itemCount: viewModel.questionnaires.length,
                      itemBuilder: (context, index) {
                        final questionnaire = viewModel.questionnaires[index];
                        return Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          color: viewModel.selectedIndex == index
                              ? Colors.blue[100]
                              : null,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AdminQuestionnaireView(
                                    initialQuestions: questionnaire.questions
                                        .map((q) => q.toMap())
                                        .toList(),
                                  ),
                                ),
                              );
                            },
                            onLongPress: () {
                              viewModel.selectQuestionnaire(index);
                              _deleteQuestionnaire(context, viewModel, index);
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
                                        color: Colors.black87),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Date: ${questionnaire.date}',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey)),
                                      Text('By: ${questionnaire.doctor}',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
            floatingActionButton: FloatingActionButton(
              heroTag: "admin_home_questionnaire_screen",
              onPressed: () async {
                final newQuestions = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const AdminQuestionnaireView(initialQuestions: [])),
                );
                if (newQuestions != null &&
                    newQuestions is List &&
                    newQuestions.isNotEmpty) {
                  print(
                      'Adding new questionnaire with questions: $newQuestions');
                  viewModel.addQuestionnaire(
                    newQuestions
                        .map((q) =>
                            QuestionModel.fromMap(q as Map<String, dynamic>))
                        .toList(),
                  );
                } else {
                  print('No questions returned from AdminQuestionnaireView');
                }
              },
              backgroundColor: AppColors.primaryColor,
              child: const Icon(Icons.add, color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
