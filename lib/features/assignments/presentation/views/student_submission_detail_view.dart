import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/assignments/models/student_assignment_response.dart';
import 'package:attendance_app/features/assignments/presentation/viewmodels/assignments_submissions_viewmodel.dart';

class StudentSubmissionDetailView extends StatefulWidget {
  final String courseId;
  final String assignmentId;
  final String assignmentTitle;
  final StudentAssignmentSubmission submission;

  const StudentSubmissionDetailView({
    Key? key,
    required this.courseId,
    required this.assignmentId,
    required this.assignmentTitle,
    required this.submission,
  }) : super(key: key);

  @override
  State<StudentSubmissionDetailView> createState() =>
      _StudentSubmissionDetailViewState();
}

class _StudentSubmissionDetailViewState
    extends State<StudentSubmissionDetailView> {
  int _currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AssignmentSubmissionsViewModel(
        courseId: widget.courseId,
        assignmentId: widget.assignmentId,
      ),
      child: Consumer<AssignmentSubmissionsViewModel>(
        builder: (context, viewModel, child) {
          // Mostrar mensajes de éxito o error
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
                'Submission by ${widget.submission.studentName}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              backgroundColor: AppColors.primaryColor,
              elevation: 0,
              centerTitle: true,
            ),
            body: _buildSubmissionDetailContent(context, viewModel),
          );
        },
      ),
    );
  }

  Widget _buildSubmissionDetailContent(
      BuildContext context, AssignmentSubmissionsViewModel viewModel) {
    if (widget.submission.responses.isEmpty) {
      return const Center(
        child: Text(
          'No responses in this submission',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      );
    }

    final currentResponse = widget.submission.responses[_currentQuestionIndex];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSubmissionHeader(),
          const SizedBox(height: 16),
          _buildQuestionNavigation(),
          const SizedBox(height: 24),
          Expanded(
            child: _buildResponseDetail(currentResponse, viewModel),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmissionHeader() {
    final statusColor = _getStatusColor(widget.submission.status);
    final statusText = _getStatusText(widget.submission.status);

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  widget.assignmentTitle,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: statusColor),
                  ),
                  child: Text(
                    statusText,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: statusColor,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                _buildHeaderInfoItem('Student', widget.submission.studentName),
                const SizedBox(width: 16),
                _buildHeaderInfoItem('Score',
                    '${widget.submission.totalScore}/${widget.submission.maxScore}'),
                const SizedBox(width: 16),
                _buildHeaderInfoItem(
                  'Submitted on',
                  _formatDate(widget.submission.submittedAt),
                ),
              ],
            ),
            if (widget.submission.gradedAt != null) ...[
              const SizedBox(height: 8),
              _buildHeaderInfoItem(
                'Graded on',
                _formatDate(widget.submission.gradedAt!),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderInfoItem(String title, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionNavigation() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.submission.responses.length,
        itemBuilder: (context, index) {
          final response = widget.submission.responses[index];
          final isActive = index == _currentQuestionIndex;
          final isGraded = response.score != null;
          final isCorrect = response.isCorrect ?? false;

          Color backgroundColor;
          if (isGraded) {
            backgroundColor = isCorrect ? Colors.green : Colors.red.shade400;
          } else {
            backgroundColor = Colors.grey.shade400;
          }

          return GestureDetector(
            onTap: () {
              setState(() {
                _currentQuestionIndex = index;
              });
            },
            child: Container(
              width: 60,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: isActive
                    ? backgroundColor
                    : backgroundColor.withOpacity(0.6),
                borderRadius: BorderRadius.circular(8),
                border:
                    isActive ? Border.all(color: Colors.blue, width: 2) : null,
                boxShadow: isActive
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          spreadRadius: 1,
                        ),
                      ]
                    : null,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Q${index + 1}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Icon(
                    _getQuestionTypeIcon(response.questionType),
                    color: Colors.white,
                    size: 16,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildResponseDetail(
      StudentResponse response, AssignmentSubmissionsViewModel viewModel) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    _getQuestionTypeText(response.questionType),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                const Spacer(),
                if (response.score != null)
                  Text(
                    'Score: ${response.score}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: (response.isCorrect ?? false)
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),

            // Contenido específico según el tipo de respuesta
            if (response.questionType == 'multiple_choice' ||
                response.questionType == 'true_false')
              _buildMultipleChoiceResponse(response)
            else if (response.questionType == 'file')
              _buildFileResponse(response, viewModel),
          ],
        ),
      ),
    );
  }

  Widget _buildMultipleChoiceResponse(StudentResponse response) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Mostrar la respuesta seleccionada
        Text(
          'Selected option: ${response.selectedOption != null ? (response.selectedOption! + 1) : "None"}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),

        // Mostrar si es correcta o no
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: (response.isCorrect ?? false)
                ? Colors.green.shade100
                : Colors.red.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                (response.isCorrect ?? false)
                    ? Icons.check_circle
                    : Icons.cancel,
                color:
                    (response.isCorrect ?? false) ? Colors.green : Colors.red,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                (response.isCorrect ?? false) ? 'Correct' : 'Incorrect',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: (response.isCorrect ?? false)
                      ? Colors.green.shade700
                      : Colors.red.shade700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFileResponse(
      StudentResponse response, AssignmentSubmissionsViewModel viewModel) {
    final bool hasFile =
        response.fileUrl != null && response.fileUrl!.isNotEmpty;
    final TextEditingController commentController =
        TextEditingController(text: response.teacherComment);
    final TextEditingController scoreController =
        TextEditingController(text: response.score?.toString() ?? '');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasFile) ...[
          // Mostrar información del archivo
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: [
                Icon(
                  _getFileIcon(response.fileName ?? ''),
                  color: Colors.blue,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        response.fileName ?? 'File',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Click to view file',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.open_in_new),
                  onPressed: () {
                    // Abrir el archivo en una nueva ventana o navegador
                    // Implement file viewing logic
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ] else ...[
          const Center(
            child: Text(
              'No file was submitted',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
        ],
        if (hasFile) ...[
          // Sección para calificar la respuesta
          const Text(
            'Grade this response',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          // Campo para ingresar la puntuación
          Row(
            children: [
              const Text(
                'Score:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 16),
              SizedBox(
                width: 100,
                child: TextField(
                  controller: scoreController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '0-1',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                '/ 1',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Campo para ingresar comentarios
          TextField(
            controller: commentController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Comment (optional)',
              hintText: 'Enter feedback for the student',
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 24),

          // Botón para guardar la calificación
          Center(
            child: ElevatedButton.icon(
              onPressed: !viewModel.isLoading
                  ? () {
                      final score = int.tryParse(scoreController.text) ?? 0;
                      final comment = commentController.text.trim();

                      viewModel.gradeFileResponse(
                        widget.submission.studentId,
                        response.questionId,
                        score,
                        comment.isNotEmpty ? comment : null,
                      );
                    }
                  : null,
              icon: viewModel.isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : const Icon(Icons.save),
              label: const Text('Save Grade'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ),
        ],
      ],
    );
  }

  IconData _getQuestionTypeIcon(String type) {
    switch (type) {
      case 'multiple_choice':
        return Icons.check_circle_outline;
      case 'true_false':
        return Icons.toggle_on_outlined;
      case 'file':
        return Icons.attach_file;
      default:
        return Icons.help_outline;
    }
  }

  String _getQuestionTypeText(String type) {
    switch (type) {
      case 'multiple_choice':
        return 'Multiple Choice';
      case 'true_false':
        return 'True/False';
      case 'file':
        return 'File Upload';
      default:
        return 'Question';
    }
  }

  IconData _getFileIcon(String fileName) {
    if (fileName.endsWith('.pdf')) {
      return Icons.picture_as_pdf;
    } else if (fileName.endsWith('.jpg') ||
        fileName.endsWith('.jpeg') ||
        fileName.endsWith('.png')) {
      return Icons.image;
    } else if (fileName.endsWith('.doc') || fileName.endsWith('.docx')) {
      return Icons.description;
    } else {
      return Icons.insert_drive_file;
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'submitted':
        return Colors.blue;
      case 'graded':
        return Colors.green;
      case 'partially_graded':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  String _getStatusText(String status) {
    switch (status) {
      case 'submitted':
        return 'Submitted';
      case 'graded':
        return 'Graded';
      case 'partially_graded':
        return 'Partially Graded';
      default:
        return 'Unknown';
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        return '${difference.inMinutes} min ago';
      }
      return '${difference.inHours} hours ago';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    }

    // Format with month, day and time
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return '${date.day} ${months[date.month - 1]}, ${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }
}
