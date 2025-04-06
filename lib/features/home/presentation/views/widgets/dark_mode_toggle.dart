import 'package:attendance_app/features/home/presentation/manager/provider/dark_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:attendance_app/core/utils/app_colors.dart';

class DarkModeToggle extends StatelessWidget {
  const DarkModeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DarkModeProvider>(
      builder: (context, darkModeProvider, child) {
        return ListTile(
          leading: Icon(
            darkModeProvider.isDarkMode
                ? Icons.nightlight_round
                : Icons.wb_sunny,
            color: darkModeProvider.isDarkMode
                ? AppColors.whiteColor
                : AppColors.primaryColor,
            size: 30,
          ),
          title: Text(
            "Dark Mode",
            style: TextStyle(
              color: darkModeProvider.isDarkMode
                  ? AppColors.whiteColor
                  : AppColors.blackColor,
              fontSize: 18,
            ),
          ),
          trailing: Switch(
            value: darkModeProvider.isDarkMode,
            onChanged: (value) {
              darkModeProvider.toggleDarkMode(); // تحديث الوضع
            },
            activeColor: AppColors.primaryColor,
            inactiveThumbColor: Colors.grey,
          ),
        );
      },
    );
  }
}
