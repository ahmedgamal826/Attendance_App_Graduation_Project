// // import 'package:attendance_app/core/utils/app_colors.dart';
// // import 'package:attendance_app/features/chats/presentation/views/home_chats__view.dart';
// // import 'package:attendance_app/features/home/presentation/manager/provider/dark_mode_provider.dart';
// // import 'package:attendance_app/features/home/presentation/views/home_screen.dart';
// // import 'package:attendance_app/features/questionnaire/presentation/views/admin_questionnaire_view.dart';
// // import 'package:attendance_app/features/questionnaire/presentation/views/admin_home_questionnaires.dart';
// // import 'package:attendance_app/features/questionnaire/presentation/views/student_home_questionnaires_view.dart';
// // import 'package:attendance_app/features/questionnaire/presentation/views/student_questionnaire_view.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';

// // class AppHome extends StatefulWidget {
// //   const AppHome({Key? key}) : super(key: key);

// //   @override
// //   _AppHomeState createState() => _AppHomeState();
// // }

// // class _AppHomeState extends State<AppHome> {
// //   int selectedIndex = 1;

// //   Future<bool> isAdmin() async {
// //     try {
// //       User? user = FirebaseAuth.instance.currentUser;
// //       if (user != null) {
// //         DocumentSnapshot userDoc = await FirebaseFirestore.instance
// //             .collection("users")
// //             .doc(user.uid)
// //             .get();
// //         if (userDoc.exists) {
// //           return userDoc["role"]?.toString().toLowerCase() == "admin";
// //         }
// //       }
// //       return false;
// //     } catch (e) {
// //       print("Error in isAdmin: $e");
// //       return false;
// //     }
// //   }

// //   // bool isAdmin = snapshot.data ?? false;

// //   // final List<Widget> pages = const [
// //   //   HomeChatsView(),
// //   //   HomeScreen(),
// //   //   isAdmin ? const AdminQuestionnaireView() : const StudentQuestionnaireView(),
// //   // ];

// //   @override
// //   Widget build(BuildContext context) {
// //     final isDarkMode = Provider.of<DarkModeProvider>(context).isDarkMode;

// //     return FutureBuilder<bool>(
// //       future: isAdmin(),
// //       builder: (context, snapshot) {
// //         if (snapshot.connectionState == ConnectionState.waiting) {
// //           return const Scaffold(
// //             body: Center(
// //               child: CircularProgressIndicator(
// //                 color: AppColors.background,
// //               ),
// //             ),
// //           );
// //         }

// //         if (snapshot.hasError) {
// //           return const Scaffold(
// //             body: Center(child: Text("Error occurred while checking role")),
// //           );
// //         }

// //         bool isAdmin = snapshot.data ?? false;

// //         // تحديد الصفحات بناءً على دور المستخدم
// //         final List<Widget> pages = [
// //           const HomeChatsView(),
// //           const HomeScreen(),
// //           isAdmin
// //               ? const HomeQuestionnairesView()
// //               : const StudentHomeQuestionnairesView(),

// //           // isAdmin ? AdminQuestionnaireView() : const StudentQuestionnaireView(),
// //         ];

// //         return Scaffold(
// //           body: pages[selectedIndex],
// //           bottomNavigationBar: BottomNavigationBar(
// //             backgroundColor:
// //                 isDarkMode ? const Color(0xff212121) : Colors.white,
// //             enableFeedback: false,
// //             items: [
// //               _buildNavItem(Icons.chat, "Chats", 0),
// //               _buildNavItem(Icons.home, "Home", 1),
// //               _buildNavItem(Icons.question_answer, "Questionnaire", 2),
// //             ],
// //             currentIndex: selectedIndex,
// //             selectedItemColor:
// //                 isDarkMode ? Colors.white : AppColors.primaryColor,
// //             unselectedItemColor: Colors.grey.shade600,
// //             showUnselectedLabels: true,
// //             elevation: 15,
// //             type: BottomNavigationBarType.fixed,
// //             onTap: (index) {
// //               setState(() {
// //                 selectedIndex = index;
// //               });
// //             },
// //           ),
// //         );
// //       },
// //     );
// //   }

// //   BottomNavigationBarItem _buildNavItem(
// //       IconData icon, String label, int index) {
// //     bool isDarkMode = Provider.of<DarkModeProvider>(context).isDarkMode;

// //     return BottomNavigationBarItem(
// //       icon: Icon(
// //         icon,
// //         size: selectedIndex == index ? 32 : 24,
// //         color: selectedIndex == index
// //             ? (isDarkMode ? Colors.white : AppColors.primaryColor)
// //             : Colors.grey.shade600,
// //       ),
// //       label: label,
// //     );
// //   }
// // }

// import 'package:attendance_app/core/utils/app_colors.dart';
// import 'package:attendance_app/features/chats/presentation/views/home_chats__view.dart';
// import 'package:attendance_app/features/home/presentation/manager/provider/dark_mode_provider.dart';
// import 'package:attendance_app/features/home/presentation/views/home_screen.dart';
// import 'package:attendance_app/features/questionnaire/presentation/views/admin_home_questionnaires.dart';
// import 'package:attendance_app/features/questionnaire/presentation/views/student_home_questionnaires_view.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class AppHome extends StatefulWidget {
//   const AppHome({Key? key}) : super(key: key);

