// import 'package:attendance_app/core/utils/app_colors.dart';
// import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// import 'package:flutter/material.dart';

// class ChatItem extends StatelessWidget {
//   final ChatModel chat;
//   final VoidCallback onTap;

//   const ChatItem({
//     super.key,
//     required this.chat,
//     required this.onTap,
//   });

//   // String _formatTo12Hour(String time) {
//   //   final timeParts = time.split(':');
//   //   if (timeParts.length >= 2) {
//   //     try {
//   //       String cleanedTime = time.split(' ')[0];
//   //       final cleanedParts = cleanedTime.split(':');
//   //       int hour = int.parse(cleanedParts[0]);
//   //       final minute = cleanedParts[1].padLeft(2, '0');
//   //       final period = hour >= 12 ? 'PM' : 'AM';
//   //       hour = hour > 12 ? hour - 12 : hour;
//   //       hour = hour == 0 ? 12 : hour;
//   //       return '${hour.toString().padLeft(2, '0')}:$minute $period';
//   //     } catch (e) {
//   //       return time;
//   //     }
//   //   }
//   //   try {
//   //     final dateTime = DateTime.parse(time);
//   //     final hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
//   //     final minute = dateTime.minute.toString().padLeft(2, '0');
//   //     final period = dateTime.hour >= 12 ? 'PM' : 'AM';
//   //     return '${hour.toString().padLeft(2, '0')}:$minute $period';
//   //   } catch (e) {
//   //     return time;
//   //   }
//   // }

//   String _formatTo12Hour(String time) {
//     if (time.isEmpty) return '';

//     // إذا كان الوقت بالفعل بتنسيق 12 ساعة (مثل 01:05 AM)، نعيده كما هو
//     if (RegExp(r'^\d{2}:\d{2}\s(?:AM|PM)$').hasMatch(time)) {
//       return time;
//     }

//     // إذا كان الوقت بتنسيق ISO 8601 (للتوافق مع البيانات القديمة)
//     try {
//       final dateTime = DateTime.parse(time);
//       final hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
//       final minute = dateTime.minute.toString().padLeft(2, '0');
//       final period = dateTime.hour >= 12 ? 'PM' : 'AM';
//       return '${hour.toString().padLeft(2, '0')}:$minute $period';
//     } catch (e) {
//       print('Error formatting time in ChatItem: $time, error: $e');
//       return time;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('Last message for chat ${chat.name}: ${chat.messages}');
//     final isLastMessageImage = chat.messages == 'Photo';

//     return ListTile(
//       onTap: onTap,
//       leading: chat.avatar.isNotEmpty && chat.avatar.startsWith('http')
//           ? CircleAvatar(
//               backgroundImage: NetworkImage(chat.avatar),
//               radius: 25,
//               onBackgroundImageError: (error, stackTrace) {
//                 print('Error loading avatar in ChatItem: $error');
//               },
//             )
//           : const CircleAvatar(
//               backgroundColor: AppColors.primaryColor,
//               child: Icon(
//                 Icons.person,
//                 color: Colors.white,
//               ),
//             ),
//       title: Text(
//         chat.name,
//         overflow: TextOverflow.ellipsis,
//         maxLines: 1,
//         style: const TextStyle(
//           fontWeight: FontWeight.bold,
//           color: Colors.black,
//         ),
//       ),
//       subtitle: Row(
//         children: [
//           const Icon(
//             Icons.done_all,
//             size: 16,
//             color: Colors.blue,
//           ),
//           const SizedBox(width: 5),
//           if (isLastMessageImage) ...[
//             const Icon(
//               Icons.image,
//               size: 16,
//               color: Colors.grey,
//             ),
//             const SizedBox(width: 5),
//             const Text(
//               'Image',
//               overflow: TextOverflow.ellipsis,
//               maxLines: 1,
//               style: TextStyle(color: Colors.grey),
//             ),
//           ] else ...[
//             Expanded(
//               // لف النص بـ Expanded عشان ياخد المساحة المتاحة
//               child: Text(
//                 chat.lastMessage,
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 1,
//                 style: const TextStyle(color: Colors.grey),
//               ),
//             ),
//           ],
//         ],
//       ),
//       trailing: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             chat.time.isNotEmpty ? _formatTo12Hour(chat.time) : '',
//             style: const TextStyle(color: Colors.grey),
//           ),
//           if (chat.unreadCount > 0)
//             Container(
//               padding: const EdgeInsets.all(6),
//               decoration: const BoxDecoration(
//                 color: Colors.green,
//                 shape: BoxShape.circle,
//               ),
//               child: Text(
//                 chat.unreadCount.toString(),
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 12,
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:attendance_app/core/utils/app_colors.dart';
// import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// import 'package:flutter/material.dart';

// class ChatItem extends StatelessWidget {
//   final ChatModel chat;
//   final VoidCallback onTap;

//   const ChatItem({
//     super.key,
//     required this.chat,
//     required this.onTap,
//   });

