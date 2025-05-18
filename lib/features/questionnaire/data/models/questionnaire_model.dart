// // import 'package:attendance_app/features/questionnaire/data/models/question_model.dart';

// // class QuestionnaireModel {
// //   final String name;
// //   final String date;
// //   final String doctor;
// //   final List<QuestionModel> questions;
// //   final bool isCompleted;

// //   QuestionnaireModel({
// //     required this.name,
// //     required this.date,
// //     required this.doctor,
// //     required this.questions,
// //     this.isCompleted = false, // Default value is false
// //   });

// //   Map<String, dynamic> toMap() {
// //     return {
// //       'name': name,
// //       'date': date,
// //       'doctor': doctor,
// //       'questions': questions.map((q) => q.toMap()).toList(),
// //       'isCompleted': isCompleted,
// //     };
// //   }

// //   factory QuestionnaireModel.fromMap(Map<String, dynamic> map) {
// //     return QuestionnaireModel(
// //       name: map['name'],
// //       date: map['date'],
// //       doctor: map['doctor'],
// //       questions: (map['questions'] as List<dynamic>)
// //           .map((q) => QuestionModel.fromMap(q as Map<String, dynamic>))
// //           .toList(),
// //       isCompleted: map['isCompleted'] ?? false,
// //     );
// //   }
// // }

// import 'package:attendance_app/features/questionnaire/data/models/question_model.dart';

// class QuestionnaireModel {
//   final String name;
//   final String date;
//   final String doctor;
//   final List<QuestionModel> questions;

//   QuestionnaireModel({
//     required this.name,
//     required this.date,
//     required this.doctor,
//     required this.questions,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'name': name,
//       'date': date,
//       'doctor': doctor,
//       'questions': questions.map((q) => q.toMap()).toList(),
//     };
//   }

//   factory QuestionnaireModel.fromMap(Map<String, dynamic> map) {
//     return QuestionnaireModel(
//       name: map['name'],
//       date: map['date'],
//       doctor: map['doctor'],
//       questions: (map['questions'] as List<dynamic>)
//           .map((q) => QuestionModel.fromMap(q as Map<String, dynamic>))
//           .toList(),
//     );
//   }
// }

import 'package:attendance_app/features/questionnaire/data/models/question_model.dart';

class QuestionnaireModel {
  final String name;
  final List<QuestionModel> questions;
  final String date;
  final String doctor;
  final int version; // حقل الإصدار

  QuestionnaireModel({
    required this.name,
    required this.questions,
    required this.date,
    required this.doctor,
    this.version = 1, // القيمة الافتراضية هي 1
  });

  factory QuestionnaireModel.fromMap(Map<String, dynamic> map) {
    return QuestionnaireModel(
      name: map['name'] ?? '',
      questions: (map['questions'] as List)
          .map((q) => QuestionModel.fromMap(q))
          .toList(),
      date: map['date'] ?? '',
      doctor: map['doctor'] ?? '',
      version: map['version'] as int? ?? 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'questions': questions.map((q) => q.toMap()).toList(),
      'date': date,
      'doctor': doctor,
      'version': version,
    };
  }
}
