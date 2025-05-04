import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/questionnaire/data/models/questionnaire_model.dart';
import 'package:attendance_app/features/questionnaire/presentation/viewmodels/home_questionnaires_viewmodel.dart';
import 'package:attendance_app/features/questionnaire/presentation/views/student_questionnaire_view.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomStudentCardHome extends StatelessWidget {
  const CustomStudentCardHome({
    super.key,
    required this.questionnaire,
    required this.viewModel,
    required this.courseId,
    required this.index,
  });

  final QuestionnaireModel questionnaire;
  final HomeQuestionnairesViewModel viewModel;
  final String courseId;
  final int index;

  @override
  Widget build(BuildContext context) {
    String formattedDate;
    try {
      final parsedDate =
          DateFormat('dd-MM-yyyy HH:mm').parseStrict(questionnaire.date);
      formattedDate = DateFormat('dd-MM-yyyy h:mm a').format(parsedDate);
    } catch (e) {
      print('Error parsing date: ${questionnaire.date}, Error: $e');
      formattedDate = DateFormat('dd-MM-yyyy h:mm a').format(DateTime.now());
    }

    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          if (questionnaire.isCompleted) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.info,
              animType: AnimType.bottomSlide,
              title: 'Submission Already Recorded',
              desc:
                  'You have already submitted your response for this questionnaire.',
              btnOkOnPress: () {},
              btnOkText: 'OK',
              btnOkColor: AppColors.primaryColor,
            ).show();
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StudentQuestionnaireView(
                  questionnaireId: questionnaire.name,
                  courseId: courseId,
                  onSubmit: () {
                    viewModel.markQuestionnaireAsCompleted(questionnaire.name);
                  },
                ),
              ),
            );
          }
        },
        borderRadius: BorderRadius.circular(16),
        splashColor: AppColors.primaryColor.withOpacity(0.2),
        highlightColor: AppColors.primaryColor.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Questionnaire ${index + 1}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Date: $formattedDate',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'By: ${questionnaire.doctor}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              questionnaire.isCompleted
                  ? Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 20,
                      ),
                    )
                  : const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.primaryColor,
                      size: 24,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
