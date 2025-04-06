import 'package:flutter/material.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({
    super.key,
    required TextEditingController messageController,
  }) : _messageController = messageController;

  final TextEditingController _messageController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: _messageController,
        style: const TextStyle(color: Colors.black),
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
        ),
      ),
    );
  }
}
