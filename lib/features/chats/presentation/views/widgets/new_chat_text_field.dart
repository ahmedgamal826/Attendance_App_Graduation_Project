// import 'package:flutter/material.dart';

// class NewChatTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String hintText;
//   final String? Function(String?)? validator;
//   final TextInputType? keyboardType;
//   final IconData? suffixIcon;
//   final VoidCallback? onSuffixIconPressed;

//   const NewChatTextField({
//     super.key,
//     required this.controller,
//     required this.hintText,
//     this.validator,
//     this.keyboardType,
//     this.suffixIcon,
//     this.onSuffixIconPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       style: const TextStyle(color: Colors.white),
//       keyboardType: keyboardType,
//       decoration: InputDecoration(
//         hintText: hintText,
//         hintStyle: const TextStyle(color: Colors.white54),
//         filled: true,
//         fillColor: Colors.white12,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide.none,
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide.none,
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(color: Colors.white54),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(color: Colors.red),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(color: Colors.red),
//         ),
//         suffixIcon: suffixIcon != null
//             ? IconButton(
//                 icon: Icon(
//                   suffixIcon,
//                   color: Colors.white54,
//                 ),
//                 onPressed: onSuffixIconPressed,
//               )
//             : null,
//       ),
//       validator: validator,
//     );
//   }
// }

import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class NewChatTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconPressed;

  const NewChatTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.keyboardType,
    this.suffixIcon,
    this.onSuffixIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primaryColor,
      controller: controller,
      style: const TextStyle(color: Colors.black), // Black text for readability
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey), // Grey hint text
        filled: true,
        fillColor: Colors.grey[100], // Very light grey background
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey), // Grey border
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:
              const BorderSide(color: Colors.grey), // Grey border when enabled
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
          ), // Green border when focused
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:
              const BorderSide(color: Colors.red), // Red border for errors
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
              color: Colors.red), // Red border when focused with error
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(
                  suffixIcon,
                  color: AppColors
                      .primaryColor, // Green suffix icon to match button
                ),
                onPressed: onSuffixIconPressed,
              )
            : null,
      ),
      validator: validator,
    );
  }
}
