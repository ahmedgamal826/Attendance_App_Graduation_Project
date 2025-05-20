// // // // import 'dart:io';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:provider/provider.dart';
// // // // import 'package:image_picker/image_picker.dart';
// // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // import 'package:attendance_app/features/assignments/models/question_model_student.dart';
// // // // import 'package:attendance_app/features/assignments/presentation/viewmodels/student_assignment_detail_viewmodel.dart';
// // // // import 'package:attendance_app/features/assignments/presentation/viewmodels/student_assignments_viewmodel.dart';

// // // // class StudentAssignmentDetailView extends StatefulWidget {
// // // //   final String courseId;
// // // //   final String assignmentId;
// // // //   final String assignmentTitle;

// // // //   const StudentAssignmentDetailView({
// // // //     Key? key,
// // // //     required this.courseId,
// // // //     required this.assignmentId,
// // // //     required this.assignmentTitle,
// // // //   }) : super(key: key);

// // // //   @override
// // // //   State<StudentAssignmentDetailView> createState() =>
// // // //       _StudentAssignmentDetailViewState();
// // // // }

// // // // class _StudentAssignmentDetailViewState
// // // //     extends State<StudentAssignmentDetailView> {
// // // //   final ImagePicker _picker = ImagePicker();

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return ChangeNotifierProvider(
// // // //       create: (context) => StudentAssignmentDetailViewModel(
// // // //         courseId: widget.courseId,
// // // //         assignmentId: widget.assignmentId,
// // // //       ),
// // // //       child: Consumer<StudentAssignmentDetailViewModel>(
// // // //         builder: (context, viewModel, child) {
// // // //           // Mostrar mensajes de éxito o error
// // // //           if (viewModel.successMessage.isNotEmpty) {
// // // //             WidgetsBinding.instance.addPostFrameCallback((_) {
// // // //               ScaffoldMessenger.of(context).showSnackBar(
// // // //                 SnackBar(
// // // //                   content: Text(viewModel.successMessage),
// // // //                   backgroundColor: Colors.green,
// // // //                 ),
// // // //               );
// // // //               viewModel.clearMessages();
// // // //             });
// // // //           }

// // // //           if (viewModel.errorMessage.isNotEmpty) {
// // // //             WidgetsBinding.instance.addPostFrameCallback((_) {
// // // //               ScaffoldMessenger.of(context).showSnackBar(
// // // //                 SnackBar(
// // // //                   content: Text(viewModel.errorMessage),
// // // //                   backgroundColor: Colors.red,
// // // //                 ),
// // // //               );
// // // //               viewModel.clearMessages();
// // // //             });
// // // //           }

// // // //           return Scaffold(
// // // //             backgroundColor: const Color(0xFFF0F7FF),
// // // //             appBar: AppBar(
// // // //               title: Text(
// // // //                 widget.assignmentTitle,
// // // //                 style: const TextStyle(
// // // //                   fontWeight: FontWeight.bold,
// // // //                   fontSize: 20,
// // // //                   color: Colors.white,
// // // //                 ),
// // // //               ),
// // // //               backgroundColor: AppColors.primaryColor,
// // // //               elevation: 0,
// // // //               centerTitle: true,
// // // //             ),
// // // //             body: viewModel.isLoading
// // // //                 ? const Center(child: CircularProgressIndicator())
// // // //                 : viewModel.questions.isEmpty
// // // //                     ? const Center(
// // // //                         child: Text('No questions in this assignment'))
// // // //                     : _buildQuestionPage(context, viewModel),
// // // //           );
// // // //         },
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildQuestionPage(
// // // //       BuildContext context, StudentAssignmentDetailViewModel viewModel) {
// // // //     final currentQuestion = viewModel.currentQuestion;
// // // //     if (currentQuestion == null) {
// // // //       return const Center(child: Text('Error loading question'));
// // // //     }

// // // //     // Force a rebuild of the page when the current question index changes
// // // //     return Padding(
// // // //       padding: const EdgeInsets.all(16.0),
// // // //       child: Column(
// // // //         key: ValueKey('question_${viewModel.currentQuestionIndex}'),
// // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // //         children: [
// // // //           // Question header with indicator
// // // //           Container(
// // // //             margin: const EdgeInsets.only(bottom: 8),
// // // //             padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
// // // //             decoration: BoxDecoration(
// // // //               color: Colors.blue.withOpacity(0.1),
// // // //               borderRadius: BorderRadius.circular(8),
// // // //             ),
// // // //             child: Row(
// // // //               children: [
// // // //                 Text(
// // // //                   'Question ${viewModel.currentQuestionIndex + 1} of ${viewModel.questions.length}',
// // // //                   style: const TextStyle(
// // // //                     fontSize: 16,
// // // //                     fontWeight: FontWeight.bold,
// // // //                     color: AppColors.primaryColor,
// // // //                   ),
// // // //                 ),
// // // //                 const Spacer(),
// // // //                 if (!viewModel.allQuestionsAnswered)
// // // //                   const Text(
// // // //                     'Please answer all questions',
// // // //                     style: TextStyle(
// // // //                       fontSize: 14,
// // // //                       color: Colors.orange,
// // // //                       fontWeight: FontWeight.w600,
// // // //                     ),
// // // //                   ),
// // // //               ],
// // // //             ),
// // // //           ),

// // // //           // Question Text
// // // //           Padding(
// // // //             padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
// // // //             child: Text(
// // // //               currentQuestion.question,
// // // //               style: const TextStyle(
// // // //                 fontSize: 18,
// // // //                 fontWeight: FontWeight.w600,
// // // //               ),
// // // //             ),
// // // //           ),

// // // //           // Question file if exists - SOLO MOSTRAR PARA PREGUNTAS TIPO FILE
// // // //           if (currentQuestion.type == 'file' &&
// // // //               currentQuestion.fileUrl != null &&
// // // //               currentQuestion.fileUrl!.isNotEmpty)
// // // //             Container(
// // // //               margin: const EdgeInsets.only(bottom: 24),
// // // //               padding: const EdgeInsets.all(12),
// // // //               decoration: BoxDecoration(
// // // //                 color: Colors.white,
// // // //                 borderRadius: BorderRadius.circular(12),
// // // //                 border: Border.all(color: Colors.grey.shade300),
// // // //               ),
// // // //               child: Column(
// // // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // // //                 children: [
// // // //                   const Text(
// // // //                     'Question Attachment',
// // // //                     style: TextStyle(
// // // //                       fontSize: 14,
// // // //                       fontWeight: FontWeight.w600,
// // // //                     ),
// // // //                   ),
// // // //                   const SizedBox(height: 8),
// // // //                   Row(
// // // //                     children: [
// // // //                       _getFileIcon(currentQuestion.fileName ?? '', Colors.blue),
// // // //                       const SizedBox(width: 12),
// // // //                       Expanded(
// // // //                         child: Column(
// // // //                           crossAxisAlignment: CrossAxisAlignment.start,
// // // //                           children: [
// // // //                             Text(
// // // //                               currentQuestion.fileName ?? 'File',
// // // //                               style: const TextStyle(
// // // //                                 fontWeight: FontWeight.w500,
// // // //                                 fontSize: 15,
// // // //                               ),
// // // //                               maxLines: 1,
// // // //                               overflow: TextOverflow.ellipsis,
// // // //                             ),
// // // //                             if (currentQuestion.fileSize != null)
// // // //                               Text(
// // // //                                 _formatFileSize(currentQuestion.fileSize!),
// // // //                                 style: TextStyle(
// // // //                                   fontSize: 13,
// // // //                                   color: Colors.grey.shade600,
// // // //                                 ),
// // // //                               ),
// // // //                           ],
// // // //                         ),
// // // //                       ),
// // // //                       IconButton(
// // // //                         icon: const Icon(Icons.visibility, color: Colors.blue),
// // // //                         onPressed: () {
// // // //                           // View file implementation
// // // //                         },
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //             ),

// // // //           // Different question types
// // // //           Expanded(
// // // //             child: SingleChildScrollView(
// // // //               child: _buildQuestionResponseWidget(currentQuestion, viewModel),
// // // //             ),
// // // //           ),

// // // //           // Bottom navigation with submit button and question indicators
// // // //           Column(
// // // //             children: [
// // // //               // Submit button
// // // //               SizedBox(
// // // //                 width: double.infinity,
// // // //                 child: ElevatedButton(
// // // //                   onPressed: viewModel.allQuestionsAnswered
// // // //                       ? () async {
// // // //                           final success = await viewModel.submitAssignment();
// // // //                           if (success && context.mounted) {
// // // //                             // Try to update the parent viewmodel to refresh the assignments list
// // // //                             try {
// // // //                               final parentViewModel =
// // // //                                   Provider.of<StudentAssignmentsViewModel>(
// // // //                                       context,
// // // //                                       listen: false);
// // // //                               await parentViewModel.refreshAssignments();
// // // //                             } catch (e) {
// // // //                               print("Could not refresh assignments list: $e");
// // // //                             }

// // // //                             // Show success message
// // // //                             ScaffoldMessenger.of(context).showSnackBar(
// // // //                               const SnackBar(
// // // //                                 content:
// // // //                                     Text('Assignment submitted successfully!'),
// // // //                                 backgroundColor: Colors.green,
// // // //                                 duration: Duration(seconds: 2),
// // // //                               ),
// // // //                             );

// // // //                             // Return to assignments list
// // // //                             Navigator.pop(context);
// // // //                           }
// // // //                         }
// // // //                       : null,
// // // //                   style: ElevatedButton.styleFrom(
// // // //                     backgroundColor: viewModel.allQuestionsAnswered
// // // //                         ? AppColors.primaryColor
// // // //                         : Color(0xFFBDBDBD), // Medium gray when disabled
// // // //                     disabledBackgroundColor:
// // // //                         Color(0xFFBDBDBD), // Medium gray when disabled
// // // //                     padding: const EdgeInsets.symmetric(vertical: 16),
// // // //                     shape: RoundedRectangleBorder(
// // // //                       borderRadius: BorderRadius.circular(8),
// // // //                     ),
// // // //                     elevation: 0,
// // // //                   ),
// // // //                   child: const Text(
// // // //                     'Submit',
// // // //                     style: TextStyle(
// // // //                       fontSize: 16,
// // // //                       fontWeight: FontWeight.bold,
// // // //                       color: Colors.white,
// // // //                     ),
// // // //                   ),
// // // //                 ),
// // // //               ),

// // // //               // Show error message if not all questions are answered
// // // //               if (!viewModel.allQuestionsAnswered)
// // // //                 Padding(
// // // //                   padding: const EdgeInsets.only(top: 8.0),
// // // //                   child: Center(
// // // //                     child: Text(
// // // //                       'Please answer all questions before submitting',
// // // //                       style: TextStyle(
// // // //                         color: Colors.red,
// // // //                         fontSize: 14,
// // // //                         fontWeight: FontWeight.w500,
// // // //                       ),
// // // //                     ),
// // // //                   ),
// // // //                 ),

// // // //               const SizedBox(height: 16),

// // // //               // Question indicators
// // // //               SizedBox(
// // // //                 height: 45,
// // // //                 child: ListView.builder(
// // // //                   scrollDirection: Axis.horizontal,
// // // //                   itemCount: viewModel.questions.length,
// // // //                   itemBuilder: (context, index) {
// // // //                     final question = viewModel.questions[index];
// // // //                     final isActive = index == viewModel.currentQuestionIndex;
// // // //                     final isAnswered = question.isQuestionAnswered();
// // // //                     print(
// // // //                         'Question ${index + 1} isAnswered: $isAnswered, type: ${question.type}, selectedOption: ${question.selectedOption}');

// // // //                     // Force rebuild with a unique key based on answered state
// // // //                     return GestureDetector(
// // // //                       key: ValueKey(
// // // //                           'q_indicator_${index}_${isAnswered}_${isActive}'),
// // // //                       onTap: () {
// // // //                         viewModel.goToQuestion(index);
// // // //                       },
// // // //                       child: Container(
// // // //                         margin: const EdgeInsets.symmetric(horizontal: 4),
// // // //                         width: 100,
// // // //                         decoration: BoxDecoration(
// // // //                           color: isActive
// // // //                               ? AppColors.primaryColor
// // // //                               : (isAnswered
// // // //                                   ? const Color(
// // // //                                       0xFFCDF1CD) // Exact light green from image
// // // //                                   : Colors.white),
// // // //                           borderRadius: BorderRadius.circular(
// // // //                               12), // Rounded corners like in image
// // // //                           border: Border.all(
// // // //                             color: isActive
// // // //                                 ? AppColors.primaryColor
// // // //                                 : isAnswered
// // // //                                     ? const Color(
// // // //                                         0xFFCDF1CD) // Match border to background
// // // //                                     : Colors.grey.shade300,
// // // //                             width: 1,
// // // //                           ),
// // // //                         ),
// // // //                         child: Stack(
// // // //                           children: [
// // // //                             // Question text
// // // //                             Center(
// // // //                               child: Text(
// // // //                                 'Question ${index + 1}',
// // // //                                 style: TextStyle(
// // // //                                   color: isActive
// // // //                                       ? Colors.white
// // // //                                       : Colors
// // // //                                           .black, // Black text on green background
// // // //                                   fontSize: 14,
// // // //                                   fontWeight: FontWeight.w500,
// // // //                                 ),
// // // //                               ),
// // // //                             ),

// // // //                             // Checkmark for answered questions - positioned exactly as in image
// // // //                             if (isAnswered)
// // // //                               Positioned(
// // // //                                 top: 1,
// // // //                                 right: 1,
// // // //                                 child: Container(
// // // //                                   child: const Icon(
// // // //                                     Icons.check_circle,
// // // //                                     color: Colors.green,
// // // //                                     size: 18,
// // // //                                   ),
// // // //                                 ),
// // // //                               ),
// // // //                           ],
// // // //                         ),
// // // //                       ),
// // // //                     );
// // // //                   },
// // // //                 ),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildQuestionResponseWidget(
// // // //       StudentQuestion question, StudentAssignmentDetailViewModel viewModel) {
// // // //     if (question.type == 'multiple_choice' || question.type == 'MCQ') {
// // // //       return _buildMultipleChoiceOptions(question, viewModel);
// // // //     } else if (question.type == 'true_false' || question.type == 'TrueFalse') {
// // // //       return _buildTrueFalseOptions(question, viewModel);
// // // //     } else if (question.type == 'file') {
// // // //       return _buildFileUpload(question, viewModel);
// // // //     } else {
// // // //       return Center(
// // // //         child: Text(
// // // //           'Tipo de pregunta no soportado: ${question.type}',
// // // //           style: TextStyle(color: Colors.red),
// // // //         ),
// // // //       );
// // // //     }
// // // //   }

// // // //   Widget _buildMultipleChoiceOptions(
// // // //       StudentQuestion question, StudentAssignmentDetailViewModel viewModel) {
// // // //     return Column(
// // // //       children: List.generate(question.options.length, (index) {
// // // //         final bool isSelected = question.selectedOption == index;

// // // //         return Container(
// // // //           width: double.infinity,
// // // //           margin: const EdgeInsets.only(bottom: 12),
// // // //           child: InkWell(
// // // //             onTap: () {
// // // //               viewModel.updateSelectedOption(
// // // //                   viewModel.currentQuestionIndex, index);
// // // //               // Force UI update
// // // //               setState(() {});
// // // //             },
// // // //             borderRadius: BorderRadius.circular(24),
// // // //             child: Container(
// // // //               padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
// // // //               decoration: BoxDecoration(
// // // //                 color: isSelected ? AppColors.primaryColor : Colors.white,
// // // //                 borderRadius: BorderRadius.circular(24),
// // // //                 boxShadow: [
// // // //                   BoxShadow(
// // // //                     color: Colors.black.withOpacity(0.05),
// // // //                     blurRadius: 2,
// // // //                     spreadRadius: 0,
// // // //                     offset: const Offset(0, 1),
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //               child: Row(
// // // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                 children: [
// // // //                   Expanded(
// // // //                     child: Text(
// // // //                       question.options[index],
// // // //                       style: TextStyle(
// // // //                         fontSize: 16,
// // // //                         fontWeight: FontWeight.w500,
// // // //                         color: isSelected ? Colors.white : Colors.black,
// // // //                       ),
// // // //                     ),
// // // //                   ),
// // // //                   if (isSelected)
// // // //                     Container(
// // // //                       padding: const EdgeInsets.all(2),
// // // //                       decoration: const BoxDecoration(
// // // //                         color: Colors.white,
// // // //                         shape: BoxShape.circle,
// // // //                       ),
// // // //                       child: const Icon(
// // // //                         Icons.check,
// // // //                         color: AppColors.primaryColor,
// // // //                         size: 18,
// // // //                       ),
// // // //                     ),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //           ),
// // // //         );
// // // //       }),
// // // //     );
// // // //   }

// // // //   Widget _buildTrueFalseOptions(
// // // //       StudentQuestion question, StudentAssignmentDetailViewModel viewModel) {
// // // //     return Column(
// // // //       children: [
// // // //         // True option
// // // //         Container(
// // // //           width: double.infinity,
// // // //           margin: const EdgeInsets.only(bottom: 12),
// // // //           child: InkWell(
// // // //             onTap: () {
// // // //               viewModel.updateSelectedOption(viewModel.currentQuestionIndex, 0);
// // // //               // Force UI update
// // // //               setState(() {});
// // // //             },
// // // //             borderRadius: BorderRadius.circular(24),
// // // //             child: Container(
// // // //               padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
// // // //               decoration: BoxDecoration(
// // // //                 color: question.selectedOption == 0
// // // //                     ? AppColors.primaryColor
// // // //                     : Colors.white,
// // // //                 borderRadius: BorderRadius.circular(24),
// // // //                 boxShadow: [
// // // //                   BoxShadow(
// // // //                     color: Colors.black.withOpacity(0.05),
// // // //                     blurRadius: 2,
// // // //                     spreadRadius: 0,
// // // //                     offset: const Offset(0, 1),
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //               child: Row(
// // // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                 children: [
// // // //                   Text(
// // // //                     'True',
// // // //                     style: TextStyle(
// // // //                       fontSize: 16,
// // // //                       fontWeight: FontWeight.w500,
// // // //                       color: question.selectedOption == 0
// // // //                           ? Colors.white
// // // //                           : Colors.black,
// // // //                     ),
// // // //                   ),
// // // //                   if (question.selectedOption == 0)
// // // //                     Container(
// // // //                       padding: const EdgeInsets.all(2),
// // // //                       decoration: const BoxDecoration(
// // // //                         color: Colors.white,
// // // //                         shape: BoxShape.circle,
// // // //                       ),
// // // //                       child: const Icon(
// // // //                         Icons.check,
// // // //                         color: AppColors.primaryColor,
// // // //                         size: 18,
// // // //                       ),
// // // //                     ),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //           ),
// // // //         ),

// // // //         // False option
// // // //         Container(
// // // //           width: double.infinity,
// // // //           margin: const EdgeInsets.only(bottom: 12),
// // // //           child: InkWell(
// // // //             onTap: () {
// // // //               viewModel.updateSelectedOption(viewModel.currentQuestionIndex, 1);
// // // //               // Force UI update
// // // //               setState(() {});
// // // //             },
// // // //             borderRadius: BorderRadius.circular(24),
// // // //             child: Container(
// // // //               padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
// // // //               decoration: BoxDecoration(
// // // //                 color: question.selectedOption == 1
// // // //                     ? AppColors.primaryColor
// // // //                     : Colors.white,
// // // //                 borderRadius: BorderRadius.circular(24),
// // // //                 boxShadow: [
// // // //                   BoxShadow(
// // // //                     color: Colors.black.withOpacity(0.05),
// // // //                     blurRadius: 2,
// // // //                     spreadRadius: 0,
// // // //                     offset: const Offset(0, 1),
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //               child: Row(
// // // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                 children: [
// // // //                   Text(
// // // //                     'False',
// // // //                     style: TextStyle(
// // // //                       fontSize: 16,
// // // //                       fontWeight: FontWeight.w500,
// // // //                       color: question.selectedOption == 1
// // // //                           ? Colors.white
// // // //                           : Colors.black,
// // // //                     ),
// // // //                   ),
// // // //                   if (question.selectedOption == 1)
// // // //                     Container(
// // // //                       padding: const EdgeInsets.all(2),
// // // //                       decoration: const BoxDecoration(
// // // //                         color: Colors.white,
// // // //                         shape: BoxShape.circle,
// // // //                       ),
// // // //                       child: const Icon(
// // // //                         Icons.check,
// // // //                         color: AppColors.primaryColor,
// // // //                         size: 18,
// // // //                       ),
// // // //                     ),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //           ),
// // // //         ),
// // // //       ],
// // // //     );
// // // //   }

// // // //   Widget _buildFileUpload(
// // // //       StudentQuestion question, StudentAssignmentDetailViewModel viewModel) {
// // // //     // Si ya hay un archivo subido
// // // //     if (question.uploadedFileUrl != null &&
// // // //         question.uploadedFileUrl!.isNotEmpty) {
// // // //       return Container(
// // // //         width: double.infinity,
// // // //         padding: const EdgeInsets.all(16),
// // // //         margin: const EdgeInsets.only(bottom: 12),
// // // //         decoration: BoxDecoration(
// // // //           color: Colors.white,
// // // //           borderRadius: BorderRadius.circular(12),
// // // //           border: Border.all(color: Colors.green),
// // // //           boxShadow: [
// // // //             BoxShadow(
// // // //               color: Colors.green.withOpacity(0.1),
// // // //               blurRadius: 4,
// // // //               spreadRadius: 1,
// // // //             ),
// // // //           ],
// // // //         ),
// // // //         child: Column(
// // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // //           children: [
// // // //             Row(
// // // //               children: [
// // // //                 const Icon(Icons.check_circle, color: Colors.green),
// // // //                 const SizedBox(width: 8),
// // // //                 const Text(
// // // //                   'Your Uploaded Answer',
// // // //                   style: TextStyle(
// // // //                     fontSize: 16,
// // // //                     fontWeight: FontWeight.bold,
// // // //                     color: Colors.green,
// // // //                   ),
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //             const SizedBox(height: 12),
// // // //             Row(
// // // //               children: [
// // // //                 _getFileIcon(question.uploadedFileName ?? '', Colors.green),
// // // //                 const SizedBox(width: 12),
// // // //                 Expanded(
// // // //                   child: Column(
// // // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // // //                     children: [
// // // //                       Text(
// // // //                         question.uploadedFileName ?? 'File uploaded',
// // // //                         style: const TextStyle(
// // // //                           fontWeight: FontWeight.w500,
// // // //                           fontSize: 15,
// // // //                         ),
// // // //                         maxLines: 1,
// // // //                         overflow: TextOverflow.ellipsis,
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                 ),
// // // //                 IconButton(
// // // //                   icon: const Icon(Icons.delete, color: Colors.red),
// // // //                   onPressed: () {
// // // //                     // Reset the uploaded file
// // // //                     viewModel.resetFileUpload(viewModel.currentQuestionIndex);
// // // //                   },
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       );
// // // //     }

