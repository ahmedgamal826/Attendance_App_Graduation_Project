class QuestionModel {
  final String type;
  final String question;
  final List<String> options;
  final String? correct;

  QuestionModel({
    required this.type,
    required this.question,
    this.options = const [],
    this.correct,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'question': question,
      'options': options,
      'correct': correct,
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      type: map['type'],
      question: map['question'],
      options: List<String>.from(map['options']),
      correct: map['correct'],
    );
  }
}
