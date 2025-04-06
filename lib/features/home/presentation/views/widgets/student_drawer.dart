import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/chat_gpt/presentation/views/chat_gpt_home_view.dart';
import 'package:attendance_app/features/home/presentation/manager/provider/dark_mode_provider.dart';
import 'package:attendance_app/features/home/presentation/views/widgets/dark_mode_toggle.dart';
import 'package:attendance_app/features/notifications/presentation/views/student_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentDrawer extends StatefulWidget {
  const StudentDrawer({Key? key}) : super(key: key);

  @override
  State<StudentDrawer> createState() => _StudentDrawerState();
}

class _StudentDrawerState extends State<StudentDrawer> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return const Drawer(
        child: Center(child: Text("No user logged in.")),
      );
    }
    final isDarkMode = Provider.of<DarkModeProvider>(context).isDarkMode;

    return Drawer(
      backgroundColor: isDarkMode ? AppColors.blackColor : AppColors.whiteColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection("users")
                .doc(currentUser.uid)
                .get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return DrawerHeader(
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? AppColors.blackColor
                        : AppColors.primaryColor,
                    // gradient: LinearGradient(
                    //   colors: [Color(0xff70ACF4), Color(0xff5A9EE0)],
                    //   begin: Alignment.topLeft,
                    //   end: Alignment.bottomRight,
                    // ),
                  ),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: isDarkMode
                          ? AppColors.whiteColor
                          : AppColors.primaryColor,
                    ),
                  ),
                );
              }
              Map<String, dynamic> userData =
                  snapshot.data!.data() as Map<String, dynamic>;
              String name = userData["name"] ?? "Student";
              String? imageUrl = userData["image"]; // جلب الصورة من Firestore

              return DrawerHeader(
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? AppColors.blackColor
                      : AppColors.primaryColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      backgroundImage: (imageUrl != null && imageUrl.isNotEmpty)
                          ? NetworkImage(imageUrl)
                          : null,
                      child: (imageUrl == null || imageUrl.isEmpty)
                          ? const Icon(
                              Icons.person,
                              size: 50,
                              color: Color(0xff70ACF4),
                            )
                          : null,
                    ),
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              size: 27,
              color: isDarkMode ? AppColors.whiteColor : AppColors.primaryColor,
            ),
            title: Text(
              "Home",
              style: TextStyle(
                fontSize: 18,
                color: isDarkMode ? AppColors.whiteColor : AppColors.blackColor,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.psychology,
              size: 27,
              color: isDarkMode ? AppColors.whiteColor : AppColors.primaryColor,
            ),
            title: Text(
              "ChatGPT",
              style: TextStyle(
                fontSize: 18,
                color: isDarkMode ? AppColors.whiteColor : AppColors.blackColor,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatGPTHomeView(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.notifications_active,
              size: 27,
              color: isDarkMode ? AppColors.whiteColor : AppColors.primaryColor,
            ),
            title: Text(
              "Notifications",
              style: TextStyle(
                fontSize: 18,
                color: isDarkMode ? AppColors.whiteColor : AppColors.blackColor,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StudentNotifications(),
                ),
              );
            },
          ),
          // ListTile(
          //   leading: const Icon(
          //     Icons.nightlight_round,
          //     color: AppColors.primaryColor,
          //     size: 30,
          //   ),
          //   title: const Text(
          //     "Dark Mode",
          //     style: TextStyle(
          //       color: Colors.black,
          //       fontSize: 18,
          //     ),
          //   ),
          //   trailing: Switch(
          //     value: isDarkMode,
          //     onChanged: (value) {
          //       setState(() {
          //         isDarkMode = value;
          //       });
          //     },
          //     activeColor: AppColors.primaryColor,
          //     inactiveThumbColor: Colors.grey,
          //   ),
          // ),

          const DarkModeToggle(),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.logout,
              size: 27,
              color: isDarkMode ? AppColors.whiteColor : AppColors.primaryColor,
            ),
            title: Text(
              "Log Out",
              style: TextStyle(
                fontSize: 18,
                color: isDarkMode ? AppColors.whiteColor : AppColors.blackColor,
              ),
            ),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, "loginScreen");
            },
          ),
        ],
      ),
    );
  }
}
