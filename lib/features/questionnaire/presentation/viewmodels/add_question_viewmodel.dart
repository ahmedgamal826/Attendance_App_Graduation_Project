import 'package:attendance_app/features/questionnaire/data/models/question_model.dart';
import 'package:flutter/material.dart';

class AddQuestionViewModel extends ChangeNotifier {
  final String questionType;
  QuestionModel? existingQuestion;

  late TextEditingController questionController;
  List<TextEditingController> mcqOptionControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  String? correctAnswerTrueFalse;
  int? correctAnswerMcq;

  AddQuestionViewModel({
    required this.questionType,
    this.existingQuestion,
  }) {
    questionController =
        TextEditingController(text: existingQuestion?.question);
    if (existingQuestion != null) {
      if (questionType == 'TrueFalse') {
        correctAnswerTrueFalse = existingQuestion!.correct;
      } else if (questionType == 'MCQ') {
        for (int i = 0;
            i < existingQuestion!.options.length &&
                i < mcqOptionControllers.length;
            i++) {
          mcqOptionControllers[i].text = existingQuestion!.options[i];
        }
        correctAnswerMcq =
            existingQuestion!.options.indexOf(existingQuestion!.correct ?? '');
      }
    }
    print(
        'AddQuestionViewModel initialized for $questionType, existing: ${existingQuestion?.toMap()}');
  }

  void setCorrectAnswerTrueFalse(String? value) {
    correctAnswerTrueFalse = value;
    print('Set correctAnswerTrueFalse: $value');
    notifyListeners();
  }

  void setCorrectAnswerMcq(int? value) {
    correctAnswerMcq = value;
    print('Set correctAnswerMcq: $value');
    notifyListeners();
  }

  QuestionModel? saveQuestion() {
    if (questionController.text.isEmpty) {
      print('saveQuestion: Question text is empty');
      return null;
    }

    if (questionType == 'TrueFalse') {
      if (correctAnswerTrueFalse == null) {
        print('saveQuestion: TrueFalse correct answer not selected');
        return null;
      }
      final question = QuestionModel(
        type: 'TrueFalse',
        question: questionController.text,
        options: ['True', 'False'],
        correct: correctAnswerTrueFalse,
      );
      print('saveQuestion: Created TrueFalse question: ${question.toMap()}');
      return question;
    } else if (questionType == 'MCQ') {
      final options = mcqOptionControllers.map((c) => c.text).toList();
      if (options.any((o) => o.isEmpty) || correctAnswerMcq == null) {
        print('saveQuestion: MCQ options incomplete or no correct answer');
        return null;
      }
      final question = QuestionModel(
        type: 'MCQ',
        question: questionController.text,
        options: options,
        correct: options[correctAnswerMcq!],
      );
      print('saveQuestion: Created MCQ question: ${question.toMap()}');
      return question;
    } else {
      final question = QuestionModel(
        type: 'Essay',
        question: questionController.text,
      );
      print('saveQuestion: Created Essay question: ${question.toMap()}');
      return question;
    }
  }

  @override
  void dispose() {
    questionController.dispose();
    for (var controller in mcqOptionControllers) {
      controller.dispose();
    }
    print('AddQuestionViewModel disposed');
    super.dispose();
  }
}
