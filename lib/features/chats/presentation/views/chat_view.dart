// // import 'package:attendance_app/core/utils/app_colors.dart';
// // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // import 'package:attendance_app/features/chats/presentation/views/update_chat_view.dart';
// // import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
// // import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
// // import 'package:attendance_app/features/chats/presentation/views/widgets/show_image.dart';
// // import 'package:awesome_dialog/awesome_dialog.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/scheduler.dart';
// // import 'package:provider/provider.dart';

// // class ChatView extends StatefulWidget {
// //   final ChatModel chat;

// //   const ChatView({super.key, required this.chat});

// //   @override
// //   _ChatViewState createState() => _ChatViewState();
// // }

// // class _ChatViewState extends State<ChatView> {
// //   bool _isUploadingImage = false;

// //   @override
// //   void initState() {
// //     super.initState();
// //     SchedulerBinding.instance.addPostFrameCallback((_) {
// //       final viewModel = Provider.of<ChatViewModel>(context, listen: false);
// //       final updatedChat = viewModel.chats.firstWhere(
// //         (chat) => chat.id == widget.chat.id,
// //         orElse: () => widget.chat,
// //       );
// //       viewModel.initChatMessages(updatedChat);
// //     });
// //   }

// //   @override
// //   void didUpdateWidget(ChatView oldWidget) {
// //     super.didUpdateWidget(oldWidget);
// //     if (oldWidget.chat.id != widget.chat.id) {
// //       final viewModel = Provider.of<ChatViewModel>(context, listen: false);
// //       final updatedChat = viewModel.chats.firstWhere(
// //         (chat) => chat.id == widget.chat.id,
// //         orElse: () => widget.chat,
// //       );
// //       viewModel.initChatMessages(updatedChat);
// //     }
// //   }

// //   void _showDeleteDialog(ChatViewModel viewModel) {
// //     AwesomeDialog(
// //       context: context,
// //       dialogType: DialogType.warning,
// //       animType: AnimType.scale,
// //       title: 'Delete Chat',
// //       desc: 'Are you sure you want to delete this chat?',
// //       btnCancelOnPress: () {},
// //       btnOkOnPress: () async {
// //         try {
// //           await viewModel.deleteChat(widget.chat.id);
// //           Navigator.pop(context);
// //         } catch (e) {
// //           ScaffoldMessenger.of(context).showSnackBar(
// //             SnackBar(content: Text('Failed to delete chat: $e')),
// //           );
// //         }
// //       },
// //       btnOkText: 'Delete',
// //       btnCancelText: 'Cancel',
// //     ).show();
// //   }

// //   void _setUploadingImage(bool value) {
// //     if (mounted) {
// //       setState(() {
// //         _isUploadingImage = value;
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Consumer<ChatViewModel>(
// //       builder: (context, viewModel, child) {
// //         // جلب الـ ChatModel المحدث من viewModel
// //         final updatedChat = viewModel.chats.firstWhere(
// //           (chat) => chat.id == widget.chat.id,
// //           orElse: () => widget.chat, // الرجوع لـ widget.chat لو ما لقاش
// //         );

// //         // التأكد من معرف المستخدم الحالي
// //         final currentUserId = FirebaseAuth.instance.currentUser?.uid ?? '';
// //         if (currentUserId.isEmpty) {
// //           return const Scaffold(
// //             body: Center(
// //               child: Text(
// //                 'No user logged in',
// //                 style: TextStyle(fontSize: 16, color: Colors.red),
// //               ),
// //             ),
// //           );
// //         }

// //         // جلب اسم المستخدم الحالي من names
// //         final names = updatedChat.names;
// //         final currentUserName = names[currentUserId] ?? 'Unknown';

// //         // تحديد الاسم اللي هيظهر في الـ AppBar
// //         String displayName = updatedChat.name;
// //         if (updatedChat.name == currentUserName) {
// //           print('خطأ في ChatView: اسم المحادثة يطابق اسم المستخدم الحالي');
// //           print('updatedChat.name: ${updatedChat.name}');
// //           print('currentUserName: $currentUserName');
// //           displayName = widget.chat.name;
// //         }

// //         // جلب صورة المستخدم الحالي من avatars
// //         final avatars = updatedChat.avatars;
// //         final currentUserAvatar = avatars[currentUserId] ?? '';

// //         // تحديد الصورة اللي هتظهر في الـ AppBar
// //         String displayAvatar = updatedChat.avatar;
// //         if (updatedChat.avatar == currentUserAvatar &&
// //             updatedChat.avatar.isNotEmpty) {
// //           print('خطأ في ChatView: صورة المحادثة تطابق صورة المستخدم الحالي');
// //           print('updatedChat.avatar: ${updatedChat.avatar}');
// //           print('currentUserAvatar: $currentUserAvatar');
// //           displayAvatar = widget.chat.avatar;
// //         }

// //         final appBar = AppBar(
// //           backgroundColor: AppColors.primaryColor,
// //           elevation: 0,
// //           leading: IconButton(
// //             icon: const Icon(Icons.arrow_back, color: Colors.white),
// //             onPressed: () => Navigator.pop(context),
// //           ),
// //           title: Row(
// //             children: [
// //               GestureDetector(
// //                 onTap: () {
// //                   if (displayAvatar.isNotEmpty &&
// //                       displayAvatar.startsWith('http')) {
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                         builder: (context) => ShowImage(
// //                           imageUrl: displayAvatar,
// //                         ),
// //                       ),
// //                     );
// //                   }
// //                 },
// //                 child: CircleAvatar(
// //                   radius: 20,
// //                   backgroundColor: Colors.white,
// //                   child: displayAvatar.isNotEmpty &&
// //                           displayAvatar.startsWith('http')
// //                       ? ClipOval(
// //                           child: Image.network(
// //                             displayAvatar, // استخدام الصورة المحددة
// //                             width: 40,
// //                             height: 40,
// //                             fit: BoxFit.cover,
// //                             loadingBuilder: (context, child, loadingProgress) {
// //                               if (loadingProgress == null) return child;
// //                               return const CircularProgressIndicator(
// //                                 strokeWidth: 2,
// //                                 valueColor: AlwaysStoppedAnimation<Color>(
// //                                     AppColors.primaryColor),
// //                               );
// //                             },
// //                             errorBuilder: (context, error, stackTrace) {
// //                               print('Error loading avatar in ChatView: $error');
// //                               return const Icon(
// //                                 Icons.person,
// //                                 color: Colors.white,
// //                                 size: 24,
// //                               );
// //                             },
// //                           ),
// //                         )
// //                       : const Icon(
// //                           Icons.person,
// //                           color: Colors.white,
// //                           size: 24,
// //                         ),
// //                 ),
// //               ),
// //               const SizedBox(width: 10),
// //               Expanded(
// //                 child: Text(
// //                   displayName, // استخدام الاسم المحدد
// //                   style: const TextStyle(
// //                     fontSize: 20,
// //                     fontWeight: FontWeight.bold,
// //                     color: Colors.white,
// //                   ),
// //                   overflow: TextOverflow.ellipsis,
// //                   maxLines: 1,
// //                 ),
// //               ),
// //             ],
// //           ),
// //           actions: [
// //             PopupMenuButton<String>(
// //               icon: const Icon(Icons.more_vert, color: Colors.white),
// //               onSelected: (value) {
// //                 if (value == 'delete') {
// //                   _showDeleteDialog(viewModel);
// //                 } else if (value == 'update') {
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) => UpdateChatView(chat: widget.chat),
// //                     ),
// //                   );
// //                 }
// //               },
// //               itemBuilder: (BuildContext context) => [
// //                 const PopupMenuItem<String>(
// //                   value: 'update',
// //                   child: Text('Update Chat Name'),
// //                 ),
// //                 const PopupMenuItem<String>(
// //                   value: 'delete',
// //                   child: Text('Delete Chat'),
// //                 ),
// //               ],
// //               offset: const Offset(0, 50),
// //             ),
// //           ],
// //         );

// //         return Scaffold(
// //           backgroundColor: Colors.white,
// //           appBar: appBar,
// //           body: Stack(
// //             children: [
// //               Column(
// //                 children: [
// //                   // Expanded(
// //                   //   child: ListView.builder(
// //                   //     controller: viewModel.scrollController,
// //                   //     physics: const AlwaysScrollableScrollPhysics(),
// //                   //     padding: const EdgeInsets.symmetric(
// //                   //         vertical: 10, horizontal: 10),
// //                   //     cacheExtent: 1000.0,
// //                   //     itemCount: viewModel.localMessages.length + 1,
// //                   //     itemBuilder: (context, index) {
// //                   //       if (index == 0) {
// //                   //         if (viewModel.localMessages.isNotEmpty) {
// //                   //           final latestTime = DateTime.now();
// //                   //           return Center(
// //                   //             child: Padding(
// //                   //               padding:
// //                   //                   const EdgeInsets.symmetric(vertical: 10),
// //                   //               child: Container(
// //                   //                 padding: const EdgeInsets.symmetric(
// //                   //                     horizontal: 12, vertical: 6),
// //                   //                 decoration: BoxDecoration(
// //                   //                   color: Colors.green.withOpacity(0.2),
// //                   //                   borderRadius: BorderRadius.circular(16),
// //                   //                 ),
// //                   //                 child: Text(
// //                   //                   '${latestTime.day}/${latestTime.month}/${latestTime.year}',
// //                   //                   style: const TextStyle(
// //                   //                     fontSize: 14,
// //                   //                     color: Colors.black54,
// //                   //                     fontWeight: FontWeight.w500,
// //                   //                   ),
// //                   //                 ),
// //                   //               ),
// //                   //             ),
// //                   //           );
// //                   //         }
// //                   //         return const SizedBox.shrink();
// //                   //       }
// //                   //       final messageIndex = index - 1;
// //                   //       final message = viewModel.localMessages[messageIndex];
// //                   //       final isMe = message['isMe'] as bool;
// //                   //       return ChatsBubble(
// //                   //         isMe: isMe,
// //                   //         message: message,
// //                   //         chatId: widget.chat.id,
// //                   //       );
// //                   //     },
// //                   //   ),
// //                   // ),

// //                   Expanded(
// //                     child: ListView.builder(
// //                       controller: viewModel.scrollController,
// //                       physics: const AlwaysScrollableScrollPhysics(),
// //                       padding: const EdgeInsets.symmetric(
// //                           vertical: 10, horizontal: 10),
// //                       cacheExtent: 1000.0,
// //                       itemCount: viewModel.localMessages.length + 1,
// //                       itemBuilder: (context, index) {
// //                         if (index == 0) {
// //                           if (viewModel.localMessages.isNotEmpty) {
// //                             final latestTime = DateTime.now();
// //                             return Center(
// //                               child: Padding(
// //                                 padding:
// //                                     const EdgeInsets.symmetric(vertical: 10),
// //                                 child: Container(
// //                                   padding: const EdgeInsets.symmetric(
// //                                       horizontal: 12, vertical: 6),
// //                                   decoration: BoxDecoration(
// //                                     color: Colors.green.withOpacity(0.2),
// //                                     borderRadius: BorderRadius.circular(16),
// //                                   ),
// //                                   child: Text(
// //                                     '${latestTime.day}/${latestTime.month}/${latestTime.year}',
// //                                     style: const TextStyle(
// //                                         fontSize: 14,
// //                                         color: Colors.black54,
// //                                         fontWeight: FontWeight.w500),
// //                                   ),
// //                                 ),
// //                               ),
// //                             );
// //                           }
// //                           return const SizedBox.shrink();
// //                         }
// //                         final messageIndex = index - 1;
// //                         final message = viewModel.localMessages[messageIndex];
// //                         // Determine isMe based on senderId
// //                         final currentUserId =
// //                             FirebaseAuth.instance.currentUser?.uid;
// //                         final isMe = currentUserId != null &&
// //                             message['senderId'] == currentUserId;
// //                         return ChatsBubble(
// //                           isMe: isMe,
// //                           message: message,
// //                           chatId: widget.chat.id,
// //                         );
// //                       },
// //                     ),
// //                   ),
// //                   Padding(
// //                     padding: const EdgeInsets.all(8.0),
// //                     child: Row(
// //                       children: [
// //                         const SizedBox(width: 5),
// //                         Expanded(
// //                           child: ChatTextField(
// //                             messageController: viewModel.messageController,
// //                             chatId: widget.chat.id,
// //                             onUploadingImage: _setUploadingImage,
// //                           ),
// //                         ),
// //                         IconButton(
// //                           icon: const Icon(
// //                             Icons.send,
// //                             color: AppColors.primaryColor,
// //                           ),
// //                           onPressed: () => viewModel.sendMessage(
// //                             widget.chat.id,
// //                             viewModel.messageController.text,
// //                             true,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //               if (_isUploadingImage)
// //                 const Center(
// //                   child: CircularProgressIndicator(
// //                     color: AppColors.primaryColor,
// //                   ),
// //                 ),
// //             ],
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

// import 'package:attendance_app/core/utils/app_colors.dart';
// import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// import 'package:attendance_app/features/chats/presentation/views/update_chat_view.dart';
// import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
// import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
// import 'package:attendance_app/features/chats/presentation/views/widgets/show_image.dart';
// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:provider/provider.dart';

// class ChatView extends StatefulWidget {
//   final ChatModel chat;

//   const ChatView({super.key, required this.chat});

//   @override
//   _ChatViewState createState() => _ChatViewState();
// }

// class _ChatViewState extends State<ChatView> {
//   bool _isUploadingImage = false;

//   @override
//   void initState() {
//     super.initState();
//     SchedulerBinding.instance.addPostFrameCallback((_) {
//       final viewModel = Provider.of<ChatViewModel>(context, listen: false);
//       final updatedChat = viewModel.chats.firstWhere(
//         (chat) => chat.id == widget.chat.id,
//         orElse: () => widget.chat,
//       );
//       viewModel.initChatMessages(updatedChat);
//     });
//   }

//   @override
//   void didUpdateWidget(ChatView oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.chat.id != widget.chat.id) {
//       final viewModel = Provider.of<ChatViewModel>(context, listen: false);
//       final updatedChat = viewModel.chats.firstWhere(
//         (chat) => chat.id == widget.chat.id,
//         orElse: () => widget.chat,
//       );
//       viewModel.initChatMessages(updatedChat);
//     }
//   }

//   void _showDeleteDialog(ChatViewModel viewModel) {
//     AwesomeDialog(
//       context: context,
//       dialogType: DialogType.warning,
//       animType: AnimType.scale,
//       title: 'Delete Chat',
//       desc: 'Are you sure you want to delete this chat?',
//       btnCancelOnPress: () {},
//       btnOkOnPress: () async {
//         try {
//           await viewModel.deleteChat(widget.chat.id);
//           Navigator.pop(context);
//         } catch (e) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Failed to delete chat: $e')),
//           );
//         }
//       },
//       btnOkText: 'Delete',
//       btnCancelText: 'Cancel',
//     ).show();
//   }

//   void _setUploadingImage(bool value) {
//     if (mounted) {
//       setState(() {
//         _isUploadingImage = value;
//       });
//     }
//   }

//   // دالة لتنسيق التاريخ بناءً على الشروط
//   String _formatMessageDate(String? time) {
//     if (time == null || time.isEmpty) return '';

//     DateTime messageTime;
//     try {
//       messageTime = DateTime.parse(time);
//     } catch (e) {
//       return '';
//     }

//     final now = DateTime.now();
//     final today = DateTime(now.year, now.month, now.day);
//     final messageDay =
//         DateTime(messageTime.year, messageTime.month, messageTime.day);
//     final yesterday = today.subtract(const Duration(days: 1));

//     if (messageDay == today) {
//       return 'Today';
//     } else if (messageDay == yesterday) {
//       return 'Yesterday';
//     } else {
//       return '${messageDay.day}/${messageDay.month}/${messageDay.year}';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ChatViewModel>(
//       builder: (context, viewModel, child) {
//         // جلب الـ ChatModel المحدث من viewModel
//         final updatedChat = viewModel.chats.firstWhere(
//           (chat) => chat.id == widget.chat.id,
//           orElse: () => widget.chat, // الرجوع لـ widget.chat لو ما لقاش
//         );

//         // التأكد من معرف المستخدم الحالي
//         final currentUserId = FirebaseAuth.instance.currentUser?.uid ?? '';
//         if (currentUserId.isEmpty) {
//           return const Scaffold(
//             body: Center(
//               child: Text(
//                 'No user logged in',
//                 style: TextStyle(fontSize: 16, color: Colors.red),
//               ),
//             ),
//           );
//         }

//         // جلب اسم المستخدم الحالي من names
//         final names = updatedChat.names;
//         final currentUserName = names[currentUserId] ?? 'Unknown';

//         // تحديد الاسم اللي هيظهر في الـ AppBar
//         String displayName = updatedChat.name;
//         if (updatedChat.name == currentUserName) {
//           print('خطأ في ChatView: اسم المحادثة يطابق اسم المستخدم الحالي');
//           print('updatedChat.name: ${updatedChat.name}');
//           print('currentUserName: $currentUserName');
//           displayName = widget.chat.name;
//         }

//         // جلب صورة المستخدم الحالي من avatars
//         final avatars = updatedChat.avatars;
//         final currentUserAvatar = avatars[currentUserId] ?? '';

//         // تحديد الصورة اللي هتظهر في الـ AppBar
//         String displayAvatar = updatedChat.avatar;
//         if (updatedChat.avatar == currentUserAvatar &&
//             updatedChat.avatar.isNotEmpty) {
//           print('خطأ في ChatView: صورة المحادثة تطابق صورة المستخدم الحالي');
//           print('updatedChat.avatar: ${updatedChat.avatar}');
//           print('currentUserAvatar: $currentUserAvatar');
//           displayAvatar = widget.chat.avatar;
//         }

//         final appBar = AppBar(
//           backgroundColor: AppColors.primaryColor,
//           elevation: 0,
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back, color: Colors.white),
//             onPressed: () => Navigator.pop(context),
//           ),
//           title: Row(
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   if (displayAvatar.isNotEmpty &&
//                       displayAvatar.startsWith('http')) {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ShowImage(
//                           imageUrl: displayAvatar,
//                         ),
//                       ),
//                     );
//                   }
//                 },
//                 child: CircleAvatar(
//                   radius: 20,
//                   backgroundColor: Colors.white,
//                   child: displayAvatar.isNotEmpty &&
//                           displayAvatar.startsWith('http')
//                       ? ClipOval(
//                           child: Image.network(
//                             displayAvatar, // استخدام الصورة المحددة
//                             width: 40,
//                             height: 40,
//                             fit: BoxFit.cover,
//                             loadingBuilder: (context, child, loadingProgress) {
//                               if (loadingProgress == null) return child;
//                               return const CircularProgressIndicator(
//                                 strokeWidth: 2,
//                                 valueColor: AlwaysStoppedAnimation<Color>(
//                                     AppColors.primaryColor),
//                               );
//                             },
//                             errorBuilder: (context, error, stackTrace) {
//                               print('Error loading avatar in ChatView: $error');
//                               return const Icon(
//                                 Icons.person,
//                                 color: Colors.white,
//                                 size: 24,
//                               );
//                             },
//                           ),
//                         )
//                       : const Icon(
//                           Icons.person,
//                           color: Colors.white,
//                           size: 24,
//                         ),
//                 ),
//               ),
//               const SizedBox(width: 10),
//               Expanded(
//                 child: Text(
//                   displayName, // استخدام الاسم المحدد
//                   style: const TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 1,
//                 ),
//               ),
//             ],
//           ),
//           actions: [
//             PopupMenuButton<String>(
//               icon: const Icon(Icons.more_vert, color: Colors.white),
//               onSelected: (value) {
//                 if (value == 'delete') {
//                   _showDeleteDialog(viewModel);
//                 } else if (value == 'update') {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => UpdateChatView(chat: widget.chat),
//                     ),
//                   );
//                 }
//               },
//               itemBuilder: (BuildContext context) => [
//                 const PopupMenuItem<String>(
//                   value: 'update',
//                   child: Text('Update Chat Name'),
//                 ),
//                 const PopupMenuItem<String>(
//                   value: 'delete',
//                   child: Text('Delete Chat'),
//                 ),
//               ],
//               offset: const Offset(0, 50),
//             ),
//           ],
//         );

//         return Scaffold(
//           backgroundColor: Colors.white,
//           appBar: appBar,
//           body: Stack(
//             children: [
//               Column(
//                 children: [
//                   Expanded(
//                     child: ListView.builder(
//                       controller: viewModel.scrollController,
//                       physics: const AlwaysScrollableScrollPhysics(),
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 10, horizontal: 10),
//                       cacheExtent: 1000.0,
//                       itemCount: viewModel.localMessages.length + 1,
//                       itemBuilder: (context, index) {
//                         // if (index == 0) {
//                         //   return Center(
//                         //     child: Padding(
//                         //       padding: const EdgeInsets.symmetric(vertical: 10),
//                         //       child: Container(
//                         //         padding: const EdgeInsets.symmetric(
//                         //             horizontal: 12, vertical: 6),
//                         //         decoration: BoxDecoration(
//                         //           color: Colors.green.withOpacity(0.2),
//                         //           borderRadius: BorderRadius.circular(16),
//                         //         ),
//                         //         child: Text(
//                         //           _formatMessageDate(
//                         //               viewModel.localMessages.isNotEmpty
//                         //                   ? viewModel.localMessages[0]['time']
//                         //                   : ''),
//                         //           style: const TextStyle(
//                         //               fontSize: 14,
//                         //               color: Colors.black54,
//                         //               fontWeight: FontWeight.w500),
//                         //         ),
//                         //       ),
//                         //     ),
//                         //   );
//                         // }
//                         // final messageIndex = index - 1;
//                         // final message = viewModel.localMessages[messageIndex];
//                         // final currentUserId =
//                         //     FirebaseAuth.instance.currentUser?.uid;
//                         // final isMe = currentUserId != null &&
//                         //     message['senderId'] == currentUserId;