// // // //     // Si no hay archivo subido - nuevo diseño como la imagen de referencia
// // // //     return Column(
// // // //       crossAxisAlignment: CrossAxisAlignment.start,
// // // //       children: [
// // // //         // Título "Upload your answer file"
// // // //         const Padding(
// // // //           padding: EdgeInsets.only(left: 8, bottom: 16),
// // // //           child: Text(
// // // //             "Upload your answer file",
// // // //             style: TextStyle(
// // // //               fontSize: 16,
// // // //               fontWeight: FontWeight.bold,
// // // //               color: AppColors.primaryColor,
// // // //             ),
// // // //           ),
// // // //         ),

// // // //         // Contenedor para el botón de carga
// // // //         Container(
// // // //           margin: const EdgeInsets.symmetric(horizontal: 10),
// // // //           width: double.infinity,
// // // //           decoration: BoxDecoration(
// // // //             color: Colors.white,
// // // //             borderRadius: BorderRadius.circular(8),
// // // //           ),
// // // //           child: InkWell(
// // // //             onTap: () async {
// // // //               await _showFilePickerOptions(context, viewModel);
// // // //             },
// // // //             child: Container(
// // // //               padding: const EdgeInsets.symmetric(vertical: 40),
// // // //               child: Column(
// // // //                 mainAxisAlignment: MainAxisAlignment.center,
// // // //                 children: [
// // // //                   // Icono circular para upload
// // // //                   Container(
// // // //                     width: 60,
// // // //                     height: 60,
// // // //                     decoration: BoxDecoration(
// // // //                       color: Colors.blue.shade200,
// // // //                       shape: BoxShape.circle,
// // // //                     ),
// // // //                     child: const Icon(
// // // //                       Icons.cloud_upload,
// // // //                       color: Colors.white,
// // // //                       size: 30,
// // // //                     ),
// // // //                   ),
// // // //                   const SizedBox(height: 16),
// // // //                   const Text(
// // // //                     "Tap to upload file",
// // // //                     style: TextStyle(
// // // //                       fontSize: 16,
// // // //                       fontWeight: FontWeight.w500,
// // // //                     ),
// // // //                   ),
// // // //                   const SizedBox(height: 8),
// // // //                   Text(
// // // //                     "PDF, JPG, PNG, or document files",
// // // //                     style: TextStyle(
// // // //                       fontSize: 14,
// // // //                       color: Colors.grey.shade600,
// // // //                     ),
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //           ),
// // // //         ),
// // // //       ],
// // // //     );
// // // //   }

// // // //   Future<void> _showFilePickerOptions(
// // // //       BuildContext context, StudentAssignmentDetailViewModel viewModel) async {
// // // //     showModalBottomSheet(
// // // //       context: context,
// // // //       backgroundColor: Colors.white,
// // // //       shape: const RoundedRectangleBorder(
// // // //         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
// // // //       ),
// // // //       builder: (context) {
// // // //         return SafeArea(
// // // //           child: Column(
// // // //             mainAxisSize: MainAxisSize.min,
// // // //             children: [
// // // //               const Padding(
// // // //                 padding: EdgeInsets.all(16.0),
// // // //                 child: Text(
// // // //                   'Select File Source',
// // // //                   style: TextStyle(
// // // //                     fontSize: 18,
// // // //                     fontWeight: FontWeight.bold,
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //               const Divider(),
// // // //               ListTile(
// // // //                 leading: const Icon(Icons.photo_library,
// // // //                     color: AppColors.primaryColor),
// // // //                 title: const Text('Gallery'),
// // // //                 onTap: () async {
// // // //                   Navigator.pop(context);
// // // //                   final XFile? image = await _picker.pickImage(
// // // //                     source: ImageSource.gallery,
// // // //                     imageQuality: 80,
// // // //                   );
// // // //                   if (image != null) {
// // // //                     await _processSelectedFile(image, viewModel);
// // // //                   }
// // // //                 },
// // // //               ),
// // // //               ListTile(
// // // //                 leading:
// // // //                     const Icon(Icons.camera_alt, color: AppColors.primaryColor),
// // // //                 title: const Text('Camera'),
// // // //                 onTap: () async {
// // // //                   Navigator.pop(context);
// // // //                   final XFile? image = await _picker.pickImage(
// // // //                     source: ImageSource.camera,
// // // //                     imageQuality: 80,
// // // //                   );
// // // //                   if (image != null) {
// // // //                     await _processSelectedFile(image, viewModel);
// // // //                   }
// // // //                 },
// // // //               ),
// // // //               // Option for non-image file (not fully implemented here)
// // // //               /*
// // // //               ListTile(
// // // //                 leading: const Icon(Icons.file_present, color: AppColors.primaryColor),
// // // //                 title: const Text('Document'),
// // // //                 onTap: () async {
// // // //                   Navigator.pop(context);
// // // //                   // Need to implement document picker
// // // //                 },
// // // //               ),
// // // //               */
// // // //               const SizedBox(height: 8),
// // // //             ],
// // // //           ),
// // // //         );
// // // //       },
// // // //     );
// // // //   }

