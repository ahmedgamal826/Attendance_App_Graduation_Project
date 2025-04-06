import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/home/presentation/views/student_attendance.dart';
import 'package:attendance_app/features/home/presentation/views/widgets/dark_mode_toggle.dart';
import 'package:attendance_app/features/home/presentation/views/widgets/open_camera_screen.dart';
import 'package:attendance_app/features/notifications/presentation/views/admin_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminDrawer extends StatefulWidget {
  const AdminDrawer({Key? key}) : super(key: key);

  @override
  State<AdminDrawer> createState() => _AdminDrawerState();
}

class _AdminDrawerState extends State<AdminDrawer> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return const Drawer(
        child: Center(child: Text("No user logged in.")),
      );
    }
    return Drawer(
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
                return const DrawerHeader(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                  ),
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              Map<String, dynamic> userData =
                  snapshot.data!.data() as Map<String, dynamic>;
              String name = userData["name"] ?? "Admin";
              String? image = userData['image'];
              return DrawerHeader(
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      backgroundImage: (image != null && image.isNotEmpty)
                          ? NetworkImage(image)
                          : null,
                      child: (image == null || image.isEmpty)
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
            leading: const Icon(
              Icons.home,
              size: 27,
              color: AppColors.primaryColor,
            ),
            title: const Text(
              "Home",
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: const Icon(
              Icons.notifications_active,
              size: 27,
              color: AppColors.primaryColor,
            ),
            title: const Text(
              "Notifications",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AdminNotifications(),
                ),
              );
            },
          ),
          // const ListTile(
          //   leading: Icon(
          //     Icons.nightlight_round,
          //     color: AppColors.primaryColor,
          //     size: 30,
          //   ),
          //   title: Text(
          //     "Dark Mode",
          //     style: TextStyle(
          //       color: Colors.black,
          //       fontSize: 18,
          //     ),
          //   ),
          //   trailing: Switch(
          //       value: true,
          //       onChanged: null,
          //       activeColor: Colors.grey,
          //       inactiveThumbColor: AppColors.primaryColor),
          // ),

          const DarkModeToggle(),

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
          //         isDarkMode = value; // تحديث الحالة عند تغيير التبديل
          //       });
          //     },
          //     activeColor: AppColors.primaryColor,
          //     inactiveThumbColor: Colors.grey,
          //   ),
          // ),
          const Divider(),

          // ListTile(
          //   leading: const Icon(Icons.person_add, color: Color(0xff70ACF4)),
          //   title: const Text("Add User"),
          //   onTap: () {
          //     Navigator.pop(context);
          //     Navigator.pushNamed(context, "addUser");
          //   },
          // ),
          // ListTile(
          //   leading: const Icon(Icons.person_add, color: Color(0xff70ACF4)),
          //   title: const Text("Attendance"),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => AttendanceScreen(),
          //       ),
          //     );
          //   },
          // ),
          // const Divider(),
          // ListTile(
          //   leading: const Icon(Icons.person_add, color: Color(0xff70ACF4)),
          //   title: const Text("OpenCamera"),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => OpenCameraScreen(),
          //       ),
          //     );
          //   },
          // ),
          ListTile(
            leading: const Icon(
              Icons.logout,
              size: 27,
              color: AppColors.primaryColor,
            ),
            title: const Text(
              "Log Out",
              style: TextStyle(fontSize: 18),
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
