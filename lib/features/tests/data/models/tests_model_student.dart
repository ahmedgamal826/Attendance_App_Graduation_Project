class TestsTestsModel {
  final String title;
  final String date;
  final String score;
  final bool isCompleted;
  final String? examDate;
  final String? startTime;
  final String? endTime;
  final String doctor;
  final int version;

  TestsTestsModel({
    required this.title,
    required this.date,
    required this.score,
    required this.isCompleted,
    this.examDate,
    this.startTime,
    this.endTime,
    this.doctor = 'Unknown',
    this.version = 1,
  });

  factory TestsTestsModel.fromJson(Map<String, dynamic> json) {
    return TestsTestsModel(
      title: json['name'] ?? json['title'] ?? '',
      date: json['date'] ?? '',
      score: json['score'] ?? 'No Degree',
      isCompleted: json['isCompleted'] ?? false,
      examDate: json['examDate'],
      startTime: json['startTime'],
      endTime: json['endTime'],
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
      'examDate': examDate,
      'startTime': startTime,
      'endTime': endTime,
      'doctor': doctor,
      'version': version,
    };
  }

  static TestsTestsModel fromAdminModel(Map<String, dynamic> adminModel) {
    return TestsTestsModel(
      title: adminModel['name'] ?? '',
      date: adminModel['date'] ?? '',
      score: 'No Degree',
      isCompleted: false,
      examDate: adminModel['examDate'],
      startTime: adminModel['startTime'],
      endTime: adminModel['endTime'],
      doctor: adminModel['doctor'] ?? 'Unknown',
      version: adminModel['version'] ?? 1,
    );
  }
}
