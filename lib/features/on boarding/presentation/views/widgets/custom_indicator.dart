import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  final bool active;
  const CustomIndicator({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: active ? AppColors.primaryColor : Colors.grey,
      ),
      width: active ? 40 : 10,
      height: 10,
    );
  }
}
