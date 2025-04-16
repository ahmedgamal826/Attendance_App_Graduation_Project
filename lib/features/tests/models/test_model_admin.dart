class TestModel {
  String name;
  String date;

  TestModel({
    required this.name,
    required this.date,
  });

  // Factory method to create a model from raw data
  factory TestModel.fromJson(Map<String, dynamic> json) {
    return TestModel(
      name: json['name'] as String,
      date: json['date'] as String,
    );
  }

  // Convert model to raw data
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'date': date,
    };
  }
}