// // // //   Future<void> _processSelectedFile(
// // // //       XFile file, StudentAssignmentDetailViewModel viewModel) async {
// // // //     try {
// // // //       final File fileToUpload = File(file.path);
// // // //       await viewModel.uploadFile(
// // // //         viewModel.currentQuestionIndex,
// // // //         fileToUpload,
// // // //         file.name,
// // // //       );
// // // //     } catch (e) {
// // // //       if (context.mounted) {
// // // //         ScaffoldMessenger.of(context).showSnackBar(
// // // //           SnackBar(
// // // //             content: Text('Error processing file: $e'),
// // // //             backgroundColor: Colors.red,
// // // //           ),
// // // //         );
// // // //       }
// // // //     }
// // // //   }

// // // //   Widget _getFileIcon(String fileName, Color color) {
// // // //     IconData iconData;

// // // //     if (fileName.endsWith('.pdf')) {
// // // //       iconData = Icons.picture_as_pdf;
// // // //     } else if (fileName.endsWith('.jpg') ||
// // // //         fileName.endsWith('.jpeg') ||
// // // //         fileName.endsWith('.png')) {
// // // //       iconData = Icons.image;
// // // //     } else if (fileName.endsWith('.doc') || fileName.endsWith('.docx')) {
// // // //       iconData = Icons.description;
// // // //     } else {
// // // //       iconData = Icons.insert_drive_file;
// // // //     }

// // // //     return Container(
// // // //       padding: const EdgeInsets.all(8),
// // // //       decoration: BoxDecoration(
// // // //         color: color.withOpacity(0.1),
// // // //         borderRadius: BorderRadius.circular(8),
// // // //       ),
// // // //       child: Icon(
// // // //         iconData,
// // // //         color: color,
// // // //         size: 24,
// // // //       ),
// // // //     );
// // // //   }

// // // //   String _formatFileSize(int sizeInBytes) {
// // // //     if (sizeInBytes < 1024) {
// // // //       return '$sizeInBytes B';
// // // //     } else if (sizeInBytes < 1048576) {
// // // //       return '${(sizeInBytes / 1024).toStringAsFixed(1)} KB';
// // // //     } else {
// // // //       return '${(sizeInBytes / 1048576).toStringAsFixed(1)} MB';
// // // //     }
// // // //   }
// // // // }

// // // import 'dart:io';
// // // import 'package:flutter/material.dart';
// // // import 'package:provider/provider.dart';
// // // import 'package:image_picker/image_picker.dart';
// // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // import 'package:attendance_app/features/assignments/models/question_model_student.dart';
// // // import 'package:attendance_app/features/assignments/presentation/viewmodels/student_assignment_detail_viewmodel.dart';
// // // import 'package:attendance_app/features/assignments/presentation/viewmodels/student_assignments_viewmodel.dart';
// // // import 'package:url_launcher/url_launcher.dart';

// // // class StudentAssignmentDetailView extends StatefulWidget {
// // //   final String courseId;
// // //   final String assignmentId;
// // //   final String assignmentTitle;

// // //   const StudentAssignmentDetailView({
// // //     Key? key,
// // //     required this.courseId,
// // //     required this.assignmentId,
// // //     required this.assignmentTitle,
// // //   }) : super(key: key);

// // //   @override
// // //   State<StudentAssignmentDetailView> createState() =>
// // //       _StudentAssignmentDetailViewState();
// // // }

// // // class _StudentAssignmentDetailViewState
// // //     extends State<StudentAssignmentDetailView> {
// // //   final ImagePicker _picker = ImagePicker();

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return ChangeNotifierProvider(
// // //       create: (context) => StudentAssignmentDetailViewModel(
// // //         courseId: widget.courseId,
// // //         assignmentId: widget.assignmentId,
// // //       ),
// // //       child: Consumer<StudentAssignmentDetailViewModel>(
// // //         builder: (context, viewModel, child) {
// // //           // Mostrar mensajes de éxito o error
// // //           if (viewModel.successMessage.isNotEmpty) {
// // //             WidgetsBinding.instance.addPostFrameCallback((_) {
// // //               ScaffoldMessenger.of(context).showSnackBar(
// // //                 SnackBar(
// // //                   content: Text(viewModel.successMessage),
// // //                   backgroundColor: Colors.green,
// // //                 ),
// // //               );
// // //               viewModel.clearMessages();
// // //             });
// // //           }

// // //           if (viewModel.errorMessage.isNotEmpty) {
// // //             WidgetsBinding.instance.addPostFrameCallback((_) {
// // //               ScaffoldMessenger.of(context).showSnackBar(
// // //                 SnackBar(
// // //                   content: Text(viewModel.errorMessage),
// // //                   backgroundColor: Colors.red,
// // //                 ),
// // //               );
// // //               viewModel.clearMessages();
// // //             });
// // //           }

// // //           return Scaffold(
// // //             backgroundColor: const Color(0xFFF0F7FF),
// // //             appBar: AppBar(
// // //               title: Text(
// // //                 widget.assignmentTitle,
// // //                 style: const TextStyle(
// // //                   fontWeight: FontWeight.bold,
// // //                   fontSize: 20,
// // //                   color: Colors.white,
// // //                 ),
// // //               ),
// // //               backgroundColor: AppColors.primaryColor,
// // //               elevation: 0,
// // //               centerTitle: true,
// // //             ),
// // //             body: viewModel.isLoading
// // //                 ? const Center(child: CircularProgressIndicator())
// // //                 : viewModel.questions.isEmpty
// // //                     ? const Center(
// // //                         child: Text('No questions in this assignment'))
// // //                     : _buildQuestionPage(context, viewModel),
// // //           );
// // //         },
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildQuestionPage(
// // //       BuildContext context, StudentAssignmentDetailViewModel viewModel) {
// // //     final currentQuestion = viewModel.currentQuestion;
// // //     if (currentQuestion == null) {
// // //       return const Center(child: Text('Error loading question'));
// // //     }

// // //     // Force a rebuild of the page when the current question index changes
// // //     return Padding(
// // //       padding: const EdgeInsets.all(16.0),
// // //       child: Column(
// // //         key: ValueKey('question_${viewModel.currentQuestionIndex}'),
// // //         crossAxisAlignment: CrossAxisAlignment.start,
// // //         children: [
// // //           // Question header with indicator
// // //           Container(
// // //             margin: const EdgeInsets.only(bottom: 8),
// // //             padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
// // //             decoration: BoxDecoration(
// // //               color: Colors.blue.withOpacity(0.1),
// // //               borderRadius: BorderRadius.circular(8),
// // //             ),
// // //             child: Row(
// // //               children: [
// // //                 Text(
// // //                   'Question ${viewModel.currentQuestionIndex + 1} of ${viewModel.questions.length}',
// // //                   style: const TextStyle(
// // //                     fontSize: 16,
// // //                     fontWeight: FontWeight.bold,
// // //                     color: AppColors.primaryColor,
// // //                   ),
// // //                 ),
// // //                 const Spacer(),
// // //                 if (!viewModel.allQuestionsAnswered)
// // //                   const Text(
// // //                     'Please answer all questions',
// // //                     style: TextStyle(
// // //                       fontSize: 14,
// // //                       color: Colors.orange,
// // //                       fontWeight: FontWeight.w600,
// // //                     ),
// // //                   ),
// // //               ],
// // //             ),
// // //           ),

// // //           // Question Text
// // //           Padding(
// // //             padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
// // //             child: Text(
// // //               currentQuestion.question,
// // //               style: const TextStyle(
// // //                 fontSize: 18,
// // //                 fontWeight: FontWeight.w600,
// // //               ),
// // //             ),
// // //           ),

// // //           // Question file if exists - SOLO MOSTRAR PARA PREGUNTAS TIPO Upload File
// // //           if (currentQuestion.type == 'Upload File' &&
// // //               currentQuestion.fileUrl != null &&
// // //               currentQuestion.fileUrl!.isNotEmpty)
// // //             Container(
// // //               margin: const EdgeInsets.only(bottom: 24),
// // //               padding: const EdgeInsets.all(12),
// // //               decoration: BoxDecoration(
// // //                 color: Colors.white,
// // //                 borderRadius: BorderRadius.circular(12),
// // //                 border: Border.all(color: Colors.grey.shade300),
// // //               ),
// // //               child: Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                 children: [
// // //                   const Text(
// // //                     'Question Attachment',
// // //                     style: TextStyle(
// // //                       fontSize: 14,
// // //                       fontWeight: FontWeight.w600,
// // //                     ),
// // //                   ),
// // //                   const SizedBox(height: 8),
// // //                   Row(
// // //                     children: [
// // //                       _getFileIcon(currentQuestion.fileName ?? '', Colors.blue),
// // //                       const SizedBox(width: 12),
// // //                       Expanded(
// // //                         child: Column(
// // //                           crossAxisAlignment: CrossAxisAlignment.start,
// // //                           children: [
// // //                             Text(
// // //                               currentQuestion.fileName ?? 'File',
// // //                               style: const TextStyle(
// // //                                 fontWeight: FontWeight.w500,
// // //                                 fontSize: 15,
// // //                               ),
// // //                               maxLines: 1,
// // //                               overflow: TextOverflow.ellipsis,
// // //                             ),
// // //                             if (currentQuestion.fileSize != null)
// // //                               Text(
// // //                                 _formatFileSize(currentQuestion.fileSize!),
// // //                                 style: TextStyle(
// // //                                   fontSize: 13,
// // //                                   color: Colors.grey.shade600,
// // //                                 ),
// // //                               ),
// // //                           ],
// // //                         ),
// // //                       ),
// // //                       IconButton(
// // //                         icon: const Icon(Icons.visibility, color: Colors.blue),
// // //                         onPressed: () {
// // //                           _launchURL(currentQuestion.fileUrl!);
// // //                         },
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),

// // //           // Different question types
// // //           Expanded(
// // //             child: SingleChildScrollView(
// // //               child: _buildQuestionResponseWidget(currentQuestion, viewModel),
// // //             ),
// // //           ),

// // //           // Bottom navigation with submit button and question indicators
// // //           Column(
// // //             children: [
// // //               // Submit button
// // //               SizedBox(
// // //                 width: double.infinity,
// // //                 child: ElevatedButton(
// // //                   onPressed: viewModel.allQuestionsAnswered
// // //                       ? () async {
// // //                           final success = await viewModel.submitAssignment();
// // //                           if (success && context.mounted) {
// // //                             // Try to update the parent viewmodel to refresh the assignments list
// // //                             try {
// // //                               final parentViewModel =
// // //                                   Provider.of<StudentAssignmentsViewModel>(
// // //                                       context,
// // //                                       listen: false);
// // //                               await parentViewModel.refreshAssignments();
// // //                             } catch (e) {
// // //                               print("Could not refresh assignments list: $e");
// // //                             }

// // //                             // Show success message
// // //                             ScaffoldMessenger.of(context).showSnackBar(
// // //                               const SnackBar(
// // //                                 content:
// // //                                     Text('Assignment submitted successfully!'),
// // //                                 backgroundColor: Colors.green,
// // //                                 duration: Duration(seconds: 2),
// // //                               ),
// // //                             );

// // //                             // Return to assignments list
// // //                             Navigator.pop(context);
// // //                           }
// // //                         }
// // //                       : null,
// // //                   style: ElevatedButton.styleFrom(
// // //                     backgroundColor: viewModel.allQuestionsAnswered
// // //                         ? AppColors.primaryColor
// // //                         : Color(0xFFBDBDBD), // Medium gray when disabled
// // //                     disabledBackgroundColor:
// // //                         Color(0xFFBDBDBD), // Medium gray when disabled
// // //                     padding: const EdgeInsets.symmetric(vertical: 16),
// // //                     shape: RoundedRectangleBorder(
// // //                       borderRadius: BorderRadius.circular(8),
// // //                     ),
// // //                     elevation: 0,
// // //                   ),
// // //                   child: const Text(
// // //                     'Submit',
// // //                     style: TextStyle(
// // //                       fontSize: 16,
// // //                       fontWeight: FontWeight.bold,
// // //                       color: Colors.white,
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ),

// // //               // Show error message if not all questions are answered
// // //               if (!viewModel.allQuestionsAnswered)
// // //                 Padding(
// // //                   padding: const EdgeInsets.only(top: 8.0),
// // //                   child: Center(
// // //                     child: Text(
// // //                       'Please answer all questions before submitting',
// // //                       style: TextStyle(
// // //                         color: Colors.red,
// // //                         fontSize: 14,
// // //                         fontWeight: FontWeight.w500,
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),

// // //               const SizedBox(height: 16),

// // //               // Question indicators
// // //               SizedBox(
// // //                 height: 45,
// // //                 child: ListView.builder(
// // //                   scrollDirection: Axis.horizontal,
// // //                   itemCount: viewModel.questions.length,
// // //                   itemBuilder: (context, index) {
// // //                     final question = viewModel.questions[index];
// // //                     final isActive = index == viewModel.currentQuestionIndex;
// // //                     final isAnswered = question.isQuestionAnswered();
// // //                     print(
// // //                         'Question ${index + 1} isAnswered: $isAnswered, type: ${question.type}, selectedOption: ${question.selectedOption}');