//                         // // تحديد ما إذا كان يجب عرض التاريخ
//                         // String? dateLabel;
//                         // if (messageIndex == 0) {
//                         //   dateLabel = _formatMessageDate(message['time']);
//                         // } else {
//                         //   final previousMessage =
//                         //       viewModel.localMessages[messageIndex - 1];
//                         //   final currentDate = DateTime.parse(message['time'])
//                         //       .copyWith(
//                         //           hour: 0,
//                         //           minute: 0,
//                         //           second: 0,
//                         //           millisecond: 0);
//                         //   final previousDate =
//                         //       DateTime.parse(previousMessage['time']).copyWith(
//                         //           hour: 0,
//                         //           minute: 0,
//                         //           second: 0,
//                         //           millisecond: 0);
//                         //   if (currentDate != previousDate) {
//                         //     dateLabel = _formatMessageDate(message['time']);
//                         //   }
//                         // }

//                         // return Column(
//                         //   children: [
//                         //     if (dateLabel != null)
//                         //       Center(
//                         //         child: Padding(
//                         //           padding:
//                         //               const EdgeInsets.symmetric(vertical: 10),
//                         //           child: Container(
//                         //             padding: const EdgeInsets.symmetric(
//                         //                 horizontal: 12, vertical: 6),
//                         //             decoration: BoxDecoration(
//                         //               color: Colors.green.withOpacity(0.2),
//                         //               borderRadius: BorderRadius.circular(16),
//                         //             ),
//                         //             child: Text(
//                         //               dateLabel,
//                         //               style: const TextStyle(
//                         //                   fontSize: 14,
//                         //                   color: Colors.black54,
//                         //                   fontWeight: FontWeight.w500),
//                         //             ),
//                         //           ),
//                         //         ),
//                         //       ),
//                         //     ChatsBubble(
//                         //       isMe: isMe,
//                         //       message: message,
//                         //       chatId: widget.chat.id,
//                         //     ),
//                         //   ],
//                         // );

