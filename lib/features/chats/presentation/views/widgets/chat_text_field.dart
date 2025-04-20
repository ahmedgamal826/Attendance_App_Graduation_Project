// // // // // // // // // // import 'package:flutter/material.dart';

// // // // // // // // // // class ChatTextField extends StatelessWidget {
// // // // // // // // // //   const ChatTextField({
// // // // // // // // // //     super.key,
// // // // // // // // // //     required TextEditingController messageController,
// // // // // // // // // //   }) : _messageController = messageController;

// // // // // // // // // //   final TextEditingController _messageController;

// // // // // // // // // //   @override
// // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // //     return Expanded(
// // // // // // // // // //       child: TextField(
// // // // // // // // // //         controller: _messageController,
// // // // // // // // // //         style: const TextStyle(color: Colors.black),
// // // // // // // // // //         decoration: InputDecoration(
// // // // // // // // // //           hintText: 'Type a message',
// // // // // // // // // //           hintStyle: const TextStyle(color: Colors.grey),
// // // // // // // // // //           filled: true,
// // // // // // // // // //           fillColor: Colors.grey[200],
// // // // // // // // // //           border: OutlineInputBorder(
// // // // // // // // // //             borderRadius: BorderRadius.circular(30),
// // // // // // // // // //             borderSide: BorderSide.none,
// // // // // // // // // //           ),
// // // // // // // // // //           suffixIcon: Row(
// // // // // // // // // //             mainAxisSize: MainAxisSize.min,
// // // // // // // // // //             children: [
// // // // // // // // // //               IconButton(
// // // // // // // // // //                 icon: const Icon(
// // // // // // // // // //                   Icons.attach_file,
// // // // // // // // // //                   color: Colors.grey,
// // // // // // // // // //                 ),
// // // // // // // // // //                 onPressed: () {},
// // // // // // // // // //               ),
// // // // // // // // // //               IconButton(
// // // // // // // // // //                 icon: const Icon(
// // // // // // // // // //                   Icons.camera_alt,
// // // // // // // // // //                   color: Colors.grey,
// // // // // // // // // //                 ),
// // // // // // // // // //                 onPressed: () {},
// // // // // // // // // //               ),
// // // // // // // // // //             ],
// // // // // // // // // //           ),
// // // // // // // // // //         ),
// // // // // // // // // //       ),
// // // // // // // // // //     );
// // // // // // // // // //   }
// // // // // // // // // // }

// // // // // // // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // // // // // // import 'package:flutter/material.dart';

// // // // // // // // // // class ChatTextField extends StatelessWidget {
// // // // // // // // // //   const ChatTextField({
// // // // // // // // // //     super.key,
// // // // // // // // // //     required this.messageController,
// // // // // // // // // //   });

// // // // // // // // // //   final TextEditingController messageController;

// // // // // // // // // //   @override
// // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // //     return Container(
// // // // // // // // // //       decoration: BoxDecoration(
// // // // // // // // // //         color: Colors.grey[200],
// // // // // // // // // //         borderRadius: BorderRadius.circular(30),
// // // // // // // // // //       ),
// // // // // // // // // //       child: TextField(
// // // // // // // // // //         cursorColor: AppColors.primaryColor,
// // // // // // // // // //         controller: messageController,
// // // // // // // // // //         style: const TextStyle(color: Colors.black),
// // // // // // // // // //         decoration: InputDecoration(
// // // // // // // // // //           hintText: 'Type a message',
// // // // // // // // // //           hintStyle: const TextStyle(color: Colors.grey),
// // // // // // // // // //           filled: true,
// // // // // // // // // //           fillColor: Colors.grey[200],
// // // // // // // // // //           border: OutlineInputBorder(
// // // // // // // // // //             borderRadius: BorderRadius.circular(30),
// // // // // // // // // //             borderSide: BorderSide.none,
// // // // // // // // // //           ),
// // // // // // // // // //           suffixIcon: Row(
// // // // // // // // // //             mainAxisSize: MainAxisSize.min,
// // // // // // // // // //             children: [
// // // // // // // // // //               IconButton(
// // // // // // // // // //                 icon: const Icon(
// // // // // // // // // //                   Icons.attach_file,
// // // // // // // // // //                   color: Colors.grey,
// // // // // // // // // //                 ),
// // // // // // // // // //                 onPressed: () {},
// // // // // // // // // //               ),
// // // // // // // // // //               IconButton(
// // // // // // // // // //                 icon: const Icon(
// // // // // // // // // //                   Icons.camera_alt,
// // // // // // // // // //                   color: Colors.grey,
// // // // // // // // // //                 ),
// // // // // // // // // //                 onPressed: () {},
// // // // // // // // // //               ),
// // // // // // // // // //             ],
// // // // // // // // // //           ),
// // // // // // // // // //           contentPadding:
// // // // // // // // // //               const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
// // // // // // // // // //         ),
// // // // // // // // // //       ),
// // // // // // // // // //     );
// // // // // // // // // //   }
// // // // // // // // // // }

// // // // // // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // // // // // import 'package:flutter/material.dart';

// // // // // // // // // class ChatTextField extends StatelessWidget {
// // // // // // // // //   const ChatTextField({
// // // // // // // // //     super.key,
// // // // // // // // //     required this.messageController,
// // // // // // // // //   });

// // // // // // // // //   final TextEditingController messageController;

// // // // // // // // //   bool _isArabic(String text) {
// // // // // // // // //     // دالة للكشف عن اللغة العربية
// // // // // // // // //     if (text.isEmpty) return false;
// // // // // // // // //     return RegExp(r'[\u0600-\u06FF]').hasMatch(text);
// // // // // // // // //   }

// // // // // // // // //   @override
// // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // //     return ValueListenableBuilder(
// // // // // // // // //       valueListenable: messageController,
// // // // // // // // //       builder: (context, TextEditingValue value, child) {
// // // // // // // // //         final isArabicText = _isArabic(value.text);
// // // // // // // // //         final textDirection =
// // // // // // // // //             isArabicText ? TextDirection.rtl : TextDirection.ltr;

// // // // // // // // //         return Container(
// // // // // // // // //           decoration: BoxDecoration(
// // // // // // // // //             color: Colors.grey[200],
// // // // // // // // //             borderRadius: BorderRadius.circular(30),
// // // // // // // // //           ),
// // // // // // // // //           child: TextField(
// // // // // // // // //             cursorColor: AppColors.primaryColor,
// // // // // // // // //             controller: messageController,
// // // // // // // // //             style: const TextStyle(color: Colors.black),
// // // // // // // // //             textDirection: textDirection,
// // // // // // // // //             textAlign: isArabicText ? TextAlign.right : TextAlign.left,
// // // // // // // // //             decoration: InputDecoration(
// // // // // // // // //               hintText: 'Type a message',
// // // // // // // // //               hintStyle: const TextStyle(color: Colors.grey),
// // // // // // // // //               filled: true,
// // // // // // // // //               fillColor: Colors.grey[200],
// // // // // // // // //               border: OutlineInputBorder(
// // // // // // // // //                 borderRadius: BorderRadius.circular(30),
// // // // // // // // //                 borderSide: BorderSide.none,
// // // // // // // // //               ),
// // // // // // // // //               suffixIcon: Row(
// // // // // // // // //                 mainAxisSize: MainAxisSize.min,
// // // // // // // // //                 children: [
// // // // // // // // //                   IconButton(
// // // // // // // // //                     icon: const Icon(
// // // // // // // // //                       Icons.attach_file,
// // // // // // // // //                       color: Colors.grey,
// // // // // // // // //                     ),
// // // // // // // // //                     onPressed: () {},
// // // // // // // // //                   ),
// // // // // // // // //                   IconButton(
// // // // // // // // //                     icon: const Icon(
// // // // // // // // //                       Icons.camera_alt,
// // // // // // // // //                       color: Colors.grey,
// // // // // // // // //                     ),
// // // // // // // // //                     onPressed: () {},
// // // // // // // // //                   ),
// // // // // // // // //                 ],
// // // // // // // // //               ),
// // // // // // // // //               contentPadding:
// // // // // // // // //                   const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
// // // // // // // // //             ),
// // // // // // // // //           ),
// // // // // // // // //         );
// // // // // // // // //       },
// // // // // // // // //     );
// // // // // // // // //   }
// // // // // // // // // }

// // // // // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // import 'package:image_picker/image_picker.dart';
// // // // // // // // import 'dart:io';
// // // // // // // // import 'package:firebase_storage/firebase_storage.dart';
// // // // // // // // import 'package:provider/provider.dart';
// // // // // // // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';

// // // // // // // // class ChatTextField extends StatelessWidget {
// // // // // // // //   const ChatTextField({
// // // // // // // //     super.key,
// // // // // // // //     required this.messageController,
// // // // // // // //     required this.chatId,
// // // // // // // //   });

// // // // // // // //   final TextEditingController messageController;
// // // // // // // //   final String chatId;

// // // // // // // //   bool _isArabic(String text) {
// // // // // // // //     if (text.isEmpty) return false;
// // // // // // // //     return RegExp(r'[\u0600-\u06FF]').hasMatch(text);
// // // // // // // //   }

// // // // // // // //   Future<void> _pickImage(BuildContext context) async {
// // // // // // // //     final picker = ImagePicker();
// // // // // // // //     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
// // // // // // // //     if (pickedFile != null) {
// // // // // // // //       File imageFile = File(pickedFile.path);
// // // // // // // //       try {
// // // // // // // //         // رفع الصورة إلى Firebase Storage
// // // // // // // //         final storageRef = FirebaseStorage.instance
// // // // // // // //             .ref()
// // // // // // // //             .child('chat_images/${chatId}/${DateTime.now().millisecondsSinceEpoch}.jpg');
// // // // // // // //         await storageRef.putFile(imageFile);
// // // // // // // //         final imageUrl = await storageRef.getDownloadURL();

// // // // // // // //         // إرسال رابط الصورة كرسالة
// // // // // // // //         final viewModel = Provider.of<ChatViewModel>(context, listen: false);
// // // // // // // //         await viewModel.sendMessage(chatId, imageUrl, true, isImage: true);
// // // // // // // //       } catch (e) {
// // // // // // // //         ScaffoldMessenger.of(context).showSnackBar(
// // // // // // // //           SnackBar(content: Text('Failed to upload image: $e')),
// // // // // // // //         );
// // // // // // // //       }
// // // // // // // //     }
// // // // // // // //   }

// // // // // // // //   void _showAttachmentSheet(BuildContext context) {
// // // // // // // //     showModalBottomSheet(
// // // // // // // //       context: context,
// // // // // // // //       shape: const RoundedRectangleBorder(
// // // // // // // //         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
// // // // // // // //       ),
// // // // // // // //       builder: (context) => Container(
// // // // // // // //         padding: const EdgeInsets.all(16),
// // // // // // // //         child: Column(
// // // // // // // //           mainAxisSize: MainAxisSize.min,
// // // // // // // //           children: [
// // // // // // // //             const Text(
// // // // // // // //               'Choose an option',
// // // // // // // //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // // // // // //             ),
// // // // // // // //             const SizedBox(height: 16),
// // // // // // // //             ListTile(
// // // // // // // //               leading: const Icon(Icons.photo, color: AppColors.primaryColor),
// // // // // // // //               title: const Text('Gallery'),
// // // // // // // //               onTap: () {
// // // // // // // //                 Navigator.pop(context);
// // // // // // // //                 _pickImage(context);
// // // // // // // //               },
// // // // // // // //             ),
// // // // // // // //             ListTile(
// // // // // // // //               leading: const Icon(Icons.description, color: AppColors.primaryColor),
// // // // // // // //               title: const Text('Document'),
// // // // // // // //               onTap: () {
// // // // // // // //                 Navigator.pop(context);
// // // // // // // //                 ScaffoldMessenger.of(context).showSnackBar(
// // // // // // // //                   const SnackBar(content: Text('Document selection coming soon!')),
// // // // // // // //                 );
// // // // // // // //               },
// // // // // // // //             ),
// // // // // // // //             ListTile(
// // // // // // // //               leading: const Icon(Icons.insert_drive_file, color: AppColors.primaryColor),
// // // // // // // //               title: const Text('File'),
// // // // // // // //               onTap: () {
// // // // // // // //                 Navigator.pop(context);
// // // // // // // //                 ScaffoldMessenger.of(context).showSnackBar(
// // // // // // // //                   const SnackBar(content: Text('File selection coming soon!')),
// // // // // // // //                 );
// // // // // // // //               },
// // // // // // // //             ),
// // // // // // // //           ],
// // // // // // // //         ),
// // // // // // // //       ),
// // // // // // // //     );
// // // // // // // //   }

// // // // // // // //   @override
// // // // // // // //   Widget build(BuildContext context) {
// // // // // // // //     return ValueListenableBuilder(
// // // // // // // //       valueListenable: messageController,
// // // // // // // //       builder: (context, TextEditingValue value, child) {
// // // // // // // //         final isArabicText = _isArabic(value.text);
// // // // // // // //         final textDirection =
// // // // // // // //             isArabicText ? TextDirection.rtl : TextDirection.ltr;

// // // // // // // //         return Container(
// // // // // // // //           decoration: BoxDecoration(
// // // // // // // //             color: Colors.grey[200],
// // // // // // // //             borderRadius: BorderRadius.circular(30),
// // // // // // // //           ),
// // // // // // // //           child: TextField(
// // // // // // // //             cursorColor: AppColors.primaryColor,
// // // // // // // //             controller: messageController,
// // // // // // // //             style: const TextStyle(color: Colors.black),
// // // // // // // //             textDirection: textDirection,
// // // // // // // //             textAlign: isArabicText ? TextAlign.right : TextAlign.left,
// // // // // // // //             decoration: InputDecoration(
// // // // // // // //               hintText: 'Type a message',
// // // // // // // //               hintStyle: const TextStyle(color: Colors.grey),
// // // // // // // //               filled: true,
// // // // // // // //               fillColor: Colors.grey[200],
// // // // // // // //               border: OutlineInputBorder(
// // // // // // // //                 borderRadius: BorderRadius.circular(30),
// // // // // // // //                 borderSide: BorderSide.none,
// // // // // // // //               ),
// // // // // // // //               suffixIcon: Row(
// // // // // // // //                 mainAxisSize: MainAxisSize.min,
// // // // // // // //                 children: [
// // // // // // // //                   IconButton(
// // // // // // // //                     icon: const Icon(
// // // // // // // //                       Icons.attach_file,
// // // // // // // //                       color: Colors.grey,
// // // // // // // //                     ),
// // // // // // // //                     onPressed: () => _showAttachmentSheet(context),
// // // // // // // //                   ),
// // // // // // // //                   IconButton(
// // // // // // // //                     icon: const Icon(
// // // // // // // //                       Icons.camera_alt,
// // // // // // // //                       color: Colors.grey,
// // // // // // // //                     ),
// // // // // // // //                     onPressed: () {},
// // // // // // // //                   ),
// // // // // // // //                 ],
// // // // // // // //               ),
// // // // // // // //               contentPadding:
// // // // // // // //                   const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
// // // // // // // //             ),
// // // // // // // //           ),
// // // // // // // //         );
// // // // // // // //       },
// // // // // // // //     );
// // // // // // // //   }
// // // // // // // // }

// // // // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // // // import 'package:flutter/material.dart';
// // // // // // // import 'package:image_picker/image_picker.dart';
// // // // // // // import 'dart:io';
// // // // // // // import 'package:firebase_storage/firebase_storage.dart';
// // // // // // // import 'package:provider/provider.dart';
// // // // // // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';

// // // // // // // class ChatTextField extends StatefulWidget {
// // // // // // //   const ChatTextField({
// // // // // // //     super.key,
// // // // // // //     required this.messageController,
// // // // // // //     required this.chatId,
// // // // // // //   });

// // // // // // //   final TextEditingController messageController;
// // // // // // //   final String chatId;

// // // // // // //   @override
// // // // // // //   _ChatTextFieldState createState() => _ChatTextFieldState();
// // // // // // // }

// // // // // // // class _ChatTextFieldState extends State<ChatTextField> {
// // // // // // //   bool _isArabic(String text) {
// // // // // // //     if (text.isEmpty) return false;
// // // // // // //     return RegExp(r'[\u0600-\u06FF]').hasMatch(text);
// // // // // // //   }

// // // // // // //   // Future<void> _pickImage() async {
// // // // // // //   //   final picker = ImagePicker();
// // // // // // //   //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
// // // // // // //   //   if (pickedFile != null && mounted) {
// // // // // // //   //     File imageFile = File(pickedFile.path);
// // // // // // //   //     try {
// // // // // // //   //       // رفع الصورة إلى Firebase Storage
// // // // // // //   //       final storageRef = FirebaseStorage.instance.ref().child(
// // // // // // //   //           'chat_images/${widget.chatId}/${DateTime.now().millisecondsSinceEpoch}.jpg');
// // // // // // //   //       await storageRef.putFile(imageFile);
// // // // // // //   //       final imageUrl = await storageRef.getDownloadURL();

// // // // // // //   //       // إرسال رابط الصورة كرسالة
// // // // // // //   //       if (mounted) {
// // // // // // //   //         final viewModel = Provider.of<ChatViewModel>(context, listen: false);
// // // // // // //   //         await viewModel.sendMessage(widget.chatId, imageUrl, true,
// // // // // // //   //             isImage: true);
// // // // // // //   //       }
// // // // // // //   //     } catch (e) {
// // // // // // //   //       if (mounted) {
// // // // // // //   //         ScaffoldMessenger.of(context).showSnackBar(
// // // // // // //   //           SnackBar(content: Text('Failed to upload image: $e')),
// // // // // // //   //         );
// // // // // // //   //       }
// // // // // // //   //     }
// // // // // // //   //   }
// // // // // // //   // }

// // // // // // //   Future<void> _pickImage() async {
// // // // // // //     final picker = ImagePicker();
// // // // // // //     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
// // // // // // //     if (pickedFile != null && mounted) {
// // // // // // //       File imageFile = File(pickedFile.path);
// // // // // // //       try {
// // // // // // //         // رفع الصورة إلى Firebase Storage
// // // // // // //         final storageRef = FirebaseStorage.instance.ref().child(
// // // // // // //             'chat_images/${widget.chatId}/${DateTime.now().millisecondsSinceEpoch}.jpg');
// // // // // // //         await storageRef.putFile(imageFile);
// // // // // // //         final imageUrl = await storageRef.getDownloadURL();

// // // // // // //         // إرسال رابط الصورة كرسالة
// // // // // // //         if (mounted) {
// // // // // // //           final viewModel = Provider.of<ChatViewModel>(context, listen: false);
// // // // // // //           await viewModel.sendMessage(widget.chatId, imageUrl, true,
// // // // // // //               isImage: true);
// // // // // // //         }
// // // // // // //       } catch (e) {
// // // // // // //         if (mounted) {
// // // // // // //           ScaffoldMessenger.of(context).showSnackBar(
// // // // // // //             SnackBar(content: Text('Failed to upload image: $e')),
// // // // // // //           );
// // // // // // //         }
// // // // // // //       }
// // // // // // //     }
// // // // // // //   }