// // //                     // Force rebuild with a unique key based on answered state
// // //                     return GestureDetector(
// // //                       key: ValueKey(
// // //                           'q_indicator_${index}_${isAnswered}_${isActive}'),
// // //                       onTap: () {
// // //                         viewModel.goToQuestion(index);
// // //                       },
// // //                       child: Container(
// // //                         margin: const EdgeInsets.symmetric(horizontal: 4),
// // //                         width: 100,
// // //                         decoration: BoxDecoration(
// // //                           color: isActive
// // //                               ? AppColors.primaryColor
// // //                               : (isAnswered
// // //                                   ? const Color(
// // //                                       0xFFCDF1CD) // Exact light green from image
// // //                                   : Colors.white),
// // //                           borderRadius: BorderRadius.circular(
// // //                               12), // Rounded corners like in image
// // //                           border: Border.all(
// // //                             color: isActive
// // //                                 ? AppColors.primaryColor
// // //                                 : isAnswered
// // //                                     ? const Color(
// // //                                         0xFFCDF1CD) // Match border to background
// // //                                     : Colors.grey.shade300,
// // //                             width: 1,
// // //                           ),
// // //                         ),
// // //                         child: Stack(
// // //                           children: [
// // //                             // Question text
// // //                             Center(
// // //                               child: Text(
// // //                                 'Question ${index + 1}',
// // //                                 style: TextStyle(
// // //                                   color: isActive
// // //                                       ? Colors.white
// // //                                       : Colors
// // //                                           .black, // Black text on green background
// // //                                   fontSize: 14,
// // //                                   fontWeight: FontWeight.w500,
// // //                                 ),
// // //                               ),
// // //                             ),

// // //                             // Checkmark for answered questions - positioned exactly as in image
// // //                             if (isAnswered)
// // //                               Positioned(
// // //                                 top: 1,
// // //                                 right: 1,
// // //                                 child: Container(
// // //                                   child: const Icon(
// // //                                     Icons.check_circle,
// // //                                     color: Colors.green,
// // //                                     size: 18,
// // //                                   ),
// // //                                 ),
// // //                               ),
// // //                           ],
// // //                         ),
// // //                       ),
// // //                     );
// // //                   },
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildQuestionResponseWidget(
// // //       StudentQuestion question, StudentAssignmentDetailViewModel viewModel) {
// // //     if (question.type == 'multiple_choice' || question.type == 'MCQ') {
// // //       return _buildMultipleChoiceOptions(question, viewModel);
// // //     } else if (question.type == 'true_false' || question.type == 'TrueFalse') {
// // //       return _buildTrueFalseOptions(question, viewModel);
// // //     } else if (question.type == 'Upload File') {
// // //       return _buildFileUpload(question, viewModel);
// // //     } else {
// // //       return Center(
// // //         child: Text(
// // //           'Tipo de pregunta no soportado: ${question.type}',
// // //           style: TextStyle(color: Colors.red),
// // //         ),
// // //       );
// // //     }
// // //   }

// // //   Widget _buildMultipleChoiceOptions(
// // //       StudentQuestion question, StudentAssignmentDetailViewModel viewModel) {
// // //     return Column(
// // //       children: List.generate(question.options.length, (index) {
// // //         final bool isSelected = question.selectedOption == index;

// // //         return Container(
// // //           width: double.infinity,
// // //           margin: const EdgeInsets.only(bottom: 12),
// // //           child: InkWell(
// // //             onTap: () {
// // //               viewModel.updateSelectedOption(
// // //                   viewModel.currentQuestionIndex, index);
// // //               // Force UI update
// // //               setState(() {});
// // //             },
// // //             borderRadius: BorderRadius.circular(24),
// // //             child: Container(
// // //               padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
// // //               decoration: BoxDecoration(
// // //                 color: isSelected ? AppColors.primaryColor : Colors.white,
// // //                 borderRadius: BorderRadius.circular(24),
// // //                 boxShadow: [
// // //                   BoxShadow(
// // //                     color: Colors.black.withOpacity(0.05),
// // //                     blurRadius: 2,
// // //                     spreadRadius: 0,
// // //                     offset: const Offset(0, 1),
// // //                   ),
// // //                 ],
// // //               ),
// // //               child: Row(
// // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                 children: [
// // //                   Expanded(
// // //                     child: Text(
// // //                       question.options[index],
// // //                       style: TextStyle(
// // //                         fontSize: 16,
// // //                         fontWeight: FontWeight.w500,
// // //                         color: isSelected ? Colors.white : Colors.black,
// // //                       ),
// // //                     ),
// // //                   ),
// // //                   if (isSelected)
// // //                     Container(
// // //                       padding: const EdgeInsets.all(2),
// // //                       decoration: const BoxDecoration(
// // //                         color: Colors.white,
// // //                         shape: BoxShape.circle,
// // //                       ),
// // //                       child: const Icon(
// // //                         Icons.check,
// // //                         color: AppColors.primaryColor,
// // //                         size: 18,
// // //                       ),
// // //                     ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),
// // //         );
// // //       }),
// // //     );
// // //   }

// // //   Widget _buildTrueFalseOptions(
// // //       StudentQuestion question, StudentAssignmentDetailViewModel viewModel) {
// // //     return Column(
// // //       children: [
// // //         // True option
// // //         Container(
// // //           width: double.infinity,
// // //           margin: const EdgeInsets.only(bottom: 12),
// // //           child: InkWell(
// // //             onTap: () {
// // //               viewModel.updateSelectedOption(viewModel.currentQuestionIndex, 0);
// // //               // Force UI update
// // //               setState(() {});
// // //             },
// // //             borderRadius: BorderRadius.circular(24),
// // //             child: Container(
// // //               padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
// // //               decoration: BoxDecoration(
// // //                 color: question.selectedOption == 0
// // //                     ? AppColors.primaryColor
// // //                     : Colors.white,
// // //                 borderRadius: BorderRadius.circular(24),
// // //                 boxShadow: [
// // //                   BoxShadow(
// // //                     color: Colors.black.withOpacity(0.05),
// // //                     blurRadius: 2,
// // //                     spreadRadius: 0,
// // //                     offset: const Offset(0, 1),
// // //                   ),
// // //                 ],
// // //               ),
// // //               child: Row(
// // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                 children: [
// // //                   Text(
// // //                     'True',
// // //                     style: TextStyle(
// // //                       fontSize: 16,
// // //                       fontWeight: FontWeight.w500,
// // //                       color: question.selectedOption == 0
// // //                           ? Colors.white
// // //                           : Colors.black,
// // //                     ),
// // //                   ),
// // //                   if (question.selectedOption == 0)
// // //                     Container(
// // //                       padding: const EdgeInsets.all(2),
// // //                       decoration: const BoxDecoration(
// // //                         color: Colors.white,
// // //                         shape: BoxShape.circle,
// // //                       ),
// // //                       child: const Icon(
// // //                         Icons.check,
// // //                         color: AppColors.primaryColor,
// // //                         size: 18,
// // //                       ),
// // //                     ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),
// // //         ),

// // //         // False option
// // //         Container(
// // //           width: double.infinity,
// // //           margin: const EdgeInsets.only(bottom: 12),
// // //           child: InkWell(
// // //             onTap: () {
// // //               viewModel.updateSelectedOption(viewModel.currentQuestionIndex, 1);
// // //               // Force UI update
// // //               setState(() {});
// // //             },
// // //             borderRadius: BorderRadius.circular(24),
// // //             child: Container(
// // //               padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
// // //               decoration: BoxDecoration(
// // //                 color: question.selectedOption == 1
// // //                     ? AppColors.primaryColor
// // //                     : Colors.white,
// // //                 borderRadius: BorderRadius.circular(24),
// // //                 boxShadow: [
// // //                   BoxShadow(
// // //                     color: Colors.black.withOpacity(0.05),
// // //                     blurRadius: 2,
// // //                     spreadRadius: 0,
// // //                     offset: const Offset(0, 1),
// // //                   ),
// // //                 ],
// // //               ),
// // //               child: Row(
// // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                 children: [
// // //                   Text(
// // //                     'False',
// // //                     style: TextStyle(
// // //                       fontSize: 16,
// // //                       fontWeight: FontWeight.w500,
// // //                       color: question.selectedOption == 1
// // //                           ? Colors.white
// // //                           : Colors.black,
// // //                     ),
// // //                   ),
// // //                   if (question.selectedOption == 1)
// // //                     Container(
// // //                       padding: const EdgeInsets.all(2),
// // //                       decoration: const BoxDecoration(
// // //                         color: Colors.white,
// // //                         shape: BoxShape.circle,
// // //                       ),
// // //                       child: const Icon(
// // //                         Icons.check,
// // //                         color: AppColors.primaryColor,
// // //                         size: 18,
// // //                       ),
// // //                     ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),
// // //         ),
// // //       ],
// // //     );
// // //   }

// // //   Widget _buildFileUpload(
// // //       StudentQuestion question, StudentAssignmentDetailViewModel viewModel) {
// // //     // Si ya hay un archivo subido
// // //     if (question.uploadedFileUrl != null &&
// // //         question.uploadedFileUrl!.isNotEmpty) {
// // //       return Container(
// // //         width: double.infinity,
// // //         padding: const EdgeInsets.all(16),
// // //         margin: const EdgeInsets.only(bottom: 12),
// // //         decoration: BoxDecoration(
// // //           color: Colors.white,
// // //           borderRadius: BorderRadius.circular(12),
// // //           border: Border.all(color: Colors.green),
// // //           boxShadow: [
// // //             BoxShadow(
// // //               color: Colors.green.withOpacity(0.1),
// // //               blurRadius: 4,
// // //               spreadRadius: 1,
// // //             ),
// // //           ],
// // //         ),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             Row(
// // //               children: [
// // //                 const Icon(Icons.check_circle, color: Colors.green),
// // //                 const SizedBox(width: 8),
// // //                 const Text(
// // //                   'Your Uploaded Answer',
// // //                   style: TextStyle(
// // //                     fontSize: 16,
// // //                     fontWeight: FontWeight.bold,
// // //                     color: Colors.green,
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //             const SizedBox(height: 12),
// // //             Row(
// // //               children: [
// // //                 _getFileIcon(question.uploadedFileName ?? '', Colors.green),
// // //                 const SizedBox(width: 12),
// // //                 Expanded(
// // //                   child: Column(
// // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // //                     children: [
// // //                       Text(
// // //                         question.uploadedFileName ?? 'File uploaded',
// // //                         style: const TextStyle(
// // //                           fontWeight: FontWeight.w500,
// // //                           fontSize: 15,
// // //                         ),
// // //                         maxLines: 1,
// // //                         overflow: TextOverflow.ellipsis,
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //                 IconButton(
// // //                   icon: const Icon(Icons.delete, color: Colors.red),
// // //                   onPressed: () {
// // //                     // Reset the uploaded file
// // //                     viewModel.resetFileUpload(viewModel.currentQuestionIndex);
// // //                   },
// // //                 ),
// // //               ],
// // //             ),
// // //           ],
// // //         ),
// // //       );
// // //     }

// // //     // Si no hay archivo subido - nuevo diseño como la imagen de referencia
// // //     return Column(
// // //       crossAxisAlignment: CrossAxisAlignment.start,
// // //       children: [
// // //         // Título "Upload your answer file"
// // //         const Padding(
// // //           padding: EdgeInsets.only(left: 8, bottom: 16),
// // //           child: Text(
// // //             "Upload your answer file",
// // //             style: TextStyle(
// // //               fontSize: 16,
// // //               fontWeight: FontWeight.bold,
// // //               color: AppColors.primaryColor,
// // //             ),
// // //           ),
// // //         ),

// // //         // Contenedor para el botón de carga
// // //         Container(
// // //           margin: const EdgeInsets.symmetric(horizontal: 10),
// // //           width: double.infinity,
// // //           decoration: BoxDecoration(
// // //             color: Colors.white,
// // //             borderRadius: BorderRadius.circular(8),
// // //           ),
// // //           child: InkWell(
// // //             onTap: () async {
// // //               await _showFilePickerOptions(context, viewModel);
// // //             },
// // //             child: Container(
// // //               padding: const EdgeInsets.symmetric(vertical: 40),
// // //               child: Column(
// // //                 mainAxisAlignment: MainAxisAlignment.center,
// // //                 children: [
// // //                   // Icono circular para upload
// // //                   Container(
// // //                     width: 60,
// // //                     height: 60,
// // //                     decoration: BoxDecoration(
// // //                       color: Colors.blue.shade200,
// // //                       shape: BoxShape.circle,
// // //                     ),
// // //                     child: const Icon(
// // //                       Icons.cloud_upload,
// // //                       color: Colors.white,
// // //                       size: 30,
// // //                     ),
// // //                   ),
// // //                   const SizedBox(height: 16),
// // //                   const Text(
// // //                     "Tap to upload file",
// // //                     style: TextStyle(
// // //                       fontSize: 16,
// // //                       fontWeight: FontWeight.w500,
// // //                     ),
// // //                   ),
// // //                   const SizedBox(height: 8),
// // //                   Text(
// // //                     "PDF, JPG, PNG, or document files",
// // //                     style: TextStyle(
// // //                       fontSize: 14,
// // //                       color: Colors.grey.shade600,
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),
// // //         ),
// // //       ],
// // //     );
// // //   }

