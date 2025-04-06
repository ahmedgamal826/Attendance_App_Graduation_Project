import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCameraButton extends StatelessWidget {
  final VoidCallback onTap; // Callback لما نضغط على الأيقونة

  const CustomCameraButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: GestureDetector(
        onTap: onTap, // استخدام الـ onTap اللي بنمرره
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.camera_alt,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}
