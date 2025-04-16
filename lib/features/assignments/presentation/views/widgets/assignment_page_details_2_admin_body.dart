import 'package:attendance_app/features/assignments/presentation/views/widgets/show_degree_assignment_admin.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../../models/question_type3.dart';
// import '../../../../../screens/assignment_page_details_2_student.dart';
// import '../features/tests/models/question_model_admin.dart';

class TestPageDetails2AdminBody extends StatefulWidget {
  final String assignmentTitle;

  const TestPageDetails2AdminBody({Key? key, required this.assignmentTitle})
      : super(key: key);

  @override
  State<TestPageDetails2AdminBody> createState() => _TestPageDetails2AdminBodyState();
}

class _TestPageDetails2AdminBodyState extends State<TestPageDetails2AdminBody> {
  int currentQuestionIndex = 0;
  // Using dynamic lists to store questions and answers
  List<Question> questions = [];
  List<int?> selectedAnswers = [];
  List<File?> uploadedImages = [];
  List<TextEditingController> textControllers = [];

  // Add a new question to the assessment
  void _addNewQuestion(QuestionType3 type) {
    // Create a TextEditingController for question text
    TextEditingController questionController = TextEditingController();

    // Show a dialog to enter question text
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add New Question"),
          content: TextField(
            controller: questionController,
            decoration: InputDecoration(
              hintText: "Enter your question here...",
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (questionController.text.isNotEmpty) {
                  final questionText = questionController.text;
                  // First dismiss this dialog
                  Navigator.of(context).pop();

                  // THEN handle different question types
                  if (type == QuestionType3.trueOrFalse) {
                    _getTrueFalseOptions(questionText);
                  } else if (type == QuestionType3.multipleChoice) {
                    _getMultipleChoiceOptions(questionText);
                  } else {
                    // For essay/upload type, no options needed
                    _createQuestion(
                        questionText,
                        type,
                        []
                    );
                  }
                }
              },
              child: Text("Next"),
            ),
          ],
        );
      },
    );
  }

  // Get True/False custom options
  void _getTrueFalseOptions(String questionText) {
    // Controllers for True and False option texts
    TextEditingController trueOptionController = TextEditingController(text: "True");
    TextEditingController falseOptionController = TextEditingController(text: "False");

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Set True/False Options"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: trueOptionController,
                decoration: InputDecoration(
                  labelText: "True Option Text",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: falseOptionController,
                decoration: InputDecoration(
                  labelText: "False Option Text",
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                List<String> options = [
                  trueOptionController.text.isNotEmpty ? trueOptionController.text : "True",
                  falseOptionController.text.isNotEmpty ? falseOptionController.text : "False",
                ];
                _createQuestion(questionText, QuestionType3.trueOrFalse, options);
                Navigator.of(context).pop();
              },
              child: Text("Add Question"),
            ),
          ],
        );
      },
    );
  }

  // Get Multiple Choice custom options
  void _getMultipleChoiceOptions(String questionText) {
    // Controllers for 4 multiple choice options
    List<TextEditingController> optionControllers = List.generate(
        4, (index) => TextEditingController(text: "Option ${index + 1}")
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Set Multiple Choice Options"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(4, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: TextField(
                    controller: optionControllers[index],
                    decoration: InputDecoration(
                      labelText: "Option ${index + 1}",
                      border: OutlineInputBorder(),
                    ),
                  ),
                );
              }),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                List<String> options = optionControllers
                    .map((controller) => controller.text.isNotEmpty
                    ? controller.text
                    : "Option")
                    .toList();

                _createQuestion(questionText, QuestionType3.multipleChoice, options);
                Navigator.of(context).pop();
              },
              child: Text("Add Question"),
            ),
          ],
        );
      },
    );
  }

  // Create and add the question to the list
  void _createQuestion(String questionText, QuestionType3 type, List<String> options) {
    setState(() {
      Question newQuestion = Question(
        questionText: questionText,
        questionType: type,
        correctAnswer: -1, // No correct answer yet
        options: options,
        hasImage: false,
      );

      // Add the new question and related data
      questions.add(newQuestion);
      selectedAnswers.add(null);
      uploadedImages.add(null);
      textControllers.add(TextEditingController());

      // Set the current question to the new one
      currentQuestionIndex = questions.length - 1;
    });
  }

  // Show question type options
  void _showQuestionTypeOptions() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Question Type"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.check_circle_outline),
                title: Text("True or False"),
                onTap: () {
                  Navigator.pop(context);
                  _addNewQuestion(QuestionType3.trueOrFalse);
                },
              ),
              ListTile(
                leading: Icon(Icons.list),
                title: Text("Multiple Choice"),
                onTap: () {
                  Navigator.pop(context);
                  _addNewQuestion(QuestionType3.multipleChoice);
                },
              ),
              ListTile(
                leading: Icon(Icons.upload_file),
                title: Text("Upload File"),
                onTap: () {
                  Navigator.pop(context);
                  _addNewQuestion(QuestionType3.essayWithImage);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Save answers function
  void _saveAnswers() {
    // Here you can implement the logic to save answers
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Answers saved successfully!'),
        duration: Duration(seconds: 2),
        backgroundColor: const Color(0xFF1A75FF),
      ),
    );
  }

  // Function to handle star icon tap
  void _handleStarTap() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AdminShowDegreeOfStudent()),
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
    // The rest of the build method remains the same
    // Colors used in the app
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
        // Add star icon instead of back button
        leading: IconButton(
          icon: Icon(Icons.star, color: Colors.white),
          onPressed: _handleStarTap,
        ),
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
      // Add floating action button for adding new questions
      floatingActionButton: FloatingActionButton(
        onPressed: _showQuestionTypeOptions,
        backgroundColor: primaryBlue,
        child: Icon(Icons.add),
      ),
      body: questions.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_circle_outline,
              size: 80,
              color: primaryBlue.withOpacity(0.5),
            ),
            SizedBox(height: 20),
            Text(
              "No questions yet",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: primaryBlue,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Tap the + button to add your first question",
              style: TextStyle(
                fontSize: 16,
                color: primaryBlue.withOpacity(0.7),
              ),
            ),
          ],
        ),
      )
          : Padding(
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
                    questions[currentQuestionIndex].questionText,
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

            // Essay with Image Upload for upload file type
            if (questions[currentQuestionIndex].questionType == QuestionType3.essayWithImage)
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
            if (questions.isNotEmpty &&
                questions[currentQuestionIndex].questionType == QuestionType3.trueOrFalse)
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
                              questions[currentQuestionIndex].options[0],
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
                              questions[currentQuestionIndex].options[1],
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
            if (questions.isNotEmpty &&
                questions[currentQuestionIndex].questionType == QuestionType3.multipleChoice)
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
                                  questions[currentQuestionIndex].options[0],
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
                                  questions[currentQuestionIndex].options[1],
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
                                  questions[currentQuestionIndex].options[2],
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
                                  questions[currentQuestionIndex].options[3],
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
            if (questions.isNotEmpty &&
                questions[currentQuestionIndex].questionType != QuestionType3.essayWithImage)
              const Spacer(),

            // Bottom Questions List (Horizontal Scrollable)
            if (questions.isNotEmpty)
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
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: questions.length,
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                        itemBuilder: (context, index) {
                          // Add indicator for answered questions
                          bool isAnswered = false;

                          if (questions[index].questionType ==
                              QuestionType3.essayWithImage) {
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
                            questionTypeText = "اختيار";
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
                    // Add a divider between the list and the + button
                    Container(
                      height: 50,
                      width: 1,
                      color: primaryBlue.withOpacity(0.3),
                      margin: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    // Add question button
                    GestureDetector(
                      onTap: _showQuestionTypeOptions,
                      child: Container(
                        width: 50,
                        height: double.infinity,
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: mediumBlue,
                          border: Border.all(
                            color: primaryBlue,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.add,
                          color: primaryBlue,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
