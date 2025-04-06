import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/chats/presentation/views/home_chats__view.dart';
import 'package:attendance_app/features/home/presentation/manager/provider/dark_mode_provider.dart';
import 'package:attendance_app/features/home/presentation/views/home_screen.dart';
import 'package:attendance_app/features/questionnaire/presentation/views/questionnaire_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppHome extends StatefulWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  int selectedIndex = 1;

  final List<Widget> pages = const [
    HomeChatsView(),
    HomeScreen(),
    QuestionnaireView(),
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<DarkModeProvider>(context).isDarkMode;

    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: isDarkMode ? const Color(0xff212121) : Colors.white,
        enableFeedback: false,
        items: [
          _buildNavItem(Icons.chat, "Chats", 0),
          _buildNavItem(Icons.home, "Home", 1),
          _buildNavItem(Icons.question_answer, "Questionnaire", 2),
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
