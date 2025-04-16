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

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       onTap: onTap,
//       leading: CircleAvatar(
//         backgroundImage: NetworkImage(chat.avatar),
//       ),
//       title: Text(
//         chat.name,
//         overflow: TextOverflow.ellipsis,
//         maxLines: 1,
//         style: const TextStyle(
//           fontWeight: FontWeight.bold,
//           color: Colors.black,
//         ),
//       ),
//       subtitle: Text(
//         chat.message,
//         style: const TextStyle(color: Colors.grey),
//       ),
//       trailing: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             chat.time,
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
//                 style: const TextStyle(color: Colors.white, fontSize: 12),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// import 'package:flutter/material.dart';
// import 'dart:io';

// class ChatItem extends StatelessWidget {
//   final ChatModel chat;
//   final VoidCallback onTap;

//   const ChatItem({
//     super.key,
//     required this.chat,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       onTap: onTap,
//       leading:
//           (chat.avatar.startsWith('file://') || File(chat.avatar).existsSync())
//               ? CircleAvatar(
//                   backgroundImage: FileImage(File(chat.avatar)),
//                   radius: 20,
//                 )
//               : (chat.avatar.isNotEmpty && chat.avatar.startsWith('http'))
//                   ? CircleAvatar(
//                       backgroundImage: NetworkImage(chat.avatar),
//                       radius: 20,
//                     )
//                   : const CircleAvatar(
//                       backgroundImage:
//                           const NetworkImage('https://via.placeholder.com/150'),
//                       radius: 20,
//                     ),
//       title: Text(
//         chat.name,
//         overflow: TextOverflow.ellipsis,
//         maxLines: 1,
//         style: const TextStyle(
//           fontWeight: FontWeight.bold,
//           color: Colors.black,
//         ),
//       ),
//       subtitle: Text(
//         chat.message,
//         overflow: TextOverflow.ellipsis,
//         maxLines: 1,
//         style: const TextStyle(color: Colors.grey),
//       ),
//       trailing: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             chat.time,
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

import 'package:attendance_app/features/chats/data/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class ChatItem extends StatelessWidget {
  final ChatModel chat;
  final VoidCallback onTap;

  const ChatItem({
    super.key,
    required this.chat,
    required this.onTap,
  });

  String _formatTo12Hour(String time) {
    // تحويل الوقت من تنسيق 24 ساعة أو timestamp إلى 12 ساعة
    final timeParts = time.split(':');
    if (timeParts.length >= 2) {
      int hour = int.parse(timeParts[0]);
      final minute = timeParts[1].padLeft(2, '0');
      final period = hour >= 12 ? 'PM' : 'AM';
      hour = hour > 12 ? hour - 12 : hour;
      hour = hour == 0 ? 12 : hour; // تحويل 0 إلى 12
      return '$hour:$minute $period';
    }
    // لو الوقت بتنسيق timestamp (مثل ISO 8601)
    try {
      final dateTime = DateTime.parse(time);
      final hour = dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour;
      final period = dateTime.hour >= 12 ? 'PM' : 'AM';
      final minute = dateTime.minute.toString().padLeft(2, '0');
      return '$hour:$minute $period';
    } catch (e) {
      return time; // إرجاع الوقت الأصلي لو فيه خطأ
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading:
          (chat.avatar.startsWith('file://') || File(chat.avatar).existsSync())
              ? CircleAvatar(
                  backgroundImage: FileImage(File(chat.avatar)),
                  radius: 25,
                )
              : (chat.avatar.isNotEmpty && chat.avatar.startsWith('http'))
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(chat.avatar),
                      radius: 30,
                    )
                  : const CircleAvatar(
                      backgroundImage:
                          NetworkImage('https://via.placeholder.com/150'),
                      radius: 30,
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
      subtitle: Text(
        chat.message,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: const TextStyle(color: Colors.grey),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _formatTo12Hour(chat.time), // الوقت بتنسيق 12 ساعة
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
