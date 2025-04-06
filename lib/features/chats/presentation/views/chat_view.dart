import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/chats/data/models/chat_model.dart';
import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
import 'package:flutter/material.dart';

class ChatView extends StatefulWidget {
  final ChatModel chat;

  const ChatView({super.key, required this.chat});

  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, dynamic>> _messages = [
    {"text": "Hey, how are you?", "isMe": true, "time": "3:00 PM"},
    {"text": "Good, how about you?", "isMe": false, "time": "3:01 PM"},
    {"text": "I’m good too!", "isMe": true, "time": "3:02 PM"},
    {
      "text": "Hey, what’s your plan for today?",
      "isMe": true,
      "time": "3:03 PM"
    },
    {"text": "Not much, just chilling. You?", "isMe": false, "time": "3:04 PM"},
    {
      "text": "I’m thinking of going out later.",
      "isMe": false,
      "time": "3:05 PM"
    },
    {
      "text": "Hey, what’s your plan for today?",
      "isMe": true,
      "time": "3:03 PM"
    },
  ];

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    setState(() {
      _messages.add({
        'text': _messageController.text.trim(),
        'isMe': true,
        'time': DateTime.now().toString().substring(11, 16),
      });
      _messageController.clear();
    });

    // 👇 التمرير لآخر رسالة بعد إرسالها
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          0.0, // لأنك عامل reverse: true
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // الخلفية بيضاء
      appBar: AppBar(
        backgroundColor: const Color(0xFF1565C0), // لون الـ AppBar أزرق غامق
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.chat.avatar),
              radius: 20,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                widget.chat.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // لون الاسم أبيض
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.call, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              reverse: true, // الرسائل تبدأ من الأسفل
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message =
                    _messages[_messages.length - 1 - index]; // عكس الترتيب
                final isMe = message['isMe'] as bool;
                return ChatsBubble(isMe: isMe, message: message);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.mic,
                      color: Colors.white,
                      size: 24,
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 5),
                ChatTextField(
                  messageController: _messageController,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: Color(0xFF1565C0),
                  ),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
