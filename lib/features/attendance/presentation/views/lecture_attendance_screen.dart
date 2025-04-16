import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/attendance/presentation/views/student_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // أضف هذه المكتبة إلى pubspec.yaml
import 'dart:io';

class LectureAttendanceScreen extends StatefulWidget {
  final int lectureNumber;

  const LectureAttendanceScreen({
    Key? key,
    required this.lectureNumber,
  }) : super(key: key);

  @override
  State<LectureAttendanceScreen> createState() =>
      _LectureAttendanceScreenState();
}

class _LectureAttendanceScreenState extends State<LectureAttendanceScreen> {
  // Example student data with starred property and image URLs
  final List<Map<String, dynamic>> students = [
    {
      'name': 'Student 1',
      'hasBonus': false,
      'isStarred': false,
      'imageUrl': 'https://i.pravatar.cc/150?img=1'
    },
    {
      'name': 'Student 2',
      'hasBonus': true,
      'isStarred': true,
      'imageUrl': 'https://i.pravatar.cc/150?img=2'
    },
    {
      'name': 'Student 3',
      'hasBonus': false,
      'isStarred': false,
      'imageUrl': 'https://i.pravatar.cc/150?img=3'
    },
    {
      'name': 'Student 4',
      'hasBonus': false,
      'isStarred': false,
      'imageUrl': 'https://i.pravatar.cc/150?img=4'
    },
    {
      'name': 'Student 5',
      'hasBonus': true,
      'isStarred': true,
      'imageUrl': 'https://i.pravatar.cc/150?img=5'
    },
  ];

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
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
              // Student List
              Expanded(
                child: ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    final student = students[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: studentCard(student, index),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddStudentDialog,
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.person_add, color: Colors.white),
      ),
    );
  }

  void _showOptionsBottomSheet(
      BuildContext context, Map<String, dynamic> student, int index) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(
                  Icons.edit,
                  color: AppColors.primaryColor,
                ),
                title: const Text(
                  'Update',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _showUpdateStudentDialog(student, index);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                title: const Text(
                  'Delete',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  // Show confirmation dialog before deleting
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Delete Student'),
                      content: Text(
                          'Are you sure you want to remove ${student['name']}?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              students.removeAt(index);
                            });
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('${student['name']} removed')),
                            );
                          },
                          child: const Text('Delete',
                              style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // دالة لعرض نافذة اختيار مصدر الصورة (كاميرا أو معرض)
  void _showImageSourceOptions(
      String currentImageUrl, Function(String) onImageSelected) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt, color: Colors.blue),
                title: const Text('Take a picture from camera',
                    style: TextStyle(fontSize: 16)),
                onTap: () async {
                  Navigator.pop(context);
                  try {
                    final XFile? pickedFile = await _picker.pickImage(
                      source: ImageSource.camera,
                      imageQuality: 85,
                    );

                    if (pickedFile != null) {
                      onImageSelected(pickedFile.path);
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'An error occurred while taking the picture: $e',
                        ),
                      ),
                    );
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library, color: Colors.green),
                title: const Text('Choose a picture from gallery',
                    style: TextStyle(fontSize: 16)),
                onTap: () async {
                  Navigator.pop(context);
                  try {
                    final XFile? pickedFile = await _picker.pickImage(
                      source: ImageSource.gallery,
                    );

                    if (pickedFile != null) {
                      onImageSelected(pickedFile.path);
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('حدث خطأ أثناء اختيار الصورة: $e')),
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Show update student dialog
  void _showUpdateStudentDialog(Map<String, dynamic> student, int index) {
    final TextEditingController nameController =
        TextEditingController(text: student['name'] ?? '');
    // Copy existing image URL to use in case user doesn't select a new image
    String currentImageUrl = student['imageUrl'] ?? 'https://i.pravatar.cc/150';
    bool isLocalImage = student['isLocalImage'] ==
        true; // لتحديد ما إذا كانت الصورة محلية أم من الإنترنت

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
          // استخدم StatefulBuilder للسماح بتحديث الحالة داخل الحوار
          builder: (context, setDialogState) {
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
                // Name field
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
                      )),
                ),

                const SizedBox(height: 20),

                // Student image
                Text(
                  'Student Image',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 10),

                // Image picker
                GestureDetector(
                  onTap: () {
                    // استدعاء دالة عرض خيارات مصدر الصورة
                    _showImageSourceOptions(currentImageUrl, (newImagePath) {
                      setDialogState(() {
                        currentImageUrl = newImagePath;
                        isLocalImage = true;
                      });
                    });
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: isLocalImage
                        ? FileImage(File(currentImageUrl)) as ImageProvider
                        : NetworkImage(currentImageUrl),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.primaryColor,
                          width: 2,
                        ),
                      ),
                      child: const Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: AppColors.primaryColor,
                          child: Icon(
                            Icons.camera_alt,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty) {
                  setState(() {
                    students[index]['name'] = nameController.text;
                    students[index]['imageUrl'] = currentImageUrl;
                    students[index]['isLocalImage'] =
                        isLocalImage; // حفظ هذه المعلومة مع بيانات الطالب
                  });
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Student updated successfully!'),
                      backgroundColor: Colors.green,
                    ),
                  );
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
      }),
    );
  }

  Widget studentCard(Map<String, dynamic> student, int index) {
    bool isLocalImage = student['isLocalImage'] == true;
    String imageUrl = student['imageUrl'] ?? 'https://i.pravatar.cc/150';

    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StudentDetailsScreen(student: student),
            ),
          );
        },
        child: Stack(
          children: [
            Container(
              height: 100, // Increased container height
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: student['isStarred'] == true
                      ? Colors.amber[600]!
                      : Colors.green,
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
                child: Row(
                  children: [
                    // CircleAvatar with student image
                    CircleAvatar(
                      radius: 25, // Increased radius for better proportion
                      backgroundImage: isLocalImage
                          ? FileImage(File(imageUrl)) as ImageProvider
                          : NetworkImage(imageUrl),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: Colors.blue[700]!, width: 2),
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    // Student name and N Le subtitle
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        // Center vertically
                        children: [
                          Text(
                            student['name'] ?? 'Unnamed Student',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue[700],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'N Le',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Three dots menu
                    // Three dots menu
                    IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.blue[700],
                      ),
                      onPressed: () =>
                          _showOptionsBottomSheet(context, student, index),
                    ),
                  ],
                ),
              ),
            ),

            // Star icon moved to top right
            Positioned(
              top: 5,
              right: 10, // Position to not overlap with the three dots menu
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    student['isStarred'] = !(student['isStarred'] == true);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        student['isStarred'] == true
                            ? '${student["name"]} marked as important'
                            : '${student["name"]} unmarked',
                      ),
                    ),
                  );
                },
                child: Icon(
                  student['isStarred'] == true ? Icons.star : Icons.star_border,
                  color: Colors.amber[600],
                  size: 30,
                ),
              ),
            ),
          ],
        ));
  }

  void _showAddStudentDialog() {
    final TextEditingController nameController = TextEditingController();
    String currentImageUrl =
        'https://i.pravatar.cc/150?img=${students.length + 1}';
    bool isLocalImage = false;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) {
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
                // Name field
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

                // Student image
                Text(
                  'Student Image',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 10),

                // Image picker
                GestureDetector(
                  onTap: () {
                    // استدعاء دالة عرض خيارات مصدر الصورة
                    _showImageSourceOptions(currentImageUrl, (newImagePath) {
                      setDialogState(() {
                        currentImageUrl = newImagePath;
                        isLocalImage = true;
                      });
                    });
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: isLocalImage
                        ? FileImage(File(currentImageUrl)) as ImageProvider
                        : NetworkImage(currentImageUrl),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.primaryColor,
                          width: 2,
                        ),
                      ),
                      child: const Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: AppColors.primaryColor,
                          child: Icon(
                            Icons.camera_alt,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (nameController.text.isNotEmpty) {
                    setState(() {
                      students.add({
                        'name': nameController.text,
                        'hasBonus': false,
                        'isStarred': false,
                        'imageUrl': currentImageUrl,
                        'isLocalImage': isLocalImage,
                      });
                    });
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Student added successfully!'),
                        backgroundColor: Colors.green,
                      ),
                    );
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
}
