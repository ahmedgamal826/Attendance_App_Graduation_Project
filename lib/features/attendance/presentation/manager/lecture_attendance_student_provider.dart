import 'package:attendance_app/features/attendance/data/repository/lecture_attendance_repository.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AttendanceProvider with ChangeNotifier {
  final AttendanceRepository repository = AttendanceRepository();
  final ImagePicker _picker = ImagePicker();

  // Expose repository streams through public methods
  Stream<QuerySnapshot> getAttendanceStream(
      String courseId, int lectureNumber) {
    return repository.getAttendanceStream(courseId, lectureNumber);
  }

  Stream<QuerySnapshot> getStudentsStream(DocumentReference lectureRef) {
    return repository.getStudentsStream(lectureRef);
  }

  // دالة لمسح الـ Cache بتاع الصور
  void clearImageCache([String? imageUrl]) {
    if (imageUrl != null) {
      CachedNetworkImageProvider(imageUrl).evict().then((success) {
        print('Cache cleared for $imageUrl: $success');
      });
    } else {
      imageCache.clear();
      imageCache.clearLiveImages();
      print('Full image cache cleared');
    }
    notifyListeners();
  }

  Future<String> uploadImageToStorage(
      String filePath, String studentName) async {
    return await repository.uploadImageToStorage(filePath, studentName);
  }

  // دالة لعرض قائمة الخيارات (Update/Delete)
  void showOptionsBottomSheet(
    BuildContext context,
    Map<String, dynamic> student,
    int index,
    List<Map<String, dynamic>> students,
    String courseId,
    int lectureNumber, {
    required VoidCallback onUpdate,
    required VoidCallback onDelete,
  }) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (bottomSheetContext) {
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
                  Navigator.pop(bottomSheetContext);
                  onUpdate();
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
                  Navigator.pop(bottomSheetContext);
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.bottomSlide,
                    title: 'Delete Student',
                    desc: 'Are you sure you want to remove ${student['name']}?',
                    btnCancelOnPress: () {},
                    btnOkOnPress: () async {
                      try {
                        await repository.deleteStudent(
                            courseId, lectureNumber, student['id']);
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('${student['name']} removed')),
                          );
                        }
                        onDelete();
                      } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Error deleting student: $e'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
                    },
                    btnCancelText: 'Cancel',
                    btnOkText: 'Delete',
                    btnOkColor: Colors.green,
                    dismissOnTouchOutside: true,
                  ).show();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // دالة لعرض خيارات اختيار الصورة (كاميرا/معرض)
  void showImageSourceOptions(
    BuildContext context,
    String? currentImageUrl,
    Function(String) onImageSelected,
  ) {
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
                            'An error occurred while taking the picture: $e'),
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
                          content: Text(
                              'An error occurred while selecting the picture: $e')),
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

  // دالة لإضافة طالب جديد
  Future<void> addStudent(
    BuildContext context,
    String courseId,
    int lectureNumber,
    String name,
    String imageUrl,
  ) async {
    try {
      await repository.addStudent(
        courseId,
        lectureNumber,
        name.replaceAll(' ', '_'),
        name,
        imageUrl,
      );
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Student added successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error adding student: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
      rethrow;
    }
  }

  // دالة لتحديث بيانات الطالب
  Future<void> updateStudent(
    BuildContext context,
    String courseId,
    int lectureNumber,
    String studentId,
    String name,
    String? imageUrl,
    bool isLocalImage,
  ) async {
    try {
      String? imageUrlToStore = imageUrl;
      if (isLocalImage && imageUrl != null) {
        imageUrlToStore = await repository.uploadImageToStorage(imageUrl, name);
      }
      await repository.updateStudent(
          courseId, lectureNumber, studentId, name, imageUrlToStore);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Student updated successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error updating student: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
      rethrow;
    }
  }

  // // دالة لتغيير حالة الـ Star
  // Future<void> toggleStarStatus(
  //   BuildContext context,
  //   String courseId,
  //   int lectureNumber,
  //   String studentId,
  //   bool isStarred,
  // ) async {
  //   try {
  //     await repository.toggleStarStatus(
  //         courseId, lectureNumber, studentId, isStarred);
  //     if (context.mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text(
  //             isStarred ? 'Student marked as important' : 'Student unmarked',
  //           ),
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     if (context.mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Error updating star status: $e'),
  //           backgroundColor: Colors.red,
  //         ),
  //       );
  //     }
  //     rethrow;
  //   }
  // }

  Future<void> toggleStarStatus(
    BuildContext context,
    String courseId,
    int lectureNumber,
    String studentId,
    bool isStarred,
  ) async {
    try {
      await repository.toggleStarStatus(
          courseId, lectureNumber, studentId, isStarred);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              isStarred ? 'Student marked as important' : 'Student unmarked',
            ),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error updating star status: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
      rethrow;
    }
  }
}