//                         if (index == 0) {
//                           return Center(
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 10),
//                               child: Container(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 12, vertical: 6),
//                                 decoration: BoxDecoration(
//                                   color: Colors.green.withOpacity(0.2),
//                                   borderRadius: BorderRadius.circular(16),
//                                 ),
//                                 child: Text(
//                                   _formatMessageDate(
//                                       viewModel.localMessages.isNotEmpty
//                                           ? viewModel.localMessages[0]['time']
//                                           : ''),
//                                   style: const TextStyle(
//                                       fontSize: 14,
//                                       color: Colors.black54,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ),
//                           );
//                         }
//                         final messageIndex = index - 1;
//                         final message = viewModel.localMessages[messageIndex];
//                         final currentUserId =
//                             FirebaseAuth.instance.currentUser?.uid;
//                         final isMe = currentUserId != null &&
//                             message['senderId'] == currentUserId;

//                         // تحديد ما إذا كان يجب عرض التاريخ
//                         String? dateLabel;
//                         if (messageIndex == 0) {
//                           dateLabel = _formatMessageDate(message['time']);
//                         } else {
//                           final currentDate = DateTime.parse(message['time'])
//                               .copyWith(
//                                   hour: 0,
//                                   minute: 0,
//                                   second: 0,
//                                   millisecond: 0);
//                           final previousDate = DateTime.parse(viewModel
//                                   .localMessages[messageIndex - 1]['time'])
//                               .copyWith(
//                                   hour: 0,
//                                   minute: 0,
//                                   second: 0,
//                                   millisecond: 0);
//                           if (currentDate != previousDate) {
//                             dateLabel = _formatMessageDate(message['time']);
//                           }
//                         }

