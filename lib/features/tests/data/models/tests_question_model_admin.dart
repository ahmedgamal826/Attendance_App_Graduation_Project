enum TestsQuestionType {
  trueOrFalse,
  multipleChoice,
  essayWithImage,
}

class TestsQuestion {
  final String questionText;
  final TestsQuestionType questionType;
  final int correctAnswer;
  final List<String> options;
  final bool hasImage;
  final String? imagePath;

  TestsQuestion({
    required this.questionText,
    required this.questionType,
    required this.correctAnswer,
    required this.options,
    this.hasImage = false,
    this.imagePath,
  });
}

class TestsQuestionModel {
  final String type;
  final String question;
  final List<String> options;
  final String? correct;
  final String? fileUrl;
  final String? fileName;
  final String? fileType;
  final int? fileSize;

  TestsQuestionModel({
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

  factory TestsQuestionModel.fromMap(Map<String, dynamic> map) {
    return TestsQuestionModel(
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
