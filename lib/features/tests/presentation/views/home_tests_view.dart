import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/assignments/data/models/assignment_model_student.dart';
import 'package:attendance_app/features/tests/data/models/tests_model_admin.dart';
import 'package:attendance_app/features/tests/data/models/tests_question_model_admin.dart';
import 'package:attendance_app/features/tests/presentation/viewmodels/home_tests_viewmodel.dart';
import 'package:attendance_app/features/tests/presentation/views/admin_tests_view.dart';
import 'package:attendance_app/features/tests/presentation/views/widgets/tests_list_item_admin.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeTestsView extends StatelessWidget {
  final String courseId;

  const HomeTestsView({Key? key, required this.courseId}) : super(key: key);

  void _deleteTest(
      BuildContext context, TestsHomeViewModel viewModel, int index) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.bottomSlide,
      title: 'Confirm Deletion',
      desc:
          'Are you sure you want to delete ${viewModel.assignments[index].name}?',
      btnCancelOnPress: () => viewModel.selectAssignment(-1),
      btnOkOnPress: () => viewModel.deleteAssignment(index),
      btnOkText: 'Confirm',
      btnCancelText: 'Cancel',
      btnOkColor: Colors.red,
      btnCancelColor: Colors.grey,
    ).show();
  }

  void _showAddTestDialog(BuildContext context, TestsHomeViewModel viewModel) {
    String newTestName = '';
    DateTime? selectedDeadline;
    TextEditingController deadlineController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Add New Test',
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  cursorColor: AppColors.primaryColor,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Enter test name',
                    filled: true,
                    fillColor: Colors.grey.shade50,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor,
                        width: 2,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    newTestName = value;
                  },
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: deadlineController,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: 'Select deadline (optional)',
                    filled: true,
                    fillColor: Colors.grey.shade50,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor,
                        width: 2,
                      ),
                    ),
                    prefixIcon: const Icon(Icons.calendar_today,
                        color: AppColors.primaryColor),
                  ),
                  onTap: () async {
                    // Show date picker
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now().add(const Duration(days: 7)),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: const ColorScheme.light(
                              primary: AppColors.primaryColor,
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );

                    if (pickedDate != null) {
                      // Show time picker
                      final TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: const ColorScheme.light(
                                primary: AppColors.primaryColor,
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );

                      if (pickedTime != null) {
                        // Combine date and time
                        selectedDeadline = DateTime(
                          pickedDate.year,
                          pickedDate.month,
                          pickedDate.day,
                          pickedTime.hour,
                          pickedTime.minute,
                        );

                        // Format the deadline for display
                        deadlineController.text =
                            DateFormat('dd-MM-yyyy h:mm a')
                                .format(selectedDeadline!);
                      }
                    }
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (newTestName.isNotEmpty) {
                  Navigator.pop(context);
                  String? formattedDeadline;
                  if (selectedDeadline != null) {
                    formattedDeadline = DateFormat('dd-MM-yyyy HH:mm')
                        .format(selectedDeadline!);
                  }
                  _addOrUpdateTest(context, viewModel,
                      name: newTestName, deadline: formattedDeadline);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Continue'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _addOrUpdateTest(
      BuildContext context, TestsHomeViewModel viewModel,
      {List<Map<String, dynamic>> initialQuestions = const [],
      String? testId,
      String? name,
      String? deadline}) async {
    final newQuestions = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdminTestsView(
          courseId: courseId,
          initialTestsQuestions: initialQuestions,
        ),
      ),
    );

    if (newQuestions == null || newQuestions is! List || newQuestions.isEmpty) {
      return;
    }

    try {
      final questionsList = newQuestions
          .map((q) => TestsQuestionModel.fromMap(q as Map<String, dynamic>))
          .toList();

      if (testId == null) {
        await viewModel.addAssignment(name!, questionsList, deadline: deadline);
      } else {
        await viewModel.updateAssignment(testId, questionsList,
            deadline: deadline);
      }
    } catch (e) {
      print('Error in _addOrUpdateTest: $e');
    }
  }

  void _showEditTestDialog(BuildContext context, TestsHomeViewModel viewModel,
      TestsAssignmentModel test) {
    String newTestName = test.name;
    DateTime? selectedDeadline;
    TextEditingController nameController =
        TextEditingController(text: test.name);
    TextEditingController deadlineController = TextEditingController();

    // Initialize the deadline controller if a deadline exists
    if (test.deadline != null) {
      try {
        final parsedDate =
            DateFormat('dd-MM-yyyy HH:mm').parseStrict(test.deadline!);
        selectedDeadline = parsedDate;
        deadlineController.text =
            DateFormat('dd-MM-yyyy h:mm a').format(parsedDate);
      } catch (e) {
        print('Error parsing date: ${test.deadline}, Error: $e');
      }
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Edit Test',
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  cursorColor: AppColors.primaryColor,
                  controller: nameController,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Test Name',
                    labelStyle: const TextStyle(
                      color: AppColors.primaryColor,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade50,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor,
                        width: 2,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    newTestName = value;
                  },
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: deadlineController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Deadline',
                    filled: true,
                    fillColor: Colors.grey.shade50,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColor,
                        width: 2,
                      ),
                    ),
                    prefixIcon: const Icon(Icons.calendar_today,
                        color: AppColors.primaryColor),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear, color: Colors.grey),
                      onPressed: () {
                        deadlineController.clear();
                        selectedDeadline = null;
                      },
                    ),
                  ),
                  onTap: () async {
                    // Show date picker
                    final initialDate = selectedDeadline ??
                        DateTime.now().add(const Duration(days: 7));

                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: initialDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: const ColorScheme.light(
                              primary: AppColors.primaryColor,
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );

                    if (pickedDate != null) {
                      // Show time picker
                      final initialTime = selectedDeadline != null
                          ? TimeOfDay(
                              hour: selectedDeadline!.hour,
                              minute: selectedDeadline!.minute)
                          : TimeOfDay.now();

                      final TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: initialTime,
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: const ColorScheme.light(
                                primary: AppColors.primaryColor,
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );

                      if (pickedTime != null) {
                        // Combine date and time
                        selectedDeadline = DateTime(
                          pickedDate.year,
                          pickedDate.month,
                          pickedDate.day,
                          pickedTime.hour,
                          pickedTime.minute,
                        );

                        // Format the deadline for display
                        deadlineController.text =
                            DateFormat('dd-MM-yyyy h:mm a')
                                .format(selectedDeadline!);
                      }
                    }
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel',
                  style: TextStyle(color: AppColors.primaryColor)),
            ),
            ElevatedButton(
              onPressed: () {
                if (newTestName.isNotEmpty) {
                  Navigator.pop(context);

                  // Format deadline for storage
                  String? formattedDeadline;
                  if (selectedDeadline != null) {
                    formattedDeadline = DateFormat('dd-MM-yyyy HH:mm')
                        .format(selectedDeadline!);
                  }

                  // Update test with new name and deadline
                  _updateTestDetails(
                    context,
                    viewModel,
                    test,
                    newName: newTestName,
                    newDeadline: formattedDeadline,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Save Changes'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _updateTestDetails(BuildContext context,
      TestsHomeViewModel viewModel, TestsAssignmentModel test,
      {required String newName, String? newDeadline}) async {
    try {
      await viewModel.updateAssignmentDetails(
        test.name,
        newName: newName,
        deadline: newDeadline,
      );
    } catch (e) {
      print('Error updating test details: $e');
    }
  }

  void _editTestQuestions(BuildContext context, TestsHomeViewModel viewModel,
      TestsAssignmentModel test) {
    _addOrUpdateTest(
      context,
      viewModel,
      initialQuestions: test.questions.map((q) => q.toMap()).toList(),
      testId: test.name,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (_) => TestsHomeViewModel(courseId: courseId),
      child: Consumer<TestsHomeViewModel>(
        builder: (context, viewModel, child) {
          // إظهار رسائل النجاح
          if (viewModel.successMessage.isNotEmpty) {
            // جدولة رسالة النجاح لتظهر بعد بناء الواجهة
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(viewModel.successMessage),
                  backgroundColor: Colors.green,
                ),
              );
              // مسح الرسالة بعد عرضها
              viewModel.clearMessages();
            });
          }

          // إظهار رسائل الخطأ
          if (viewModel.errorMessage.isNotEmpty) {
            // جدولة رسالة الخطأ لتظهر بعد بناء الواجهة
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(viewModel.errorMessage),
                  backgroundColor: Colors.red,
                ),
              );
              // مسح الرسالة بعد عرضها
              viewModel.clearMessages();
            });
          }

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text('Tests',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              backgroundColor: AppColors.primaryColor,
            ),
            // عرض مؤشر التحميل الرئيسي
            body: Stack(
              children: [
                // محتوى الصفحة الرئيسي
                viewModel.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ))
                    : viewModel.assignments.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.assignment,
                                    size: 80, color: Colors.grey),
                                SizedBox(height: screenHeight * 0.03),
                                Text('No Tests available',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: screenHeight * 0.03,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(height: screenHeight * 0.01),
                                Text('Click the "+" button to add a new one!',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: screenHeight * 0.02,
                                        color: Colors.grey)),
                              ],
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.all(screenWidth * 0.04),
                            child: ListView.builder(
                              itemCount: viewModel.assignments.length,
                              itemBuilder: (context, index) {
                                final test = viewModel.assignments[index];
                                return TestsListItemAdmin(
                                  test: test,
                                  animation: AlwaysStoppedAnimation(1.0),
                                  onDelete: () {
                                    viewModel.selectAssignment(index);
                                    _deleteTest(context, viewModel, index);
                                  },
                                  onTap: () {
                                    _showEditTestDialog(
                                      context,
                                      viewModel,
                                      test,
                                    );
                                  },
                                  onEditQuestions: () {
                                    _editTestQuestions(
                                      context,
                                      viewModel,
                                      test,
                                    );
                                  },
                                  courseName: viewModel.courseName,
                                ).animate().flipV(duration: 400.ms);
                              },
                            ),
                          ),

                // طبقة مؤشر التحميل أثناء المعالجة
                if (viewModel.isProcessing)
                  Container(
                    color: Colors.black.withOpacity(0.3),
                    width: double.infinity,
                    height: double.infinity,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                _showAddTestDialog(context, viewModel);
              },
              backgroundColor: AppColors.primaryColor,
              child: const Icon(Icons.add, color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
