
// Question Models
enum QuestionType {
  trueOrFalse,
  multipleChoice,
  essayWithImage,
}

class Question {
  final String questionText;
  final QuestionType questionType;
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
