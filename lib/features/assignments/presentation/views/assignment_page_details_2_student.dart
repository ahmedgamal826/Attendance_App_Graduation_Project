import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../../models/question_type3.dart';

class TestPageDetails2Student extends StatefulWidget {
  final String assignmentTitle;

  const TestPageDetails2Student({Key? key, required this.assignmentTitle})
      : super(key: key);

  @override
  State<TestPageDetails2Student> createState() => _TestPageDetails2StudentState();
}

class _TestPageDetails2StudentState extends State<TestPageDetails2Student> {
  int currentQuestionIndex = 0;
  // Track selected answers for multiple choice and true/false questions
  List<int?> selectedAnswers = List.filled(10, null);
  // Track uploaded images for questions 5 and 6
  List<File?> uploadedImages = List.filled(10, null);
  // Track text answers for questions 5 and 6
  List<TextEditingController> textControllers = List.generate(
    10,
        (index) => TextEditingController(),
  );

  // Sample questions list
  final List<Question> questions = [
    Question(
      questionText: "Is Flutter developed by Google?",
      questionType: QuestionType3.trueOrFalse,
      correctAnswer: 0, // True
      options: ["True", "False"],
      hasImage: false,
    ),
    Question(
      questionText: "Which is NOT a programming language?",
      questionType: QuestionType3.multipleChoice,
      correctAnswer: 1, // HTML
      options: ["Python", "HTML", "JavaScript", "Kotlin"],
      hasImage: false,
    ),
    Question(
      questionText: "What widget is shown in this diagram?",
      questionType: QuestionType3.multipleChoice,
      correctAnswer: 0, // ListView
      options: ["ListView", "Container", "Scaffold", "Column"],
      hasImage: true,
      imagePath: "assets/images/img.png", // مسار الصورة
    ),
    Question(
      questionText: "Which widget is used for scrollable lists in Flutter?",
      questionType: QuestionType3.multipleChoice,
      correctAnswer: 0, // ListView
      options: ["ListView", "Container", "Scaffold", "Text"],
      hasImage: false,
    ),
    Question(
      questionText: "Explain the concept of state management in Flutter",
      questionType: QuestionType3.essayWithImage,
      correctAnswer: -1, // Not applicable for essay questions
      options: [],
      hasImage: false,
    ),
    Question(
      questionText: "Describe the Flutter widget lifecycle with an example",
      questionType: QuestionType3.essayWithImage,
      correctAnswer: -1, // Not applicable for essay questions
      options: [],
      hasImage: false,
    ),
    Question(
      questionText: "Hot Reload preserves the app state.",
      questionType: QuestionType3.trueOrFalse,
      correctAnswer: 0, // True
      options: ["True", "False"],
      hasImage: false,
    ),
    Question(
      questionText: "What does 'pubspec.yaml' define in a Flutter project?",
      questionType: QuestionType3.multipleChoice,
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
      questionType: QuestionType3.trueOrFalse,
      correctAnswer: 0, // True
      options: ["True", "False"],
      hasImage: false,
    ),
    Question(
      questionText: "Which of these is NOT a Flutter widget?",
      questionType: QuestionType3.multipleChoice,
      correctAnswer: 3, // Fragment
      options: ["AppBar", "Column", "Expanded", "Fragment"],
      hasImage: false,
    ),
  ];