// // //   Future<void> _showFilePickerOptions(
// // //       BuildContext context, StudentAssignmentDetailViewModel viewModel) async {
// // //     showModalBottomSheet(
// // //       context: context,
// // //       backgroundColor: Colors.white,
// // //       shape: const RoundedRectangleBorder(
// // //         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
// // //       ),
// // //       builder: (context) {
// // //         return SafeArea(
// // //           child: Column(
// // //             mainAxisSize: MainAxisSize.min,
// // //             children: [
// // //               const Padding(
// // //                 padding: EdgeInsets.all(16.0),
// // //                 child: Text(
// // //                   'Select File Source',
// // //                   style: TextStyle(
// // //                     fontSize: 18,
// // //                     fontWeight: FontWeight.bold,
// // //                   ),
// // //                 ),
// // //               ),
// // //               const Divider(),
// // //               ListTile(
// // //                 leading: const Icon(Icons.photo_library,
// // //                     color: AppColors.primaryColor),
// // //                 title: const Text('Gallery'),
// // //                 onTap: () async {
// // //                   Navigator.pop(context);
// // //                   final XFile? image = await _picker.pickImage(
// // //                     source: ImageSource.gallery,
// // //                     imageQuality: 80,
// // //                   );
// // //                   if (image != null) {
// // //                     await _processSelectedFile(image, viewModel);
// // //                   }
// // //                 },
// // //               ),
// // //               ListTile(
// // //                 leading:
// // //                     const Icon(Icons.camera_alt, color: AppColors.primaryColor),
// // //                 title: const Text('Camera'),
// // //                 onTap: () async {
// // //                   Navigator.pop(context);
// // //                   final XFile? image = await _picker.pickImage(
// // //                     source: ImageSource.camera,
// // //                     imageQuality: 80,
// // //                   );
// // //                   if (image != null) {
// // //                     await _processSelectedFile(image, viewModel);
// // //                   }
// // //                 },
// // //               ),
// // //               // Option for non-image file (not fully implemented here)
// // //               /*
// // //               ListTile(
// // //                 leading: const Icon(Icons.file_present, color: AppColors.primaryColor),
// // //                 title: const Text('Document'),
// // //                 onTap: () async {
// // //                   Navigator.pop(context);
// // //                   // Need to implement document picker
// // //                 },
// // //               ),
// // //               */
// // //               const SizedBox(height: 8),
// // //             ],
// // //           ),
// // //         );
// // //       },
// // //     );
// // //   }

// // //   Future<void> _processSelectedFile(
// // //       XFile file, StudentAssignmentDetailViewModel viewModel) async {
// // //     try {
// // //       final File fileToUpload = File(file.path);
// // //       await viewModel.uploadFile(
// // //         viewModel.currentQuestionIndex,
// // //         fileToUpload,
// // //         file.name,
// // //       );
// // //     } catch (e) {
// // //       if (context.mounted) {
// // //         ScaffoldMessenger.of(context).showSnackBar(
// // //           SnackBar(
// // //             content: Text('Error processing file: $e'),
// // //             backgroundColor: Colors.red,
// // //           ),
// // //         );
// // //       }
// // //     }
// // //   }

// // //   Future<void> _launchURL(String url) async {
// // //     try {
// // //       final Uri uri = Uri.parse(url);
// // //       debugPrint('Attempting to launch URL: $url'); // تصحيح
// // //       if (await canLaunchUrl(uri)) {
// // //         await launchUrl(
// // //           uri,
// // //           mode: LaunchMode.externalApplication,
// // //         );
// // //       } else {
// // //         throw 'Could not launch $url';
// // //       }
// // //     } catch (e) {
// // //       debugPrint('Error launching URL: $e'); // تصحيح
// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         SnackBar(
// // //           content: Text('Could not open the file: $e'),
// // //           backgroundColor: Colors.red,
// // //         ),
// // //       );
// // //     }
// // //   }

// // //   Widget _getFileIcon(String fileName, Color color) {
// // //     IconData iconData;

// // //     if (fileName.endsWith('.pdf')) {
// // //       iconData = Icons.picture_as_pdf;
// // //     } else if (fileName.endsWith('.jpg') ||
// // //         fileName.endsWith('.jpeg') ||
// // //         fileName.endsWith('.png')) {
// // //       iconData = Icons.image;
// // //     } else if (fileName.endsWith('.doc') || fileName.endsWith('.docx')) {
// // //       iconData = Icons.description;
// // //     } else {
// // //       iconData = Icons.insert_drive_file;
// // //     }

// // //     return Container(
// // //       padding: const EdgeInsets.all(8),
// // //       decoration: BoxDecoration(
// // //         color: color.withOpacity(0.1),
// // //         borderRadius: BorderRadius.circular(8),
// // //       ),
// // //       child: Icon(
// // //         iconData,
// // //         color: color,
// // //         size: 24,
// // //       ),
// // //     );
// // //   }

// // //   String _formatFileSize(int sizeInBytes) {
// // //     if (sizeInBytes < 1024) {
// // //       return '$sizeInBytes B';
// // //     } else if (sizeInBytes < 1048576) {
// // //       return '${(sizeInBytes / 1024).toStringAsFixed(1)} KB';
// // //     } else {
// // //       return '${(sizeInBytes / 1048576).toStringAsFixed(1)} MB';
// // //     }
// // //   }
// // // }

// // import 'dart:io';
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'package:file_picker/file_picker.dart';
// // import 'package:attendance_app/core/utils/app_colors.dart';
// // import 'package:attendance_app/features/assignments/models/question_model_student.dart';
// // import 'package:attendance_app/features/assignments/presentation/viewmodels/student_assignment_detail_viewmodel.dart';
// // import 'package:attendance_app/features/assignments/presentation/viewmodels/student_assignments_viewmodel.dart';
// // import 'file_preview_view.dart';

// // class StudentAssignmentDetailView extends StatefulWidget {
// //   final String courseId;
// //   final String assignmentId;
// //   final String assignmentTitle;

// //   const StudentAssignmentDetailView({
// //     Key? key,
// //     required this.courseId,
// //     required this.assignmentId,
// //     required this.assignmentTitle,
// //   }) : super(key: key);

// //   @override
// //   State<StudentAssignmentDetailView> createState() =>
// //       _StudentAssignmentDetailViewState();
// // }

// // class _StudentAssignmentDetailViewState
// //     extends State<StudentAssignmentDetailView> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return ChangeNotifierProvider(
// //       create: (context) => StudentAssignmentDetailViewModel(
// //         courseId: widget.courseId,
// //         assignmentId: widget.assignmentId,
// //       ),
// //       child: Consumer<StudentAssignmentDetailViewModel>(
// //         builder: (context, viewModel, child) {
// //           // Mostrar mensajes de éxito o error
// //           if (viewModel.successMessage.isNotEmpty) {
// //             WidgetsBinding.instance.addPostFrameCallback((_) {
// //               ScaffoldMessenger.of(context).showSnackBar(
// //                 SnackBar(
// //                   content: Text(viewModel.successMessage),
// //                   backgroundColor: Colors.green,
// //                 ),
// //               );
// //               viewModel.clearMessages();
// //             });
// //           }

// //           if (viewModel.errorMessage.isNotEmpty) {
// //             WidgetsBinding.instance.addPostFrameCallback((_) {
// //               ScaffoldMessenger.of(context).showSnackBar(
// //                 SnackBar(
// //                   content: Text(viewModel.errorMessage),
// //                   backgroundColor: Colors.red,
// //                 ),
// //               );
// //               viewModel.clearMessages();
// //             });
// //           }

// //           return Scaffold(
// //             backgroundColor: const Color(0xFFF0F7FF),
// //             appBar: AppBar(
// //               title: Text(
// //                 widget.assignmentTitle,
// //                 style: const TextStyle(
// //                   fontWeight: FontWeight.bold,
// //                   fontSize: 20,
// //                   color: Colors.white,
// //                 ),
// //               ),
// //               backgroundColor: AppColors.primaryColor,
// //               elevation: 0,
// //               centerTitle: true,
// //             ),
// //             body: viewModel.isLoading
// //                 ? const Center(child: CircularProgressIndicator())
// //                 : viewModel.questions.isEmpty
// //                     ? const Center(
// //                         child: Text('No questions in this assignment'))
// //                     : _buildQuestionPage(context, viewModel),
// //           );
// //         },
// //       ),
// //     );
// //   }

// //   Widget _buildQuestionPage(
// //       BuildContext context, StudentAssignmentDetailViewModel viewModel) {
// //     final currentQuestion = viewModel.currentQuestion;
// //     if (currentQuestion == null) {
// //       return const Center(child: Text('Error loading question'));
// //     }

// //     // Force a rebuild of the page when the current question index changes
// //     return Padding(
// //       padding: const EdgeInsets.all(16.0),
// //       child: Column(
// //         key: ValueKey('question_${viewModel.currentQuestionIndex}'),
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           // Question header with indicator
// //           Container(
// //             margin: const EdgeInsets.only(bottom: 8),
// //             padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
// //             decoration: BoxDecoration(
// //               color: Colors.blue.withOpacity(0.1),
// //               borderRadius: BorderRadius.circular(8),
// //             ),
// //             child: Row(
// //               children: [
// //                 Text(
// //                   'Question ${viewModel.currentQuestionIndex + 1} of ${viewModel.questions.length}',
// //                   style: const TextStyle(
// //                     fontSize: 16,
// //                     fontWeight: FontWeight.bold,
// //                     color: AppColors.primaryColor,
// //                   ),
// //                 ),
// //                 const Spacer(),
// //                 if (!viewModel.allQuestionsAnswered)
// //                   const Text(
// //                     'Please answer all questions',
// //                     style: TextStyle(
// //                       fontSize: 14,
// //                       color: Colors.orange,
// //                       fontWeight: FontWeight.w600,
// //                     ),
// //                   ),
// //               ],
// //             ),
// //           ),

// //           // Question Text
// //           Padding(
// //             padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
// //             child: Text(
// //               currentQuestion.question,
// //               style: const TextStyle(
// //                 fontSize: 18,
// //                 fontWeight: FontWeight.w600,
// //               ),
// //             ),
// //           ),

// //           // Question file if exists - SOLO MOSTRAR PARA PREGUNTAS TIPO Upload File
// //           if (currentQuestion.type == 'Upload File' &&
// //               currentQuestion.fileUrl != null &&
// //               currentQuestion.fileUrl!.isNotEmpty)
// //             Container(
// //               margin: const EdgeInsets.only(bottom: 24),
// //               padding: const EdgeInsets.all(12),
// //               decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 borderRadius: BorderRadius.circular(12),
// //                 border: Border.all(color: Colors.grey.shade300),
// //               ),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   const Text(
// //                     'Question Attachment',
// //                     style: TextStyle(
// //                       fontSize: 14,
// //                       fontWeight: FontWeight.w600,
// //                     ),
// //                   ),
// //                   const SizedBox(height: 8),
// //                   Row(
// //                     children: [
// //                       _getFileIcon(currentQuestion.fileName ?? '', Colors.blue),
// //                       const SizedBox(width: 12),
// //                       Expanded(
// //                         child: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Text(
// //                               currentQuestion.fileName ?? 'File',
// //                               style: const TextStyle(
// //                                 fontWeight: FontWeight.w500,
// //                                 fontSize: 15,
// //                               ),
// //                               maxLines: 1,
// //                               overflow: TextOverflow.ellipsis,
// //                             ),
// //                             if (currentQuestion.fileSize != null)
// //                               Text(
// //                                 _formatFileSize(currentQuestion.fileSize!),
// //                                 style: TextStyle(
// //                                   fontSize: 13,
// //                                   color: Colors.grey.shade600,
// //                                 ),
// //                               ),
// //                           ],
// //                         ),
// //                       ),
// //                       IconButton(
// //                         icon: const Icon(Icons.visibility, color: Colors.blue),
// //                         onPressed: () {
// //                           // Navigate to FilePreviewView to open the file in the app
// //                           Navigator.push(
// //                             context,
// //                             MaterialPageRoute(
// //                               builder: (context) => FilePreviewView(
// //                                 fileUrl: currentQuestion.fileUrl!,
// //                                 firebaseFileName: currentQuestion.fileName,
// //                                 fileSize: currentQuestion.fileSize,
// //                               ),
// //                             ),
// //                           );
// //                         },
// //                       ),
// //                     ],
// //                   ),
// //                 ],
// //               ),
// //             ),

// //           // Different question types
// //           Expanded(
// //             child: SingleChildScrollView(
// //               child: _buildQuestionResponseWidget(currentQuestion, viewModel),
// //             ),
// //           ),

// //           // Bottom navigation with submit button and question indicators
// //           Column(
// //             children: [
// //               // Submit button
// //               SizedBox(
// //                 width: double.infinity,
// //                 child: ElevatedButton(
// //                   onPressed: viewModel.allQuestionsAnswered
// //                       ? () async {
// //                           final success = await viewModel.submitAssignment();
// //                           if (success && context.mounted) {
// //                             // Try to update the parent viewmodel to refresh the assignments list
// //                             try {
// //                               final parentViewModel =
// //                                   Provider.of<StudentAssignmentsViewModel>(
// //                                       context,
// //                                       listen: false);
// //                               await parentViewModel.refreshAssignments();
// //                             } catch (e) {
// //                               print("Could not refresh assignments list: $e");
// //                             }

// //                             // Show success message
// //                             ScaffoldMessenger.of(context).showSnackBar(
// //                               const SnackBar(
// //                                 content:
// //                                     Text('Assignment submitted successfully!'),
// //                                 backgroundColor: Colors.green,
// //                                 duration: Duration(seconds: 2),
// //                               ),
// //                             );

// //                             // Return to assignments list
// //                             Navigator.pop(context);
// //                           }
// //                         }
// //                       : null,
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: viewModel.allQuestionsAnswered
// //                         ? AppColors.primaryColor
// //                         : const Color(0xFFBDBDBD), // Medium gray when disabled
// //                     disabledBackgroundColor:
// //                         const Color(0xFFBDBDBD), // Medium gray when disabled
// //                     padding: const EdgeInsets.symmetric(vertical: 16),
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(8),
// //                     ),
// //                     elevation: 0,
// //                   ),
// //                   child: const Text(
// //                     'Submit',
// //                     style: TextStyle(
// //                       fontSize: 16,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.white,
// //                     ),
// //                   ),
// //                 ),
// //               ),

// //               // Show error message if not all questions are answered
// //               if (!viewModel.allQuestionsAnswered)
// //                 const Padding(
// //                   padding: EdgeInsets.only(top: 8.0),
// //                   child: Center(
// //                     child: Text(
// //                       'Please answer all questions before submitting',
// //                       style: TextStyle(
// //                         color: Colors.red,
// //                         fontSize: 14,
// //                         fontWeight: FontWeight.w500,
// //                       ),
// //                     ),
// //                   ),
// //                 ),

// //               const SizedBox(height: 16),

