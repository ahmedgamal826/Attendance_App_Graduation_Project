import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  final String title;
  final bool isOut;

  const TitleSection({
    super.key,
    required this.title,
    required this.isOut,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            left: isOut ? screenWidth + 100 : 0,
            right: isOut ? -screenWidth - 100 : 0,
            duration: const Duration(milliseconds: 250),
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