//                         return Column(
//                           children: [
//                             if (dateLabel != null)
//                               Center(
//                                 child: Padding(
//                                   padding:
//                                       const EdgeInsets.symmetric(vertical: 10),
//                                   child: Container(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 12, vertical: 6),
//                                     decoration: BoxDecoration(
//                                       color: Colors.green.withOpacity(0.2),
//                                       borderRadius: BorderRadius.circular(16),
//                                     ),
//                                     child: Text(
//                                       dateLabel,
//                                       style: const TextStyle(
//                                           fontSize: 14,
//                                           color: Colors.black54,
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ChatsBubble(
//                               isMe: isMe,
//                               message: message,
//                               chatId: widget.chat.id,
//                             ),
//                           ],
//                         );
//                       },
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         const SizedBox(width: 5),
//                         Expanded(
//                           child: ChatTextField(
//                             messageController: viewModel.messageController,
//                             chatId: widget.chat.id,
//                             onUploadingImage: _setUploadingImage,
//                           ),
//                         ),
//                         IconButton(
//                           icon: const Icon(
//                             Icons.send,
//                             color: AppColors.primaryColor,
//                           ),
//                           onPressed: () => viewModel.sendMessage(
//                             widget.chat.id,
//                             viewModel.messageController.text,
//                             true,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               if (_isUploadingImage)
//                 const Center(
//                   child: CircularProgressIndicator(
//                     color: AppColors.primaryColor,
//                   ),
//                 ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/chats/data/models/chat_model.dart';
import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
import 'package:attendance_app/features/chats/presentation/views/update_chat_view.dart';
import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
import 'package:attendance_app/features/chats/presentation/views/widgets/show_image.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class ChatView extends StatefulWidget {
  final ChatModel chat;

  const ChatView({super.key, required this.chat});

  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  bool _isUploadingImage = false;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final viewModel = Provider.of<ChatViewModel>(context, listen: false);
      final updatedChat = viewModel.chats.firstWhere(
        (chat) => chat.id == widget.chat.id,
        orElse: () => widget.chat,
      );
      viewModel.initChatMessages(updatedChat);
    });
  }

  @override
  void didUpdateWidget(ChatView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.chat.id != widget.chat.id) {
      final viewModel = Provider.of<ChatViewModel>(context, listen: false);
      final updatedChat = viewModel.chats.firstWhere(
        (chat) => chat.id == widget.chat.id,
        orElse: () => widget.chat,
      );
      viewModel.initChatMessages(updatedChat);
    }
  }

  void _showDeleteDialog(ChatViewModel viewModel) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.scale,
      title: 'Delete Chat',
      desc: 'Are you sure you want to delete this chat?',
      btnCancelOnPress: () {},
      btnOkOnPress: () async {
        try {
          await viewModel.deleteChat(widget.chat.id);
          Navigator.pop(context);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to delete chat: $e')),
          );
        }
      },
      btnOkText: 'Delete',
      btnCancelText: 'Cancel',
    ).show();
  }

  void _setUploadingImage(bool value) {
    if (mounted) {
      setState(() {
        _isUploadingImage = value;
      });
    }
  }

  // دالة لتنسيق التاريخ بناءً على الشروط
  String _formatMessageDate(String? time) {
    if (time == null || time.isEmpty) return '';

    DateTime messageTime;
    try {
      messageTime = DateTime.parse(time);
    } catch (e) {
      return '';
    }

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final messageDay =
        DateTime(messageTime.year, messageTime.month, messageTime.day);
    final yesterday = today.subtract(const Duration(days: 1));

    if (messageDay == today) {
      return 'Today';
    } else if (messageDay == yesterday) {
      return 'Yesterday';
    } else {
      return '${messageDay.day}/${messageDay.month}/${messageDay.year}';
    }
  }

  // دالة لتجميع الرسائل حسب التاريخ
  List<Map<String, dynamic>> _groupMessagesByDate(
      List<Map<String, dynamic>> messages) {
    if (messages.isEmpty) return [];

    final groupedMessages = <String, List<Map<String, dynamic>>>{};

    for (var message in messages) {
      final messageTime = message['time'] as String?;
      if (messageTime == null || messageTime.isEmpty) continue;

      final date = DateTime.parse(messageTime)
          .copyWith(hour: 0, minute: 0, second: 0, millisecond: 0);
      final dateKey = '${date.day}/${date.month}/${date.year}';

      if (!groupedMessages.containsKey(dateKey)) {
        groupedMessages[dateKey] = [];
      }
      groupedMessages[dateKey]!.add(message);
    }

    // تحويل المجموعات إلى قائمة من العناصر
    final result = <Map<String, dynamic>>[];
    groupedMessages.forEach((dateKey, messages) {
      final formattedDate = _formatMessageDate(messages.first['time']);
      result.add({'type': 'date', 'date': formattedDate});
      for (var message in messages) {
        result.add({'type': 'message', 'message': message});
      }
    });

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatViewModel>(
      builder: (context, viewModel, child) {
        // جلب الـ ChatModel المحدث من viewModel
        final updatedChat = viewModel.chats.firstWhere(
          (chat) => chat.id == widget.chat.id,
          orElse: () => widget.chat,
        );

        // التأكد من معرف المستخدم الحالي
        final currentUserId = FirebaseAuth.instance.currentUser?.uid ?? '';
        if (currentUserId.isEmpty) {
          return const Scaffold(
            body: Center(
              child: Text(
                'No user logged in',
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
            ),
          );
        }

        // جلب اسم المستخدم الحالي من names
        final names = updatedChat.names;
        final currentUserName = names[currentUserId] ?? 'Unknown';

        // تحديد الاسم اللي هيظهر في الـ AppBar
        String displayName = updatedChat.name;
        if (updatedChat.name == currentUserName) {
          displayName = widget.chat.name;
        }

        // جلب صورة المستخدم الحالي من avatars
        final avatars = updatedChat.avatars;
        final currentUserAvatar = avatars[currentUserId] ?? '';

        // تحديد الصورة اللي هتظهر في الـ AppBar
        String displayAvatar = updatedChat.avatar;
        if (updatedChat.avatar == currentUserAvatar &&
            updatedChat.avatar.isNotEmpty) {
          displayAvatar = widget.chat.avatar;
        }

        final appBar = AppBar(
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (displayAvatar.isNotEmpty &&
                      displayAvatar.startsWith('http')) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ShowImage(imageUrl: displayAvatar),
                      ),
                    );
                  }
                },
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: displayAvatar.isNotEmpty &&
                          displayAvatar.startsWith('http')
                      ? ClipOval(
                          child: Image.network(
                            displayAvatar,
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColors.primaryColor),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 24,
                              );
                            },
                          ),
                        )
                      : const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 24,
                        ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  displayName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          actions: [
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onSelected: (value) {
                if (value == 'delete') {
                  _showDeleteDialog(viewModel);
                } else if (value == 'update') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateChatView(chat: widget.chat),
                    ),
                  );
                }
              },
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem<String>(
                  value: 'update',
                  child: Text('Update Chat Name'),
                ),
                const PopupMenuItem<String>(
                  value: 'delete',
                  child: Text('Delete Chat'),
                ),
              ],
              offset: const Offset(0, 50),
            ),
          ],
        );

        // تجميع الرسائل حسب التاريخ
        final groupedItems = _groupMessagesByDate(viewModel.localMessages);

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: appBar,
          body: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: viewModel.scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      cacheExtent: 1000.0,
                      itemCount: groupedItems.length,
                      itemBuilder: (context, index) {
                        final item = groupedItems[index];
                        if (item['type'] == 'date') {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(
                                  item['date'] as String,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          );
                        } else {
                          final message =
                              item['message'] as Map<String, dynamic>;
                          final currentUserId =
                              FirebaseAuth.instance.currentUser?.uid;
                          final isMe = currentUserId != null &&
                              message['senderId'] == currentUserId;

                          return ChatsBubble(
                            isMe: isMe,
                            message: message,
                            chatId: widget.chat.id,
                          );
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const SizedBox(width: 5),
                        Expanded(
                          child: ChatTextField(
                            messageController: viewModel.messageController,
                            chatId: widget.chat.id,
                            onUploadingImage: _setUploadingImage,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.send,
                            color: AppColors.primaryColor,
                          ),
                          onPressed: () => viewModel.sendMessage(
                            widget.chat.id,
                            viewModel.messageController.text,
                            true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (_isUploadingImage)
                const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
