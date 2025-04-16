import 'package:attendance_app/features/assignments/presentation/views/widgets/assignment_page_details_student_body.dart';
import 'package:flutter/material.dart';
import '../../models/question_model_student.dart';

class TestPageDetailsStudent extends StatefulWidget {
  final String assignmentTitle;

  const TestPageDetailsStudent({
    Key? key,
    required this.assignmentTitle,
  }) : super(key: key);

  @override
  State<TestPageDetailsStudent> createState() => _TestPageDetailsStudentState();
}

class _TestPageDetailsStudentState extends State<TestPageDetailsStudent> {
  int currentQuestionIndex = 0;

  // Sample questions list
  final List<Question> questions = [
    Question(
      questionText: "Is Flutter developed by Google?",
      questionType: QuestionType2.trueOrFalse,
      correctAnswer: 0, // True
      options: ["True", "False"],
      hasImage: false,
    ),
    Question(
      questionText: "Which is NOT a programming language?",
      questionType: QuestionType2.multipleChoice,
      correctAnswer: 1, // HTML
      options: ["Python", "HTML", "JavaScript", "Kotlin"],
      hasImage: false,
    ),
    Question(
      questionText: "What widget is shown in this diagram?",
      questionType: QuestionType2.multipleChoice,
      correctAnswer: 0, // ListView
      options: ["ListView", "Container", "Scaffold", "Column"],
      hasImage: true,
      imagePath: "assets/images/img.png", // مسار الصورة
    ),
    Question(
      questionText: "Which widget is used for scrollable lists in Flutter?",
      questionType: QuestionType2.multipleChoice,
      correctAnswer: 0, // ListView
      options: ["ListView", "Container", "Scaffold", "Text"],
      hasImage: false,
    ),
    Question(
      questionText: "Dart is a strongly typed language.",
      questionType: QuestionType2.trueOrFalse,
      correctAnswer: 0, // True
      options: ["True", "False"],
      hasImage: false,
    ),
    Question(
      questionText:
          "Which state management solution is NOT officially supported by Flutter?",
      questionType: QuestionType2.multipleChoice,
      correctAnswer: 3, // MobX
      options: ["Provider", "Riverpod", "Bloc", "MobX"],
      hasImage: false,
    ),
    Question(
      questionText: "Hot Reload preserves the app state.",
      questionType: QuestionType2.trueOrFalse,
      correctAnswer: 0, // True
      options: ["True", "False"],
      hasImage: false,
    ),
    Question(
      questionText: "What does 'pubspec.yaml' define in a Flutter project?",
      questionType: QuestionType2.multipleChoice,
      correctAnswer: 2, // Dependencies
      options: [
        "UI Layout",
        "App Functionality",
        "Dependencies",
        "Platform Settings"
      ],
      hasImage: false,
    ),
    Question(
      questionText:
          "Flutter uses the same codebase for mobile, web, and desktop.",
      questionType: QuestionType2.trueOrFalse,
      correctAnswer: 0, // True
      options: ["True", "False"],
      hasImage: false,
    ),
    Question(
      questionText: "Which of these is NOT a Flutter widget?",
      questionType: QuestionType2.multipleChoice,
      correctAnswer: 3, // Fragment
      options: ["AppBar", "Column", "Expanded", "Fragment"],
      hasImage: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // الألوان المستخدمة في التطبيق
    final Color primaryBlue = const Color(0xFF1A75FF);

    return Scaffold(
      backgroundColor: const Color(0xFFF0F7FF),
      appBar: AppBar(
        title: Text(
          widget.assignmentTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: primaryBlue,
        elevation: 0,
        centerTitle: true,
      ),
      body: TestPageDetailsStudentBody(
        questions: questions,
        currentQuestionIndex: currentQuestionIndex,
        onQuestionChanged: (index) {
          setState(() {
            currentQuestionIndex = index;
          });
        },
      ),
    );
  }
}
