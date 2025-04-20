import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/chats/data/models/chat_model.dart';
import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateChatView extends StatefulWidget {
  final ChatModel chat;

  const UpdateChatView({super.key, required this.chat});

  @override
  _UpdateChatViewState createState() => _UpdateChatViewState();
}

class _UpdateChatViewState extends State<UpdateChatView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.chat.name; // تعبئة الاسم الحالي
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatViewModel(ChatRepository()),
      child: Consumer<ChatViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.primaryColor,
              title: const Text(
                'Update Chat',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              elevation: 0,
              actions: [
                IconButton(
                  icon: const Icon(Icons.check, color: Colors.white),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await viewModel.updateChatName(
                        widget.chat.id,
                        _nameController.text.trim(),
                      );
                      Navigator.pop(context);
                      if (viewModel.errorMessage == null) {
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(viewModel.errorMessage!)),
                        );
                      }
                    }
                  },
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColors.primaryColor,
                      child: widget.chat.avatar.isNotEmpty &&
                              widget.chat.avatar.startsWith('http')
                          ? ClipOval(
                              child: Image.network(
                                widget.chat.avatar,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  print(
                                      'Error loading avatar in UpdateChatView: $error');
                                  return const Icon(
                                    Icons.person,
                                    size: 50,
                                    color: Colors.white,
                                  );
                                },
                              ),
                            )
                          : const Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.white,
                            ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      cursorColor: AppColors.primaryColor,
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(
                          color: AppColors.primaryColor,
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.primaryColor,
                            width: 2,
                          ),
                        ),
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      initialValue: widget.chat.email,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                      ),
                      enabled: false, // تعطيل تعديل الإيميل
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}