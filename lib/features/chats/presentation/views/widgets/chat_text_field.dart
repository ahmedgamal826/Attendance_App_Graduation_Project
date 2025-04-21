import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
import 'package:file_picker/file_picker.dart'; // إضافة مكتبة file_picker

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

  // دالة جديدة لاختيار مستند
  Future<void> _pickDocument() async {
    try {
      // استخدام file_picker لاختيار ملف
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: [
          'pdf',
          'doc',
          'docx'
        ], // تحديد أنواع الملفات المسموح بيها
      );

      if (result != null && mounted) {
        File documentFile = File(result.files.single.path!);
        try {
          widget.onUploadingImage(true); // إعادة استخدام نفس الـ callback للصور
          final viewModel = Provider.of<ChatViewModel>(context, listen: false);
          await viewModel.sendDocument(
              widget.chatId, documentFile, widget.onUploadingImage);
        } catch (e) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Failed to upload document: $e')),
            );
          }
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error picking document: $e')),
        );
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
                _pickDocument(); // استدعاء دالة اختيار المستند
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
