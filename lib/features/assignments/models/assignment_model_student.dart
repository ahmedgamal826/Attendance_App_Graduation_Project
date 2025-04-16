class TestModel {
  final String title;
  final String date;
  final String score;
  final bool isCompleted;

  TestModel({
    required this.title,
    required this.date,
    required this.score,
    required this.isCompleted,
  });

  factory TestModel.fromJson(Map<String, dynamic> json) {
    return TestModel(
      title: json['title'] ?? '',
      date: json['date'] ?? '',
      score: json['score'] ?? 'No Degree',
      isCompleted: json['isCompleted'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'date': date,
      'score': score,
      'isCompleted': isCompleted,
    };
  }
}
