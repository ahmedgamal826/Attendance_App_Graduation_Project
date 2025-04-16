import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  _UserProfileViewState createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userEmailController = TextEditingController();
  String? _avatarUrl = 'https://via.placeholder.com/150';

  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      _userNameController.text = user.displayName ?? '';
      _userEmailController.text = user.email ?? '';
      _avatarUrl = user.photoURL ?? _avatarUrl;
    }
  }

  void _addChatWithUser() {
    if (_userEmailController.text.trim().isNotEmpty) {
      final repo = ChatRepository();
      repo.addChatWithUser(_userEmailController.text.trim(),
          _userNameController.text.trim(), _avatarUrl ?? '');
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(_avatarUrl!),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _userNameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _userEmailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addChatWithUser,
              child: const Text('Add Chat with User'),
            ),
          ],
        ),
      ),
    );
  }
}
