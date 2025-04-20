// // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // import 'package:attendance_app/features/chats/presentation/views/widgets/chat_item.dart';
// // // import 'package:awesome_dialog/awesome_dialog.dart';
// // // import 'package:flutter/material.dart';

// // // class LongPressChatItem extends StatefulWidget {
// // //   final ChatModel chat;
// // //   final VoidCallback onTap;
// // //   final VoidCallback onDelete;

// // //   const LongPressChatItem({
// // //     super.key,
// // //     required this.chat,
// // //     required this.onTap,
// // //     required this.onDelete,
// // //   });

// // //   @override
// // //   _LongPressChatItemState createState() => _LongPressChatItemState();
// // // }

// // // class _LongPressChatItemState extends State<LongPressChatItem> {
// // //   bool _isHighlighted = false; // متغير لتتبع حالة التظليل

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return GestureDetector(
// // //       onTap: widget.onTap,
// // //       onLongPress: () {
// // //         setState(() {
// // //           _isHighlighted = true; // تفعيل التظليل عند الضغط المطول
// // //         });

// // //         // عرض AwesomeDialog
// // //         AwesomeDialog(
// // //           context: context,
// // //           dialogType: DialogType.warning,
// // //           animType: AnimType.bottomSlide,
// // //           title: 'Delete Chat',
// // //           desc: 'Are you sure you want to delete this chat?',
// // //           btnCancelOnPress: () {
// // //             setState(() {
// // //               _isHighlighted = false; // إلغاء التظليل عند الإلغاء
// // //             });
// // //           },
// // //           btnOkOnPress: () {
// // //             widget.onDelete(); // تنفيذ الحذف
// // //             setState(() {
// // //               _isHighlighted = false; // إلغاء التظليل بعد الحذف
// // //             });
// // //           },
// // //           btnOkText: 'Delete',
// // //           btnCancelText: 'Cancel',
// // //           btnOkColor: AppColors.primaryColor,
// // //           btnCancelColor: Colors.grey,
// // //         ).show();
// // //       },
// // //       child: Container(
// // //         color: _isHighlighted
// // //             ? AppColors.primaryColor
// // //             : Colors.transparent, // اللون الطبيعي
// // //         child: ChatItem(
// // //           chat: widget.chat,
// // //           onTap: widget.onTap,
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/chats/data/models/chat_model.dart';
import 'package:attendance_app/features/chats/presentation/views/widgets/chat_item.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class LongPressChatItem extends StatefulWidget {
  final ChatModel chat;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const LongPressChatItem({
    super.key,
    required this.chat,
    required this.onTap,
    required this.onDelete,
  });

  @override
  _LongPressChatItemState createState() => _LongPressChatItemState();
}

class _LongPressChatItemState extends State<LongPressChatItem> {
  bool _isHighlighted = false; // متغير لتتبع حالة التظليل

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onLongPress: () {
        setState(() {
          _isHighlighted = true; // تفعيل التظليل عند الضغط المطول
        });

        // عرض AwesomeDialog
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          animType: AnimType.bottomSlide,
          title: 'Delete Chat',
          desc: 'Are you sure you want to delete this chat?',
          btnCancelOnPress: () {
            setState(() {
              _isHighlighted = false; // إلغاء التظليل عند الإلغاء
            });
          },
          btnOkOnPress: () {
            widget.onDelete(); // تنفيذ الحذف
            setState(() {
              _isHighlighted = false; // إلغاء التظليل بعد الحذف
            });
          },
          btnOkText: 'Delete',
          btnCancelText: 'Cancel',
          btnOkColor: AppColors.primaryColor,
          btnCancelColor: Colors.grey,
        ).show();
      },
      child: Container(
        color: _isHighlighted
            ? AppColors.primaryColor.withOpacity(0.2) // تظليل أخف
            : Colors.transparent, // اللون الطبيعي
        child: ChatItem(
          chat: widget.chat,
          onTap: widget.onTap,
        ),
      ),
    );
  }
}

// import 'package:attendance_app/core/utils/app_colors.dart';
// import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class LongPressChatItem extends StatelessWidget {
//   final ChatModel chat;
//   final VoidCallback onTap;
//   final VoidCallback onDelete;

//   const LongPressChatItem({
//     super.key,
//     required this.chat,
//     required this.onTap,
//     required this.onDelete,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final lastMessage = chat.messages.isNotEmpty ? chat.messages.last : null;
//     final isRead =
//         lastMessage != null ? (lastMessage['isRead'] as bool? ?? false) : false;
//     final isMe = lastMessage != null
//         ? lastMessage['senderId'] == FirebaseAuth.instance.currentUser?.uid
//         : false;