// //               // Question indicators
// //               SizedBox(
// //                 height: 45,
// //                 child: ListView.builder(
// //                   scrollDirection: Axis.horizontal,
// //                   itemCount: viewModel.questions.length,
// //                   itemBuilder: (context, index) {
// //                     final question = viewModel.questions[index];
// //                     final isActive = index == viewModel.currentQuestionIndex;
// //                     final isAnswered = question.isQuestionAnswered();
// //                     print(
// //                         'Question ${index + 1} isAnswered: $isAnswered, type: ${question.type}, selectedOption: ${question.selectedOption}');

// //                     // Force rebuild with a unique key based on answered state
// //                     return GestureDetector(
// //                       key: ValueKey(
// //                           'q_indicator_${index}_${isAnswered}_${isActive}'),
// //                       onTap: () {
// //                         viewModel.goToQuestion(index);
// //                       },
// //                       child: Container(
// //                         margin: const EdgeInsets.symmetric(horizontal: 4),
// //                         width: 100,
// //                         decoration: BoxDecoration(
// //                           color: isActive
// //                               ? AppColors.primaryColor
// //                               : (isAnswered
// //                                   ? const Color(
// //                                       0xFFCDF1CD) // Exact light green from image
// //                                   : Colors.white),
// //                           borderRadius: BorderRadius.circular(
// //                               12), // Rounded corners like in image
// //                           border: Border.all(
// //                             color: isActive
// //                                 ? AppColors.primaryColor
// //                                 : isAnswered
// //                                     ? const Color(
// //                                         0xFFCDF1CD) // Match border to background
// //                                     : Colors.grey.shade300,
// //                             width: 1,
// //                           ),
// //                         ),
// //                         child: Stack(
// //                           children: [
// //                             // Question text
// //                             Center(
// //                               child: Text(
// //                                 'Question ${index + 1}',
// //                                 style: TextStyle(
// //                                   color: isActive
// //                                       ? Colors.white
// //                                       : Colors
// //                                           .black, // Black text on green background
// //                                   fontSize: 14,
// //                                   fontWeight: FontWeight.w500,
// //                                 ),
// //                               ),
// //                             ),

