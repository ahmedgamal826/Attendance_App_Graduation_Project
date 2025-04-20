// // // import 'dart:io';
// // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // // import 'package:flutter/material.dart';

// // // class CreateChatButton extends StatelessWidget {
// // //   const CreateChatButton({
// // //     super.key,
// // //     required GlobalKey<FormState> formKey,
// // //     required this.nameController,
// // //     required File? selectedImage,
// // //     required this.viewModel,
// // //   })  : _formKey = formKey,
// // //         _selectedImage = selectedImage;

// // //   final GlobalKey<FormState> _formKey;
// // //   final TextEditingController nameController;
// // //   final File? _selectedImage;
// // //   final ChatViewModel viewModel;

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return SizedBox(
// // //       width: double.infinity,
// // //       child: ElevatedButton(
// // //         onPressed: viewModel.isLoading
// // //             ? null // تعطيل الزر أثناء التحميل
// // //             : () async {
// // //                 if (_formKey.currentState!.validate()) {
// // //                   await viewModel.createChat(

// // //                     name: nameController.text.trim(),
// // //                     message: "New chat started",
// // //                     time: DateTime.now().toString().substring(11, 16),
// // //                     unreadCount: 0,
// // //                     avatar: _selectedImage?.path ??
// // //                         'https://t4.ftcdn.net/jpg/02/17/51/67/240_F_217516770_nHjCK3C82B2ZUC3JB3qQs8W2BGLHxZfa.jpg',
// // //                     hasCheckmark: false,
// // //                   );
// // //                   if (viewModel.errorMessage == null) {
// // //                     Navigator.pop(context); // رجوع للـ ChatsView
// // //                   }
// // //                 }
// // //               },
// // //         style: ElevatedButton.styleFrom(
// // //           backgroundColor: AppColors.primaryColor,
// // //           padding: const EdgeInsets.symmetric(vertical: 16),
// // //           shape: RoundedRectangleBorder(
// // //             borderRadius: BorderRadius.circular(30),
// // //           ),
// // //         ),
// // //         child: const Text(
// // //           'Create Chat',
// // //           style: TextStyle(
// // //             color: Colors.white,
// // //             fontSize: 16,
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'dart:io';
// // import 'package:attendance_app/core/utils/app_colors.dart';
// // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // import 'package:flutter/material.dart';

// // class CreateChatButton extends StatelessWidget {
// //   const CreateChatButton({
// //     super.key,
// //     required GlobalKey<FormState> formKey,
// //     required this.nameController,
// //     required this.emailController,
// //     required File? selectedImage,
// //     required this.viewModel,
// //   })  : _formKey = formKey,
// //         _selectedImage = selectedImage;

// //   final GlobalKey<FormState> _formKey;
// //   final TextEditingController nameController;
// //   final TextEditingController emailController; // إضافة المعلم الجديد
// //   final File? _selectedImage;
// //   final ChatViewModel viewModel;

// //   @override
// //   Widget build(BuildContext context) {
// //     return SizedBox(
// //       width: double.infinity,
// //       child: ElevatedButton(
// //         onPressed: viewModel.isLoading
// //             ? null // تعطيل الزر أثناء التحميل
// //             : () async {
// //                 if (_formKey.currentState!.validate()) {
// //                   await viewModel.createChat(
// //                     name: nameController.text.trim(),
// //                     message: "New chat started",
// //                     time: DateTime.now().toString().substring(11, 16),
// //                     unreadCount: 0,
// //                     avatar: _selectedImage?.path ??
// //                         'https://t4.ftcdn.net/jpg/02/17/51/67/240_F_217516770_nHjCK3C82B2ZUC3JB3qQs8W2BGLHxZfa.jpg',
// //                     hasCheckmark: false,
// //                     // إضافة الإيميل
// //                     email: emailController.text.trim(),
// //                   );
// //                   if (viewModel.errorMessage == null) {
// //                     Navigator.pop(context); // رجوع للـ ChatsView
// //                   }
// //                 }
// //               },
// //         style: ElevatedButton.styleFrom(
// //           backgroundColor: AppColors.primaryColor,
// //           padding: const EdgeInsets.symmetric(vertical: 16),
// //           shape: RoundedRectangleBorder(
// //             borderRadius: BorderRadius.circular(30),
// //           ),
// //         ),
// //         child: const Text(
// //           'Create Chat',
// //           style: TextStyle(
// //             color: Colors.white,
// //             fontSize: 16,
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'dart:io';
// import 'package:attendance_app/core/utils/app_colors.dart';
// import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';

// class CreateChatButton extends StatelessWidget {
//   const CreateChatButton({
//     super.key,
//     required GlobalKey<FormState> formKey,
//     required this.nameController,
//     required this.emailController,
//     required File? selectedImage,
//     required this.viewModel,
//   })  : _formKey = formKey,
//         _selectedImage = selectedImage;

//   final GlobalKey<FormState> _formKey;
//   final TextEditingController nameController;
//   final TextEditingController emailController;
//   final File? _selectedImage;
//   final ChatViewModel viewModel;

//   Future<String> _uploadImageToStorage(File? image) async {
//     if (image == null) return 'https://via.placeholder.com/150';
//     final storageRef = FirebaseStorage.instance
//         .ref()
//         .child('chat_avatars/${DateTime.now().millisecondsSinceEpoch}.jpg');
//     await storageRef.putFile(image);
//     return await storageRef.getDownloadURL();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: viewModel.isLoading
//             ? null
//             : () async {
//                 if (_formKey.currentState!.validate()) {
//                   String avatarUrl =
//                       await _uploadImageToStorage(_selectedImage);
//                   await viewModel.createChat(
//                     name: nameController.text.trim(),
//                     message: "New chat started",
//                     time: DateTime.now().toString().substring(11, 16),
//                     unreadCount: 0,
//                     avatar: avatarUrl,
//                     hasCheckmark: false,
//                     email: emailController.text.trim(),
//                   );
//                   if (viewModel.errorMessage == null) {
//                     Navigator.pop(context);
//                   }
//                 }
//               },
//         style: ElevatedButton.styleFrom(
//           backgroundColor: AppColors.primaryColor,
//           padding: const EdgeInsets.symmetric(vertical: 16),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30),
//           ),
//         ),
//         child: const Text(
//           'Create Chat',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class CreateChatButton extends StatelessWidget {
  const CreateChatButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.nameController,
    required this.emailController,
    required File? selectedImage,
    required this.viewModel,
  })  : _formKey = formKey,
        _selectedImage = selectedImage;

  final GlobalKey<FormState> _formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final File? _selectedImage;
  final ChatViewModel viewModel;

  Future<String> _uploadImageToStorage(File? image) async {
    if (image == null) return '';
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('chat_avatars/${DateTime.now().millisecondsSinceEpoch}.jpg');
    await storageRef.putFile(image);
    return await storageRef.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: viewModel.isLoading
            ? null
            : () async {
                if (_formKey.currentState!.validate()) {
                  String avatarUrl =
                      await _uploadImageToStorage(_selectedImage);
                  try {
                    await viewModel.addChatWithUser(
                      emailController.text.trim(),
                      nameController.text.trim(),
                      avatarUrl,
                    );
                    if (viewModel.errorMessage == null) {
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(viewModel.errorMessage!)),
                      );
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('فشل إنشاء المحادثة: $e')),
                    );
                  }
                }
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Text(
          'Create Chat',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