//     return GestureDetector(
//       onTap: onTap,
//       onLongPress: () {
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: const Text('حذف المحادثة'),
//             content: const Text('هل تريد حذف هذه المحادثة؟'),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: const Text('إلغاء'),
//               ),
//               TextButton(
//                 onPressed: () {
//                   onDelete();
//                   Navigator.pop(context);
//                 },
//                 child: const Text('حذف'),
//               ),
//             ],
//           ),
//         );
//       },
//       child: ListTile(
//         leading: CircleAvatar(
//           radius: 25,
//           backgroundColor: AppColors.primaryColor,
//           child: chat.avatar.isNotEmpty && chat.avatar.startsWith('http')
//               ? ClipOval(
//                   child: Image.network(
//                     chat.avatar,
//                     width: 50,
//                     height: 50,
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) {
//                       return const Icon(
//                         Icons.person,
//                         color: Colors.white,
//                         size: 30,
//                       );
//                     },
//                   ),
//                 )
//               : const Icon(
//                   Icons.person,
//                   color: Colors.white,
//                   size: 30,
//                 ),
//         ),
//         title: Text(
//           chat.name,
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 16,
//           ),
//         ),
//         subtitle: Row(
//           children: [
//             Expanded(
//               child: Text(
//                 chat.lastMessage,
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyle(
//                   color: Colors.grey[600],
//                 ),
//               ),
//             ),
//             if (isMe && lastMessage != null) ...[
//               Icon(
//                 Icons.done_all,
//                 size: 16,
//                 color: isRead ? Colors.blue : Colors.grey,
//               ),
//             ],
//           ],
//         ),
//         trailing: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               chat.timestamp != null
//                   ? DateFormat('h:mm a').format(chat.timestamp!)
//                   : '',
//               style: TextStyle(
//                 color: Colors.grey[600],
//                 fontSize: 12,
//               ),
//             ),
//             if (chat.unreadCount > 0)
//               Container(
//                 padding: const EdgeInsets.all(6),
//                 decoration: const BoxDecoration(
//                   color: AppColors.primaryColor,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Text(
//                   chat.unreadCount.toString(),
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 12,
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// // import 'package:attendance_app/core/utils/app_colors.dart';
// // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';
// // import 'package:cached_network_image/cached_network_image.dart';

// // class LongPressChatItem extends StatelessWidget {
// //   final ChatModel chat;
// //   final VoidCallback onTap;
// //   final VoidCallback onDelete;

// //   const LongPressChatItem({
// //     super.key,
// //     required this.chat,
// //     required this.onTap,
// //     required this.onDelete,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     final lastMessage = chat.messages.isNotEmpty ? chat.messages.last : null;
// //     final isRead = lastMessage != null ? (lastMessage['isRead'] as bool? ?? false) : false;
// //     final isMe = lastMessage != null
// //         ? lastMessage['senderId'] == FirebaseAuth.instance.currentUser?.uid
// //         : false;

// //     return GestureDetector(
// //       onTap: onTap,
// //       onLongPress: () {
// //         showDialog(
// //           context: context,
// //           builder: (context) => AlertDialog(
// //             title: const Text('Delete Chat'),
// //             content: const Text('Are you sure you want to delete this chat?'),
// //             actions: [
// //               TextButton(
// //                 onPressed: () => Navigator.pop(context),
// //                 child: const Text('Cancel'),
// //               ),
// //               TextButton(
// //                 onPressed: () {
// //                   onDelete();
// //                   Navigator.pop(context);
// //                 },
// //                 child: const Text('Delete'),
// //               ),
// //             ],
// //           ),
// //         );
// //       },
// //       child: ListTile(
// //         leading: CircleAvatar(
// //           radius: 25,
// //           backgroundColor: AppColors.primaryColor,
// //           child: chat.avatar.isNotEmpty && chat.avatar.startsWith('http')
// //               ? ClipOval(
// //                   child: CachedNetworkImage(
// //                     imageUrl: chat.avatar,
// //                     width: 50,
// //                     height: 50,
// //                     fit: BoxFit.cover,
// //                     memCacheWidth: 100,
// //                     memCacheHeight: 100,
// //                     placeholder: (context, url) => const CircularProgressIndicator(
// //                       color: Colors.white,
// //                     ),
// //                     errorWidget: (context, url, error) => const Icon(
// //                       Icons.person,
// //                       color: Colors.white,
// //                       size: 30,
// //                     ),
// //                   ),
// //                 )
// //               : const Icon(
// //                   Icons.person,
// //                   color: Colors.white,
// //                   size: 30,
// //                 ),
// //         ),
// //         title: Text(
// //           chat.name,
// //           style: const TextStyle(
// //             fontWeight: FontWeight.bold,
// //             fontSize: 16,
// //           ),
// //         ),
// //         subtitle: Row(
// //           children: [
// //             if (isMe && lastMessage != null)
// //               Icon(
// //                 Icons.done_all,
// //                 size: 16,
// //                 color: isRead ? Colors.blue : Colors.grey,
// //               ),
// //             if (isMe && lastMessage != null) const SizedBox(width: 5),
// //             Expanded(
// //               child: Text(
// //                 chat.lastMessage,
// //                 maxLines: 1,
// //                 overflow: TextOverflow.ellipsis,
// //                 style: TextStyle(
// //                   color: Colors.grey[600],
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //         trailing: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Text(
// //               chat.timestamp != null
// //                   ? DateFormat('h:mm a').format(chat.timestamp!)
// //                   : '',
// //               style: TextStyle(
// //                 color: Colors.grey[600],
// //                 fontSize: 12,
// //               ),
// //             ),
// //             if (chat.unreadCount > 0) const SizedBox(height: 4),
// //             if (chat.unreadCount > 0)
// //               Container(
// //                 padding: const EdgeInsets.all(6),
// //                 decoration: const BoxDecoration(
// //                   color: AppColors.primaryColor,
// //                   shape: BoxShape.circle,
// //                 ),
// //                 child: Text(
// //                   chat.unreadCount.toString(),
// //                   style: const TextStyle(
// //                     color: Colors.white,
// //                     fontSize: 12,
// //                   ),
// //                 ),
// //               ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }