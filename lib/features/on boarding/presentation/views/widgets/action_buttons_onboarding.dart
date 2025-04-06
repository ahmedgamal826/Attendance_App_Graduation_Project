import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final int index;
  final bool isOut;
  final VoidCallback onNext;
  final VoidCallback onBack;

  const ActionButtons({
    super.key,
    required this.index,
    required this.isOut,
    required this.onNext,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: onBack,
            child: const Text(
              "Back",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
            ),
            onPressed: onNext,
            child: Text(
              index == 2 ? "Start" : "Next",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
