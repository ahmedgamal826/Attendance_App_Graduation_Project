import 'package:animate_do/animate_do.dart';
import 'package:attendance_app/core/widgets/subject_screen.dart';
import 'package:attendance_app/features/attendance/presentation/views/update_course_view.dart';
import 'package:attendance_app/features/home/presentation/views/add_subject_view.dart';
import 'package:attendance_app/features/home/presentation/views/widgets/course_card_widget.dart';
import 'package:attendance_app/features/home/presentation/views/widgets/no_course_found_widget.dart';
import 'package:attendance_app/features/home/presentation/views/widgets/no_course_search__found_widget.dart';
import 'package:attendance_app/features/home/presentation/views/widgets/search_course_text_field.dart';
import 'package:flutter/material.dart';
import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/home/presentation/views/widgets/admin_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart'; // استيراد Firebase Auth

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> filteredSubjects = [];
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  String? adminUid; // لتخزين uid الخاص بالـ admin

  @override
  void initState() {
    super.initState();
    _getAdminUid(); // استرجاع uid الخاص بالـ admin عند بدء الشاشة
    searchController.addListener(() {
      filterSubjects(searchController.text);
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  // دالة لاسترجاع uid الخاص بالـ admin بناءً على email
  Future<void> _getAdminUid() async {
    try {
      // الحصول على المستخدم الحالي من Firebase Auth
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        String email = currentUser.email ?? '';
        if (email.isNotEmpty) {
          // البحث في مجموعة users للحصول على uid بناءً على email
          QuerySnapshot userSnapshot = await FirebaseFirestore.instance
              .collection('users')
              .where('email', isEqualTo: email)
              .get();

          if (userSnapshot.docs.isNotEmpty) {
            setState(() {
              adminUid =
                  userSnapshot.docs.first.id; // تخزين uid الخاص بالـ admin
            });
          } else {
            print('No user found with this email');
          }
        } else {
          print('No user email found');
        }
      } else {
        print('No user logged in');
      }
    } catch (e) {
      print('Error fetching admin UID: $e');
    }
  }

  void filterSubjects(String query) {
    setState(() {
      // لا حاجة لتصفية محلية، لأننا نعتمد على StreamBuilder
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldMessengerKey,
      backgroundColor: AppColors.whiteColor,
      drawer: const AdminDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          "Admin Home Screen",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchCourseTextField(
              controller: searchController,
              onChanged: filterSubjects,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: adminUid == null
                  ? const Center(
                      child:
                          CircularProgressIndicator()) // عرض مؤشر تحميل أثناء جلب adminUid
                  : StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('Courses')
                          .where('adminID',
                              isEqualTo: adminUid) // تصفية بناءً على adminID
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        }
                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return const NoCourseFoundWidget();
                        }

                        var subjects = snapshot.data!.docs.where((doc) {
                          String title =
                              (doc.data() as Map<String, dynamic>)['courseName']
                                      ?.toString()
                                      .toLowerCase() ??
                                  '';
                          String query = searchController.text.toLowerCase();
                          return title.contains(query);
                        }).toList();

                        if (subjects.isEmpty) {
                          return const NoCourseSearchFoundWidget();
                        }

                        return ListView.builder(
                          itemCount: subjects.length,
                          itemBuilder: (context, index) {
                            var subjectData =
                                subjects[index].data() as Map<String, dynamic>;
                            String courseId = subjects[index].id; // معرف المادة
                            String courseName =
                                subjectData['courseName']?.toString() ??
                                    'Unknown Subject';
                            String semester =
                                subjectData['semester']?.toString() ??
                                    'Unknown Year';
                            String date = subjectData['date']?.toString() ??
                                'Unknown Date';

                            return LayoutBuilder(
                              builder: (context, constraints) {
                                double cardHeight = constraints.maxWidth * 0.4;
                                double fontSizeTitle =
                                    constraints.maxWidth * 0.06;
                                double fontSizeSubtitle =
                                    constraints.maxWidth * 0.04;

                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SubjectScreen(
                                          courseId: courseId, // تمرير courseId
                                          courseName:
                                              courseName, // تمرير اسم المادة
                                        ),
                                      ),
                                    );
                                  },
                                  child: FadeInUp(
                                    duration: const Duration(milliseconds: 400),
                                    delay: Duration(milliseconds: index * 500),
                                    child: CourseCard(
                                      cardHeight: cardHeight,
                                      fontSizeTitle: fontSizeTitle,
                                      fontSizeSubtitle: fontSizeSubtitle,
                                      constraints: constraints,
                                      courseName: courseName,
                                      semester: semester,
                                      date: date,
                                      onMorePressed: (context) {
                                        _showBottomSheet(context,
                                            subjects[index].id, courseName);
                                      },
                                    ),
                                  ),
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
      floatingActionButton: FloatingActionButton(
        heroTag: "fab_admin_home_screen",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddSubjectPage()),
          );
        },
        backgroundColor: AppColors.primaryColor,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  void _showBottomSheet(
      BuildContext parentContext, String docId, String courseName) {
    showModalBottomSheet(
      context: parentContext,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      builder: (BuildContext bottomSheetContext) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.edit, color: Colors.blue),
                title: Text('Update'),
                onTap: () async {
                  // جلب بيانات المادة الحالية من Firestore
                  DocumentSnapshot doc = await FirebaseFirestore.instance
                      .collection('Courses')
                      .doc(docId)
                      .get();
                  var subjectData = doc.data() as Map<String, dynamic>;

                  Navigator.pop(bottomSheetContext);
                  Navigator.push(
                    parentContext,
                    MaterialPageRoute(
                      builder: (context) => UpdateCoursePage(
                        courseId: docId,
                        courseName: subjectData['courseName'] ?? '',
                        courseCode: subjectData['courseCode'] ?? '',
                        semester: subjectData['semester'] ?? '',
                        date: subjectData['date'] ?? '',
                      ),
                    ),
                  );
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: const Text('Delete'),
                onTap: () {
                  AwesomeDialog(
                    context: bottomSheetContext,
                    dialogType: DialogType.warning,
                    animType: AnimType.bottomSlide,
                    title: 'Confirm Deletion',
                    desc:
                        'Are you sure you want to delete the course "$courseName"?',
                    btnCancelOnPress: () {},
                    btnOkOnPress: () async {
                      try {
                        await FirebaseFirestore.instance
                            .collection('Courses')
                            .doc(docId)
                            .delete();
                        Navigator.pop(bottomSheetContext);
                        _scaffoldMessengerKey.currentState?.showSnackBar(
                          const SnackBar(
                            content: Text('Course deleted successfully'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      } catch (e) {
                        Navigator.pop(bottomSheetContext);
                        _scaffoldMessengerKey.currentState?.showSnackBar(
                          SnackBar(
                            content: Text('Error deleting course: $e'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
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
}
