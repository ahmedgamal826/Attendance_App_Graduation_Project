
// Question Models
enum QuestionType3 {
  trueOrFalse,
  multipleChoice,
  essayWithImage, // New question type for questions 5 and 6
}

class Question {
  final String questionText;
  final QuestionType3 questionType;
  final int correctAnswer; // 0-based index of correct answer in options
  final List<String> options;
  final bool hasImage;
  final String? imagePath;

  Question({
    required this.questionText,
    required this.questionType,
    required this.correctAnswer,
    required this.options,
    this.hasImage = false,
    this.imagePath,
  });
}
