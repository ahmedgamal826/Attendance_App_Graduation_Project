import 'package:attendance_app/core/widgets/subject_screen.dart';
import 'package:attendance_app/features/home/presentation/manager/provider/dark_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/home/presentation/views/widgets/student_drawer.dart';
import 'package:attendance_app/features/home/presentation/views/widgets/join_team_dialog.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({Key? key}) : super(key: key);

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  TextEditingController searchController = TextEditingController();
  String? studentUid;

  @override
  void initState() {
    super.initState();
    _getStudentUid();
    searchController.addListener(() {
      setState(() {});
    });
  }

  Future<void> _getStudentUid() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      setState(() {
        studentUid = currentUser.uid;
      });

      // Check if the student document exists, if not create it
      DocumentSnapshot studentDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(studentUid)
          .get();

      if (!studentDoc.exists) {
        // Create a new document for the student with an empty enrolledCourses
        await FirebaseFirestore.instance
            .collection('users')
            .doc(studentUid)
            .set({
          'enrolledCourses': [],
          'role': 'student',
          'email': currentUser.email,
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<DarkModeProvider>(context).isDarkMode;
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : AppColors.whiteColor,
      drawer: const StudentDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          "Student Home Screen",
          style: TextStyle(
            fontSize: 22,
            color: AppColors.whiteColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: isDarkMode ? Colors.grey[900] : AppColors.primaryColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {
                JoinTeamDialog.show(context);
              },
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.2),
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: TextField(
                cursorColor: AppColors.primaryColor,
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Search for courses...",
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                        color: AppColors.primaryColor, width: 2),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: studentUid == null
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ))
                  : StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .doc(studentUid)
                          .snapshots(),
                      builder: (context, userSnapshot) {
                        if (userSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (userSnapshot.hasError) {
                          return const Center(
                              child: Text('Error fetching data'));
                        }
                        if (!userSnapshot.hasData ||
                            !userSnapshot.data!.exists) {
                          return const Center(
                              child: Text('No student data found'));
                        }

                        // Safely handle the enrolledCourses field
                        List<dynamic> enrolledCourses =
                            userSnapshot.data!.data() != null &&
                                    (userSnapshot.data!.data()
                                            as Map<String, dynamic>)
                                        .containsKey('enrolledCourses')
                                ? userSnapshot.data!.get('enrolledCourses')
                                : [];

                        if (enrolledCourses.isEmpty) {
                          return const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.book_outlined,
                                  size: 60,
                                  color: Colors.grey,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'No courses enrolled',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }

                        return StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('Courses')
                              .where('courseCode', whereIn: enrolledCourses)
                              .snapshots(),
                          builder: (context, coursesSnapshot) {
                            if (coursesSnapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            if (coursesSnapshot.hasError) {
                              return const Center(
                                  child: Text('Error fetching courses'));
                            }
                            if (!coursesSnapshot.hasData ||
                                coursesSnapshot.data!.docs.isEmpty) {
                              return const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.book_outlined,
                                      size: 60,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'No courses found',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }

                            var courses = coursesSnapshot.data!.docs;
                            var filteredCourses = courses.where((course) {
                              String title = course['courseName']
                                      ?.toString()
                                      .toLowerCase() ??
                                  '';
                              String query =
                                  searchController.text.toLowerCase();
                              return title.contains(query);
                            }).toList();

                            if (filteredCourses.isEmpty) {
                              return const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.book_outlined,
                                      size: 60,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'No matching courses found',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }

                            return ListView.builder(
                              itemCount: filteredCourses.length,
                              itemBuilder: (context, index) {
                                var courseData = filteredCourses[index].data()
                                    as Map<String, dynamic>;
                                String courseId = filteredCourses[index].id;
                                String courseName = courseData['courseName'] ??
                                    'Unknown Subject';
                                String semester =
                                    courseData['semester'] ?? 'Unknown Year';
                                String date =
                                    courseData['date'] ?? 'Unknown Date';

                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SubjectScreen(
                                          courseId: courseId,
                                          courseName: courseName,
                                        ),
                                      ),
                                    );
                                  },
                                  child: LayoutBuilder(
                                    builder: (context, constraints) {
                                      double cardHeight =
                                          constraints.maxWidth * 0.4;
                                      double fontSizeTitle =
                                          constraints.maxWidth * 0.06;
                                      double fontSizeSubtitle =
                                          constraints.maxWidth * 0.04;

                                      return Card(
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 8),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: Stack(
                                            children: [
                                              Image.asset(
                                                "assets/images/1.jpg",
                                                fit: BoxFit.cover,
                                                width: double.infinity,
                                                height: cardHeight,
                                              ),
                                              Container(
                                                height: cardHeight,
                                                decoration: BoxDecoration(
                                                  color: Colors.black
                                                      .withOpacity(0.6),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16.0,
                                                        vertical: 12),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width:
                                                          constraints.maxWidth *
                                                              0.75,
                                                      child: Text(
                                                        courseName,
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                          fontSize:
                                                              fontSizeTitle,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 6),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 8.0),
                                                      child: Text(
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        semester,
                                                        style: TextStyle(
                                                          fontSize:
                                                              fontSizeSubtitle,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.white
                                                              .withOpacity(0.9),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 8,
                                                left: 12,
                                                right: 20,
                                                child: Text(
                                                  date,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: fontSizeSubtitle,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white
                                                        .withOpacity(0.9),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
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
    );
  }
}
