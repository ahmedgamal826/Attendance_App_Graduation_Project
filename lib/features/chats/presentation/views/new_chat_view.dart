import 'dart:io';
import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
import 'package:attendance_app/features/chats/presentation/views/widgets/create_chat_button.dart';
import 'package:attendance_app/features/chats/presentation/views/widgets/custom_camera_button.dart';
import 'package:attendance_app/features/chats/presentation/views/widgets/custom_circle_avatar.dart';
import 'package:attendance_app/features/chats/presentation/views/widgets/new_chat_text_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class NewChatView extends StatefulWidget {
  const NewChatView({super.key});

  @override
  _NewChatViewState createState() => _NewChatViewState();
}

class _NewChatViewState extends State<NewChatView> {
  File? _selectedImage; // To store the selected image
  final _formKey = GlobalKey<FormState>(); // For form validation
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatViewModel(ChatRepository()),
      child: Consumer<ChatViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            resizeToAvoidBottomInset: true, // يضبط الشاشة لما الكيبورد يظهر
            backgroundColor: Colors.white, // خلفية بيضاء
            appBar: AppBar(
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              backgroundColor: AppColors.primaryColor,
              elevation: 0,
              title: const Text(
                'New Chat',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(), // سكرول مرن
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // CircleAvatar with camera icon
                      Center(
                        child: Stack(
                          children: [
                            CustomCircleAvatar(selectedImage: _selectedImage),
                            CustomCameraButton(
                              onTap: _pickImage,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      // Name field
                      NewChatTextField(
                        controller: nameController,
                        hintText: 'Name',
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Name is required';
                          }
                          return null;
                        },
                        suffixIcon: Icons.person,
                        onSuffixIconPressed: () {
                          // Logic to open contacts (not implemented for now)
                        },
                      ),
                      const SizedBox(height: 30),
                      // Email field
                      NewChatTextField(
                        controller: emailController,
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Email is required';
                          }
                          return null;
                        },
                        suffixIcon: Icons.email,
                        onSuffixIconPressed: () {
                          // Logic for email action (not implemented for now)
                        },
                      ),
                      const SizedBox(height: 16),
                      // Display error message from ViewModel (if any)
                      if (viewModel.errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            viewModel.errorMessage!,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      const SizedBox(height: 20),
                      CreateChatButton(
                        viewModel: viewModel,
                        formKey: _formKey,
                        nameController: nameController,
                        selectedImage: _selectedImage,
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
