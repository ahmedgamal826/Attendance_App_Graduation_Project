import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:attendance_app/core/utils/app_colors.dart';

class JoinTeamDialog {
  static void show(BuildContext context) {
    final TextEditingController codeController = TextEditingController();
    String? errorMessage;

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Join a team using a code",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: codeController,
                      cursorColor: AppColors.primaryColor,
                      decoration: InputDecoration(
                        labelText: "Course Code",
                        labelStyle: TextStyle(color: Colors.grey.shade700),
                        errorText: errorMessage,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.primaryColor, width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 14),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildDialogButton(context, "Cancel", Colors.red,
                            () => Navigator.pop(context)),
                        _buildDialogButton(context, "Join", Colors.green,
                            () async {
                          String courseCode = codeController.text.trim();
                          if (courseCode.isEmpty) {
                            setState(() {
                              errorMessage = 'Please enter a course code';
                            });
                            return;
                          }

                          try {
                            // Check if the course code exists in the Courses collection
                            QuerySnapshot courseSnapshot =
                                await FirebaseFirestore.instance
                                    .collection('Courses')
                                    .where('courseCode', isEqualTo: courseCode)
                                    .get();

                            if (courseSnapshot.docs.isEmpty) {
                              setState(() {
                                errorMessage = 'Invalid course code';
                              });
                              return;
                            }

                            // Get the course document
                            var courseDoc = courseSnapshot.docs.first;
                            String courseId = courseDoc.id;

                            // Get the current student's UID
                            User? currentUser =
                                FirebaseAuth.instance.currentUser;
                            if (currentUser == null) {
                              setState(() {
                                errorMessage = 'User not logged in';
                              });
                              return;
                            }

                            String studentUid = currentUser.uid;

                            // Get the student's data from the users collection
                            DocumentSnapshot studentDoc =
                                await FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(studentUid)
                                    .get();

                            if (!studentDoc.exists) {
                              setState(() {
                                errorMessage = 'Student data not found';
                              });
                              return;
                            }

                            var studentData =
                                studentDoc.data() as Map<String, dynamic>;
                            String studentName =
                                studentData['name'] ?? 'Unknown';
                            String studentEmail = studentData['email'] ?? '';
                            String studentImage = studentData['image'] ?? '';

                            // Add the student to the students subcollection under the course
                            await FirebaseFirestore.instance
                                .collection('Courses')
                                .doc(courseId)
                                .collection('students')
                                .doc(studentUid)
                                .set({
                              'uid': studentUid,
                              'name': studentName,
                              'email': studentEmail,
                              'image': studentImage,
                              'joinedAt': FieldValue.serverTimestamp(),
                            });

                            // Add the course to the student's enrolledCourses in users collection
                            DocumentReference studentRef = FirebaseFirestore
                                .instance
                                .collection('users')
                                .doc(studentUid);

                            await studentRef.update({
                              'enrolledCourses':
                                  FieldValue.arrayUnion([courseCode])
                            });

                            Navigator.pop(context);

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Course added successfully!'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          } catch (e) {
                            setState(() {
                              errorMessage = 'Error joining course: $e';
                            });
                          }
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  static Widget _buildDialogButton(
      BuildContext context, String text, Color color, VoidCallback onPressed) {
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width * 0.25,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