// //                             // Checkmark for answered questions - positioned exactly as in image
// //                             if (isAnswered)
// //                               const Positioned(
// //                                 top: 1,
// //                                 right: 1,
// //                                 child: Icon(
// //                                   Icons.check_circle,
// //                                   color: Colors.green,
// //                                   size: 18,
// //                                 ),
// //                               ),
// //                           ],
// //                         ),
// //                       ),
// //                     );
// //                   },
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildQuestionResponseWidget(
// //       StudentQuestion question, StudentAssignmentDetailViewModel viewModel) {
// //     if (question.type == 'multiple_choice' || question.type == 'MCQ') {
// //       return _buildMultipleChoiceOptions(question, viewModel);
// //     } else if (question.type == 'true_false' || question.type == 'TrueFalse') {
// //       return _buildTrueFalseOptions(question, viewModel);
// //     } else if (question.type == 'Upload File') {
// //       return _buildFileUpload(question, viewModel);
// //     } else {
// //       return Center(
// //         child: Text(
// //           'Tipo de pregunta no soportado: ${question.type}',
// //           style: const TextStyle(color: Colors.red),
// //         ),
// //       );
// //     }
// //   }

// //   Widget _buildMultipleChoiceOptions(
// //       StudentQuestion question, StudentAssignmentDetailViewModel viewModel) {
// //     return Column(
// //       children: List.generate(question.options.length, (index) {
// //         final bool isSelected = question.selectedOption == index;

// //         return Container(
// //           width: double.infinity,
// //           margin: const EdgeInsets.only(bottom: 12),
// //           child: InkWell(
// //             onTap: () {
// //               viewModel.updateSelectedOption(
// //                   viewModel.currentQuestionIndex, index);
// //               // Force UI update
// //               setState(() {});
// //             },
// //             borderRadius: BorderRadius.circular(24),
// //             child: Container(
// //               padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
// //               decoration: BoxDecoration(
// //                 color: isSelected ? AppColors.primaryColor : Colors.white,
// //                 borderRadius: BorderRadius.circular(24),
// //                 boxShadow: [
// //                   BoxShadow(
// //                     color: Colors.black.withOpacity(0.05),
// //                     blurRadius: 2,
// //                     spreadRadius: 0,
// //                     offset: const Offset(0, 1),
// //                   ),
// //                 ],
// //               ),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   Expanded(
// //                     child: Text(
// //                       question.options[index],
// //                       style: TextStyle(
// //                         fontSize: 16,
// //                         fontWeight: FontWeight.w500,
// //                         color: isSelected ? Colors.white : Colors.black,
// //                       ),
// //                     ),
// //                   ),
// //                   if (isSelected)
// //                     Container(
// //                       padding: const EdgeInsets.all(2),
// //                       decoration: const BoxDecoration(
// //                         color: Colors.white,
// //                         shape: BoxShape.circle,
// //                       ),
// //                       child: const Icon(
// //                         Icons.check,
// //                         color: AppColors.primaryColor,
// //                         size: 18,
// //                       ),
// //                     ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         );
// //       }),
// //     );
// //   }

// //   Widget _buildTrueFalseOptions(
// //       StudentQuestion question, StudentAssignmentDetailViewModel viewModel) {
// //     return Column(
// //       children: [
// //         // True option
// //         Container(
// //           width: double.infinity,
// //           margin: const EdgeInsets.only(bottom: 12),
// //           child: InkWell(
// //             onTap: () {
// //               viewModel.updateSelectedOption(viewModel.currentQuestionIndex, 0);
// //               // Force UI update
// //               setState(() {});
// //             },
// //             borderRadius: BorderRadius.circular(24),
// //             child: Container(
// //               padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
// //               decoration: BoxDecoration(
// //                 color: question.selectedOption == 0
// //                     ? AppColors.primaryColor
// //                     : Colors.white,
// //                 borderRadius: BorderRadius.circular(24),
// //                 boxShadow: [
// //                   BoxShadow(
// //                     color: Colors.black.withOpacity(0.05),
// //                     blurRadius: 2,
// //                     spreadRadius: 0,
// //                     offset: const Offset(0, 1),
// //                   ),
// //                 ],
// //               ),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   Text(
// //                     'True',
// //                     style: TextStyle(
// //                       fontSize: 16,
// //                       fontWeight: FontWeight.w500,
// //                       color: question.selectedOption == 0
// //                           ? Colors.white
// //                           : Colors.black,
// //                     ),
// //                   ),
// //                   if (question.selectedOption == 0)
// //                     Container(
// //                       padding: const EdgeInsets.all(2),
// //                       decoration: const BoxDecoration(
// //                         color: Colors.white,
// //                         shape: BoxShape.circle,
// //                       ),
// //                       child: const Icon(
// //                         Icons.check,
// //                         color: AppColors.primaryColor,
// //                         size: 18,
// //                       ),
// //                     ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ),

// //         // False option
// //         Container(
// //           width: double.infinity,
// //           margin: const EdgeInsets.only(bottom: 12),
// //           child: InkWell(
// //             onTap: () {
// //               viewModel.updateSelectedOption(viewModel.currentQuestionIndex, 1);
// //               // Force UI update
// //               setState(() {});
// //             },
// //             borderRadius: BorderRadius.circular(24),
// //             child: Container(
// //               padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
// //               decoration: BoxDecoration(
// //                 color: question.selectedOption == 1
// //                     ? AppColors.primaryColor
// //                     : Colors.white,
// //                 borderRadius: BorderRadius.circular(24),
// //                 boxShadow: [
// //                   BoxShadow(
// //                     color: Colors.black.withOpacity(0.05),
// //                     blurRadius: 2,
// //                     spreadRadius: 0,
// //                     offset: const Offset(0, 1),
// //                   ),
// //                 ],
// //               ),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   Text(
// //                     'False',
// //                     style: TextStyle(
// //                       fontSize: 16,
// //                       fontWeight: FontWeight.w500,
// //                       color: question.selectedOption == 1
// //                           ? Colors.white
// //                           : Colors.black,
// //                     ),
// //                   ),
// //                   if (question.selectedOption == 1)
// //                     Container(
// //                       padding: const EdgeInsets.all(2),
// //                       decoration: const BoxDecoration(
// //                         color: Colors.white,
// //                         shape: BoxShape.circle,
// //                       ),
// //                       child: const Icon(
// //                         Icons.check,
// //                         color: AppColors.primaryColor,
// //                         size: 18,
// //                       ),
// //                     ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _buildFileUpload(
// //       StudentQuestion question, StudentAssignmentDetailViewModel viewModel) {
// //     // Si ya hay un archivo subido
// //     if (question.uploadedFileUrl != null &&
// //         question.uploadedFileUrl!.isNotEmpty) {
// //       return Container(
// //         width: double.infinity,
// //         padding: const EdgeInsets.all(16),
// //         margin: const EdgeInsets.only(bottom: 12),
// //         decoration: BoxDecoration(
// //           color: Colors.white,
// //           borderRadius: BorderRadius.circular(12),
// //           border: Border.all(color: Colors.green),
// //           boxShadow: [
// //             BoxShadow(
// //               color: Colors.green.withOpacity(0.1),
// //               blurRadius: 4,
// //               spreadRadius: 1,
// //             ),
// //           ],
// //         ),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Row(
// //               children: [
// //                 const Icon(Icons.check_circle, color: Colors.green),
// //                 const SizedBox(width: 8),
// //                 const Text(
// //                   'Your Uploaded Answer',
// //                   style: TextStyle(
// //                     fontSize: 16,
// //                     fontWeight: FontWeight.bold,
// //                     color: Colors.green,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             const SizedBox(height: 12),
// //             Row(
// //               children: [
// //                 _getFileIcon(question.uploadedFileName ?? '', Colors.green),
// //                 const SizedBox(width: 12),
// //                 Expanded(
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text(
// //                         question.uploadedFileName ?? 'File uploaded',
// //                         style: const TextStyle(
// //                           fontWeight: FontWeight.w500,
// //                           fontSize: 15,
// //                         ),
// //                         maxLines: 1,
// //                         overflow: TextOverflow.ellipsis,
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 IconButton(
// //                   icon: const Icon(Icons.delete, color: Colors.red),
// //                   onPressed: () {
// //                     // Reset the uploaded file
// //                     viewModel.resetFileUpload(viewModel.currentQuestionIndex);
// //                   },
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       );
// //     }

// //     // Si no hay archivo subido - nuevo diseño كما في الصورة المرجعية
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         // عنوان "Upload your answer file"
// //         const Padding(
// //           padding: EdgeInsets.only(left: 8, bottom: 16),
// //           child: Text(
// //             "Upload your answer file",
// //             style: TextStyle(
// //               fontSize: 16,
// //               fontWeight: FontWeight.bold,
// //               color: AppColors.primaryColor,
// //             ),
// //           ),
// //         ),

// //         // حاوية لزر الرفع
// //         Container(
// //           margin: const EdgeInsets.symmetric(horizontal: 10),
// //           width: double.infinity,
// //           decoration: BoxDecoration(
// //             color: Colors.white,
// //             borderRadius: BorderRadius.circular(8),
// //           ),
// //           child: InkWell(
// //             onTap: () async {
// //               await _pickFile(context, viewModel);
// //             },
// //             child: Container(
// //               padding: const EdgeInsets.symmetric(vertical: 40),
// //               child: Column(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   // أيقونة دائرية للرفع
// //                   Container(
// //                     width: 60,
// //                     height: 60,
// //                     decoration: BoxDecoration(
// //                       color: Colors.blue.shade200,
// //                       shape: BoxShape.circle,
// //                     ),
// //                     child: const Icon(
// //                       Icons.cloud_upload,
// //                       color: Colors.white,
// //                       size: 30,
// //                     ),
// //                   ),
// //                   const SizedBox(height: 16),
// //                   const Text(
// //                     "Tap to upload file",
// //                     style: TextStyle(
// //                       fontSize: 16,
// //                       fontWeight: FontWeight.w500,
// //                     ),
// //                   ),
// //                   const SizedBox(height: 8),
// //                   Text(
// //                     "PDF, JPG, PNG, or document files",
// //                     style: TextStyle(
// //                       fontSize: 14,
// //                       color: Colors.grey.shade600,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }

// //   Future<void> _pickFile(
// //       BuildContext context, StudentAssignmentDetailViewModel viewModel) async {
// //     try {
// //       // استخدام file_picker لاختيار ملف من الجهاز
// //       FilePickerResult? result = await FilePicker.platform.pickFiles(
// //         type: FileType.custom,
// //         allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png', 'doc', 'docx'],
// //       );

// //       if (result != null && result.files.single.path != null) {
// //         PlatformFile file = result.files.single;
// //         File fileToUpload = File(file.path!);
// //         String fileName = file.name;

// //         // رفع الملف باستخدام viewModel
// //         await viewModel.uploadFile(
// //           viewModel.currentQuestionIndex,
// //           fileToUpload,
// //           fileName,
// //         );
// //       } else {
// //         // لم يتم اختيار ملف
// //         if (context.mounted) {
// //           ScaffoldMessenger.of(context).showSnackBar(
// //             const SnackBar(
// //               content: Text('No file selected'),
// //               backgroundColor: Colors.orange,
// //             ),
// //           );
// //         }
// //       }
// //     } catch (e) {
// //       if (context.mounted) {
// //         ScaffoldMessenger.of(context).showSnackBar(
// //           SnackBar(
// //             content: Text('Error picking file: $e'),
// //             backgroundColor: Colors.red,
// //           ),
// //         );
// //       }
// //     }
// //   }

// //   Widget _getFileIcon(String fileName, Color color) {
// //     IconData iconData;

// //     if (fileName.endsWith('.pdf')) {
// //       iconData = Icons.picture_as_pdf;
// //     } else if (fileName.endsWith('.jpg') ||
// //         fileName.endsWith('.jpeg') ||
// //         fileName.endsWith('.png')) {
// //       iconData = Icons.image;
// //     } else if (fileName.endsWith('.doc') || fileName.endsWith('.docx')) {
// //       iconData = Icons.description;
// //     } else {
// //       iconData = Icons.insert_drive_file;
// //     }

// //     return Container(
// //       padding: const EdgeInsets.all(8),
// //       decoration: BoxDecoration(
// //         color: color.withOpacity(0.1),
// //         borderRadius: BorderRadius.circular(8),
// //       ),
// //       child: Icon(
// //         iconData,
// //         color: color,
// //         size: 24,
// //       ),
// //     );
// //   }

// //   String _formatFileSize(int sizeInBytes) {
// //     if (sizeInBytes < 1024) {
// //       return '$sizeInBytes B';
// //     } else if (sizeInBytes < 1048576) {
// //       return '${(sizeInBytes / 1024).toStringAsFixed(1)} KB';
// //     } else {
// //       return '${(sizeInBytes / 1048576).toStringAsFixed(1)} MB';
// //     }
// //   }
// // }

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:attendance_app/core/utils/app_colors.dart';
// import 'package:attendance_app/features/assignments/models/question_model_student.dart';
// import 'package:attendance_app/features/assignments/presentation/viewmodels/student_assignment_detail_viewmodel.dart';
// import 'package:attendance_app/features/assignments/presentation/viewmodels/student_assignments_viewmodel.dart';
// import 'file_preview_view.dart';

// class StudentAssignmentDetailView extends StatefulWidget {
//   final String courseId;
//   final String assignmentId;
//   final String assignmentTitle;

//   const StudentAssignmentDetailView({
//     Key? key,
//     required this.courseId,
//     required this.assignmentId,
//     required this.assignmentTitle,
//   }) : super(key: key);

//   @override
//   State<StudentAssignmentDetailView> createState() =>
//       _StudentAssignmentDetailViewState();
// }

// class _StudentAssignmentDetailViewState
//     extends State<StudentAssignmentDetailView> {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => StudentAssignmentDetailViewModel(
//         courseId: widget.courseId,
//         assignmentId: widget.assignmentId,
//       ),
//       child: Consumer<StudentAssignmentDetailViewModel>(
//         builder: (context, viewModel, child) {
//           if (viewModel.successMessage.isNotEmpty) {
//             WidgetsBinding.instance.addPostFrameCallback((_) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text(viewModel.successMessage),
//                   backgroundColor: Colors.green,
//                 ),
//               );
//               viewModel.clearMessages();
//             });
//           }

//           if (viewModel.errorMessage.isNotEmpty) {
//             WidgetsBinding.instance.addPostFrameCallback((_) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text(viewModel.errorMessage),
//                   backgroundColor: Colors.red,
//                 ),
//               );
//               viewModel.clearMessages();
//             });
//           }

//           return Scaffold(
//             backgroundColor: const Color(0xFFF0F7FF),
//             appBar: AppBar(
//               title: Text(
//                 widget.assignmentTitle,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                   color: Colors.white,
//                 ),
//               ),
//               backgroundColor: AppColors.primaryColor,
//               elevation: 0,
//               centerTitle: true,
//             ),
//             body: viewModel.isLoading
//                 ? const Center(child: CircularProgressIndicator())
//                 : viewModel.questions.isEmpty
//                     ? const Center(
//                         child: Text('No questions in this assignment'))
//                     : _buildQuestionPage(context, viewModel),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildQuestionPage(
//       BuildContext context, StudentAssignmentDetailViewModel viewModel) {
//     final currentQuestion = viewModel.currentQuestion;
//     if (currentQuestion == null) {
//       return const Center(child: Text('Error loading question'));
//     }

//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         key: ValueKey('question_${viewModel.currentQuestionIndex}'),
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             margin: const EdgeInsets.only(bottom: 8),
//             padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//             decoration: BoxDecoration(
//               color: Colors.blue.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Row(
//               children: [
//                 Text(
//                   'Question ${viewModel.currentQuestionIndex + 1} of ${viewModel.questions.length}',
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: AppColors.primaryColor,
//                   ),
//                 ),
//                 const Spacer(),
//                 if (!viewModel.allQuestionsAnswered)
//                   const Text(
//                     'Please answer all questions',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.orange,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
//             child: Text(
//               currentQuestion.question,
//               style: const TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//           if (currentQuestion.type == 'Upload File' &&
//               currentQuestion.fileUrl != null &&
//               currentQuestion.fileUrl!.isNotEmpty)
//             Container(
//               margin: const EdgeInsets.only(bottom: 24),
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//                 border: Border.all(color: Colors.grey.shade300),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Question Attachment',
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: [
//                       _getFileIcon(currentQuestion.fileName ?? '', Colors.blue),
//                       const SizedBox(width: 12),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               currentQuestion.fileName ?? 'File',
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 15,
//                               ),
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                             if (currentQuestion.fileSize != null)
//                               Text(
//                                 _formatFileSize(currentQuestion.fileSize!),
//                                 style: TextStyle(
//                                   fontSize: 13,
//                                   color: Colors.grey.shade600,
//                                 ),
//                               ),
//                           ],
//                         ),
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.visibility, color: Colors.blue),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => FilePreviewView(
//                                 fileUrl: currentQuestion.fileUrl!,
//                                 firebaseFileName: currentQuestion.fileName,
//                                 fileSize: currentQuestion.fileSize,
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           Expanded(
//             child: SingleChildScrollView(
//               child: _buildQuestionResponseWidget(currentQuestion, viewModel),
//             ),
//           ),
//           Column(
//             children: [
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: viewModel.allQuestionsAnswered &&
//                           !viewModel.isSubmitting
//                       ? () async {
//                           final success = await viewModel.submitAssignment();
//                           if (success && context.mounted) {
//                             try {
//                               final parentViewModel =
//                                   Provider.of<StudentAssignmentsViewModel>(
//                                       context,
//                                       listen: false);
//                               await parentViewModel.refreshAssignments();
//                             } catch (e) {
//                               print("Could not refresh assignments list: $e");
//                             }

//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                 content:
//                                     Text('Assignment submitted successfully!'),
//                                 backgroundColor: Colors.green,
//                                 duration: Duration(seconds: 2),
//                               ),
//                             );

//                             Navigator.pop(context);
//                           }
//                         }
//                       : null,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: viewModel.allQuestionsAnswered
//                         ? AppColors.primaryColor
//                         : const Color(0xFFBDBDBD),
//                     disabledBackgroundColor: const Color(0xFFBDBDBD),
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     elevation: 0,
//                   ),
//                   child: viewModel.isSubmitting
//                       ? const CircularProgressIndicator(
//                           color: Colors.white,
//                           strokeWidth: 2,
//                         )
//                       : const Text(
//                           'Submit',
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                 ),
//               ),
//               if (!viewModel.allQuestionsAnswered)
//                 const Padding(
//                   padding: EdgeInsets.only(top: 8.0),
//                   child: Center(
//                     child: Text(
//                       'Please answer all questions before submitting',
//                       style: TextStyle(
//                         color: Colors.red,
//                         fontSize: 14,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ),
//               const SizedBox(height: 16),
//               SizedBox(
//                 height: 45,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: viewModel.questions.length,
//                   itemBuilder: (context, index) {
//                     final question = viewModel.questions[index];
//                     final isActive = index == viewModel.currentQuestionIndex;
//                     final isAnswered = question.isQuestionAnswered();

//                     return GestureDetector(
//                       key: ValueKey(
//                           'q_indicator_${index}_${isAnswered}_${isActive}'),
//                       onTap: () {
//                         viewModel.goToQuestion(index);
//                       },
//                       child: Container(
//                         margin: const EdgeInsets.symmetric(horizontal: 4),
//                         width: 100,
//                         decoration: BoxDecoration(
//                           color: isActive
//                               ? AppColors.primaryColor
//                               : (isAnswered
//                                   ? const Color(0xFFCDF1CD)
//                                   : Colors.white),
//                           borderRadius: BorderRadius.circular(12),
//                           border: Border.all(
//                             color: isActive
//                                 ? AppColors.primaryColor
//                                 : isAnswered
//                                     ? const Color(0xFFCDF1CD)
//                                     : Colors.grey.shade300,
//                             width: 1,
//                           ),
//                         ),
//                         child: Stack(
//                           children: [
//                             Center(
//                               child: Text(
//                                 'Question ${index + 1}',
//                                 style: TextStyle(
//                                   color: isActive ? Colors.white : Colors.black,
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ),
//                             if (isAnswered)
//                               const Positioned(
//                                 top: 1,
//                                 right: 1,
//                                 child: Icon(
//                                   Icons.check_circle,
//                                   color: Colors.green,
//                                   size: 18,
//                                 ),
//                               ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildQuestionResponseWidget(
//       StudentQuestion question, StudentAssignmentDetailViewModel viewModel) {
//     if (question.type == 'multiple_choice' || question.type == 'MCQ') {
//       return _buildMultipleChoiceOptions(question, viewModel);
//     } else if (question.type == 'true_false' || question.type == 'TrueFalse') {
//       return _buildTrueFalseOptions(question, viewModel);
//     } else if (question.type == 'Upload File') {
//       return _buildFileUpload(question, viewModel);
//     } else {
//       return Center(
//         child: Text(
//           'Unsupported question type: ${question.type}',
//           style: const TextStyle(color: Colors.red),
//         ),
//       );
//     }
//   }

//   Widget _buildMultipleChoiceOptions(
//       StudentQuestion question, StudentAssignmentDetailViewModel viewModel) {
//     return Column(
//       children: List.generate(question.options.length, (index) {
//         final bool isSelected = question.selectedOption == index;

//         return Container(
//           width: double.infinity,
//           margin: const EdgeInsets.only(bottom: 12),
//           child: InkWell(
//             onTap: () {
//               viewModel.updateSelectedOption(
//                   viewModel.currentQuestionIndex, index);
//               setState(() {});
//             },
//             borderRadius: BorderRadius.circular(24),
//             child: Container(
//               padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
//               decoration: BoxDecoration(
//                 color: isSelected ? AppColors.primaryColor : Colors.white,
//                 borderRadius: BorderRadius.circular(24),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.05),
//                     blurRadius: 2,
//                     spreadRadius: 0,
//                     offset: const Offset(0, 1),
//                   ),
//                 ],
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Text(
//                       question.options[index],
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: isSelected ? Colors.white : Colors.black,
//                       ),
//                     ),
//                   ),
//                   if (isSelected)
//                     Container(
//                       padding: const EdgeInsets.all(2),
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         shape: BoxShape.circle,
//                       ),
//                       child: const Icon(
//                         Icons.check,
//                         color: AppColors.primaryColor,
//                         size: 18,
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       }),
//     );
//   }

//   Widget _buildTrueFalseOptions(
//       StudentQuestion question, StudentAssignmentDetailViewModel viewModel) {
//     return Column(
//       children: [
//         Container(
//           width: double.infinity,
//           margin: const EdgeInsets.only(bottom: 12),
//           child: InkWell(
//             onTap: () {
//               viewModel.updateSelectedOption(viewModel.currentQuestionIndex, 0);
//               setState(() {});
//             },
//             borderRadius: BorderRadius.circular(24),
//             child: Container(
//               padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
//               decoration: BoxDecoration(
//                 color: question.selectedOption == 0
//                     ? AppColors.primaryColor
//                     : Colors.white,
//                 borderRadius: BorderRadius.circular(24),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.05),
//                     blurRadius: 2,
//                     spreadRadius: 0,
//                     offset: const Offset(0, 1),
//                   ),
//                 ],
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'True',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                       color: question.selectedOption == 0
//                           ? Colors.white
//                           : Colors.black,
//                     ),
//                   ),
//                   if (question.selectedOption == 0)
//                     Container(
//                       padding: const EdgeInsets.all(2),
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         shape: BoxShape.circle,
//                       ),
//                       child: const Icon(
//                         Icons.check,
//                         color: AppColors.primaryColor,
//                         size: 18,
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Container(
//           width: double.infinity,
//           margin: const EdgeInsets.only(bottom: 12),
//           child: InkWell(
//             onTap: () {
//               viewModel.updateSelectedOption(viewModel.currentQuestionIndex, 1);
//               setState(() {});
//             },
//             borderRadius: BorderRadius.circular(24),
//             child: Container(
//               padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
//               decoration: BoxDecoration(
//                 color: question.selectedOption == 1
//                     ? AppColors.primaryColor
//                     : Colors.white,
//                 borderRadius: BorderRadius.circular(24),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.05),
//                     blurRadius: 2,
//                     spreadRadius: 0,
//                     offset: const Offset(0, 1),
//                   ),
//                 ],
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'False',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                       color: question.selectedOption == 1
//                           ? Colors.white
//                           : Colors.black,
//                     ),
//                   ),
//                   if (question.selectedOption == 1)
//                     Container(
//                       padding: const EdgeInsets.all(2),
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         shape: BoxShape.circle,
//                       ),
//                       child: const Icon(
//                         Icons.check,
//                         color: AppColors.primaryColor,
//                         size: 18,
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildFileUpload(
//       StudentQuestion question, StudentAssignmentDetailViewModel viewModel) {
//     if (question.uploadedFileUrl != null &&
//         question.uploadedFileUrl!.isNotEmpty) {
//       return Container(
//         width: double.infinity,
//         padding: const EdgeInsets.all(16),
//         margin: const EdgeInsets.only(bottom: 12),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: Colors.green),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.green.withOpacity(0.1),
//               blurRadius: 4,
//               spreadRadius: 1,
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 const Icon(Icons.check_circle, color: Colors.green),
//                 const SizedBox(width: 8),
//                 const Text(
//                   'Your Uploaded Answer',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.green,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 12),
//             Row(
//               children: [
//                 _getFileIcon(question.uploadedFileName ?? '', Colors.green),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         question.uploadedFileName ?? 'File uploaded',
//                         style: const TextStyle(
//                           fontWeight: FontWeight.w500,
//                           fontSize: 15,
//                         ),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ],
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.visibility, color: Colors.blue),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => FilePreviewView(
//                           fileUrl: question.uploadedFileUrl!,
//                           firebaseFileName: question.uploadedFileName,
//                           fileSize: null,
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.delete, color: Colors.red),
//                   onPressed: () {
//                     viewModel.resetFileUpload(viewModel.currentQuestionIndex);
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       );
//     }

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Padding(
//           padding: EdgeInsets.only(left: 8, bottom: 16),
//           child: Text(
//             "Upload your answer file",
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: AppColors.primaryColor,
//             ),
//           ),
//         ),
//         Container(
//           margin: const EdgeInsets.symmetric(horizontal: 10),
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: viewModel.isUploading
//               ? Center(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       SizedBox(
//                         width: 40,
//                         height: 40,
//                         child: CircularProgressIndicator(
//                           value: viewModel.uploadProgress,
//                           strokeWidth: 3,
//                           valueColor: AlwaysStoppedAnimation<Color>(
//                               AppColors.primaryColor),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Text(
//                         'Uploading... ${(viewModel.uploadProgress * 100).toStringAsFixed(0)}%',
//                         style: const TextStyle(fontSize: 14),
//                       ),
//                     ],
//                   ),
//                 )
//               : InkWell(
//                   onTap: () async {
//                     await _pickFile(context, viewModel);
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(vertical: 40),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           width: 60,
//                           height: 60,
//                           decoration: BoxDecoration(
//                             color: Colors.blue.shade200,
//                             shape: BoxShape.circle,
//                           ),
//                           child: const Icon(
//                             Icons.cloud_upload,
//                             color: Colors.white,
//                             size: 30,
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         const Text(
//                           "Tap to upload file",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           "PDF, JPG, PNG, or document files",
//                           style: TextStyle(
//                             fontSize: 14,
//                             color: Colors.grey.shade600,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//         ),
//       ],
//     );
//   }

//   Future<void> _pickFile(
//       BuildContext context, StudentAssignmentDetailViewModel viewModel) async {
//     try {
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         type: FileType.custom,
//         allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png', 'doc', 'docx'],
//       );

//       if (result != null && result.files.single.path != null) {
//         PlatformFile file = result.files.single;
//         File fileToUpload = File(file.path!);
//         String fileName = file.name;

//         await viewModel.uploadFile(
//           viewModel.currentQuestionIndex,
//           fileToUpload,
//           fileName,
//         );
//       } else {
//         if (context.mounted) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('No file selected'),
//               backgroundColor: Colors.orange,
//             ),
//           );
//         }
//       }
//     } catch (e) {
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Error picking file: $e'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     }
//   }

//   Widget _getFileIcon(String fileName, Color color) {
//     IconData iconData;

//     if (fileName.endsWith('.pdf')) {
//       iconData = Icons.picture_as_pdf;
//     } else if (fileName.endsWith('.jpg') ||
//         fileName.endsWith('.jpeg') ||
//         fileName.endsWith('.png')) {
//       iconData = Icons.image;
//     } else if (fileName.endsWith('.doc') || fileName.endsWith('.docx')) {
//       iconData = Icons.description;
//     } else {
//       iconData = Icons.insert_drive_file;
//     }

//     return Container(
//       padding: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: color.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Icon(
//         iconData,
//         color: color,
//         size: 24,
//       ),
//     );
//   }

//   String _formatFileSize(int sizeInBytes) {
//     if (sizeInBytes < 1024) {
//       return '$sizeInBytes B';
//     } else if (sizeInBytes < 1048576) {
//       return '${(sizeInBytes / 1024).toStringAsFixed(1)} KB';
//     } else {
//       return '${(sizeInBytes / 1048576).toStringAsFixed(1)} MB';
//     }
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/assignments/models/question_model_student.dart';
import 'package:attendance_app/features/assignments/presentation/viewmodels/student_assignment_detail_viewmodel.dart';
import 'package:attendance_app/features/assignments/presentation/viewmodels/student_assignments_viewmodel.dart';
import 'file_preview_view.dart';

class StudentAssignmentDetailView extends StatefulWidget {
  final String courseId;
  final String assignmentId;
  final String assignmentTitle;

  const StudentAssignmentDetailView({
    Key? key,
    required this.courseId,
    required this.assignmentId,
    required this.assignmentTitle,
  }) : super(key: key);

  @override
  State<StudentAssignmentDetailView> createState() =>
      _StudentAssignmentDetailViewState();
}

class _StudentAssignmentDetailViewState
    extends State<StudentAssignmentDetailView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StudentAssignmentDetailViewModel(
        courseId: widget.courseId,
        assignmentId: widget.assignmentId,
      ),
      child: Consumer<StudentAssignmentDetailViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.successMessage.isNotEmpty) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(viewModel.successMessage),
                  backgroundColor: Colors.green,
                ),
              );
              viewModel.clearMessages();
            });
          }

          if (viewModel.errorMessage.isNotEmpty) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(viewModel.errorMessage),
                  backgroundColor: Colors.red,
                ),
              );
              viewModel.clearMessages();
            });
          }

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
              backgroundColor: AppColors.primaryColor,
              elevation: 0,
              centerTitle: true,
            ),
            body: viewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : viewModel.questions.isEmpty
                    ? const Center(
                        child: Text('No questions in this assignment'))
                    : _buildQuestionPage(context, viewModel),
          );
        },
      ),
    );
  }

  Widget _buildQuestionPage(
      BuildContext context, StudentAssignmentDetailViewModel viewModel) {
    final currentQuestion = viewModel.currentQuestion;
    if (currentQuestion == null) {
      return const Center(child: Text('Error loading question'));
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        key: ValueKey('question_${viewModel.currentQuestionIndex}'),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Text(
                  'Question ${viewModel.currentQuestionIndex + 1} of ${viewModel.questions.length}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                const Spacer(),
                if (!viewModel.allQuestionsAnswered)
                  const Text(
                    'Please answer all questions',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.orange,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Text(
              currentQuestion.question,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          if (currentQuestion.type == 'Upload File' &&
              currentQuestion.fileUrl != null &&
              currentQuestion.fileUrl!.isNotEmpty)
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Question Attachment',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _getFileIcon(currentQuestion.fileName ?? '', Colors.blue),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              currentQuestion.fileName ?? 'File',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (currentQuestion.fileSize != null)
                              Text(
                                _formatFileSize(currentQuestion.fileSize!),
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.visibility, color: Colors.blue),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FilePreviewView(
                                fileUrl: currentQuestion.fileUrl!,
                                firebaseFileName: currentQuestion.fileName,
                                fileSize: currentQuestion.fileSize,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          Expanded(
            child: SingleChildScrollView(
              child: _buildQuestionResponseWidget(currentQuestion, viewModel),
            ),
          ),
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: viewModel.allQuestionsAnswered &&
                          !viewModel.isSubmitting
                      ? () async {
                          final success = await viewModel.submitAssignment();
                          if (success && context.mounted) {
                            try {
                              final parentViewModel =
                                  Provider.of<StudentAssignmentsViewModel>(
                                      context,
                                      listen: false);
                              await parentViewModel.refreshAssignments();
                            } catch (e) {
                              print("Could not refresh assignments list: $e");
                            }

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Assignment submitted successfully!'),
                                backgroundColor: Colors.green,
                                duration: Duration(seconds: 2),
                              ),
                            );

                            Navigator.pop(context);
                          }
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: viewModel.allQuestionsAnswered
                        ? AppColors.primaryColor
                        : const Color(0xFFBDBDBD),
                    disabledBackgroundColor: const Color(0xFFBDBDBD),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: viewModel.isSubmitting
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        )
                      : const Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
              if (!viewModel.allQuestionsAnswered)
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Center(
                    child: Text(
                      'Please answer all questions before submitting',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 16),
              SizedBox(
                height: 45,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: viewModel.questions.length,
                  itemBuilder: (context, index) {
                    final question = viewModel.questions[index];
                    final isActive = index == viewModel.currentQuestionIndex;
                    final isAnswered = question.isQuestionAnswered();

                    return GestureDetector(
                      key: ValueKey(
                          'q_indicator_${index}_${isAnswered}_${isActive}'),
                      onTap: () {
                        viewModel.goToQuestion(index);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 100,
                        decoration: BoxDecoration(
                          color: isActive
                              ? AppColors.primaryColor
                              : (isAnswered
                                  ? const Color(0xFFCDF1CD)
                                  : Colors.white),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isActive
                                ? AppColors.primaryColor
                                : isAnswered
                                    ? const Color(0xFFCDF1CD)
                                    : Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: Text(
                                'Question ${index + 1}',
                                style: TextStyle(
                                  color: isActive ? Colors.white : Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            if (isAnswered)
                              const Positioned(
                                top: 1,
                                right: 1,
                                child: Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 18,
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionResponseWidget(
      StudentQuestion question, StudentAssignmentDetailViewModel viewModel) {
    if (question.type == 'multiple_choice' || question.type == 'MCQ') {
      return _buildMultipleChoiceOptions(question, viewModel);
    } else if (question.type == 'true_false' || question.type == 'TrueFalse') {
      return _buildTrueFalseOptions(question, viewModel);
    } else if (question.type == 'Upload File') {
      return _buildFileUpload(question, viewModel);
    } else {
      return Center(
        child: Text(
          'Unsupported question type: ${question.type}',
          style: const TextStyle(color: Colors.red),
        ),
      );
    }
  }

  Widget _buildMultipleChoiceOptions(
      StudentQuestion question, StudentAssignmentDetailViewModel viewModel) {
    return Column(
      children: List.generate(question.options.length, (index) {
        final bool isSelected = question.selectedOption == index;

        return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 12),
          child: InkWell(
            onTap: () {
              viewModel.updateSelectedOption(
                  viewModel.currentQuestionIndex, index);
              setState(() {});
            },
            borderRadius: BorderRadius.circular(24),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryColor : Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 2,
                    spreadRadius: 0,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      question.options[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  if (isSelected)
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: AppColors.primaryColor,
                        size: 18,
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildTrueFalseOptions(
      StudentQuestion question, StudentAssignmentDetailViewModel viewModel) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 12),
          child: InkWell(
            onTap: () {
              viewModel.updateSelectedOption(viewModel.currentQuestionIndex, 0);
              setState(() {});
            },
            borderRadius: BorderRadius.circular(24),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: BoxDecoration(
                color: question.selectedOption == 0
                    ? AppColors.primaryColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 2,
                    spreadRadius: 0,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'True',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: question.selectedOption == 0
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  if (question.selectedOption == 0)
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: AppColors.primaryColor,
                        size: 18,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 12),
          child: InkWell(
            onTap: () {
              viewModel.updateSelectedOption(viewModel.currentQuestionIndex, 1);
              setState(() {});
            },
            borderRadius: BorderRadius.circular(24),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: BoxDecoration(
                color: question.selectedOption == 1
                    ? AppColors.primaryColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 2,
                    spreadRadius: 0,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'False',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: question.selectedOption == 1
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  if (question.selectedOption == 1)
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: AppColors.primaryColor,
                        size: 18,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFileUpload(
      StudentQuestion question, StudentAssignmentDetailViewModel viewModel) {
    if (question.uploadedFileUrl != null &&
        question.uploadedFileUrl!.isNotEmpty) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.green),
          boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(0.1),
              blurRadius: 4,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.green),
                const SizedBox(width: 8),
                const Text(
                  'Your Uploaded Answer',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _getFileIcon(question.uploadedFileName ?? '', Colors.green),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        question.uploadedFileName ?? 'File uploaded',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.visibility, color: Colors.blue),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FilePreviewView(
                          fileUrl: question.uploadedFileUrl!,
                          firebaseFileName: question.uploadedFileName,
                          fileSize: null,
                        ),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    viewModel.resetFileUpload(viewModel.currentQuestionIndex);
                  },
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8, bottom: 16),
          child: Text(
            "Upload your answer file",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: viewModel.isUploading
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: CircularProgressIndicator(
                          value: viewModel.uploadProgress,
                          strokeWidth: 3,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.primaryColor),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Uploading... ${(viewModel.uploadProgress * 100).toStringAsFixed(0)}%',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                )
              : InkWell(
                  onTap: () async {
                    await _pickFile(context, viewModel);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade200,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.cloud_upload,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Tap to upload file",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "PDF, JPG, PNG, or document files",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ],
    );
  }

  Future<void> _pickFile(
      BuildContext context, StudentAssignmentDetailViewModel viewModel) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png', 'doc', 'docx'],
      );

      if (result != null && result.files.single.path != null) {
        PlatformFile file = result.files.single;
        File fileToUpload = File(file.path!);
        String fileName = file.name;

        await viewModel.uploadFile(
          viewModel.currentQuestionIndex,
          fileToUpload,
          fileName,
        );
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('No file selected'),
              backgroundColor: Colors.orange,
            ),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error picking file: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Widget _getFileIcon(String fileName, Color color) {
    IconData iconData;

    if (fileName.endsWith('.pdf')) {
      iconData = Icons.picture_as_pdf;
    } else if (fileName.endsWith('.jpg') ||
        fileName.endsWith('.jpeg') ||
        fileName.endsWith('.png')) {
      iconData = Icons.image;
    } else if (fileName.endsWith('.doc') || fileName.endsWith('.docx')) {
      iconData = Icons.description;
    } else {
      iconData = Icons.insert_drive_file;
    }

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        iconData,
        color: color,
        size: 24,
      ),
    );
  }

  String _formatFileSize(int sizeInBytes) {
    if (sizeInBytes < 1024) {
      return '$sizeInBytes B';
    } else if (sizeInBytes < 1048576) {
      return '${(sizeInBytes / 1024).toStringAsFixed(1)} KB';
    } else {
      return '${(sizeInBytes / 1048576).toStringAsFixed(1)} MB';
    }
  }
}