//   String _formatTo12Hour(DateTime? timestamp) {
//     if (timestamp == null) return '';

//     try {
//       final hour = timestamp.hour % 12 == 0 ? 12 : timestamp.hour % 12;
//       final minute = timestamp.minute.toString().padLeft(2, '0');
//       final period = timestamp.hour >= 12 ? 'PM' : 'AM';
//       return '${hour.toString().padLeft(2, '0')}:$minute $period';
//     } catch (e) {
//       print('Error formatting timestamp in ChatItem: $timestamp, error: $e');
//       return '';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('Last message for chat ${chat.name}: ${chat.lastMessage}');
//     final isLastMessageImage = chat.lastMessage == 'Photo';

//     return ListTile(
//       onTap: onTap,
//       leading: chat.avatar.isNotEmpty && chat.avatar.startsWith('http')
//           ? CircleAvatar(
//               backgroundImage: NetworkImage(chat.avatar),
//               radius: 25,
//               onBackgroundImageError: (error, stackTrace) {
//                 print('Error loading avatar in ChatItem: $error');
//               },
//             )
//           : const CircleAvatar(
//               backgroundColor: AppColors.primaryColor,
//               child: Icon(
//                 Icons.person,
//                 color: Colors.white,
//               ),
//             ),
//       title: Text(
//         chat.name,
//         overflow: TextOverflow.ellipsis,
//         maxLines: 1,
//         style: const TextStyle(
//           fontWeight: FontWeight.bold,
//           color: Colors.black,
//         ),
//       ),
//       subtitle: Row(
//         children: [
//           if (chat.hasCheckmark)
//             const Icon(
//               Icons.done_all,
//               size: 16,
//               color: Colors.blue,
//             ),
//           if (chat.hasCheckmark) const SizedBox(width: 5),
//           if (isLastMessageImage) ...[
//             const Icon(
//               Icons.image,
//               size: 16,
//               color: Colors.grey,
//             ),
//             const SizedBox(width: 5),
//             const Text(
//               'Image',
//               overflow: TextOverflow.ellipsis,
//               maxLines: 1,
//               style: TextStyle(color: Colors.grey),
//             ),
//           ] else ...[
//             Expanded(
//               child: Text(
//                 chat.lastMessage,
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 1,
//                 style: const TextStyle(color: Colors.grey),
//               ),
//             ),
//           ],
//         ],
//       ),
//       trailing: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             _formatTo12Hour(chat.timestamp),
//             style: const TextStyle(color: Colors.grey),
//           ),
//           if (chat.unreadCount > 0)
//             Container(
//               padding: const EdgeInsets.all(6),
//               decoration: const BoxDecoration(
//                 color: Colors.green,
//                 shape: BoxShape.circle,
//               ),
//               child: Text(
//                 chat.unreadCount.toString(),
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 12,
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/chats/data/models/chat_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  final ChatModel chat;
  final VoidCallback onTap;

  const ChatItem({
    super.key,
    required this.chat,
    required this.onTap,
  });

  // تنسيق الوقت بشكل مشابه للواتساب (مثلاً: 10:30 AM)
  String _formatTo12Hour(DateTime? timestamp) {
    if (timestamp == null) return '';

    try {
      final hour = timestamp.hour % 12 == 0 ? 12 : timestamp.hour % 12;
      final minute = timestamp.minute.toString().padLeft(2, '0');
      final period = timestamp.hour >= 12 ? 'PM' : 'AM';
      return '${hour.toString().padLeft(2, '0')}:$minute $period';
    } catch (e) {
      print('Error formatting timestamp in ChatItem: $timestamp, error: $e');
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Last message for chat ${chat.name}: ${chat.lastMessage}');
    final isLastMessageImage = chat.lastMessage == 'Photo';

    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: AppColors.primaryColor,
        child: chat.avatar.isNotEmpty && chat.avatar.startsWith('http')
            ? ClipOval(
                child: CachedNetworkImage(
                  imageUrl: chat.avatar,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(
                    color: Colors.white,
                  ),
                  errorWidget: (context, url, error) {
                    print('Error loading avatar in ChatItem: $error');
                    return const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 30,
                    );
                  },
                ),
              )
            : const Icon(
                Icons.person,
                color: Colors.white,
                size: 30,
              ),
      ),
      title: Text(
        chat.name,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      subtitle: Row(
        children: [
          if (chat.hasCheckmark)
            const Icon(
              Icons.done_all,
              size: 16,
              color: Colors.blue,
            ),
          if (chat.hasCheckmark) const SizedBox(width: 5),
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
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ] else ...[
            Expanded(
              child: Text(
                chat.lastMessage,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
          ],
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            _formatTo12Hour(chat.timestamp),
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
          if (chat.unreadCount > 0) const SizedBox(height: 4),
          if (chat.unreadCount > 0)
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: AppColors.primaryColor, // غيرنا اللون ليتناسب مع التصميم
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