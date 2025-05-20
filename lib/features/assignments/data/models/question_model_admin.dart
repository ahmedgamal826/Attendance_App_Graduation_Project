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

class QuestionModel {
  final String type;
  final String question;
  final List<String> options;
  final String? correct;
  final String? fileUrl;
  final String? fileName;
  final String? fileType;
  final int? fileSize;

  QuestionModel({
    required this.type,
    required this.question,
    this.options = const [],
    this.correct,
    this.fileUrl,
    this.fileName,
    this.fileType,
    this.fileSize,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'question': question,
      'options': options,
      'correct': correct,
      'fileUrl': fileUrl,
      'fileName': fileName,
      'fileType': fileType,
      'fileSize': fileSize,
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      type: map['type'],
      question: map['question'],
      options: List<String>.from(map['options'] ?? []),
      correct: map['correct'],
      fileUrl: map['fileUrl'],
      fileName: map['fileName'],
      fileType: map['fileType'],
      fileSize: map['fileSize'],
    );
  }
}
