import 'package:flutter/material.dart';

class ChatsBubble extends StatelessWidget {
  const ChatsBubble({
    super.key,
    required this.isMe,
    required this.message,
  });

  final bool isMe;
  final Map<String, dynamic> message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isMe
                    ? const Color(0xFF1565C0) // الرسائل منك: أزرق غامق
                    : Colors.grey[500], // الرسائل من الطرف التاني: رمادي فاتح
                borderRadius: BorderRadius.circular(15),
              ),
              child: SelectableText(
                message['text'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              if (isMe) // إضافة الـ ticks للرسائل اللي منك بس
                const Icon(
                  Icons.done_all,
                  size: 16,
                  color: Colors.blue,
                ),
              if (isMe) const SizedBox(width: 5),
              Text(
                message['time'],
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
