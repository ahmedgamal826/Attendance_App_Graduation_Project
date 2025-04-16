import 'package:flutter/material.dart';
import '../../../models/test_model_student.dart';

class TestListItem extends StatelessWidget {
  final TestModel test;
  final VoidCallback onTap;

  const TestListItem({
    Key? key,
    required this.test,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Color configurations based on completion status
    final Color checkBackgroundColor = test.isCompleted ? Colors.green : Colors.white;
    final Color checkIconColor = test.isCompleted ? Colors.white : const Color(0xFF1A75FF);
    final Color borderColor = test.isCompleted ? Colors.green : const Color(0xFF1A75FF);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color(0xFF1A75FF),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Completion indicator circle
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: borderColor,
                    width: 2,
                  ),
                  color: checkBackgroundColor,
                ),
                child: Icon(
                  Icons.check,
                  color: checkIconColor,
                  size: 18,
                ),
              ),
              const SizedBox(width: 16),
              // Test details
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    test.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A75FF),
                    ),
                  ),
                  Text(
                    test.date,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF7FA8D7),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              // Score
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6F0FF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  test.score,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A75FF),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}