// // // // // // //   void _showAttachmentSheet() {
// // // // // // //     if (!mounted) return;
// // // // // // //     showModalBottomSheet(
// // // // // // //       context: context,
// // // // // // //       shape: const RoundedRectangleBorder(
// // // // // // //         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
// // // // // // //       ),
// // // // // // //       builder: (context) => Container(
// // // // // // //         padding: const EdgeInsets.all(16),
// // // // // // //         child: Column(
// // // // // // //           mainAxisSize: MainAxisSize.min,
// // // // // // //           children: [
// // // // // // //             const Text(
// // // // // // //               'Choose an option',
// // // // // // //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // // // // //             ),
// // // // // // //             const SizedBox(height: 16),
// // // // // // //             ListTile(
// // // // // // //               leading: const Icon(Icons.photo, color: AppColors.primaryColor),
// // // // // // //               title: const Text('Gallery'),
// // // // // // //               onTap: () {
// // // // // // //                 Navigator.pop(context);
// // // // // // //                 _pickImage();
// // // // // // //               },
// // // // // // //             ),
// // // // // // //             ListTile(
// // // // // // //               leading:
// // // // // // //                   const Icon(Icons.description, color: AppColors.primaryColor),
// // // // // // //               title: const Text('Document'),
// // // // // // //               onTap: () {
// // // // // // //                 Navigator.pop(context);
// // // // // // //                 if (mounted) {
// // // // // // //                   ScaffoldMessenger.of(context).showSnackBar(
// // // // // // //                     const SnackBar(
// // // // // // //                         content: Text('Document selection coming soon!')),
// // // // // // //                   );
// // // // // // //                 }
// // // // // // //               },
// // // // // // //             ),
// // // // // // //             ListTile(
// // // // // // //               leading: const Icon(Icons.insert_drive_file,
// // // // // // //                   color: AppColors.primaryColor),
// // // // // // //               title: const Text('File'),
// // // // // // //               onTap: () {
// // // // // // //                 Navigator.pop(context);
// // // // // // //                 if (mounted) {
// // // // // // //                   ScaffoldMessenger.of(context).showSnackBar(
// // // // // // //                     const SnackBar(
// // // // // // //                         content: Text('File selection coming soon!')),
// // // // // // //                   );
// // // // // // //                 }
// // // // // // //               },
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return ValueListenableBuilder(
// // // // // // //       valueListenable: widget.messageController,
// // // // // // //       builder: (context, TextEditingValue value, child) {
// // // // // // //         final isArabicText = _isArabic(value.text);
// // // // // // //         final textDirection =
// // // // // // //             isArabicText ? TextDirection.rtl : TextDirection.ltr;

// // // // // // //         return Container(
// // // // // // //           decoration: BoxDecoration(
// // // // // // //             color: Colors.grey[200],
// // // // // // //             borderRadius: BorderRadius.circular(30),
// // // // // // //           ),
// // // // // // //           child: TextField(
// // // // // // //             cursorColor: AppColors.primaryColor,
// // // // // // //             controller: widget.messageController,
// // // // // // //             style: const TextStyle(color: Colors.black),
// // // // // // //             textDirection: textDirection,
// // // // // // //             textAlign: isArabicText ? TextAlign.right : TextAlign.left,
// // // // // // //             decoration: InputDecoration(
// // // // // // //               hintText: 'Type a message',
// // // // // // //               hintStyle: const TextStyle(color: Colors.grey),
// // // // // // //               filled: true,
// // // // // // //               fillColor: Colors.grey[200],
// // // // // // //               border: OutlineInputBorder(
// // // // // // //                 borderRadius: BorderRadius.circular(30),
// // // // // // //                 borderSide: BorderSide.none,
// // // // // // //               ),
// // // // // // //               suffixIcon: Row(
// // // // // // //                 mainAxisSize: MainAxisSize.min,
// // // // // // //                 children: [
// // // // // // //                   IconButton(
// // // // // // //                     icon: const Icon(
// // // // // // //                       Icons.attach_file,
// // // // // // //                       color: Colors.grey,
// // // // // // //                     ),
// // // // // // //                     onPressed: _showAttachmentSheet,
// // // // // // //                   ),
// // // // // // //                   IconButton(
// // // // // // //                     icon: const Icon(
// // // // // // //                       Icons.camera_alt,
// // // // // // //                       color: Colors.grey,
// // // // // // //                     ),
// // // // // // //                     onPressed: () {},
// // // // // // //                   ),
// // // // // // //                 ],
// // // // // // //               ),
// // // // // // //               contentPadding:
// // // // // // //                   const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //         );
// // // // // // //       },
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'package:image_picker/image_picker.dart';
// // // // // // import 'dart:io';
// // // // // // import 'package:firebase_storage/firebase_storage.dart';
// // // // // // import 'package:provider/provider.dart';
// // // // // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';

// // // // // // class ChatTextField extends StatefulWidget {
// // // // // //   const ChatTextField({
// // // // // //     super.key,
// // // // // //     required this.messageController,
// // // // // //     required this.chatId,
// // // // // //     required this.onUploadingImage, // دالة لتغيير حالة التحميل
// // // // // //   });

// // // // // //   final TextEditingController messageController;
// // // // // //   final String chatId;
// // // // // //   final Function(bool) onUploadingImage;

// // // // // //   @override
// // // // // //   _ChatTextFieldState createState() => _ChatTextFieldState();
// // // // // // }

// // // // // // class _ChatTextFieldState extends State<ChatTextField> {
// // // // // //   bool _isArabic(String text) {
// // // // // //     if (text.isEmpty) return false;
// // // // // //     return RegExp(r'[\u0600-\u06FF]').hasMatch(text);
// // // // // //   }

// // // // // //   Future<void> _pickImage() async {
// // // // // //     final picker = ImagePicker();
// // // // // //     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
// // // // // //     if (pickedFile != null && mounted) {
// // // // // //       File imageFile = File(pickedFile.path);
// // // // // //       try {
// // // // // //         // تغيير حالة التحميل لـ true
// // // // // //         widget.onUploadingImage(true);

// // // // // //         // رفع الصورة إلى Firebase Storage
// // // // // //         final storageRef = FirebaseStorage.instance
// // // // // //             .ref()
// // // // // //             .child('chat_images/${widget.chatId}/${DateTime.now().millisecondsSinceEpoch}.jpg');
// // // // // //         await storageRef.putFile(imageFile);
// // // // // //         final imageUrl = await storageRef.getDownloadURL();

// // // // // //         // إرسال رابط الصورة كرسالة
// // // // // //         if (mounted) {
// // // // // //           final viewModel = Provider.of<ChatViewModel>(context, listen: false);
// // // // // //           await viewModel.sendMessage(widget.chatId, imageUrl, true, isImage: true);
// // // // // //         }
// // // // // //       } catch (e) {
// // // // // //         if (mounted) {
// // // // // //           ScaffoldMessenger.of(context).showSnackBar(
// // // // // //             SnackBar(content: Text('Failed to upload image: $e')),
// // // // // //           );
// // // // // //         }
// // // // // //       } finally {
// // // // // //         // تغيير حالة التحميل لـ false بعد الانتهاء (سواء نجح أو فشل)
// // // // // //         if (mounted) {
// // // // // //           widget.onUploadingImage(false);
// // // // // //         }
// // // // // //       }
// // // // // //     }
// // // // // //   }

// // // // // //   void _showAttachmentSheet() {
// // // // // //     if (!mounted) return;
// // // // // //     showModalBottomSheet(
// // // // // //       context: context,
// // // // // //       shape: const RoundedRectangleBorder(
// // // // // //         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
// // // // // //       ),
// // // // // //       builder: (context) => Container(
// // // // // //         padding: const EdgeInsets.all(16),
// // // // // //         child: Column(
// // // // // //           mainAxisSize: MainAxisSize.min,
// // // // // //           children: [
// // // // // //             const Text(
// // // // // //               'Choose an option',
// // // // // //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // // // //             ),
// // // // // //             const SizedBox(height: 16),
// // // // // //             ListTile(
// // // // // //               leading: const Icon(Icons.photo, color: AppColors.primaryColor),
// // // // // //               title: const Text('Gallery'),
// // // // // //               onTap: () {
// // // // // //                 Navigator.pop(context);
// // // // // //                 _pickImage();
// // // // // //               },
// // // // // //             ),
// // // // // //             ListTile(
// // // // // //               leading: const Icon(Icons.description, color: AppColors.primaryColor),
// // // // // //               title: const Text('Document'),
// // // // // //               onTap: () {
// // // // // //                 Navigator.pop(context);
// // // // // //                 if (mounted) {
// // // // // //                   ScaffoldMessenger.of(context).showSnackBar(
// // // // // //                     const SnackBar(content: Text('Document selection coming soon!')),
// // // // // //                   );
// // // // // //                 }
// // // // // //               },
// // // // // //             ),
// // // // // //             ListTile(
// // // // // //               leading: const Icon(Icons.insert_drive_file, color: AppColors.primaryColor),
// // // // // //               title: const Text('File'),
// // // // // //               onTap: () {
// // // // // //                 Navigator.pop(context);
// // // // // //                 if (mounted) {
// // // // // //                   ScaffoldMessenger.of(context).showSnackBar(
// // // // // //                     const SnackBar(content: Text('File selection coming soon!')),
// // // // // //                   );
// // // // // //                 }
// // // // // //               },
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return ValueListenableBuilder(
// // // // // //       valueListenable: widget.messageController,
// // // // // //       builder: (context, TextEditingValue value, child) {
// // // // // //         final isArabicText = _isArabic(value.text);
// // // // // //         final textDirection =
// // // // // //             isArabicText ? TextDirection.rtl : TextDirection.ltr;

// // // // // //         return Container(
// // // // // //           decoration: BoxDecoration(
// // // // // //             color: Colors.grey[200],
// // // // // //             borderRadius: BorderRadius.circular(30),
// // // // // //           ),
// // // // // //           child: TextField(
// // // // // //             cursorColor: AppColors.primaryColor,
// // // // // //             controller: widget.messageController,
// // // // // //             style: const TextStyle(color: Colors.black),
// // // // // //             textDirection: textDirection,
// // // // // //             textAlign: isArabicText ? TextAlign.right : TextAlign.left,
// // // // // //             decoration: InputDecoration(
// // // // // //               hintText: 'Type a message',
// // // // // //               hintStyle: const TextStyle(color: Colors.grey),
// // // // // //               filled: true,
// // // // // //               fillColor: Colors.grey[200],
// // // // // //               border: OutlineInputBorder(
// // // // // //                 borderRadius: BorderRadius.circular(30),
// // // // // //                 borderSide: BorderSide.none,
// // // // // //               ),
// // // // // //               suffixIcon: Row(
// // // // // //                 mainAxisSize: MainAxisSize.min,
// // // // // //                 children: [
// // // // // //                   IconButton(
// // // // // //                     icon: const Icon(
// // // // // //                       Icons.attach_file,
// // // // // //                       color: Colors.grey,
// // // // // //                     ),
// // // // // //                     onPressed: _showAttachmentSheet,
// // // // // //                   ),
// // // // // //                   IconButton(
// // // // // //                     icon: const Icon(
// // // // // //                       Icons.camera_alt,
// // // // // //                       color: Colors.grey,
// // // // // //                     ),
// // // // // //                     onPressed: () {},
// // // // // //                   ),
// // // // // //                 ],
// // // // // //               ),
// // // // // //               contentPadding:
// // // // // //                   const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
// // // // // //             ),
// // // // // //           ),
// // // // // //         );
// // // // // //       },
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:image_picker/image_picker.dart';
// // // // // import 'dart:io';
// // // // // import 'package:firebase_storage/firebase_storage.dart';
// // // // // import 'package:provider/provider.dart';
// // // // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';

// // // // // class ChatTextField extends StatefulWidget {
// // // // //   const ChatTextField({
// // // // //     super.key,
// // // // //     required this.messageController,
// // // // //     required this.chatId,
// // // // //     required this.onUploadingImage,
// // // // //   });

// // // // //   final TextEditingController messageController;
// // // // //   final String chatId;
// // // // //   final Function(bool) onUploadingImage;

// // // // //   @override
// // // // //   _ChatTextFieldState createState() => _ChatTextFieldState();
// // // // // }

// // // // // class _ChatTextFieldState extends State<ChatTextField> {
// // // // //   bool _isArabic(String text) {
// // // // //     if (text.isEmpty) return false;
// // // // //     return RegExp(r'[\u0600-\u06FF]').hasMatch(text);
// // // // //   }

// // // // //   // دالة لاختيار الصورة (من المعرض أو الكاميرا)
// // // // //   Future<void> _pickImage(ImageSource source) async {
// // // // //     final picker = ImagePicker();
// // // // //     final pickedFile = await picker.pickImage(source: source);
// // // // //     if (pickedFile != null && mounted) {
// // // // //       File imageFile = File(pickedFile.path);
// // // // //       try {
// // // // //         // تغيير حالة التحميل لـ true
// // // // //         widget.onUploadingImage(true);

// // // // //         // رفع الصورة إلى Firebase Storage
// // // // //         final storageRef = FirebaseStorage.instance.ref().child(
// // // // //             'chat_images/${widget.chatId}/${DateTime.now().millisecondsSinceEpoch}.jpg');
// // // // //         await storageRef.putFile(imageFile);
// // // // //         final imageUrl = await storageRef.getDownloadURL();

// // // // //         // إرسال رابط الصورة كرسالة
// // // // //         if (mounted) {
// // // // //           final viewModel = Provider.of<ChatViewModel>(context, listen: false);
// // // // //           await viewModel.sendMessage(widget.chatId, imageUrl, true,
// // // // //               isImage: true);
// // // // //         }
// // // // //       } catch (e) {
// // // // //         if (mounted) {
// // // // //           ScaffoldMessenger.of(context).showSnackBar(
// // // // //             SnackBar(content: Text('Failed to upload image: $e')),
// // // // //           );
// // // // //         }
// // // // //       } finally {
// // // // //         // تغيير حالة التحميل لـ false بعد الانتهاء (سواء نجح أو فشل)
// // // // //         if (mounted) {
// // // // //           widget.onUploadingImage(false);
// // // // //         }
// // // // //       }
// // // // //     }
// // // // //   }

// // // // //   void _showAttachmentSheet() {
// // // // //     if (!mounted) return;
// // // // //     showModalBottomSheet(
// // // // //       context: context,
// // // // //       shape: const RoundedRectangleBorder(
// // // // //         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
// // // // //       ),
// // // // //       builder: (context) => Container(
// // // // //         padding: const EdgeInsets.all(16),
// // // // //         child: Column(
// // // // //           mainAxisSize: MainAxisSize.min,
// // // // //           children: [
// // // // //             const Text(
// // // // //               'Choose an option',
// // // // //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // // //             ),
// // // // //             const SizedBox(height: 16),
// // // // //             ListTile(
// // // // //               leading: const Icon(Icons.photo, color: AppColors.primaryColor),
// // // // //               title: const Text('Gallery'),
// // // // //               onTap: () {
// // // // //                 Navigator.pop(context);
// // // // //                 _pickImage(ImageSource.gallery);
// // // // //               },
// // // // //             ),
// // // // //             ListTile(
// // // // //               leading:
// // // // //                   const Icon(Icons.description, color: AppColors.primaryColor),
// // // // //               title: const Text('Document'),
// // // // //               onTap: () {
// // // // //                 Navigator.pop(context);
// // // // //                 if (mounted) {
// // // // //                   ScaffoldMessenger.of(context).showSnackBar(
// // // // //                     const SnackBar(
// // // // //                         content: Text('Document selection coming soon!')),
// // // // //                   );
// // // // //                 }
// // // // //               },
// // // // //             ),
// // // // //             ListTile(
// // // // //               leading: const Icon(Icons.insert_drive_file,
// // // // //                   color: AppColors.primaryColor),
// // // // //               title: const Text('File'),
// // // // //               onTap: () {
// // // // //                 Navigator.pop(context);
// // // // //                 if (mounted) {
// // // // //                   ScaffoldMessenger.of(context).showSnackBar(
// // // // //                     const SnackBar(
// // // // //                         content: Text('File selection coming soon!')),
// // // // //                   );
// // // // //                 }
// // // // //               },
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return ValueListenableBuilder(
// // // // //       valueListenable: widget.messageController,
// // // // //       builder: (context, TextEditingValue value, child) {
// // // // //         final isArabicText = _isArabic(value.text);
// // // // //         final textDirection =
// // // // //             isArabicText ? TextDirection.rtl : TextDirection.ltr;

// // // // //         return Container(
// // // // //           decoration: BoxDecoration(
// // // // //             color: Colors.grey[200],
// // // // //             borderRadius: BorderRadius.circular(30),
// // // // //           ),
// // // // //           child: TextField(
// // // // //             cursorColor: AppColors.primaryColor,
// // // // //             controller: widget.messageController,
// // // // //             style: const TextStyle(color: Colors.black),
// // // // //             textDirection: textDirection,
// // // // //             textAlign: isArabicText ? TextAlign.right : TextAlign.left,
// // // // //             decoration: InputDecoration(
// // // // //               hintText: 'Type a message',
// // // // //               hintStyle: const TextStyle(color: Colors.grey),
// // // // //               filled: true,
// // // // //               fillColor: Colors.grey[200],
// // // // //               border: OutlineInputBorder(
// // // // //                 borderRadius: BorderRadius.circular(30),
// // // // //                 borderSide: BorderSide.none,
// // // // //               ),
// // // // //               suffixIcon: Row(
// // // // //                 mainAxisSize: MainAxisSize.min,
// // // // //                 children: [
// // // // //                   IconButton(
// // // // //                     icon: const Icon(
// // // // //                       Icons.attach_file,
// // // // //                       color: Colors.grey,
// // // // //                     ),
// // // // //                     onPressed: _showAttachmentSheet,
// // // // //                   ),
// // // // //                   IconButton(
// // // // //                     icon: const Icon(
// // // // //                       Icons.camera_alt,
// // // // //                       color: Colors.grey,
// // // // //                     ),
// // // // //                     onPressed: () {
// // // // //                       _pickImage(ImageSource.camera); // فتح الكاميرا
// // // // //                     },
// // // // //                   ),
// // // // //                 ],
// // // // //               ),
// // // // //               contentPadding:
// // // // //                   const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
// // // // //             ),
// // // // //           ),
// // // // //         );
// // // // //       },
// // // // //     );
// // // // //   }
// // // // // }

// // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:image_picker/image_picker.dart';
// // // // import 'dart:io';
// // // // import 'package:provider/provider.dart';
// // // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';

// // // // class ChatTextField extends StatefulWidget {
// // // //   const ChatTextField({
// // // //     super.key,
// // // //     required this.messageController,
// // // //     required this.chatId,
// // // //     required this.onUploadingImage,
// // // //   });

// // // //   final TextEditingController messageController;
// // // //   final String chatId;
// // // //   final Function(bool) onUploadingImage;

// // // //   @override
// // // //   _ChatTextFieldState createState() => _ChatTextFieldState();
// // // // }

// // // // class _ChatTextFieldState extends State<ChatTextField> {
// // // //   bool _isArabic(String text) {
// // // //     if (text.isEmpty) return false;
// // // //     return RegExp(r'[\u0600-\u06FF]').hasMatch(text);
// // // //   }

// // // //   // دالة لاختيار الصورة (من المعرض أو الكاميرا)
// // // //   Future<void> _pickImage(ImageSource source) async {
// // // //     final picker = ImagePicker();
// // // //     final pickedFile = await picker.pickImage(source: source);
// // // //     if (pickedFile != null && mounted) {
// // // //       File imageFile = File(pickedFile.path);
// // // //       try {
// // // //         // تغيير حالة التحميل لـ true
// // // //         widget.onUploadingImage(true);

// // // //         // استخدام دالة sendImage من ChatViewModel
// // // //         final viewModel = Provider.of<ChatViewModel>(context, listen: false);
// // // //         await viewModel.sendImage(
// // // //             widget.chatId, imageFile, widget.onUploadingImage);
// // // //       } catch (e) {
// // // //         if (mounted) {
// // // //           ScaffoldMessenger.of(context).showSnackBar(
// // // //             SnackBar(content: Text('Failed to upload image: $e')),
// // // //           );
// // // //         }
// // // //       }
// // // //     }
// // // //   }

// // // //   void _showAttachmentSheet() {
// // // //     if (!mounted) return;
// // // //     showModalBottomSheet(
// // // //       context: context,
// // // //       shape: const RoundedRectangleBorder(
// // // //         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
// // // //       ),
// // // //       builder: (context) => Container(
// // // //         padding: const EdgeInsets.all(16),
// // // //         child: Column(
// // // //           mainAxisSize: MainAxisSize.min,
// // // //           children: [
// // // //             const Text(
// // // //               'Choose an option',
// // // //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // // //             ),
// // // //             const SizedBox(height: 16),
// // // //             ListTile(
// // // //               leading: const Icon(Icons.photo, color: AppColors.primaryColor),
// // // //               title: const Text('Gallery'),
// // // //               onTap: () {
// // // //                 Navigator.pop(context);
// // // //                 _pickImage(ImageSource.gallery);
// // // //               },
// // // //             ),
// // // //             ListTile(
// // // //               leading:
// // // //                   const Icon(Icons.description, color: AppColors.primaryColor),
// // // //               title: const Text('Document'),
// // // //               onTap: () {
// // // //                 Navigator.pop(context);
// // // //                 if (mounted) {
// // // //                   ScaffoldMessenger.of(context).showSnackBar(
// // // //                     const SnackBar(
// // // //                         content: Text('Document selection coming soon!')),
// // // //                   );
// // // //                 }
// // // //               },
// // // //             ),
// // // //             ListTile(
// // // //               leading: const Icon(Icons.insert_drive_file,
// // // //                   color: AppColors.primaryColor),
// // // //               title: const Text('File'),
// // // //               onTap: () {
// // // //                 Navigator.pop(context);
// // // //                 if (mounted) {
// // // //                   ScaffoldMessenger.of(context).showSnackBar(
// // // //                     const SnackBar(
// // // //                         content: Text('File selection coming soon!')),
// // // //                   );
// // // //                 }
// // // //               },
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return ValueListenableBuilder(
// // // //       valueListenable: widget.messageController,
// // // //       builder: (context, TextEditingValue value, child) {
// // // //         final isArabicText = _isArabic(value.text);
// // // //         final textDirection =
// // // //             isArabicText ? TextDirection.rtl : TextDirection.ltr;

// // // //         return Container(
// // // //           decoration: BoxDecoration(
// // // //             color: Colors.grey[200],
// // // //             borderRadius: BorderRadius.circular(30),
// // // //           ),
// // // //           child: TextField(
// // // //             cursorColor: AppColors.primaryColor,
// // // //             controller: widget.messageController,
// // // //             style: const TextStyle(color: Colors.black),
// // // //             textDirection: textDirection,
// // // //             textAlign: isArabicText ? TextAlign.right : TextAlign.left,
// // // //             decoration: InputDecoration(
// // // //               hintText: 'Type a message',
// // // //               hintStyle: const TextStyle(color: Colors.grey),
// // // //               filled: true,
// // // //               fillColor: Colors.grey[200],
// // // //               border: OutlineInputBorder(
// // // //                 borderRadius: BorderRadius.circular(30),
// // // //                 borderSide: BorderSide.none,
// // // //               ),
// // // //               suffixIcon: Row(
// // // //                 mainAxisSize: MainAxisSize.min,
// // // //                 children: [
// // // //                   IconButton(
// // // //                     icon: const Icon(
// // // //                       Icons.attach_file,
// // // //                       color: Colors.grey,
// // // //                     ),
// // // //                     onPressed: _showAttachmentSheet,
// // // //                   ),
// // // //                   IconButton(
// // // //                     icon: const Icon(
// // // //                       Icons.camera_alt,
// // // //                       color: Colors.grey,
// // // //                     ),
// // // //                     onPressed: () {
// // // //                       _pickImage(ImageSource.camera);
// // // //                     },
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //               contentPadding:
// // // //                   const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
// // // //             ),
// // // //           ),
// // // //         );
// // // //       },
// // // //     );
// // // //   }
// // // // }

// // import 'package:attendance_app/core/utils/app_colors.dart';
// // import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'dart:io';
// // import 'package:provider/provider.dart';
// // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';

// // class ChatTextField extends StatefulWidget {
// //   const ChatTextField({
// //     super.key,
// //     required this.messageController,
// //     required this.chatId,
// //     required this.onUploadingImage,
// //   });

// //   final TextEditingController messageController;
// //   final String chatId;
// //   final Function(bool) onUploadingImage;

// //   @override
// //   _ChatTextFieldState createState() => _ChatTextFieldState();
// // }

// // class _ChatTextFieldState extends State<ChatTextField> {
// //   bool _isArabic(String text) {
// //     if (text.isEmpty) return false;
// //     return RegExp(r'[\u0600-\u06FF]').hasMatch(text);
// //   }

// //   // Function to pick an image (from gallery or camera)
// //   Future<void> _pickImage(ImageSource source) async {
// //     final picker = ImagePicker();
// //     final pickedFile = await picker.pickImage(source: source);
// //     if (pickedFile != null && mounted) {
// //       File imageFile = File(pickedFile.path);
// //       try {
// //         // Set uploading state to true
// //         widget.onUploadingImage(true);

// //         // Use sendImage from ChatViewModel
// //         final viewModel = Provider.of<ChatViewModel>(context, listen: false);
// //         await viewModel.sendImage(
// //             widget.chatId, imageFile, widget.onUploadingImage);
// //       } catch (e) {
// //         if (mounted) {
// //           ScaffoldMessenger.of(context).showSnackBar(
// //             SnackBar(content: Text('Failed to upload image: $e')),
// //           );
// //         }
// //       }
// //     }
// //   }

// //   void _showAttachmentSheet() {
// //     if (!mounted) return;
// //     showModalBottomSheet(
// //       context: context,
// //       shape: const RoundedRectangleBorder(
// //         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
// //       ),
// //       builder: (context) => Container(
// //         padding: const EdgeInsets.all(16),
// //         child: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             const Text(
// //               'Choose an option',
// //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //             ),
// //             const SizedBox(height: 16),
// //             ListTile(
// //               leading: const Icon(Icons.photo, color: AppColors.primaryColor),
// //               title: const Text('Gallery'),
// //               onTap: () {
// //                 Navigator.pop(context);
// //                 _pickImage(ImageSource.gallery);
// //               },
// //             ),
// //             ListTile(
// //               leading:
// //                   const Icon(Icons.description, color: AppColors.primaryColor),
// //               title: const Text('Document'),
// //               onTap: () {
// //                 Navigator.pop(context);
// //                 if (mounted) {
// //                   ScaffoldMessenger.of(context).showSnackBar(
// //                     const SnackBar(
// //                         content: Text('Document selection coming soon!')),
// //                   );
// //                 }
// //               },
// //             ),
// //             ListTile(
// //               leading: const Icon(Icons.insert_drive_file,
// //                   color: AppColors.primaryColor),
// //               title: const Text('File'),
// //               onTap: () {
// //                 Navigator.pop(context);
// //                 if (mounted) {
// //                   ScaffoldMessenger.of(context).showSnackBar(
// //                     const SnackBar(
// //                         content: Text('File selection coming soon!')),
// //                   );
// //                 }
// //               },
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return ValueListenableBuilder(
// //       valueListenable: widget.messageController,
// //       builder: (context, TextEditingValue value, child) {
// //         final isArabicText = _isArabic(value.text);
// //         final textDirection =
// //             isArabicText ? TextDirection.rtl : TextDirection.ltr;

// //         return Container(
// //           decoration: BoxDecoration(
// //             color: Colors.grey[200],
// //             borderRadius: BorderRadius.circular(30),
// //           ),
// //           child: TextField(
// //             cursorColor: AppColors.primaryColor,
// //             controller: widget.messageController,
// //             style: const TextStyle(color: Colors.black),
// //             textDirection: textDirection,
// //             textAlign: isArabicText ? TextAlign.right : TextAlign.left,
// //             decoration: InputDecoration(
// //               hintText: 'Type a message...',
// //               hintStyle: const TextStyle(color: Colors.grey),
// //               filled: true,
// //               fillColor: Colors.grey[200],
// //               border: OutlineInputBorder(
// //                 borderRadius: BorderRadius.circular(30),
// //                 borderSide: BorderSide.none,
// //               ),
// //               suffixIcon: Row(
// //                 mainAxisSize: MainAxisSize.min,
// //                 children: [
// //                   IconButton(
// //                     icon: const Icon(
// //                       Icons.attach_file,
// //                       color: Colors.grey,
// //                     ),
// //                     onPressed: _showAttachmentSheet,
// //                   ),
// //                   IconButton(
// //                     icon: const Icon(
// //                       Icons.camera_alt,
// //                       color: Colors.grey,
// //                     ),
// //                     onPressed: () {
// //                       _pickImage(ImageSource.camera);
// //                     },
// //                   ),
// //                 ],
// //               ),
// //               contentPadding:
// //                   const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

// // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:image_picker/image_picker.dart';
// // // import 'dart:io';
// // // import 'package:provider/provider.dart';
// // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';

// // // class ChatTextField extends StatefulWidget {
// // //   const ChatTextField({
// // //     super.key,
// // //     required this.messageController,
// // //     required this.chatId,
// // //     required this.onUploadingImage,
// // //   });

// // //   final TextEditingController messageController;
// // //   final String chatId;
// // //   final Function(bool) onUploadingImage;

// // //   @override
// // //   _ChatTextFieldState createState() => _ChatTextFieldState();
// // // }

// // // class _ChatTextFieldState extends State<ChatTextField> {
// // //   bool _isArabic(String text) {
// // //     if (text.isEmpty) return false;
// // //     return RegExp(r'[\u0600-\u06FF]').hasMatch(text);
// // //   }

// // //   Future<void> _pickImage(ImageSource source) async {
// // //     final picker = ImagePicker();
// // //     final pickedFile = await picker.pickImage(source: source);
// // //     if (pickedFile != null && mounted) {
// // //       File imageFile = File(pickedFile.path);
// // //       try {
// // //         widget.onUploadingImage(true);
// // //         final viewModel = Provider.of<ChatViewModel>(context, listen: false);
// // //         await viewModel.sendImage(
// // //             widget.chatId, imageFile, widget.onUploadingImage);
// // //       } catch (e) {
// // //         if (mounted) {
// // //           ScaffoldMessenger.of(context).showSnackBar(
// // //             SnackBar(content: Text('Failed to upload image: $e')),
// // //           );
// // //         }
// // //       }
// // //     }
// // //   }

// // //   void _showAttachmentSheet() {
// // //     if (!mounted) return;
// // //     showModalBottomSheet(
// // //       context: context,
// // //       shape: const RoundedRectangleBorder(
// // //         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
// // //       ),
// // //       builder: (context) => Container(
// // //         padding: const EdgeInsets.all(16),
// // //         child: Column(
// // //           mainAxisSize: MainAxisSize.min,
// // //           children: [
// // //             const Text(
// // //               'Choose an option',
// // //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // //             ),
// // //             const SizedBox(height: 16),
// // //             ListTile(
// // //               leading: const Icon(Icons.photo, color: AppColors.primaryColor),
// // //               title: const Text('Gallery'),
// // //               onTap: () {
// // //                 Navigator.pop(context);
// // //                 _pickImage(ImageSource.gallery);
// // //               },
// // //             ),
// // //             ListTile(
// // //               leading:
// // //                   const Icon(Icons.description, color: AppColors.primaryColor),
// // //               title: const Text('Document'),
// // //               onTap: () {
// // //                 Navigator.pop(context);
// // //                 if (mounted) {
// // //                   ScaffoldMessenger.of(context).showSnackBar(
// // //                     const SnackBar(
// // //                         content: Text('Document selection coming soon!')),
// // //                   );
// // //                 }
// // //               },
// // //             ),
// // //             ListTile(
// // //               leading: const Icon(Icons.insert_drive_file,
// // //                   color: AppColors.primaryColor),
// // //               title: const Text('File'),
// // //               onTap: () {
// // //                 Navigator.pop(context);
// // //                 if (mounted) {
// // //                   ScaffoldMessenger.of(context).showSnackBar(
// // //                     const SnackBar(
// // //                         content: Text('File selection coming soon!')),
// // //                   );
// // //                 }
// // //               },
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return ValueListenableBuilder(
// // //       valueListenable: widget.messageController,
// // //       builder: (context, TextEditingValue value, child) {
// // //         final isArabicText = _isArabic(value.text);
// // //         final textDirection =
// // //             isArabicText ? TextDirection.rtl : TextDirection.ltr;

// // //         return Container(
// // //           decoration: BoxDecoration(
// // //             color: Colors.grey[200],
// // //             borderRadius: BorderRadius.circular(30),
// // //           ),
// // //           child: TextField(
// // //             cursorColor: AppColors.primaryColor,
// // //             controller: widget.messageController,
// // //             style: const TextStyle(color: Colors.black),
// // //             textDirection: textDirection,
// // //             textAlign: isArabicText ? TextAlign.right : TextAlign.left,
// // //             decoration: InputDecoration(
// // //               hintText: 'Type a message...',
// // //               hintStyle: const TextStyle(color: Colors.grey),
// // //               filled: true,
// // //               fillColor: Colors.grey[200],
// // //               border: OutlineInputBorder(
// // //                 borderRadius: BorderRadius.circular(30),
// // //                 borderSide: BorderSide.none,
// // //               ),
// // //               suffixIcon: Row(
// // //                 mainAxisSize: MainAxisSize.min,
// // //                 children: [
// // //                   IconButton(
// // //                     icon: const Icon(Icons.attach_file, color: Colors.grey),
// // //                     onPressed: _showAttachmentSheet,
// // //                   ),
// // //                   IconButton(
// // //                     icon: const Icon(Icons.camera_alt, color: Colors.grey),
// // //                     onPressed: () {
// // //                       _pickImage(ImageSource.camera);
// // //                     },
// // //                   ),
// // //                 ],
// // //               ),
// // //               contentPadding:
// // //                   const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
// // //             ),
// // //           ),
// // //         );
// // //       },
// // //     );
// // //   }
// // // }

// import 'package:attendance_app/core/utils/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'package:provider/provider.dart';
// import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';

// class ChatTextField extends StatefulWidget {
//   const ChatTextField({
//     super.key,
//     required this.messageController,
//     required this.chatId,
//     required this.onUploadingImage,
//   });

//   final TextEditingController messageController;
//   final String chatId;
//   final Function(bool) onUploadingImage;

//   @override
//   _ChatTextFieldState createState() => _ChatTextFieldState();
// }

// class _ChatTextFieldState extends State<ChatTextField> {
//   bool _isArabic(String text) {
//     if (text.isEmpty) return false;
//     return RegExp(r'[\u0600-\u06FF]').hasMatch(text);
//   }

//   Future<void> _pickImage(ImageSource source) async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: source);
//     if (pickedFile != null && mounted) {
//       File imageFile = File(pickedFile.path);
//       try {
//         widget.onUploadingImage(true);
//         final viewModel = Provider.of<ChatViewModel>(context, listen: false);
//         await viewModel.sendImage(
//             widget.chatId, imageFile, widget.onUploadingImage);
//       } catch (e) {
//         if (mounted) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Failed to upload image: $e')),
//           );
//         }
//       }
//     }
//   }

//   void _showAttachmentSheet() {
//     if (!mounted) return;
//     showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (context) => Container(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Text(
//               'Choose an option',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             ListTile(
//               leading: const Icon(Icons.photo, color: AppColors.primaryColor),
//               title: const Text('Gallery'),
//               onTap: () {
//                 Navigator.pop(context);
//                 _pickImage(ImageSource.gallery);
//               },
//             ),
//             ListTile(
//               leading:
//                   const Icon(Icons.description, color: AppColors.primaryColor),
//               title: const Text('Document'),
//               onTap: () {
//                 Navigator.pop(context);
//                 if (mounted) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                         content: Text('Document selection coming soon!')),
//                   );
//                 }
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.insert_drive_file,
//                   color: AppColors.primaryColor),
//               title: const Text('File'),
//               onTap: () {
//                 Navigator.pop(context);
//                 if (mounted) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                         content: Text('File selection coming soon!')),
//                   );
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: widget.messageController,
//       builder: (context, TextEditingValue value, child) {
//         final isArabicText = _isArabic(value.text);
//         final textDirection =
//             isArabicText ? TextDirection.rtl : TextDirection.ltr;

//         return Container(
//           decoration: BoxDecoration(
//             color: Colors.grey[200],
//             borderRadius: BorderRadius.circular(30),
//           ),
//           child: TextField(
//             cursorColor: AppColors.primaryColor,
//             controller: widget.messageController,
//             style: const TextStyle(color: Colors.black),
//             textDirection: textDirection,
//             textAlign: isArabicText ? TextAlign.right : TextAlign.left,
//             decoration: InputDecoration(
//               hintText: 'Type a message...',
//               hintStyle: const TextStyle(color: Colors.grey),
//               filled: true,
//               fillColor: Colors.grey[200],
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30),
//                 borderSide: BorderSide.none,
//               ),
//               suffixIcon: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.attach_file, color: Colors.grey),
//                     onPressed: _showAttachmentSheet,
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.camera_alt, color: Colors.grey),
//                     onPressed: () {
//                       _pickImage(ImageSource.camera);
//                     },
//                   ),
//                 ],
//               ),
//               contentPadding:
//                   const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';

class ChatTextField extends StatefulWidget {
  const ChatTextField({
    super.key,
    required this.messageController,
    required this.chatId,
    required this.onUploadingImage,
  });

  final TextEditingController messageController;
  final String chatId;
  final Function(bool) onUploadingImage;

  @override
  _ChatTextFieldState createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  bool _isArabic(String text) {
    if (text.isEmpty) return false;
    return RegExp(r'[\u0600-\u06FF]').hasMatch(text);
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null && mounted) {
      File imageFile = File(pickedFile.path);
      try {
        widget.onUploadingImage(true);
        final viewModel = Provider.of<ChatViewModel>(context, listen: false);
        await viewModel.sendImage(
            widget.chatId, imageFile, widget.onUploadingImage);
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to upload image: $e')),
          );
        }
      }
    }
  }

  void _showAttachmentSheet() {
    if (!mounted) return;
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Choose an option',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.photo, color: AppColors.primaryColor),
              title: const Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading:
                  const Icon(Icons.description, color: AppColors.primaryColor),
              title: const Text('Document'),
              onTap: () {
                Navigator.pop(context);
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Document selection coming soon!')),
                  );
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.insert_drive_file,
                  color: AppColors.primaryColor),
              title: const Text('File'),
              onTap: () {
                Navigator.pop(context);
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('File selection coming soon!')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.messageController,
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
            controller: widget.messageController,
            style: const TextStyle(color: Colors.black),
            textDirection: textDirection,
            textAlign: isArabicText ? TextAlign.right : TextAlign.left,
            decoration: InputDecoration(
              hintText: 'Type a message...',
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
                    icon: const Icon(Icons.attach_file, color: Colors.grey),
                    onPressed: _showAttachmentSheet,
                  ),
                  IconButton(
                    icon: const Icon(Icons.camera_alt, color: Colors.grey),
                    onPressed: () {
                      _pickImage(ImageSource.camera);
                    },
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
