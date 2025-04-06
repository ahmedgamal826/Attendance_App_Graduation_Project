import 'package:attendance_app/features/home/presentation/manager/provider/dark_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.buttonText, required this.onPressed});

  String buttonText;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<DarkModeProvider>(context).isDarkMode;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 23,
              color: isDarkMode ? Colors.black : Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
