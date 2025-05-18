class TestModel {
  final String title;
  final String date;
  final String score;
  final bool isCompleted;
  final String? deadline;
  final String doctor;
  final int version;

  TestModel({
    required this.title,
    required this.date,
    required this.score,
    required this.isCompleted,
    this.deadline,
    this.doctor = 'Unknown',
    this.version = 1,
  });

  factory TestModel.fromJson(Map<String, dynamic> json) {
    return TestModel(
      title: json['name'] ?? json['title'] ?? '',
      date: json['date'] ?? '',
      score: json['score'] ?? 'No Degree',
      isCompleted: json['isCompleted'] ?? false,
      deadline: json['deadline'],
      doctor: json['doctor'] ?? 'Unknown',
      version: json['version'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'date': date,
      'score': score,
      'isCompleted': isCompleted,
      'deadline': deadline,
      'doctor': doctor,
      'version': version,
    };
  }

  // Helper method to create TestModel from admin assignment model
  static TestModel fromAdminModel(Map<String, dynamic> adminModel) {
    return TestModel(
      title: adminModel['name'] ?? '',
      date: adminModel['date'] ?? '',
      score: 'No Degree', // Default score for new assignments
      isCompleted: false, // Default to not completed
      deadline: adminModel['deadline'],
      doctor: adminModel['doctor'] ?? 'Unknown',
      version: adminModel['version'] ?? 1,
    );
  }
}
