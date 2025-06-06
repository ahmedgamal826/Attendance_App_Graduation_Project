import 'package:attendance_app/features/tests/presentation/views/test_submission_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/tests/data/models/tests_model_admin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TestsListItemAdmin extends StatefulWidget {
  final TestsAssignmentModel test;
  final Animation<double> animation;
  final VoidCallback onDelete;
  final VoidCallback onTap;
  final VoidCallback onEditQuestions;
  final String? courseName;

  const TestsListItemAdmin({
    super.key,
    required this.test,
    required this.animation,
    required this.onDelete,
    required this.onTap,
    required this.onEditQuestions,
    this.courseName,
  });

  @override
  State<TestsListItemAdmin> createState() => TestsListItemAdminState();
}

class TestsListItemAdminState extends State<TestsListItemAdmin> {
  bool _isHovering = false;
  bool _expanded = false;
  String? _currentUserName;

  @override
  void initState() {
    super.initState();
    _fetchCurrentUserName();
  }

  Future<void> _fetchCurrentUserName() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.uid)
            .get();
        if (userDoc.exists) {
          setState(() {
            _currentUserName = userDoc.data()?['name'] ?? 'Unknown User';
          });
          debugPrint('Current user name: $_currentUserName');
        } else {
          setState(() {
            _currentUserName = 'Unknown User';
          });
          debugPrint('User document does not exist in Firestore');
        }
      } else {
        setState(() {
          _currentUserName = 'Unknown User';
        });
        debugPrint('No current user found');
      }
    } catch (e) {
      setState(() {
        _currentUserName = 'Unknown User';
      });
      debugPrint('Error fetching user name: $e');
    }
  }

  String _formatDate(String dateString) {
    try {
      final parsedDate = DateFormat('dd-MM-yyyy HH:mm').parseStrict(dateString);
      return DateFormat('dd MMM yyyy, h:mm a').format(parsedDate);
    } catch (e) {
      print('Error parsing date: $dateString, Error: $e');
      return dateString;
    }
  }

  String _formatExamDate(String dateString) {
    try {
      final parsedDate = DateFormat('dd-MM-yyyy').parseStrict(dateString);
      return DateFormat('dd MMM yyyy').format(parsedDate);
    } catch (e) {
      print('Error parsing exam date: $dateString, Error: $e');
      return dateString;
    }
  }

  String _formatTimeWithAMPM(String timeString) {
    try {
      // Parse the time in 24-hour format (HH:mm)
      final timeParts = timeString.split(':');
      if (timeParts.length != 2) {
        return timeString;
      }

      int hour = int.parse(timeParts[0]);
      final minute = int.parse(timeParts[1]);

      final period = hour >= 12 ? 'PM' : 'AM';
      hour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);

      return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period';
    } catch (e) {
      print('Error formatting time with AM/PM: $timeString, Error: $e');
      return timeString;
    }
  }

  bool isTestActive() {
    if (widget.test.examDate == null ||
        widget.test.startTime == null ||
        widget.test.endTime == null) {
      return false;
    }

    try {
      final now = DateTime.now();
      final examDate =
          DateFormat('dd-MM-yyyy').parseStrict(widget.test.examDate!);
      final startTimeParts = widget.test.startTime!.split(':');
      final endTimeParts = widget.test.endTime!.split(':');

      if (startTimeParts.length != 2 || endTimeParts.length != 2) {
        return false;
      }

      final startDateTime = DateTime(
        examDate.year,
        examDate.month,
        examDate.day,
        int.parse(startTimeParts[0]),
        int.parse(startTimeParts[1]),
      );

      final endDateTime = DateTime(
        examDate.year,
        examDate.month,
        examDate.day,
        int.parse(endTimeParts[0]),
        int.parse(endTimeParts[1]),
      );

      return now.isAfter(startDateTime) && now.isBefore(endDateTime);
    } catch (e) {
      print('Error checking if test is active: $e');
      return false;
    }
  }

  bool isTestExpired() {
    if (widget.test.examDate == null || widget.test.endTime == null) {
      return false;
    }

    try {
      final now = DateTime.now();
      final examDate =
          DateFormat('dd-MM-yyyy').parseStrict(widget.test.examDate!);
      final endTimeParts = widget.test.endTime!.split(':');

      if (endTimeParts.length != 2) {
        return false;
      }

      final endDateTime = DateTime(
        examDate.year,
        examDate.month,
        examDate.day,
        int.parse(endTimeParts[0]),
        int.parse(endTimeParts[1]),
      );

      return now.isAfter(endDateTime);
    } catch (e) {
      print('Error checking if test is expired: $e');
      return false;
    }
  }

  String _calculateTimeRemaining() {
    if (widget.test.examDate == null || widget.test.startTime == null) {
      return '';
    }

    try {
      final now = DateTime.now();
      final examDate =
          DateFormat('dd-MM-yyyy').parseStrict(widget.test.examDate!);
      final startTimeParts = widget.test.startTime!.split(':');

      if (startTimeParts.length != 2) {
        return '';
      }

      final startDateTime = DateTime(
        examDate.year,
        examDate.month,
        examDate.day,
        int.parse(startTimeParts[0]),
        int.parse(startTimeParts[1]),
      );

      if (startDateTime.isBefore(now)) {
        return '';
      }

      final difference = startDateTime.difference(now);

      if (difference.inDays > 0) {
        return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} left';
      } else if (difference.inHours > 0) {
        return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} left';
      } else {
        return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} left';
      }
    } catch (e) {
      print('Error calculating time remaining: $e');
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final String createdDate = _formatDate(widget.test.date);
    final bool isExpired = isTestExpired();
    final bool isActive = isTestActive();
    final String timeRemaining = _calculateTimeRemaining();

    // Format start and end times with AM/PM
    final String startTimeFormatted = widget.test.startTime != null
        ? _formatTimeWithAMPM(widget.test.startTime!)
        : '';
    final String endTimeFormatted = widget.test.endTime != null
        ? _formatTimeWithAMPM(widget.test.endTime!)
        : '';

    final colorScheme = Theme.of(context).colorScheme;

    return AnimatedBuilder(
      animation: widget.animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 50 * (1 - widget.animation.value)),
          child: Opacity(
            opacity: widget.animation.value,
            child: MouseRegion(
              onEnter: (_) => setState(() => _isHovering = true),
              onExit: (_) => setState(() => _isHovering = false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: _isHovering
                          ? Colors.black.withOpacity(0.15)
                          : Colors.black.withOpacity(0.4),
                      blurRadius: _isHovering ? 10 : 5,
                      offset:
                          _isHovering ? const Offset(0, 5) : const Offset(0, 3),
                      spreadRadius: _isHovering ? 1 : 0,
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _expanded = !_expanded;
                          });
                        },
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                AppColors.primaryColor,
                                AppColors.primaryColor.withBlue(220),
                              ],
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.assignment_outlined,
                                      color: Colors.white,
                                      size: 22,
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        widget.test.name,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  if (!_expanded)
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: isExpired
                                            ? Colors.red.withOpacity(0.9)
                                            : isActive
                                                ? Colors.green.withOpacity(0.9)
                                                : Colors.orange
                                                    .withOpacity(0.9),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        isExpired
                                            ? 'Expired'
                                            : isActive
                                                ? 'Active'
                                                : 'Scheduled',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  const SizedBox(width: 8),
                                  InkWell(
                                    onTap: widget.onTap,
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Icon(
                                        Icons.edit_outlined,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      AnimatedSize(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 10, 16, 5),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryColor
                                            .withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Icon(
                                        Icons.person_outline,
                                        color: AppColors.primaryColor,
                                        size: 20,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Created by',
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(height: 3),
                                          Text(
                                            widget.test.doctor
                                                        .startsWith('Dr') ||
                                                    widget.test.doctor
                                                        .startsWith('dr')
                                                ? widget.test.doctor
                                                : 'Dr/ ${widget.test.doctor}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                  indent: 16, endIndent: 16, height: 20),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 5, 16, 0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: Colors.blue.shade50,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Icon(
                                              Icons.calendar_today_outlined,
                                              color: Colors.blue.shade700,
                                              size: 20,
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Created on',
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                const SizedBox(height: 3),
                                                Text(
                                                  createdDate,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  overflow: _expanded
                                                      ? TextOverflow.visible
                                                      : TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (widget.test.examDate != null) ...[
                                const SizedBox(height: 14),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 0, 16, 0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: isExpired
                                                    ? Colors.red.shade50
                                                    : isActive
                                                        ? Colors.green.shade50
                                                        : Colors.orange.shade50,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Icon(
                                                Icons.event,
                                                color: isExpired
                                                    ? Colors.red.shade700
                                                    : isActive
                                                        ? Colors.green.shade700
                                                        : Colors
                                                            .orange.shade700,
                                                size: 20,
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Exam Date',
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 3),
                                                  Text(
                                                    _formatExamDate(
                                                        widget.test.examDate!),
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: isExpired
                                                          ? Colors.red.shade700
                                                          : isActive
                                                              ? Colors.green
                                                                  .shade700
                                                              : Colors.orange
                                                                  .shade700,
                                                    ),
                                                    overflow: _expanded
                                                        ? TextOverflow.visible
                                                        : TextOverflow.ellipsis,
                                                  ),
                                                  if (timeRemaining
                                                      .isNotEmpty) ...[
                                                    const SizedBox(height: 5),
                                                    Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 8,
                                                          vertical: 3),
                                                      decoration: BoxDecoration(
                                                        color: Colors
                                                            .orange.shade100,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      child: Text(
                                                        timeRemaining,
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors
                                                              .orange.shade700,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                              if (widget.test.startTime != null &&
                                  widget.test.endTime != null) ...[
                                const SizedBox(height: 14),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 0, 16, 0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: isExpired
                                                    ? Colors.red.shade50
                                                    : isActive
                                                        ? Colors.green.shade50
                                                        : Colors.blue.shade50,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Icon(
                                                Icons.access_time,
                                                color: isExpired
                                                    ? Colors.red.shade700
                                                    : isActive
                                                        ? Colors.green.shade700
                                                        : Colors.blue.shade700,
                                                size: 20,
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Test Time',
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 3),
                                                  Text(
                                                    '${startTimeFormatted} - ${endTimeFormatted}',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: isExpired
                                                          ? Colors.red.shade700
                                                          : isActive
                                                              ? Colors.green
                                                                  .shade700
                                                              : Colors.blue
                                                                  .shade700,
                                                    ),
                                                    overflow: _expanded
                                                        ? TextOverflow.visible
                                                        : TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                            onTap: () async {
                                              if (_currentUserName == null) {
                                                await _fetchCurrentUserName();
                                              }
                                              final currentUser = FirebaseAuth
                                                  .instance.currentUser;
                                              final adminId =
                                                  currentUser?.uid ?? '';

                                              if (_currentUserName != null) {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        TestSubmissionView(
                                                      adminId: adminId,
                                                      testId: widget.test.name,
                                                      testTitle:
                                                          widget.test.name,
                                                      courseName:
                                                          widget.courseName ??
                                                              'IOT',
                                                      currentUserName:
                                                          _currentUserName!,
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                        'Error: Could not fetch user name'),
                                                    backgroundColor: Colors.red,
                                                  ),
                                                );
                                              }
                                            },
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              decoration: BoxDecoration(
                                                color: Colors.green.shade50,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.assignment_turned_in,
                                                    size: 18,
                                                    color:
                                                        Colors.green.shade700,
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Text(
                                                    'Student Submissions',
                                                    style: TextStyle(
                                                      color:
                                                          Colors.green.shade700,
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                            onTap: widget.onEditQuestions,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              decoration: BoxDecoration(
                                                color: Colors.amber.shade50,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .question_answer_outlined,
                                                    size: 18,
                                                    color:
                                                        Colors.amber.shade700,
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Text(
                                                    'Edit Questions',
                                                    style: TextStyle(
                                                      color:
                                                          Colors.amber.shade700,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: InkWell(
                                            onTap: widget.onDelete,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              decoration: BoxDecoration(
                                                color: Colors.red.shade50,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.delete_outline,
                                                    size: 18,
                                                    color: Colors.red.shade700,
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Text(
                                                    'Delete',
                                                    style: TextStyle(
                                                      color:
                                                          Colors.red.shade700,
                                                      fontWeight:
                                                          FontWeight.w600,
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
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
