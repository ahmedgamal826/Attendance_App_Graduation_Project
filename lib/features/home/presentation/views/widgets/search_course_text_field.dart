import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SearchCourseTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onChanged;

  const SearchCourseTextField({
    Key? key,
    required this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        cursorColor: AppColors.primaryColor,
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Search for courses...",
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
              width: 2,
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        ),
      ),
    );
  }
}