  // Save answers function
  void _saveAnswers() {
    // Here you can implement the logic to save answers
    // For now, just show a snackbar with selected answers
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Answers saved successfully!'),
        duration: Duration(seconds: 2),
        backgroundColor: const Color(0xFF1A75FF),
      ),
    );
  }

  // Function to pick image from gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        uploadedImages[currentQuestionIndex] = File(pickedFile.path);
      });
    }
  }

  // Show options for image selection
  void _showImageSourceOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // معاينة الصورة بشكل كامل
  void _showFullScreenImage(BuildContext context, String imagePath) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        pageBuilder: (BuildContext context, _, __) {
          return Scaffold(
            backgroundColor: Colors.black.withOpacity(0.85),
            body: SafeArea(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Image with interactive viewer for zoom
                  Center(
                    child: InteractiveViewer(
                      boundaryMargin: const EdgeInsets.all(20),
                      minScale: 0.5,
                      maxScale: 4.0,
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  // Close button
                  Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  // Show uploaded image in full screen
  void _showFullScreenUploadedImage(BuildContext context, File imageFile) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        pageBuilder: (BuildContext context, _, __) {
          return Scaffold(
            backgroundColor: Colors.black.withOpacity(0.85),
            body: SafeArea(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Image with interactive viewer for zoom
                  Center(
                    child: InteractiveViewer(
                      boundaryMargin: const EdgeInsets.all(20),
                      minScale: 0.5,
                      maxScale: 4.0,
                      child: Image.file(
                        imageFile,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  // Close button
                  Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = questions[currentQuestionIndex];

    // الألوان المستخدمة في التطبيق
    final Color primaryBlue = const Color(0xFF1A75FF);
    final Color lightBlue = const Color(0xFFF0F7FF);
    final Color mediumBlue = const Color(0xFFE6F0FF);

    return Scaffold(
      backgroundColor: lightBlue,
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
        actions: [
          // Add Save button to app bar
          TextButton(
            onPressed: _saveAnswers,
            child: const Text(
              "Save",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Question Container
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: primaryBlue,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: primaryBlue.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Question ${currentQuestionIndex + 1}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: primaryBlue,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    currentQuestion.questionText,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Image Container (For questions with images)
            if (currentQuestion.hasImage &&
                currentQuestion.questionType != QuestionType3.essayWithImage)
              Container(
                width: double.infinity,
                height: 200, // ارتفاع الصورة
                decoration: BoxDecoration(
                  color: mediumBlue,
                  border: Border.all(
                    color: primaryBlue,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: primaryBlue.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: GestureDetector(
                  onTap: () {
                    // افتح الصورة في وضع ملء الشاشة عند النقر عليها
                    _showFullScreenImage(
                      context,
                      currentQuestion.imagePath ?? "assets/images/img.png",
                    );
                  },
                  child: Stack(
                    children: [
                      // صورة السؤال
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            currentQuestion.imagePath ??
                                "assets/images/img.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      // أيقونة للإشارة إلى أن الصورة قابلة للتكبير
                      Positioned(
                        bottom: 8,
                        right: 8,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: primaryBlue.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.zoom_in,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            // Essay with Image Upload for questions 5 and 6
            if (currentQuestion.questionType == QuestionType3.essayWithImage)
              Expanded(
                child: Column(
                  children: [
                    // Text field for essay answer
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: primaryBlue,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: primaryBlue.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                        controller: textControllers[currentQuestionIndex],
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: "Write your answer here...",
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: primaryBlue.withOpacity(0.5),
                          ),
                        ),
                        style: TextStyle(
                          color: primaryBlue,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Image upload container
                    Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        color: mediumBlue,
                        border: Border.all(
                          color: primaryBlue,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: primaryBlue.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: uploadedImages[currentQuestionIndex] != null
                          ? Stack(
                        fit: StackFit.expand,
                        children: [
                          // Display uploaded image
                          GestureDetector(
                            onTap: () {
                              _showFullScreenUploadedImage(
                                context,
                                uploadedImages[currentQuestionIndex]!,
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                uploadedImages[currentQuestionIndex]!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          // Options to view or change image
                          Positioned(
                            bottom: 8,
                            right: 8,
                            child: Row(
                              children: [
                                // View button
                                Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: primaryBlue.withOpacity(0.8),
                                    borderRadius:
                                    BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.zoom_in,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                // Change button
                                GestureDetector(
                                  onTap: _showImageSourceOptions,
                                  child: Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: Colors.red.withOpacity(0.8),
                                      borderRadius:
                                      BorderRadius.circular(8),
                                    ),
                                    child: const Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                          : GestureDetector(
                        onTap: _showImageSourceOptions,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.cloud_upload,
                                size: 48,
                                color: primaryBlue,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Upload Image",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: primaryBlue,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Tap to add a photo",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: primaryBlue.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            // True/False options
            if (currentQuestion.questionType == QuestionType3.trueOrFalse)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // True option
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedAnswers[currentQuestionIndex] = 0;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectedAnswers[currentQuestionIndex] == 0
                              ? primaryBlue.withOpacity(0.2)
                              : mediumBlue,
                          border: Border.all(
                            color: primaryBlue,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: primaryBlue.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: primaryBlue,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "True",
                              style: TextStyle(
                                color: primaryBlue,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 4),
                            if (selectedAnswers[currentQuestionIndex] == 0)
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: primaryBlue,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // False option
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedAnswers[currentQuestionIndex] = 1;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectedAnswers[currentQuestionIndex] == 1
                              ? primaryBlue.withOpacity(0.2)
                              : mediumBlue,
                          border: Border.all(
                            color: primaryBlue,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: primaryBlue.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.cancel,
                              color: primaryBlue,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "False",
                              style: TextStyle(
                                color: primaryBlue,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 4),
                            if (selectedAnswers[currentQuestionIndex] == 1)
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: primaryBlue,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            // Multiple choice options
            if (currentQuestion.questionType == QuestionType3.multipleChoice)
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Option 1
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedAnswers[currentQuestionIndex] = 0;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: selectedAnswers[currentQuestionIndex] == 0
                                  ? primaryBlue.withOpacity(0.2)
                                  : mediumBlue,
                              border: Border.all(
                                color: primaryBlue,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: primaryBlue.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  currentQuestion.options[0],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: primaryBlue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (selectedAnswers[currentQuestionIndex] == 0)
                                  Container(
                                    margin: const EdgeInsets.only(left: 4),
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: primaryBlue,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 10,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Option 2
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedAnswers[currentQuestionIndex] = 1;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: selectedAnswers[currentQuestionIndex] == 1
                                  ? primaryBlue.withOpacity(0.2)
                                  : mediumBlue,
                              border: Border.all(
                                color: primaryBlue,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: primaryBlue.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  currentQuestion.options[1],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: primaryBlue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (selectedAnswers[currentQuestionIndex] == 1)
                                  Container(
                                    margin: const EdgeInsets.only(left: 4),
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: primaryBlue,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 10,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Option 3
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedAnswers[currentQuestionIndex] = 2;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: selectedAnswers[currentQuestionIndex] == 2
                                  ? primaryBlue.withOpacity(0.2)
                                  : mediumBlue,
                              border: Border.all(
                                color: primaryBlue,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: primaryBlue.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  currentQuestion.options[2],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: primaryBlue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (selectedAnswers[currentQuestionIndex] == 2)
                                  Container(
                                    margin: const EdgeInsets.only(left: 4),
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: primaryBlue,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 10,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Option 4
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedAnswers[currentQuestionIndex] = 3;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: selectedAnswers[currentQuestionIndex] == 3
                                  ? primaryBlue.withOpacity(0.2)
                                  : mediumBlue,
                              border: Border.all(
                                color: primaryBlue,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: primaryBlue.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  currentQuestion.options[3],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: primaryBlue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (selectedAnswers[currentQuestionIndex] == 3)
                                  Container(
                                    margin: const EdgeInsets.only(left: 4),
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: primaryBlue,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 10,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

            // Spacer for better layout when not showing essay content
            if (currentQuestion.questionType != QuestionType3.essayWithImage)
              const Spacer(),

            // Bottom Questions List (Horizontal Scrollable)
            Container(
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: primaryBlue,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: primaryBlue.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: questions.length,
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                itemBuilder: (context, index) {
                  // Add indicator for answered questions and essays
                  bool isAnswered = false;

                  if (questions[index].questionType ==
                      QuestionType3.essayWithImage) {
                    // Consider essay answered if there's text or an image
                    isAnswered = textControllers[index].text.isNotEmpty ||
                        uploadedImages[index] != null;
                  } else {
                    isAnswered = selectedAnswers[index] != null;
                  }

                  // Get question type display text
                  String questionTypeText;

                  if (questions[index].questionType ==
                      QuestionType3.trueOrFalse) {
                    questionTypeText = "صح/خطأ";
                  } else if (questions[index].questionType ==
                      QuestionType3.multipleChoice) {
                    questionTypeText =
                    questions[index].hasImage ? "صورة" : "اختيار";
                  } else {
                    questionTypeText = "مقالي";
                  }

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentQuestionIndex = index;
                      });
                    },
                    child: Container(
                      width: 80,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: currentQuestionIndex == index
                            ? primaryBlue.withOpacity(0.1)
                            : Colors.transparent,
                        border: Border.all(
                          color: isAnswered ? Colors.green : primaryBlue,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: currentQuestionIndex == index
                                        ? primaryBlue
                                        : isAnswered
                                        ? Colors.green
                                        : primaryBlue,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${index + 1}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                if (isAnswered)
                                  Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.green,
                                          width: 2,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.check,
                                        color: Colors.green,
                                        size: 8,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              questionTypeText,
                              style: TextStyle(
                                color: currentQuestionIndex == index
                                    ? primaryBlue
                                    : isAnswered
                                    ? Colors.green
                                    : primaryBlue,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
