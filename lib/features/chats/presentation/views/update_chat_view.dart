import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/chats/data/models/chat_model.dart';
import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // أضفنا المكتبة دي

class UpdateChatView extends StatefulWidget {
  final ChatModel chat;

  const UpdateChatView({super.key, required this.chat});

  @override
  _UpdateChatViewState createState() => _UpdateChatViewState();
}

class _UpdateChatViewState extends State<UpdateChatView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController(); // أضفنا controller للإيميل
  String? _otherUserEmail;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.chat.name;
    _emailController.text = 'Fetching email...'; // قيمة افتراضية
    _fetchOtherUserEmail();
  }

  Future<void> _fetchOtherUserEmail() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      setState(() {
        _otherUserEmail = 'No current user';
        _emailController.text = _otherUserEmail!;
      });
      print('خطأ: لا يوجد مستخدم مسجل دخول');
      return;
    }

    print('معرف المستخدم الحالي: ${currentUser.uid}');
    print('المشاركون في المحادثة: ${widget.chat.participants}');

    // جلب معرف المستخدم الآخر
    final otherUserId = widget.chat.participants
        .firstWhere((id) => id != currentUser.uid, orElse: () => '');

    print('معرف المستخدم الآخر: $otherUserId');

    if (otherUserId.isNotEmpty) {
      try {
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(otherUserId)
            .get();

        print('بيانات المستخدم الآخر: ${userDoc.data()}');

        if (userDoc.exists) {
          setState(() {
            _otherUserEmail = userDoc['email'] ?? 'No email available';
            _emailController.text = _otherUserEmail!; // تحديث الـ controller
          });
          print('الإيميل بتاع المستخدم الآخر: $_otherUserEmail');
        } else {
          setState(() {
            _otherUserEmail = 'User not found';
            _emailController.text = _otherUserEmail!;
          });
          print('المستخدم الآخر غير موجود في users collection');
        }
      } catch (e) {
        setState(() {
          _otherUserEmail = 'Error fetching email';
          _emailController.text = _otherUserEmail!;
        });
        print('خطأ في جلب الإيميل: $e');
      }
    } else {
      setState(() {
        _otherUserEmail = 'No other user found';
        _emailController.text = _otherUserEmail!;
      });
      print('لم يتم العثور على مستخدم آخر في المحادثة');
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose(); // التخلص من الـ controller
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
                      controller: _emailController, // استخدام الـ controller
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: AppColors.primaryColor),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.primaryColor, width: 2),
                        ),
                        prefixIcon:
                            Icon(Icons.email, color: AppColors.primaryColor),
                      ),
                      style: const TextStyle(color: Colors.grey),
                      enabled: false,
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
