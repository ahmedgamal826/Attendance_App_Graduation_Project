import 'package:attendance_app/core/widgets/subject_screen.dart';
import 'package:attendance_app/features/home/presentation/manager/provider/dark_mode_provider.dart';
import 'package:attendance_app/features/home/presentation/views/widgets/subjects_list.dart';
import 'package:attendance_app/features/attendance/presentation/views/schedule_screen.dart';
import 'package:flutter/material.dart';
import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/home/presentation/views/widgets/student_drawer.dart';
import 'package:attendance_app/features/home/presentation/views/widgets/join_team_dialog.dart';
import 'package:provider/provider.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({Key? key}) : super(key: key);

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  TextEditingController searchController = TextEditingController();

  List<Map<String, String>> filteredSubjects = [];

  @override
  void initState() {
    super.initState();
    filteredSubjects = subjects;
  }

  void filterSubjects(String query) {
    setState(() {
      filteredSubjects = subjects
          .where((subject) =>
              subject["title"]!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
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
                onChanged: filterSubjects,
                decoration: InputDecoration(
                  hintText: "Search for subjects...",
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
              child: ListView.builder(
                itemCount: filteredSubjects.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const SubjectScreen(),
                      //   ),
                      // );
                    },
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double cardHeight = constraints.maxWidth * 0.4;
                        double fontSizeTitle = constraints.maxWidth * 0.06;
                        double fontSizeSubtitle = constraints.maxWidth * 0.04;

                        return Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Stack(
                              children: [
                                // صورة الخلفية
                                Image.asset(
                                  "assets/images/1.jpg",
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: cardHeight,
                                ),

                                Container(
                                  height: cardHeight,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: constraints.maxWidth * 0.75,
                                        child: Text(
                                          filteredSubjects[index]["title"]!,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: fontSizeTitle,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 6),

                                      // السنة
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          filteredSubjects[index]["year"]!,
                                          style: TextStyle(
                                            fontSize: fontSizeSubtitle,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Colors.white.withOpacity(0.9),
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
                                    filteredSubjects[index]["lecturer"]!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: fontSizeSubtitle,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white.withOpacity(0.9),
                                    ),
                                  ),
                                ),

                                // Positioned(
                                //   top: 8,
                                //   right: 8,
                                //   child: IconButton(
                                //     icon: const Icon(Icons.more_vert,
                                //         color: Colors.white),
                                //     onPressed: () {},
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
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
