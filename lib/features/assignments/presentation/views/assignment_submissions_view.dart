import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/assignments/models/student_assignment_response.dart';
import 'package:attendance_app/features/assignments/presentation/viewmodels/assignments_submissions_viewmodel.dart';
import 'package:attendance_app/features/assignments/presentation/views/student_submission_detail_view.dart';

class AssignmentSubmissionsView extends StatelessWidget {
  final String courseId;
  final String assignmentId;
  final String assignmentTitle;

  const AssignmentSubmissionsView({
    Key? key,
    required this.courseId,
    required this.assignmentId,
    required this.assignmentTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AssignmentSubmissionsViewModel(
        courseId: courseId,
        assignmentId: assignmentId,
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
                'Submissions for $assignmentTitle',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              backgroundColor: AppColors.primaryColor,
              elevation: 0,
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () => viewModel.refreshSubmissions(),
                  tooltip: 'Refresh submissions',
                ),
              ],
            ),
            body: viewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : _buildSubmissionsContent(context, viewModel),
          );
        },
      ),
    );
  }

  Widget _buildSubmissionsContent(
      BuildContext context, AssignmentSubmissionsViewModel viewModel) {
    if (viewModel.submissions.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.assignment_late,
              size: 80,
              color: Colors.grey,
            ),
            SizedBox(height: 24),
            Text(
              'No submissions yet',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Students have not submitted any assignments yet',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Student Submissions',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${viewModel.submissions.length} submissions found',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: viewModel.submissions.length,
              itemBuilder: (context, index) {
                return _buildSubmissionCard(
                  context,
                  viewModel.submissions[index],
                  viewModel,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmissionCard(
    BuildContext context,
    StudentAssignmentSubmission submission,
    AssignmentSubmissionsViewModel viewModel,
  ) {
    final Color statusColor = _getStatusColor(submission.status);
    final String statusText = _getStatusText(submission.status);
    final bool needsGrading = submission.status == 'submitted' ||
        submission.status == 'partially_graded';

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: needsGrading
              ? Colors.orange.withOpacity(0.5)
              : Colors.transparent,
          width: needsGrading ? 2 : 0,
        ),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StudentSubmissionDetailView(
                courseId: courseId,
                assignmentId: assignmentId,
                assignmentTitle: assignmentTitle,
                submission: submission,
              ),
            ),
          ).then((_) => viewModel.refreshSubmissions());
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Student Name
                  Expanded(
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: AppColors.primaryColor,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            submission.studentName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Status badge
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
              const SizedBox(height: 16),

              // Submission details
              Row(
                children: [
                  _buildInfoItem(
                    Icons.score_outlined,
                    Colors.blue,
                    'Score',
                    '${submission.totalScore}/${submission.maxScore}',
                  ),
                  const Spacer(),
                  _buildInfoItem(
                    Icons.calendar_today_outlined,
                    Colors.green,
                    'Submitted on',
                    _formatDate(submission.submittedAt),
                  ),
                  const Spacer(),
                  if (submission.gradedAt != null)
                    _buildInfoItem(
                      Icons.check_circle_outline,
                      Colors.purple,
                      'Graded on',
                      _formatDate(submission.gradedAt!),
                    )
                  else
                    _buildInfoItem(
                      Icons.pending_outlined,
                      Colors.orange,
                      'Status',
                      needsGrading ? 'Needs grading' : 'Not graded',
                    ),
                ],
              ),

              const SizedBox(height: 16),
              const Divider(),

              // Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (needsGrading)
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StudentSubmissionDetailView(
                              courseId: courseId,
                              assignmentId: assignmentId,
                              assignmentTitle: assignmentTitle,
                              submission: submission,
                            ),
                          ),
                        ).then((_) => viewModel.refreshSubmissions());
                      },
                      icon: const Icon(Icons.grading),
                      label: const Text('Grade submission'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                      ),
                    )
                  else
                    TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StudentSubmissionDetailView(
                              courseId: courseId,
                              assignmentId: assignmentId,
                              assignmentTitle: assignmentTitle,
                              submission: submission,
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.visibility),
                      label: const Text('View details'),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem(
      IconData icon, Color color, String title, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 16,
                color: color,
              ),
              const SizedBox(width: 4),
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
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

    // Format with month and day
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
    return '${date.day} ${months[date.month - 1]}';
  }
}
