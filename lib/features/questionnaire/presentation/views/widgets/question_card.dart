import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final int index;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const QuestionCard({
    required this.index,
    required this.isSelected,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Card(
              elevation: 5,
              color: isSelected ? AppColors.primaryColor : Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                width: 100,
                alignment: Alignment.center,
                child: Text(
                  'Question ${index + 1}',
                  style: TextStyle(
                    fontSize: 16,
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: onDelete,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                    color: Colors.red, shape: BoxShape.circle),
                child: const Icon(Icons.close, color: Colors.white, size: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