//   @override
//   _AppHomeState createState() => _AppHomeState();
// }

// class _AppHomeState extends State<AppHome> {
//   int selectedIndex = 1;
//   bool isAdminUser = false;
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _checkUserRole();
//   }

//   // التحقق من نوع المستخدم مرة واحدة عند بدء التطبيق
//   Future<void> _checkUserRole() async {
//     try {
//       User? user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         DocumentSnapshot userDoc = await FirebaseFirestore.instance
//             .collection("users")
//             .doc(user.uid)
//             .get();
//         if (userDoc.exists) {
//           setState(() {
//             isAdminUser = userDoc["role"]?.toString().toLowerCase() == "admin";
//             isLoading = false;
//           });
//         } else {
//           setState(() {
//             isAdminUser = false;
//             isLoading = false;
//           });
//         }
//       } else {
//         setState(() {
//           isAdminUser = false;
//           isLoading = false;
//         });
//       }
//     } catch (e) {
//       print("Error in checking role: $e");
//       setState(() {
//         isAdminUser = false;
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isDarkMode = Provider.of<DarkModeProvider>(context).isDarkMode;

//     if (isLoading) {
//       return const Scaffold(
//         body: Center(
//           child: CircularProgressIndicator(
//             color: AppColors.primaryColor,
//           ),
//         ),
//       );
//     }

//     // استخدام IndexedStack لتجنب إعادة بناء الصفحات في كل انتقال
//     return Scaffold(
//       body: IndexedStack(
//         index: selectedIndex,
//         children: [
//           const HomeChatsView(),
//           const HomeScreen(),
//           isAdminUser
//               ? const HomeQuestionnairesView()
//               : const StudentHomeQuestionnairesView(),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: isDarkMode ? const Color(0xff212121) : Colors.white,
//         enableFeedback: false,
//         items: [
//           _buildNavItem(Icons.chat, "Chats", 0),
//           _buildNavItem(Icons.home, "Home", 1),
//           _buildNavItem(Icons.question_answer, "Questionnaire", 2),
//         ],
//         currentIndex: selectedIndex,
//         selectedItemColor: isDarkMode ? Colors.white : AppColors.primaryColor,
//         unselectedItemColor: Colors.grey.shade600,
//         showUnselectedLabels: true,
//         elevation: 15,
//         type: BottomNavigationBarType.fixed,
//         onTap: (index) {
//           setState(() {
//             selectedIndex = index;
//           });
//         },
//       ),
//     );
//   }

//   BottomNavigationBarItem _buildNavItem(
//       IconData icon, String label, int index) {
//     bool isDarkMode = Provider.of<DarkModeProvider>(context).isDarkMode;

//     return BottomNavigationBarItem(
//       icon: Icon(
//         icon,
//         size: selectedIndex == index ? 32 : 24,
//         color: selectedIndex == index
//             ? (isDarkMode ? Colors.white : AppColors.primaryColor)
//             : Colors.grey.shade600,
//       ),
//       label: label,
//     );
//   }
// }

import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/chats/presentation/views/home_chats__view.dart';
import 'package:attendance_app/features/home/presentation/manager/provider/dark_mode_provider.dart';
import 'package:attendance_app/features/home/presentation/views/home_screen.dart';
import 'package:attendance_app/features/profile/presentations/views/user_profile_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppHome extends StatefulWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  int selectedIndex = 1;
  bool isAdminUser = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkUserRole();
  }

  Future<void> _checkUserRole() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .get();
        if (userDoc.exists) {
          setState(() {
            isAdminUser = userDoc["role"]?.toString().toLowerCase() == "admin";
            isLoading = false;
          });
        } else {
          setState(() {
            isAdminUser = false;
            isLoading = false;
          });
        }
      } else {
        setState(() {
          isAdminUser = false;
          isLoading = false;
        });
      }
    } catch (e) {
      print("Error in checking role: $e");
      setState(() {
        isAdminUser = false;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<DarkModeProvider>(context).isDarkMode;

    if (isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
        ),
      );
    }

    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: [
          const HomeChatsView(),
          const HomeScreen(),
          isAdminUser ? const UserProfileView() : const UserProfileView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: isDarkMode ? const Color(0xff212121) : Colors.white,
        enableFeedback: false,
        items: [
          _buildNavItem(Icons.chat, "Chats", 0),
          _buildNavItem(Icons.home, "Home", 1),
          _buildNavItem(Icons.person, "Profile", 2),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: isDarkMode ? Colors.white : AppColors.primaryColor,
        unselectedItemColor: Colors.grey.shade600,
        showUnselectedLabels: true,
        elevation: 15,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
      IconData icon, String label, int index) {
    bool isDarkMode = Provider.of<DarkModeProvider>(context).isDarkMode;

    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        size: selectedIndex == index ? 32 : 24,
        color: selectedIndex == index
            ? (isDarkMode ? Colors.white : AppColors.primaryColor)
            : Colors.grey.shade600,
      ),
      label: label,
    );
  }
}
