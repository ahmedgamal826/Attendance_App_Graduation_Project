import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/questionnaire/presentation/viewmodels/student_questionnaire_viewmode.dart';
import 'package:attendance_app/features/questionnaire/presentation/views/widgets/question_card.dart';
import 'package:attendance_app/features/questionnaire/presentation/views/widgets/question_content.dart';
import 'package:attendance_app/features/questionnaire/presentation/views/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentQuestionnaireView extends StatelessWidget {
  final String questionnaireId;
  final VoidCallback onSubmit;

  const StudentQuestionnaireView({
    Key? key,
    required this.questionnaireId,
    required this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final viewModel = StudentQuestionnaireViewmodel();
        return viewModel;
      },
      child: Consumer<StudentQuestionnaireViewmodel>(
        builder: (context, viewModel, child) {
          bool allQuestionsAnswered = viewModel.areAllQuestionsAnswered();

          return Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              title: const Text(
                'Answer Questionnaire',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: AppColors.primaryColor,
            ),
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: viewModel.questions.isEmpty
                        ? const Center(
                            child: Text(
                              'No questions available in this questionnaire.',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        : QuestionContent(
                            question: viewModel.currentQuestion,
                            onAnswerSelected: (answer) {
                              viewModel.setAnswer(
                                  viewModel.currentQuestionIndex, answer);
                            },
                            selectedAnswer: viewModel
                                .getAnswer(viewModel.currentQuestionIndex),
                          ),
                  ),
                ),
                SubmitButton(
                  viewModel: viewModel,
                  allQuestionsAnswered: allQuestionsAnswered,
                  onSubmit: onSubmit,
                ),
                if (!allQuestionsAnswered && viewModel.questions.isNotEmpty)
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Please answer all questions before submitting',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                Container(
                  height: 80,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  color: Colors.grey.shade200,
                  child: viewModel.questions.isEmpty
                      ? const Center(
                          child: Text(
                            'No questions yet',
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: viewModel.questions.length,
                          itemBuilder: (context, index) {
                            bool isAnswered =
                                viewModel.isQuestionAnswered(index);
                            return QuestionCard(
                              role: 'Student',
                              index: index,
                              isSelected:
                                  viewModel.currentQuestionIndex == index,
                              isAnswered: isAnswered,
                              onTap: () {
                                viewModel.selectQuestion(index);
                              },
                              onDelete: () {},
                            );
                          },
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
