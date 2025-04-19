import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/chats/data/models/chat_model.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  final ChatModel chat;
  final VoidCallback onTap;

  const ChatItem({
    super.key,
    required this.chat,
    required this.onTap,
  });

  // String _formatTo12Hour(String time) {
  //   final timeParts = time.split(':');
  //   if (timeParts.length >= 2) {
  //     try {
  //       String cleanedTime = time.split(' ')[0];
  //       final cleanedParts = cleanedTime.split(':');
  //       int hour = int.parse(cleanedParts[0]);
  //       final minute = cleanedParts[1].padLeft(2, '0');
  //       final period = hour >= 12 ? 'PM' : 'AM';
  //       hour = hour > 12 ? hour - 12 : hour;
  //       hour = hour == 0 ? 12 : hour;
  //       return '${hour.toString().padLeft(2, '0')}:$minute $period';
  //     } catch (e) {
  //       return time;
  //     }
  //   }
  //   try {
  //     final dateTime = DateTime.parse(time);
  //     final hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
  //     final minute = dateTime.minute.toString().padLeft(2, '0');
  //     final period = dateTime.hour >= 12 ? 'PM' : 'AM';
  //     return '${hour.toString().padLeft(2, '0')}:$minute $period';
  //   } catch (e) {
  //     return time;
  //   }
  // }

  String _formatTo12Hour(String time) {
    if (time.isEmpty) return '';

    // إذا كان الوقت بالفعل بتنسيق 12 ساعة (مثل 01:05 AM)، نعيده كما هو
    if (RegExp(r'^\d{2}:\d{2}\s(?:AM|PM)$').hasMatch(time)) {
      return time;
    }

    // إذا كان الوقت بتنسيق ISO 8601 (للتوافق مع البيانات القديمة)
    try {
      final dateTime = DateTime.parse(time);
      final hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
      final minute = dateTime.minute.toString().padLeft(2, '0');
      final period = dateTime.hour >= 12 ? 'PM' : 'AM';
      return '${hour.toString().padLeft(2, '0')}:$minute $period';
    } catch (e) {
      print('Error formatting time in ChatItem: $time, error: $e');
      return time;
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Last message for chat ${chat.name}: ${chat.message}');
    final isLastMessageImage = chat.message == 'Photo';

    return ListTile(
      onTap: onTap,
      leading: chat.avatar.isNotEmpty && chat.avatar.startsWith('http')
          ? CircleAvatar(
              backgroundImage: NetworkImage(chat.avatar),
              radius: 25,
              onBackgroundImageError: (error, stackTrace) {
                print('Error loading avatar in ChatItem: $error');
              },
            )
          : const CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
      title: Text(
        chat.name,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      subtitle: Row(
        children: [
          const Icon(
            Icons.done_all,
            size: 16,
            color: Colors.blue,
          ),
          const SizedBox(width: 5),
          if (isLastMessageImage) ...[
            const Icon(
              Icons.image,
              size: 16,
              color: Colors.grey,
            ),
            const SizedBox(width: 5),
            const Text(
              'Image',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(color: Colors.grey),
            ),
          ] else ...[
            Expanded(
              // لف النص بـ Expanded عشان ياخد المساحة المتاحة
              child: Text(
                chat.message,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            chat.time.isNotEmpty ? _formatTo12Hour(chat.time) : '',
            style: const TextStyle(color: Colors.grey),
          ),
          if (chat.unreadCount > 0)
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: Text(
                chat.unreadCount.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
