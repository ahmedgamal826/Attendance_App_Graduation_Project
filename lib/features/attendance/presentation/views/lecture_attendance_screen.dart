import 'dart:io';
import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/attendance/presentation/manager/lecture_attendance_student_provider.dart';
import 'package:attendance_app/features/attendance/presentation/views/widgets/student_card_attendance.dart';
import 'package:attendance_app/features/attendance/presentation/views/student_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

class LectureAttendanceScreen extends StatefulWidget {
  final int lectureNumber;
  final String courseId;

  const LectureAttendanceScreen({
    Key? key,
    required this.lectureNumber,
    required this.courseId,
  }) : super(key: key);

  @override
  State<LectureAttendanceScreen> createState() =>
      _LectureAttendanceScreenState();
}

class _LectureAttendanceScreenState extends State<LectureAttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AttendanceProvider(),
      child: Consumer<AttendanceProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Lecture ${widget.lectureNumber} Attendance',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: AppColors.primaryColor,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue[100]!,
                    Colors.white,
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Expanded(
                      child: StreamBuilder<QuerySnapshot>(
                        stream: provider.getAttendanceStream(
                            widget.courseId, widget.lectureNumber),
                        builder: (context, lectureSnapshot) {
                          if (lectureSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          if (!lectureSnapshot.hasData ||
                              lectureSnapshot.data!.docs.isEmpty) {
                            return const Center(
                                child: Text('Lecture not found'));
                          }

                          var lectureDoc = lectureSnapshot.data!.docs.first;
                          return StreamBuilder<QuerySnapshot>(
                            stream: provider
                                .getStudentsStream(lectureDoc.reference),
                            builder: (context, attendanceSnapshot) {
                              if (attendanceSnapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                ));
                              }
                              if (!attendanceSnapshot.hasData ||
                                  attendanceSnapshot.data!.docs.isEmpty) {
                                return const Center(
                                    child: Text('No students found'));
                              }

                              // جلب جميع الطلاب وتصفيتهم بناءً على Check-out
                              List<Map<String, dynamic>> students = [];
                              for (var doc in attendanceSnapshot.data!.docs) {
                                var data = doc.data() as Map<String, dynamic>;
                                data['id'] = doc.id;

                                // جمع جميع بيانات الحضور (التواريخ) في حقل واحد
                                Map<String, dynamic> attendanceDates = {};
                                String? latestDate;
                                Map<String, dynamic>? latestAttendanceData;

                                data.forEach((key, value) {
                                  if (key.startsWith('20') &&
                                      value is Map<String, dynamic>) {
                                    attendanceDates[key] = value;
                                  }
                                });

                                if (attendanceDates.isNotEmpty) {
                                  // اختيار أحدث تاريخ
                                  var sortedDates = attendanceDates.keys
                                      .toList()
                                    ..sort((a, b) => b.compareTo(a));
                                  latestDate = sortedDates.first;
                                  latestAttendanceData =
                                      attendanceDates[latestDate];

                                  // التحقق من قيمة Check-out
                                  if (latestAttendanceData?['Check-out'] !=
                                      '--') {
                                    data['attendanceDates'] = {
                                      latestDate: latestAttendanceData
                                    };
                                    data['displayImageUrl'] =
                                        latestAttendanceData?['imageUrl'] ??
                                            data['imageUrl'];
                                    // تحديث imageUrl ليتم تمريره إلى StudentDetailsScreen
                                    data['imageUrl'] = data['displayImageUrl'];
                                    students.add(data);
                                  }
                                }
                              }

                              if (students.isEmpty) {
                                return const Center(
                                    child: Text(
                                        'No students have checked out yet'));
                              }

                              return ListView.builder(
                                itemCount: students.length,
                                itemBuilder: (context, index) {
                                  final student = students[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: studentCard(
                                        student, index, students, provider),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () => _showAddStudentDialog(provider),
                  backgroundColor: AppColors.primaryColor,
                  child: const Icon(Icons.person_add, color: Colors.white),
                  heroTag: 'addStudent',
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showAddStudentDialog(AttendanceProvider provider) {
    final TextEditingController nameController = TextEditingController();
    String? currentImageUrl;
    bool isLocalImage = false;

    showDialog(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (dialogContext, setDialogState) {
          return AlertDialog(
            title: const Text(
              'Add New Student',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  cursorColor: AppColors.primaryColor,
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Student Name',
                    labelStyle: TextStyle(
                      color: AppColors.primaryColor,
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.primaryColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Student Image',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    provider.showImageSourceOptions(
                      context,
                      currentImageUrl,
                      (newImagePath) {
                        setDialogState(() {
                          currentImageUrl = newImagePath;
                          isLocalImage = true;
                        });
                      },
                    );
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300],
                    child: (currentImageUrl != null && isLocalImage)
                        ? ClipOval(
                            child: Image.file(
                              File(currentImageUrl!),
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            ),
                          )
                        : currentImageUrl != null
                            ? CachedNetworkImage(
                                imageUrl: currentImageUrl!,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                    border: Border.all(
                                      color: AppColors.primaryColor,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.person,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                              )
                            : const Icon(
                                Icons.person,
                                size: 50,
                                color: Colors.grey,
                              ),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext),
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (nameController.text.isNotEmpty) {
                    if (!isLocalImage || currentImageUrl == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please select a student image'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    Navigator.pop(dialogContext);

                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (loadingContext) => const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    );

                    try {
                      String imageUrlToStore =
                          await provider.uploadImageToStorage(
                        currentImageUrl!,
                        nameController.text,
                      );

                      await provider.addStudent(
                        context,
                        widget.courseId,
                        widget.lectureNumber,
                        nameController.text,
                        imageUrlToStore,
                      );

                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    } catch (e) {
                      if (context.mounted) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Error adding student: $e'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Name cannot be empty'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                ),
                child: const Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showUpdateStudentDialog(
      AttendanceProvider provider,
      Map<String, dynamic> student,
      int index,
      List<Map<String, dynamic>> students) {
    final TextEditingController nameController =
        TextEditingController(text: student['name'] ?? '');
    String? currentImageUrl = student['imageUrl'];
    bool isLocalImage = false;

    showDialog(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (dialogContext, setDialogState) {
          return AlertDialog(
            title: const Text(
              'Update Student',
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
                    decoration: const InputDecoration(
                      labelText: 'Student Name',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.primaryColor,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Student Image',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      provider.showImageSourceOptions(
                        context,
                        currentImageUrl,
                        (newImagePath) {
                          setDialogState(() {
                            currentImageUrl = newImagePath;
                            isLocalImage = true;
                          });
                        },
                      );
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey[300],
                      child: currentImageUrl != null
                          ? (isLocalImage
                              ? ClipOval(
                                  child: Image.file(
                                    File(currentImageUrl!),
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                  ),
                                )
                              : CachedNetworkImage(
                                  imageUrl: currentImageUrl!,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                      border: Border.all(
                                        color: AppColors.primaryColor,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(
                                    color: AppColors.primaryColor,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(
                                    Icons.person,
                                    size: 50,
                                    color: Colors.grey,
                                  ),
                                ))
                          : const Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.grey,
                            ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext),
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (nameController.text.isNotEmpty) {
                    if (currentImageUrl == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please select a student image'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    try {
                      await provider.updateStudent(
                        context,
                        widget.courseId,
                        widget.lectureNumber,
                        student['id'],
                        nameController.text,
                        currentImageUrl,
                        isLocalImage,
                      );

                      Navigator.pop(dialogContext);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error updating student: $e'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Name cannot be empty'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget studentCard(Map<String, dynamic> student, int index,
      List<Map<String, dynamic>> students, AttendanceProvider provider) {
    String? imageUrl = student['displayImageUrl'];

    // تمرير بيانات الحضور (أحدث تاريخ فقط)
    Map<String, dynamic> attendanceDates = student['attendanceDates'] ?? {};

    return StudentCardAttendance(
      student: student,
      attendanceDates: attendanceDates,
      imageUrl: imageUrl ?? '',
      index: index,
      students: students,
      courseId: widget.courseId,
      lectureNumber: widget.lectureNumber,
      showOptionsBottomSheet: (context, student, index, students) {
        provider.showOptionsBottomSheet(
          context,
          student,
          index,
          students,
          widget.courseId,
          widget.lectureNumber,
          onUpdate: () =>
              _showUpdateStudentDialog(provider, student, index, students),
          onDelete: () => provider.clearImageCache(),
        );
      },
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StudentDetailsScreen(
              student: student,
              courseId: widget.courseId,
              lectureNumber: widget.lectureNumber,
            ),
          ),
        );
      },
    );
  }
}
