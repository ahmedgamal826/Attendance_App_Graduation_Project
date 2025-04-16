// import 'package:flutter/material.dart';

// class ChatTextField extends StatelessWidget {
//   const ChatTextField({
//     super.key,
//     required TextEditingController messageController,
//   }) : _messageController = messageController;

//   final TextEditingController _messageController;

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: TextField(
//         controller: _messageController,
//         style: const TextStyle(color: Colors.black),
//         decoration: InputDecoration(
//           hintText: 'Type a message',
//           hintStyle: const TextStyle(color: Colors.grey),
//           filled: true,
//           fillColor: Colors.grey[200],
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30),
//             borderSide: BorderSide.none,
//           ),
//           suffixIcon: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               IconButton(
//                 icon: const Icon(
//                   Icons.attach_file,
//                   color: Colors.grey,
//                 ),
//                 onPressed: () {},
//               ),
//               IconButton(
//                 icon: const Icon(
//                   Icons.camera_alt,
//                   color: Colors.grey,
//                 ),
//                 onPressed: () {},
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:attendance_app/core/utils/app_colors.dart';
// import 'package:flutter/material.dart';

// class ChatTextField extends StatelessWidget {
//   const ChatTextField({
//     super.key,
//     required this.messageController,
//   });

//   final TextEditingController messageController;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadius.circular(30),
//       ),
//       child: TextField(
//         cursorColor: AppColors.primaryColor,
//         controller: messageController,
//         style: const TextStyle(color: Colors.black),
//         decoration: InputDecoration(
//           hintText: 'Type a message',
//           hintStyle: const TextStyle(color: Colors.grey),
//           filled: true,
//           fillColor: Colors.grey[200],
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30),
//             borderSide: BorderSide.none,
//           ),
//           suffixIcon: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               IconButton(
//                 icon: const Icon(
//                   Icons.attach_file,
//                   color: Colors.grey,
//                 ),
//                 onPressed: () {},
//               ),
//               IconButton(
//                 icon: const Icon(
//                   Icons.camera_alt,
//                   color: Colors.grey,
//                 ),
//                 onPressed: () {},
//               ),
//             ],
//           ),
//           contentPadding:
//               const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//         ),
//       ),
//     );
//   }
// }

import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({
    super.key,
    required this.messageController,
  });

  final TextEditingController messageController;

  bool _isArabic(String text) {
    // دالة للكشف عن اللغة العربية
    if (text.isEmpty) return false;
    return RegExp(r'[\u0600-\u06FF]').hasMatch(text);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: messageController,
      builder: (context, TextEditingValue value, child) {
        final isArabicText = _isArabic(value.text);
        final textDirection =
            isArabicText ? TextDirection.rtl : TextDirection.ltr;

        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            cursorColor: AppColors.primaryColor,
            controller: messageController,
            style: const TextStyle(color: Colors.black),
            textDirection: textDirection,
            textAlign: isArabicText ? TextAlign.right : TextAlign.left,
            decoration: InputDecoration(
              hintText: 'Type a message',
              hintStyle: const TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.attach_file,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.camera_alt,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
          ),
        );
      },
    );
  }
}
