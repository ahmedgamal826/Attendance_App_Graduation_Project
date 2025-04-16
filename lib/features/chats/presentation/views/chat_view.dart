// // // // // // // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
// // // // // // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
// // // // // // // // // // import 'package:flutter/material.dart';

// // // // // // // // // // class ChatView extends StatefulWidget {
// // // // // // // // // //   final ChatModel chat;

// // // // // // // // // //   const ChatView({super.key, required this.chat});

// // // // // // // // // //   @override
// // // // // // // // // //   _ChatViewState createState() => _ChatViewState();
// // // // // // // // // // }

// // // // // // // // // // class _ChatViewState extends State<ChatView> {
// // // // // // // // // //   final TextEditingController _messageController = TextEditingController();
// // // // // // // // // //   final ScrollController _scrollController = ScrollController();

// // // // // // // // // //   final List<Map<String, dynamic>> _messages = [
// // // // // // // // // //     {"text": "Hey, how are you?", "isMe": true, "time": "3:00 PM"},
// // // // // // // // // //     {"text": "Good, how about you?", "isMe": false, "time": "3:01 PM"},
// // // // // // // // // //     {"text": "I’m good too!", "isMe": true, "time": "3:02 PM"},
// // // // // // // // // //     {
// // // // // // // // // //       "text": "Hey, what’s your plan for today?",
// // // // // // // // // //       "isMe": true,
// // // // // // // // // //       "time": "3:03 PM"
// // // // // // // // // //     },
// // // // // // // // // //     {"text": "Not much, just chilling. You?", "isMe": false, "time": "3:04 PM"},
// // // // // // // // // //     {
// // // // // // // // // //       "text": "I’m thinking of going out later.",
// // // // // // // // // //       "isMe": false,
// // // // // // // // // //       "time": "3:05 PM"
// // // // // // // // // //     },
// // // // // // // // // //     {
// // // // // // // // // //       "text": "Hey, what’s your plan for today?",
// // // // // // // // // //       "isMe": true,
// // // // // // // // // //       "time": "3:03 PM"
// // // // // // // // // //     },
// // // // // // // // // //   ];

// // // // // // // // // //   void _sendMessage() {
// // // // // // // // // //     if (_messageController.text.trim().isEmpty) return;

// // // // // // // // // //     setState(() {
// // // // // // // // // //       _messages.add({
// // // // // // // // // //         'text': _messageController.text.trim(),
// // // // // // // // // //         'isMe': true,
// // // // // // // // // //         'time': DateTime.now().toString().substring(11, 16),
// // // // // // // // // //       });
// // // // // // // // // //       _messageController.clear();
// // // // // // // // // //     });

// // // // // // // // // //     // 👇 التمرير لآخر رسالة بعد إرسالها
// // // // // // // // // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // // // // // // // // //       if (_scrollController.hasClients) {
// // // // // // // // // //         _scrollController.animateTo(
// // // // // // // // // //           0.0, // لأنك عامل reverse: true
// // // // // // // // // //           duration: const Duration(milliseconds: 300),
// // // // // // // // // //           curve: Curves.easeOut,
// // // // // // // // // //         );
// // // // // // // // // //       }
// // // // // // // // // //     });
// // // // // // // // // //   }

// // // // // // // // // //   @override
// // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // //     return Scaffold(
// // // // // // // // // //       backgroundColor: Colors.white, // الخلفية بيضاء
// // // // // // // // // //       appBar: AppBar(
// // // // // // // // // //         backgroundColor: const Color(0xFF1565C0), // لون الـ AppBar أزرق غامق
// // // // // // // // // //         elevation: 0,
// // // // // // // // // //         leading: IconButton(
// // // // // // // // // //           icon: const Icon(Icons.arrow_back, color: Colors.white),
// // // // // // // // // //           onPressed: () => Navigator.pop(context),
// // // // // // // // // //         ),
// // // // // // // // // //         title: Row(
// // // // // // // // // //           children: [
// // // // // // // // // //             CircleAvatar(
// // // // // // // // // //               backgroundImage: NetworkImage(widget.chat.avatar),
// // // // // // // // // //               radius: 20,
// // // // // // // // // //             ),
// // // // // // // // // //             const SizedBox(width: 10),
// // // // // // // // // //             Expanded(
// // // // // // // // // //               child: Text(
// // // // // // // // // //                 widget.chat.name,
// // // // // // // // // //                 style: const TextStyle(
// // // // // // // // // //                   fontSize: 20,
// // // // // // // // // //                   fontWeight: FontWeight.bold,
// // // // // // // // // //                   color: Colors.white, // لون الاسم أبيض
// // // // // // // // // //                 ),
// // // // // // // // // //                 overflow: TextOverflow.ellipsis,
// // // // // // // // // //                 maxLines: 1,
// // // // // // // // // //               ),
// // // // // // // // // //             ),
// // // // // // // // // //           ],
// // // // // // // // // //         ),
// // // // // // // // // //         actions: [
// // // // // // // // // //           IconButton(
// // // // // // // // // //             icon: const Icon(Icons.videocam, color: Colors.white),
// // // // // // // // // //             onPressed: () {},
// // // // // // // // // //           ),
// // // // // // // // // //           IconButton(
// // // // // // // // // //             icon: const Icon(Icons.call, color: Colors.white),
// // // // // // // // // //             onPressed: () {},
// // // // // // // // // //           ),
// // // // // // // // // //           IconButton(
// // // // // // // // // //             icon: const Icon(Icons.more_vert, color: Colors.white),
// // // // // // // // // //             onPressed: () {},
// // // // // // // // // //           ),
// // // // // // // // // //         ],
// // // // // // // // // //       ),
// // // // // // // // // //       body: Column(
// // // // // // // // // //         children: [
// // // // // // // // // //           Expanded(
// // // // // // // // // //             child: ListView.builder(
// // // // // // // // // //               controller: _scrollController,
// // // // // // // // // //               reverse: true, // الرسائل تبدأ من الأسفل
// // // // // // // // // //               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
// // // // // // // // // //               itemCount: _messages.length,
// // // // // // // // // //               itemBuilder: (context, index) {
// // // // // // // // // //                 final message =
// // // // // // // // // //                     _messages[_messages.length - 1 - index]; // عكس الترتيب
// // // // // // // // // //                 final isMe = message['isMe'] as bool;
// // // // // // // // // //                 return ChatsBubble(isMe: isMe, message: message);
// // // // // // // // // //               },
// // // // // // // // // //             ),
// // // // // // // // // //           ),
// // // // // // // // // //           Padding(
// // // // // // // // // //             padding: const EdgeInsets.all(8.0),
// // // // // // // // // //             child: Row(
// // // // // // // // // //               children: [
// // // // // // // // // //                 Container(
// // // // // // // // // //                   width: 40,
// // // // // // // // // //                   height: 40,
// // // // // // // // // //                   decoration: const BoxDecoration(
// // // // // // // // // //                     color: AppColors.primaryColor,
// // // // // // // // // //                     shape: BoxShape.circle,
// // // // // // // // // //                   ),
// // // // // // // // // //                   child: IconButton(
// // // // // // // // // //                     icon: const Icon(
// // // // // // // // // //                       Icons.mic,
// // // // // // // // // //                       color: Colors.white,
// // // // // // // // // //                       size: 24,
// // // // // // // // // //                     ),
// // // // // // // // // //                     onPressed: () {},
// // // // // // // // // //                   ),
// // // // // // // // // //                 ),
// // // // // // // // // //                 const SizedBox(width: 5),
// // // // // // // // // //                 ChatTextField(
// // // // // // // // // //                   messageController: _messageController,
// // // // // // // // // //                 ),
// // // // // // // // // //                 IconButton(
// // // // // // // // // //                   icon: const Icon(
// // // // // // // // // //                     Icons.send,
// // // // // // // // // //                     color: Color(0xFF1565C0),
// // // // // // // // // //                   ),
// // // // // // // // // //                   onPressed: _sendMessage,
// // // // // // // // // //                 ),
// // // // // // // // // //               ],
// // // // // // // // // //             ),
// // // // // // // // // //           ),
// // // // // // // // // //         ],
// // // // // // // // // //       ),
// // // // // // // // // //     );
// // // // // // // // // //   }
// // // // // // // // // // }

// // // // // // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // // // // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // // // // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
// // // // // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
// // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // import 'package:provider/provider.dart';

// // // // // // // // // class ChatView extends StatefulWidget {
// // // // // // // // //   final ChatModel chat;

// // // // // // // // //   const ChatView({super.key, required this.chat});

// // // // // // // // //   @override
// // // // // // // // //   _ChatViewState createState() => _ChatViewState();
// // // // // // // // // }

// // // // // // // // // class _ChatViewState extends State<ChatView> {
// // // // // // // // //   final TextEditingController _messageController = TextEditingController();
// // // // // // // // //   final ScrollController _scrollController = ScrollController();

// // // // // // // // //   void _sendMessage(ChatViewModel viewModel) {
// // // // // // // // //     if (_messageController.text.trim().isEmpty) return;

// // // // // // // // //     viewModel.sendMessage(widget.chat.id, _messageController.text.trim(), true);
// // // // // // // // //     _messageController.clear();

// // // // // // // // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // // // // // // // //       if (_scrollController.hasClients) {
// // // // // // // // //         _scrollController.animateTo(
// // // // // // // // //           0.0,
// // // // // // // // //           duration: const Duration(milliseconds: 300),
// // // // // // // // //           curve: Curves.easeOut,
// // // // // // // // //         );
// // // // // // // // //       }
// // // // // // // // //     });
// // // // // // // // //   }

// // // // // // // // //   @override
// // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // //     return Consumer<ChatViewModel>(
// // // // // // // // //       builder: (context, viewModel, child) {
// // // // // // // // //         return Scaffold(
// // // // // // // // //           backgroundColor: Colors.white,
// // // // // // // // //           appBar: AppBar(
// // // // // // // // //             backgroundColor: AppColors.primaryColor,
// // // // // // // // //             elevation: 0,
// // // // // // // // //             leading: IconButton(
// // // // // // // // //               icon: const Icon(Icons.arrow_back, color: Colors.white),
// // // // // // // // //               onPressed: () => Navigator.pop(context),
// // // // // // // // //             ),
// // // // // // // // //             title: Row(
// // // // // // // // //               children: [
// // // // // // // // //                 CircleAvatar(
// // // // // // // // //                   backgroundImage: NetworkImage(widget.chat.avatar),
// // // // // // // // //                   radius: 20,
// // // // // // // // //                 ),
// // // // // // // // //                 const SizedBox(width: 10),
// // // // // // // // //                 Expanded(
// // // // // // // // //                   child: Text(
// // // // // // // // //                     widget.chat.name,
// // // // // // // // //                     style: const TextStyle(
// // // // // // // // //                       fontSize: 20,
// // // // // // // // //                       fontWeight: FontWeight.bold,
// // // // // // // // //                       color: Colors.white,
// // // // // // // // //                     ),
// // // // // // // // //                     overflow: TextOverflow.ellipsis,
// // // // // // // // //                     maxLines: 1,
// // // // // // // // //                   ),
// // // // // // // // //                 ),
// // // // // // // // //               ],
// // // // // // // // //             ),
// // // // // // // // //             actions: [
// // // // // // // // //               IconButton(
// // // // // // // // //                 icon: const Icon(Icons.videocam, color: Colors.white),
// // // // // // // // //                 onPressed: () {},
// // // // // // // // //               ),
// // // // // // // // //               IconButton(
// // // // // // // // //                 icon: const Icon(Icons.call, color: Colors.white),
// // // // // // // // //                 onPressed: () {},
// // // // // // // // //               ),
// // // // // // // // //               IconButton(
// // // // // // // // //                 icon: const Icon(Icons.more_vert, color: Colors.white),
// // // // // // // // //                 onPressed: () {},
// // // // // // // // //               ),
// // // // // // // // //             ],
// // // // // // // // //           ),
// // // // // // // // //           body: Column(
// // // // // // // // //             children: [
// // // // // // // // //               Expanded(
// // // // // // // // //                 child: ListView.builder(
// // // // // // // // //                   controller: _scrollController,
// // // // // // // // //                   reverse: true,
// // // // // // // // //                   padding:
// // // // // // // // //                       const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
// // // // // // // // //                   itemCount: widget.chat.messages.length,
// // // // // // // // //                   itemBuilder: (context, index) {
// // // // // // // // //                     final message = widget
// // // // // // // // //                         .chat.messages[widget.chat.messages.length - 1 - index];
// // // // // // // // //                     final isMe = message['isMe'] as bool;
// // // // // // // // //                     return ChatsBubble(isMe: isMe, message: message);
// // // // // // // // //                   },
// // // // // // // // //                 ),
// // // // // // // // //               ),
// // // // // // // // //               Padding(
// // // // // // // // //                 padding: const EdgeInsets.all(8.0),
// // // // // // // // //                 child: Row(
// // // // // // // // //                   children: [
// // // // // // // // //                     Container(
// // // // // // // // //                       width: 40,
// // // // // // // // //                       height: 40,
// // // // // // // // //                       decoration: const BoxDecoration(
// // // // // // // // //                         color: AppColors.primaryColor,
// // // // // // // // //                         shape: BoxShape.circle,
// // // // // // // // //                       ),
// // // // // // // // //                       child: IconButton(
// // // // // // // // //                         icon: const Icon(
// // // // // // // // //                           Icons.mic,
// // // // // // // // //                           color: Colors.white,
// // // // // // // // //                           size: 24,
// // // // // // // // //                         ),
// // // // // // // // //                         onPressed: () {},
// // // // // // // // //                       ),
// // // // // // // // //                     ),
// // // // // // // // //                     const SizedBox(width: 5),
// // // // // // // // //                     Expanded(
// // // // // // // // //                       child: ChatTextField(
// // // // // // // // //                         messageController: _messageController,
// // // // // // // // //                       ),
// // // // // // // // //                     ),
// // // // // // // // //                     IconButton(
// // // // // // // // //                       icon: const Icon(
// // // // // // // // //                         Icons.send,
// // // // // // // // //                         color: AppColors.primaryColor,
// // // // // // // // //                       ),
// // // // // // // // //                       onPressed: () => _sendMessage(viewModel),
// // // // // // // // //                     ),
// // // // // // // // //                   ],
// // // // // // // // //                 ),
// // // // // // // // //               ),
// // // // // // // // //             ],
// // // // // // // // //           ),
// // // // // // // // //         );
// // // // // // // // //       },
// // // // // // // // //     );
// // // // // // // // //   }
// // // // // // // // // }

// // // // // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // // // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // // // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
// // // // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
// // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // import 'package:provider/provider.dart';
// // // // // // // // import 'dart:io';

// // // // // // // // class ChatView extends StatefulWidget {
// // // // // // // //   final ChatModel chat;

// // // // // // // //   const ChatView({super.key, required this.chat});

// // // // // // // //   @override
// // // // // // // //   _ChatViewState createState() => _ChatViewState();
// // // // // // // // }

// // // // // // // // class _ChatViewState extends State<ChatView> {
// // // // // // // //   final TextEditingController _messageController = TextEditingController();
// // // // // // // //   final ScrollController _scrollController = ScrollController();

// // // // // // // //   void _sendMessage(ChatViewModel viewModel) {
// // // // // // // //     if (_messageController.text.trim().isEmpty) return;

// // // // // // // //     viewModel.sendMessage(widget.chat.id, _messageController.text.trim(), true);
// // // // // // // //     _messageController.clear();

// // // // // // // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // // // // // // //       if (_scrollController.hasClients) {
// // // // // // // //         _scrollController.animateTo(
// // // // // // // //           0.0,
// // // // // // // //           duration: const Duration(milliseconds: 300),
// // // // // // // //           curve: Curves.easeOut,
// // // // // // // //         );
// // // // // // // //       }
// // // // // // // //     });
// // // // // // // //   }

// // // // // // // //   @override
// // // // // // // //   Widget build(BuildContext context) {
// // // // // // // //     return Consumer<ChatViewModel>(
// // // // // // // //       builder: (context, viewModel, child) {
// // // // // // // //         return Scaffold(
// // // // // // // //           backgroundColor: Colors.white,
// // // // // // // //           appBar: AppBar(
// // // // // // // //             backgroundColor: AppColors.primaryColor,
// // // // // // // //             elevation: 0,
// // // // // // // //             leading: IconButton(
// // // // // // // //               icon: const Icon(Icons.arrow_back, color: Colors.white),
// // // // // // // //               onPressed: () => Navigator.pop(context),
// // // // // // // //             ),
// // // // // // // //             title: Row(
// // // // // // // //               children: [
// // // // // // // //                 CircleAvatar(
// // // // // // // //                   backgroundImage: (widget.chat.avatar.startsWith('file://') ||
// // // // // // // //                           File(widget.chat.avatar).existsSync())
// // // // // // // //                       ? FileImage(File(widget.chat.avatar))
// // // // // // // //                       : NetworkImage(widget.chat.avatar.isNotEmpty
// // // // // // // //                           ? widget.chat.avatar
// // // // // // // //                           : 'https://via.placeholder.com/150'),
// // // // // // // //                   radius: 20,
// // // // // // // //                 ),
// // // // // // // //                 const SizedBox(width: 10),
// // // // // // // //                 Expanded(
// // // // // // // //                   child: Text(
// // // // // // // //                     widget.chat.name,
// // // // // // // //                     style: const TextStyle(
// // // // // // // //                       fontSize: 20,
// // // // // // // //                       fontWeight: FontWeight.bold,
// // // // // // // //                       color: Colors.white,
// // // // // // // //                     ),
// // // // // // // //                     overflow: TextOverflow.ellipsis,
// // // // // // // //                     maxLines: 1,
// // // // // // // //                   ),
// // // // // // // //                 ),
// // // // // // // //               ],
// // // // // // // //             ),
// // // // // // // //             actions: [
// // // // // // // //               // IconButton(
// // // // // // // //               //   icon: const Icon(Icons.videocam, color: Colors.white),
// // // // // // // //               //   onPressed: () {},
// // // // // // // //               // ),
// // // // // // // //               // IconButton(
// // // // // // // //               //   icon: const Icon(Icons.call, color: Colors.white),
// // // // // // // //               //   onPressed: () {},
// // // // // // // //               // ),
// // // // // // // //               IconButton(
// // // // // // // //                 icon: const Icon(Icons.more_vert, color: Colors.white),
// // // // // // // //                 onPressed: () {},
// // // // // // // //               ),
// // // // // // // //             ],
// // // // // // // //           ),
// // // // // // // //           body: Column(
// // // // // // // //             children: [
// // // // // // // //               Expanded(
// // // // // // // //                 child: ListView.builder(
// // // // // // // //                   controller: _scrollController,
// // // // // // // //                   reverse: true,
// // // // // // // //                   padding:
// // // // // // // //                       const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
// // // // // // // //                   itemCount: widget.chat.messages.length,
// // // // // // // //                   itemBuilder: (context, index) {
// // // // // // // //                     final message = widget
// // // // // // // //                         .chat.messages[widget.chat.messages.length - 1 - index];
// // // // // // // //                     final isMe = message['isMe'] as bool;
// // // // // // // //                     return ChatsBubble(isMe: isMe, message: message);
// // // // // // // //                   },
// // // // // // // //                 ),
// // // // // // // //               ),
// // // // // // // //               Padding(
// // // // // // // //                 padding: const EdgeInsets.all(8.0),
// // // // // // // //                 child: Row(
// // // // // // // //                   children: [
// // // // // // // //                     Container(
// // // // // // // //                       width: 40,
// // // // // // // //                       height: 40,
// // // // // // // //                       decoration: const BoxDecoration(
// // // // // // // //                         color: AppColors.primaryColor,
// // // // // // // //                         shape: BoxShape.circle,
// // // // // // // //                       ),
// // // // // // // //                       child: IconButton(
// // // // // // // //                         icon: const Icon(
// // // // // // // //                           Icons.mic,
// // // // // // // //                           color: Colors.white,
// // // // // // // //                           size: 24,
// // // // // // // //                         ),
// // // // // // // //                         onPressed: () {},
// // // // // // // //                       ),
// // // // // // // //                     ),
// // // // // // // //                     const SizedBox(width: 5),
// // // // // // // //                     Expanded(
// // // // // // // //                       child: ChatTextField(
// // // // // // // //                         messageController: _messageController,
// // // // // // // //                       ),
// // // // // // // //                     ),
// // // // // // // //                     IconButton(
// // // // // // // //                       icon: const Icon(
// // // // // // // //                         Icons.send,
// // // // // // // //                         color: AppColors.primaryColor,
// // // // // // // //                       ),
// // // // // // // //                       onPressed: () => _sendMessage(viewModel),
// // // // // // // //                     ),
// // // // // // // //                   ],
// // // // // // // //                 ),
// // // // // // // //               ),
// // // // // // // //             ],
// // // // // // // //           ),
// // // // // // // //         );
// // // // // // // //       },
// // // // // // // //     );
// // // // // // // //   }
// // // // // // // // }

// // // // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
// // // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
// // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // // import 'package:flutter/material.dart';
// // // // // // // import 'package:provider/provider.dart';
// // // // // // // import 'dart:io';

// // // // // // // class ChatView extends StatefulWidget {
// // // // // // //   final ChatModel chat;

// // // // // // //   const ChatView({super.key, required this.chat});

// // // // // // //   @override
// // // // // // //   _ChatViewState createState() => _ChatViewState();
// // // // // // // }

// // // // // // // class _ChatViewState extends State<ChatView> {
// // // // // // //   final TextEditingController _messageController = TextEditingController();
// // // // // // //   final ScrollController _scrollController = ScrollController();

// // // // // // //   void _sendMessage(ChatViewModel viewModel) {
// // // // // // //     if (_messageController.text.trim().isEmpty) return;

// // // // // // //     viewModel.sendMessage(widget.chat.id, _messageController.text.trim(), true);
// // // // // // //     _messageController.clear();

// // // // // // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // // // // // //       if (_scrollController.hasClients) {
// // // // // // //         _scrollController.animateTo(
// // // // // // //           0.0,
// // // // // // //           duration: const Duration(milliseconds: 300),
// // // // // // //           curve: Curves.easeOut,
// // // // // // //         );
// // // // // // //       }
// // // // // // //     });
// // // // // // //   }

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return Consumer<ChatViewModel>(
// // // // // // //       builder: (context, viewModel, child) {
// // // // // // //         return Scaffold(
// // // // // // //           backgroundColor: Colors.white,
// // // // // // //           appBar: AppBar(
// // // // // // //             backgroundColor: AppColors.primaryColor,
// // // // // // //             elevation: 0,
// // // // // // //             leading: IconButton(
// // // // // // //               icon: const Icon(Icons.arrow_back, color: Colors.white),
// // // // // // //               onPressed: () => Navigator.pop(context),
// // // // // // //             ),
// // // // // // //             title: Row(
// // // // // // //               children: [
// // // // // // //                 CircleAvatar(
// // // // // // //                   backgroundImage: (widget.chat.avatar.startsWith('file://') ||
// // // // // // //                           File(widget.chat.avatar).existsSync())
// // // // // // //                       ? FileImage(File(widget.chat.avatar))
// // // // // // //                       : NetworkImage(widget.chat.avatar.isNotEmpty
// // // // // // //                           ? widget.chat.avatar
// // // // // // //                           : 'https://via.placeholder.com/150'),
// // // // // // //                   radius: 20,
// // // // // // //                 ),
// // // // // // //                 const SizedBox(width: 10),
// // // // // // //                 Expanded(
// // // // // // //                   child: Text(
// // // // // // //                     widget.chat.name,
// // // // // // //                     style: const TextStyle(
// // // // // // //                       fontSize: 20,
// // // // // // //                       fontWeight: FontWeight.bold,
// // // // // // //                       color: Colors.white,
// // // // // // //                     ),
// // // // // // //                     overflow: TextOverflow.ellipsis,
// // // // // // //                     maxLines: 1,
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //               ],
// // // // // // //             ),
// // // // // // //             actions: [
// // // // // // //               IconButton(
// // // // // // //                 icon: const Icon(Icons.more_vert, color: Colors.white),
// // // // // // //                 onPressed: () {},
// // // // // // //               ),
// // // // // // //             ],
// // // // // // //           ),
// // // // // // //           body: StreamBuilder<DocumentSnapshot>(
// // // // // // //             stream: FirebaseFirestore.instance
// // // // // // //                 .collection('users_chats')
// // // // // // //                 .doc(widget.chat.id)
// // // // // // //                 .snapshots(),
// // // // // // //             builder: (context, snapshot) {
// // // // // // //               if (snapshot.connectionState == ConnectionState.waiting) {
// // // // // // //                 return const Center(child: CircularProgressIndicator());
// // // // // // //               }
// // // // // // //               if (snapshot.hasError) {
// // // // // // //                 return const Center(child: Text('Error fetching messages'));
// // // // // // //               }
// // // // // // //               if (!snapshot.hasData || !snapshot.data!.exists) {
// // // // // // //                 return const Center(child: Text('No messages yet'));
// // // // // // //               }

// // // // // // //               final chatData = snapshot.data!.data() as Map<String, dynamic>;
// // // // // // //               final messages =
// // // // // // //                   List<Map<String, dynamic>>.from(chatData['messages'] ?? []);

// // // // // // //               return Column(
// // // // // // //                 children: [
// // // // // // //                   Expanded(
// // // // // // //                     child: ListView.builder(
// // // // // // //                       controller: _scrollController,
// // // // // // //                       reverse: true,
// // // // // // //                       padding: const EdgeInsets.symmetric(
// // // // // // //                           vertical: 10, horizontal: 10),
// // // // // // //                       itemCount: messages.length,
// // // // // // //                       itemBuilder: (context, index) {
// // // // // // //                         final message = messages[messages.length - 1 - index];
// // // // // // //                         final isMe = message['isMe'] as bool;
// // // // // // //                         return ChatsBubble(isMe: isMe, message: message);
// // // // // // //                       },
// // // // // // //                     ),
// // // // // // //                   ),
// // // // // // //                   Padding(
// // // // // // //                     padding: const EdgeInsets.all(8.0),
// // // // // // //                     child: Row(
// // // // // // //                       children: [
// // // // // // //                         Container(
// // // // // // //                           width: 40,
// // // // // // //                           height: 40,
// // // // // // //                           decoration: const BoxDecoration(
// // // // // // //                             color: AppColors.primaryColor,
// // // // // // //                             shape: BoxShape.circle,
// // // // // // //                           ),
// // // // // // //                           child: IconButton(
// // // // // // //                             icon: const Icon(
// // // // // // //                               Icons.mic,
// // // // // // //                               color: Colors.white,
// // // // // // //                               size: 24,
// // // // // // //                             ),
// // // // // // //                             onPressed: () {},
// // // // // // //                           ),
// // // // // // //                         ),
// // // // // // //                         const SizedBox(width: 5),
// // // // // // //                         Expanded(
// // // // // // //                           child: ChatTextField(
// // // // // // //                             messageController: _messageController,
// // // // // // //                           ),
// // // // // // //                         ),
// // // // // // //                         IconButton(
// // // // // // //                           icon: const Icon(
// // // // // // //                             Icons.send,
// // // // // // //                             color: AppColors.primaryColor,
// // // // // // //                           ),
// // // // // // //                           onPressed: () => _sendMessage(viewModel),
// // // // // // //                         ),
// // // // // // //                       ],
// // // // // // //                     ),
// // // // // // //                   ),
// // // // // // //                 ],
// // // // // // //               );
// // // // // // //             },
// // // // // // //           ),
// // // // // // //         );
// // // // // // //       },
// // // // // // //     );
// // // // // // //   }

// // // // // // //   @override
// // // // // // //   void dispose() {
// // // // // // //     _messageController.dispose();
// // // // // // //     _scrollController.dispose();
// // // // // // //     super.dispose();
// // // // // // //   }
// // // // // // // }

// // // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
// // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'package:provider/provider.dart';
// // // // // // import 'dart:io';

// // // // // // class ChatView extends StatefulWidget {
// // // // // //   final ChatModel chat;

// // // // // //   const ChatView({super.key, required this.chat});

// // // // // //   @override
// // // // // //   _ChatViewState createState() => _ChatViewState();
// // // // // // }

// // // // // // class _ChatViewState extends State<ChatView> {
// // // // // //   final TextEditingController _messageController = TextEditingController();
// // // // // //   final ScrollController _scrollController = ScrollController();
// // // // // //   List<Map<String, dynamic>> _localMessages = [];

// // // // // //   @override
// // // // // //   void initState() {
// // // // // //     super.initState();
// // // // // //     // تهيئة الرسائل المحلية من ChatModel
// // // // // //     _localMessages = List.from(widget.chat.messages);
// // // // // //     // التمرير لآخر رسالة عند فتح الصفحة
// // // // // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // // // // //       if (_scrollController.hasClients) {
// // // // // //         _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
// // // // // //       }
// // // // // //     });
// // // // // //   }

// // // // // //   void _sendMessage(ChatViewModel viewModel) {
// // // // // //     if (_messageController.text.trim().isEmpty) return;

// // // // // //     // إنشاء الرسالة محليًا مع تحديد الوقت بشكل صحيح (06:23)
// // // // // //     final now = DateTime.now();
// // // // // //     final newMessage = {
// // // // // //       'text': _messageController.text.trim(),
// // // // // //       'isMe': true,
// // // // // //       'time':
// // // // // //           '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}',
// // // // // //     };

// // // // // //     // تحديث الرسائل المحلية بدون إعادة بناء الصفحة الكاملة
// // // // // //     setState(() {
// // // // // //       _localMessages.add(newMessage); // إضافة الرسالة في النهاية
// // // // // //     });

// // // // // //     // إرسال الرسالة إلى Firestore في الخلفية
// // // // // //     viewModel.sendMessage(widget.chat.id, _messageController.text.trim(), true);
// // // // // //     _messageController.clear();

// // // // // //     // التمرير لآخر رسالة
// // // // // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // // // // //       if (_scrollController.hasClients) {
// // // // // //         _scrollController.animateTo(
// // // // // //           _scrollController.position.maxScrollExtent,
// // // // // //           duration: const Duration(milliseconds: 300),
// // // // // //           curve: Curves.easeOut,
// // // // // //         );
// // // // // //       }
// // // // // //     });
// // // // // //   }

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     // فصل الـ AppBar عن الـ Consumer
// // // // // //     final appBar = AppBar(
// // // // // //       backgroundColor: AppColors.primaryColor,
// // // // // //       elevation: 0,
// // // // // //       leading: IconButton(
// // // // // //         icon: const Icon(Icons.arrow_back, color: Colors.white),
// // // // // //         onPressed: () => Navigator.pop(context),
// // // // // //       ),
// // // // // //       title: Row(
// // // // // //         children: [
// // // // // //           CircleAvatar(
// // // // // //             backgroundImage: (widget.chat.avatar.startsWith('file://') ||
// // // // // //                     File(widget.chat.avatar).existsSync())
// // // // // //                 ? FileImage(File(widget.chat.avatar))
// // // // // //                 : NetworkImage(widget.chat.avatar.isNotEmpty
// // // // // //                     ? widget.chat.avatar
// // // // // //                     : 'https://via.placeholder.com/150'),
// // // // // //             radius: 20,
// // // // // //           ),
// // // // // //           const SizedBox(width: 10),
// // // // // //           Expanded(
// // // // // //             child: Text(
// // // // // //               widget.chat.name,
// // // // // //               style: const TextStyle(
// // // // // //                 fontSize: 20,
// // // // // //                 fontWeight: FontWeight.bold,
// // // // // //                 color: Colors.white,
// // // // // //               ),
// // // // // //               overflow: TextOverflow.ellipsis,
// // // // // //               maxLines: 1,
// // // // // //             ),
// // // // // //           ),
// // // // // //         ],
// // // // // //       ),
// // // // // //       actions: [
// // // // // //         IconButton(
// // // // // //           icon: const Icon(Icons.more_vert, color: Colors.white),
// // // // // //           onPressed: () {},
// // // // // //         ),
// // // // // //       ],
// // // // // //     );

// // // // // //     return Scaffold(
// // // // // //       backgroundColor: Colors.white,
// // // // // //       appBar: appBar,
// // // // // //       body: Column(
// // // // // //         children: [
// // // // // //           Expanded(
// // // // // //             child: ListView.builder(
// // // // // //               controller: _scrollController,
// // // // // //               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
// // // // // //               itemCount: _localMessages.length + 1, // +1 للتاريخ
// // // // // //               itemBuilder: (context, index) {
// // // // // //                 if (index == 0) {
// // // // // //                   // عرض التاريخ في الأعلى
// // // // // //                   if (_localMessages.isNotEmpty) {
// // // // // //                     final latestTime =
// // // // // //                         DateTime.now(); // يمكن تعديله لأحدث رسالة
// // // // // //                     return Center(
// // // // // //                       child: Padding(
// // // // // //                         padding: const EdgeInsets.symmetric(vertical: 10),
// // // // // //                         child: Text(
// // // // // //                           '${latestTime.day}/${latestTime.month}/${latestTime.year}',
// // // // // //                           style: const TextStyle(
// // // // // //                             fontSize: 12,
// // // // // //                             color: Colors.grey,
// // // // // //                           ),
// // // // // //                         ),
// // // // // //                       ),
// // // // // //                     );
// // // // // //                   }
// // // // // //                   return const SizedBox.shrink();
// // // // // //                 }
// // // // // //                 // عرض الرسائل
// // // // // //                 final messageIndex = index - 1;
// // // // // //                 final message = _localMessages[messageIndex];
// // // // // //                 final isMe = message['isMe'] as bool;
// // // // // //                 return ChatsBubble(
// // // // // //                   isMe: isMe,
// // // // // //                   message: message,
// // // // // //                 );
// // // // // //               },
// // // // // //             ),
// // // // // //           ),
// // // // // //           Padding(
// // // // // //             padding: const EdgeInsets.all(8.0),
// // // // // //             child: Row(
// // // // // //               children: [
// // // // // //                 Container(
// // // // // //                   width: 40,
// // // // // //                   height: 40,
// // // // // //                   decoration: const BoxDecoration(
// // // // // //                     color: AppColors.primaryColor,
// // // // // //                     shape: BoxShape.circle,
// // // // // //                   ),
// // // // // //                   child: IconButton(
// // // // // //                     icon: const Icon(
// // // // // //                       Icons.mic,
// // // // // //                       color: Colors.white,
// // // // // //                       size: 24,
// // // // // //                     ),
// // // // // //                     onPressed: () {},
// // // // // //                   ),
// // // // // //                 ),
// // // // // //                 const SizedBox(width: 5),
// // // // // //                 Expanded(
// // // // // //                   child: ChatTextField(
// // // // // //                     messageController: _messageController,
// // // // // //                   ),
// // // // // //                 ),
// // // // // //                 IconButton(
// // // // // //                   icon: const Icon(
// // // // // //                     Icons.send,
// // // // // //                     color: AppColors.primaryColor,
// // // // // //                   ),
// // // // // //                   onPressed: () => _sendMessage(
// // // // // //                       Provider.of<ChatViewModel>(context, listen: false)),
// // // // // //                 ),
// // // // // //               ],
// // // // // //             ),
// // // // // //           ),
// // // // // //         ],
// // // // // //       ),
// // // // // //     );
// // // // // //   }

// // // // // //   @override
// // // // // //   void dispose() {
// // // // // //     _messageController.dispose();
// // // // // //     _scrollController.dispose();
// // // // // //     super.dispose();
// // // // // //   }
// // // // // // }

// // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
// // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:provider/provider.dart';
// // // // // import 'dart:io';

// // // // // class ChatView extends StatefulWidget {
// // // // //   final ChatModel chat;

// // // // //   const ChatView({super.key, required this.chat});

// // // // //   @override
// // // // //   _ChatViewState createState() => _ChatViewState();
// // // // // }

// // // // // class _ChatViewState extends State<ChatView> {
// // // // //   final TextEditingController _messageController = TextEditingController();
// // // // //   final ScrollController _scrollController = ScrollController();
// // // // //   List<Map<String, dynamic>> _localMessages = [];

// // // // //   @override
// // // // //   void initState() {
// // // // //     super.initState();
// // // // //     // تهيئة الرسائل المحلية من ChatModel
// // // // //     _localMessages = List.from(widget.chat.messages.map((msg) {
// // // // //       final time = DateTime.parse(msg['time']).toString().substring(11, 16);
// // // // //       return {...msg, 'time': time}; // تحويل الـ timestamp لـ HH:MM
// // // // //     }));
// // // // //     // التمرير لآخر رسالة عند فتح الصفحة
// // // // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // // // //       if (_scrollController.hasClients) {
// // // // //         _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
// // // // //       }
// // // // //     });
// // // // //   }

// // // // //   void _sendMessage(ChatViewModel viewModel) {
// // // // //     if (_messageController.text.trim().isEmpty) return;

// // // // //     // إنشاء الرسالة محليًا مع تحديد الوقت بشكل صحيح (05:25)
// // // // //     final now = DateTime.now();
// // // // //     final newMessage = {
// // // // //       'text': _messageController.text.trim(),
// // // // //       'isMe': true,
// // // // //       'time':
// // // // //           '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}',
// // // // //     };

// // // // //     // تحديث الرسائل المحلية بدون إعادة بناء الصفحة الكاملة
// // // // //     setState(() {
// // // // //       _localMessages.add(newMessage); // إضافة الرسالة في النهاية
// // // // //     });

// // // // //     // إرسال الرسالة إلى Firestore في الخلفية مع الـ timestamp الكامل
// // // // //     final firestoreMessage = {
// // // // //       'text': _messageController.text.trim(),
// // // // //       'isMe': true,
// // // // //       'time': DateTime.now().toIso8601String(),
// // // // //     };
// // // // //     viewModel.sendMessage(widget.chat.id, _messageController.text.trim(), true);
// // // // //     _messageController.clear();

// // // // //     // التمرير لآخر رسالة
// // // // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // // // //       if (_scrollController.hasClients) {
// // // // //         _scrollController.animateTo(
// // // // //           _scrollController.position.maxScrollExtent,
// // // // //           duration: const Duration(milliseconds: 300),
// // // // //           curve: Curves.easeOut,
// // // // //         );
// // // // //       }
// // // // //     });
// // // // //   }

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     // فصل الـ AppBar عن الـ Consumer
// // // // //     final appBar = AppBar(
// // // // //       backgroundColor: AppColors.primaryColor,
// // // // //       elevation: 0,
// // // // //       leading: IconButton(
// // // // //         icon: const Icon(Icons.arrow_back, color: Colors.white),
// // // // //         onPressed: () => Navigator.pop(context),
// // // // //       ),
// // // // //       title: Row(
// // // // //         children: [
// // // // //           CircleAvatar(
// // // // //             backgroundImage: (widget.chat.avatar.startsWith('file://') ||
// // // // //                     File(widget.chat.avatar).existsSync())
// // // // //                 ? FileImage(File(widget.chat.avatar))
// // // // //                 : NetworkImage(widget.chat.avatar.isNotEmpty
// // // // //                     ? widget.chat.avatar
// // // // //                     : 'https://via.placeholder.com/150'),
// // // // //             radius: 20,
// // // // //           ),
// // // // //           const SizedBox(width: 10),
// // // // //           Expanded(
// // // // //             child: Text(
// // // // //               widget.chat.name,
// // // // //               style: const TextStyle(
// // // // //                 fontSize: 20,
// // // // //                 fontWeight: FontWeight.bold,
// // // // //                 color: Colors.white,
// // // // //               ),
// // // // //               overflow: TextOverflow.ellipsis,
// // // // //               maxLines: 1,
// // // // //             ),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //       actions: [
// // // // //         IconButton(
// // // // //           icon: const Icon(Icons.more_vert, color: Colors.white),
// // // // //           onPressed: () {},
// // // // //         ),
// // // // //       ],
// // // // //     );

// // // // //     return Scaffold(
// // // // //       backgroundColor: Colors.white,
// // // // //       appBar: appBar,
// // // // //       body: Column(
// // // // //         children: [
// // // // //           Expanded(
// // // // //             child: ListView.builder(
// // // // //               controller: _scrollController,
// // // // //               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
// // // // //               itemCount: _localMessages.length + 1, // +1 للتاريخ
// // // // //               itemBuilder: (context, index) {
// // // // //                 if (index == 0) {
// // // // //                   // عرض التاريخ في الأعلى
// // // // //                   if (_localMessages.isNotEmpty) {
// // // // //                     final latestTime = DateTime.now(); // يمكن تعديله لآخر رسالة
// // // // //                     return Center(
// // // // //                       child: Padding(
// // // // //                         padding: const EdgeInsets.symmetric(vertical: 10),
// // // // //                         child: Text(
// // // // //                           '${latestTime.day}/${latestTime.month}/${latestTime.year}',
// // // // //                           style: const TextStyle(
// // // // //                             fontSize: 12,
// // // // //                             color: Colors.grey,
// // // // //                           ),
// // // // //                         ),
// // // // //                       ),
// // // // //                     );
// // // // //                   }
// // // // //                   return const SizedBox.shrink();
// // // // //                 }
// // // // //                 // عرض الرسائل
// // // // //                 final messageIndex = index - 1;
// // // // //                 final message = _localMessages[messageIndex];
// // // // //                 final isMe = message['isMe'] as bool;
// // // // //                 return ChatsBubble(
// // // // //                   isMe: isMe,
// // // // //                   message: message,
// // // // //                 );
// // // // //               },
// // // // //             ),
// // // // //           ),
// // // // //           Padding(
// // // // //             padding: const EdgeInsets.all(8.0),
// // // // //             child: Row(
// // // // //               children: [
// // // // //                 Container(
// // // // //                   width: 40,
// // // // //                   height: 40,
// // // // //                   decoration: const BoxDecoration(
// // // // //                     color: AppColors.primaryColor,
// // // // //                     shape: BoxShape.circle,
// // // // //                   ),
// // // // //                   child: IconButton(
// // // // //                     icon: const Icon(
// // // // //                       Icons.mic,
// // // // //                       color: Colors.white,
// // // // //                       size: 24,
// // // // //                     ),
// // // // //                     onPressed: () {},
// // // // //                   ),
// // // // //                 ),
// // // // //                 const SizedBox(width: 5),
// // // // //                 Expanded(
// // // // //                   child: ChatTextField(
// // // // //                     messageController: _messageController,
// // // // //                   ),
// // // // //                 ),
// // // // //                 IconButton(
// // // // //                   icon: const Icon(
// // // // //                     Icons.send,
// // // // //                     color: AppColors.primaryColor,
// // // // //                   ),
// // // // //                   onPressed: () => _sendMessage(
// // // // //                       Provider.of<ChatViewModel>(context, listen: false)),
// // // // //                 ),
// // // // //               ],
// // // // //             ),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   @override
// // // // //   void dispose() {
// // // // //     _messageController.dispose();
// // // // //     _scrollController.dispose();
// // // // //     super.dispose();
// // // // //   }
// // // // // }

// // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
// // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:provider/provider.dart';
// // // // // import 'dart:io';

// // // // // class ChatView extends StatefulWidget {
// // // // //   final ChatModel chat;

// // // // //   const ChatView({super.key, required this.chat});

// // // // //   @override
// // // // //   _ChatViewState createState() => _ChatViewState();
// // // // // }

// // // // // class _ChatViewState extends State<ChatView> {
// // // // //   final TextEditingController _messageController = TextEditingController();
// // // // //   final ScrollController _scrollController = ScrollController();
// // // // //   List<Map<String, dynamic>> _localMessages = [];

// // // // //   @override
// // // // //   void initState() {
// // // // //     super.initState();
// // // // //     // تهيئة الرسائل المحلية من ChatModel مع تحويل الوقت لـ 12 ساعة
// // // // //     _localMessages = List.from(widget.chat.messages.map((msg) {
// // // // //       final time = DateTime.parse(msg['time']);
// // // // //       final formattedTime = _formatTo12Hour(time);
// // // // //       return {
// // // // //         ...msg,
// // // // //         'time': formattedTime
// // // // //       }; // تحويل الـ timestamp لـ HH:MM AM/PM
// // // // //     }));
// // // // //     // التمرير لآخر رسالة عند فتح الصفحة
// // // // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // // // //       if (_scrollController.hasClients) {
// // // // //         _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
// // // // //       }
// // // // //     });
// // // // //   }

// // // // //   String _formatTo12Hour(DateTime time) {
// // // // //     final hour = time.hour % 12;
// // // // //     final period = time.hour >= 12 ? 'PM' : 'AM';
// // // // //     final minute = time.minute.toString().padLeft(2, '0');
// // // // //     final displayHour = hour == 0 ? 12 : hour; // تحويل 0 إلى 12
// // // // //     return '$displayHour:$minute $period';
// // // // //   }

// // // // //   void _sendMessage(ChatViewModel viewModel) {
// // // // //     if (_messageController.text.trim().isEmpty) return;

// // // // //     // إنشاء الرسالة محليًا مع تحديد الوقت بصيغة 12 ساعة
// // // // //     final now = DateTime.now();
// // // // //     final formattedTime = _formatTo12Hour(now);
// // // // //     final newMessage = {
// // // // //       'text': _messageController.text.trim(),
// // // // //       'isMe': true,
// // // // //       'time': formattedTime,
// // // // //     };

// // // // //     // تحديث الرسائل المحلية بدون إعادة بناء الصفحة الكاملة
// // // // //     setState(() {
// // // // //       _localMessages.add(newMessage); // إضافة الرسالة في النهاية
// // // // //     });

// // // // //     // إرسال الرسالة إلى Firestore في الخلفية مع الـ timestamp الكامل
// // // // //     final firestoreMessage = {
// // // // //       'text': _messageController.text.trim(),
// // // // //       'isMe': true,
// // // // //       'time': DateTime.now().toIso8601String(),
// // // // //     };
// // // // //     viewModel.sendMessage(widget.chat.id, _messageController.text.trim(), true);
// // // // //     _messageController.clear();

// // // // //     // التمرير لآخر رسالة
// // // // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // // // //       if (_scrollController.hasClients) {
// // // // //         _scrollController.animateTo(
// // // // //           _scrollController.position.maxScrollExtent,
// // // // //           duration: const Duration(milliseconds: 300),
// // // // //           curve: Curves.easeOut,
// // // // //         );
// // // // //       }
// // // // //     });
// // // // //   }

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     // فصل الـ AppBar عن الـ Consumer
// // // // //     final appBar = AppBar(
// // // // //       backgroundColor: AppColors.primaryColor,
// // // // //       elevation: 0,
// // // // //       leading: IconButton(
// // // // //         icon: const Icon(Icons.arrow_back, color: Colors.white),
// // // // //         onPressed: () => Navigator.pop(context),
// // // // //       ),
// // // // //       title: Row(
// // // // //         children: [
// // // // //           CircleAvatar(
// // // // //             backgroundImage: (widget.chat.avatar.startsWith('file://') ||
// // // // //                     File(widget.chat.avatar).existsSync())
// // // // //                 ? FileImage(File(widget.chat.avatar))
// // // // //                 : NetworkImage(widget.chat.avatar.isNotEmpty
// // // // //                     ? widget.chat.avatar
// // // // //                     : 'https://via.placeholder.com/150'),
// // // // //             radius: 20,
// // // // //           ),
// // // // //           const SizedBox(width: 10),
// // // // //           Expanded(
// // // // //             child: Text(
// // // // //               widget.chat.name,
// // // // //               style: const TextStyle(
// // // // //                 fontSize: 20,
// // // // //                 fontWeight: FontWeight.bold,
// // // // //                 color: Colors.white,
// // // // //               ),
// // // // //               overflow: TextOverflow.ellipsis,
// // // // //               maxLines: 1,
// // // // //             ),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //       actions: [
// // // // //         IconButton(
// // // // //           icon: const Icon(Icons.more_vert, color: Colors.white),
// // // // //           onPressed: () {},
// // // // //         ),
// // // // //       ],
// // // // //     );

// // // // //     return Scaffold(
// // // // //       backgroundColor: Colors.white,
// // // // //       appBar: appBar,
// // // // //       body: Column(
// // // // //         children: [
// // // // //           Expanded(
// // // // //             child: ListView.builder(
// // // // //               controller: _scrollController,
// // // // //               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
// // // // //               itemCount: _localMessages.length + 1, // +1 للتاريخ
// // // // //               itemBuilder: (context, index) {
// // // // //                 if (index == 0) {
// // // // //                   // عرض التاريخ في الأعلى
// // // // //                   if (_localMessages.isNotEmpty) {
// // // // //                     final latestTime = DateTime.now(); // يمكن تعديله لآخر رسالة
// // // // //                     return Center(
// // // // //                       child: Padding(
// // // // //                         padding: const EdgeInsets.symmetric(vertical: 10),
// // // // //                         child: Text(
// // // // //                           '${latestTime.day}/${latestTime.month}/${latestTime.year}',
// // // // //                           style: const TextStyle(
// // // // //                             fontSize: 12,
// // // // //                             color: Colors.grey,
// // // // //                           ),
// // // // //                         ),
// // // // //                       ),
// // // // //                     );
// // // // //                   }
// // // // //                   return const SizedBox.shrink();
// // // // //                 }
// // // // //                 // عرض الرسائل
// // // // //                 final messageIndex = index - 1;
// // // // //                 final message = _localMessages[messageIndex];
// // // // //                 final isMe = message['isMe'] as bool;
// // // // //                 return ChatsBubble(
// // // // //                   isMe: isMe,
// // // // //                   message: message,
// // // // //                 );
// // // // //               },
// // // // //             ),
// // // // //           ),
// // // // //           Padding(
// // // // //             padding: const EdgeInsets.all(8.0),
// // // // //             child: Row(
// // // // //               children: [
// // // // //                 Container(
// // // // //                   width: 40,
// // // // //                   height: 40,
// // // // //                   decoration: const BoxDecoration(
// // // // //                     color: AppColors.primaryColor,
// // // // //                     shape: BoxShape.circle,
// // // // //                   ),
// // // // //                   child: IconButton(
// // // // //                     icon: const Icon(
// // // // //                       Icons.mic,
// // // // //                       color: Colors.white,
// // // // //                       size: 24,
// // // // //                     ),
// // // // //                     onPressed: () {},
// // // // //                   ),
// // // // //                 ),
// // // // //                 const SizedBox(width: 5),
// // // // //                 Expanded(
// // // // //                   child: ChatTextField(
// // // // //                     messageController: _messageController,
// // // // //                   ),
// // // // //                 ),
// // // // //                 IconButton(
// // // // //                   icon: const Icon(
// // // // //                     Icons.send,
// // // // //                     color: AppColors.primaryColor,
// // // // //                   ),
// // // // //                   onPressed: () => _sendMessage(
// // // // //                       Provider.of<ChatViewModel>(context, listen: false)),
// // // // //                 ),
// // // // //               ],
// // // // //             ),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   @override
// // // // //   void dispose() {
// // // // //     _messageController.dispose();
// // // // //     _scrollController.dispose();
// // // // //     super.dispose();
// // // // //   }
// // // // // }

// // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
// // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:flutter/scheduler.dart';
// // // // import 'package:provider/provider.dart';
// // // // import 'dart:io';

// // // // class ChatView extends StatefulWidget {
// // // //   final ChatModel chat;

// // // //   const ChatView({super.key, required this.chat});

// // // //   @override
// // // //   _ChatViewState createState() => _ChatViewState();
// // // // }

// // // // class _ChatViewState extends State<ChatView> {
// // // //   final TextEditingController _messageController = TextEditingController();
// // // //   final ScrollController _scrollController = ScrollController();
// // // //   List<Map<String, dynamic>> _localMessages = [];

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     // تهيئة الرسائل المحلية من ChatModel مع تحويل الوقت لـ 12 ساعة
// // // //     _localMessages = List.from(widget.chat.messages.map((msg) {
// // // //       final time = DateTime.parse(msg['time']);
// // // //       final formattedTime = _formatTo12Hour(time);
// // // //       return {...msg, 'time': formattedTime};
// // // //     }));

// // // //     // التمرير لآخر رسالة بعد تحميل الـ UI
// // // //     SchedulerBinding.instance.addPostFrameCallback((_) {
// // // //       _scrollToBottom(attempts: 5); // حاول 5 مرات كحد أقصى
// // // //     });
// // // //   }

// // // //   String _formatTo12Hour(DateTime time) {
// // // //     final hour = time.hour % 12;
// // // //     final period = time.hour >= 12 ? 'PM' : 'AM';
// // // //     final minute = time.minute.toString().padLeft(2, '0');
// // // //     final displayHour = hour == 0 ? 12 : hour;
// // // //     return '$displayHour:$minute $period';
// // // //   }

// // // //   void _scrollToBottom({int attempts = 5}) {
// // // //     if (attempts <= 0) return; // توقف بعد 5 محاولات

// // // //     if (_scrollController.hasClients) {
// // // //       final currentExtent = _scrollController.position.maxScrollExtent;
// // // //       _scrollController.animateTo(
// // // //         currentExtent,
// // // //         duration: const Duration(milliseconds: 300),
// // // //         curve: Curves.easeOut,
// // // //       );
// // // //       // التحقق إذا كان الـ maxScrollExtent لسه بيتغير (بمعنى إن الـ ListView لسه بترندر)
// // // //       Future.delayed(const Duration(milliseconds: 200), () {
// // // //         if (_scrollController.hasClients &&
// // // //             _scrollController.position.maxScrollExtent > currentExtent) {
// // // //           _scrollToBottom(
// // // //               attempts: attempts - 1); // إعادة المحاولة لو الـ extent اتغير
// // // //         }
// // // //       });
// // // //     } else {
// // // //       // إعادة المحاولة بعد تأخير إذا لم يكن الـ ListView جاهزًا
// // // //       Future.delayed(const Duration(milliseconds: 200), () {
// // // //         _scrollToBottom(attempts: attempts - 1);
// // // //       });
// // // //     }
// // // //   }

// // // //   void _sendMessage(ChatViewModel viewModel) {
// // // //     if (_messageController.text.trim().isEmpty) return;

// // // //     // إنشاء الرسالة محليًا مع تحديد الوقت بصيغة 12 ساعة
// // // //     final now = DateTime.now();
// // // //     final formattedTime = _formatTo12Hour(now);
// // // //     final newMessage = {
// // // //       'text': _messageController.text.trim(),
// // // //       'isMe': true,
// // // //       'time': formattedTime,
// // // //     };

// // // //     // تحديث الرسائل المحلية
// // // //     setState(() {
// // // //       _localMessages.add(newMessage);
// // // //     });

// // // //     // إرسال الرسالة إلى Firestore
// // // //     final firestoreMessage = {
// // // //       'text': _messageController.text.trim(),
// // // //       'isMe': true,
// // // //       'time': DateTime.now().toIso8601String(),
// // // //     };
// // // //     viewModel.sendMessage(widget.chat.id, _messageController.text.trim(), true);
// // // //     _messageController.clear();

// // // //     // التمرير لآخر رسالة
// // // //     SchedulerBinding.instance.addPostFrameCallback((_) {
// // // //       _scrollToBottom(attempts: 5); // حاول 5 مرات بعد إرسال الرسالة
// // // //     });
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     final appBar = AppBar(
// // // //       backgroundColor: AppColors.primaryColor,
// // // //       elevation: 0,
// // // //       leading: IconButton(
// // // //         icon: const Icon(Icons.arrow_back, color: Colors.white),
// // // //         onPressed: () => Navigator.pop(context),
// // // //       ),
// // // //       title: Row(
// // // //         children: [
// // // //           CircleAvatar(
// // // //             backgroundImage: (widget.chat.avatar.startsWith('file://') ||
// // // //                     File(widget.chat.avatar).existsSync())
// // // //                 ? FileImage(File(widget.chat.avatar))
// // // //                 : NetworkImage(widget.chat.avatar.isNotEmpty
// // // //                     ? widget.chat.avatar
// // // //                     : 'https://via.placeholder.com/150'),
// // // //             radius: 20,
// // // //           ),
// // // //           const SizedBox(width: 10),
// // // //           Expanded(
// // // //             child: Text(
// // // //               widget.chat.name,
// // // //               style: const TextStyle(
// // // //                 fontSize: 20,
// // // //                 fontWeight: FontWeight.bold,
// // // //                 color: Colors.white,
// // // //               ),
// // // //               overflow: TextOverflow.ellipsis,
// // // //               maxLines: 1,
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //       // actions: [
// // // //       //   IconButton(
// // // //       //     icon: const Icon(Icons.more_vert, color: Colors.white),
// // // //       //     onPressed: () {},
// // // //       //   ),
// // // //       // ],
// // // //     );

// // // //     return Scaffold(
// // // //       backgroundColor: Colors.white,
// // // //       appBar: appBar,
// // // //       body: Column(
// // // //         children: [
// // // //           Expanded(
// // // //             child: ListView.builder(
// // // //               controller: _scrollController,
// // // //               physics: const AlwaysScrollableScrollPhysics(),
// // // //               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
// // // //               cacheExtent:
// // // //                   1000.0, // زيادة cacheExtent لتحسين الأداء مع الرسايل الكتير
// // // //               itemCount: _localMessages.length + 1, // +1 للتاريخ
// // // //               itemBuilder: (context, index) {
// // // //                 if (index == 0) {
// // // //                   // عرض التاريخ في الأعلى
// // // //                   if (_localMessages.isNotEmpty) {
// // // //                     final latestTime = DateTime.now();
// // // //                     return Center(
// // // //                       child: Padding(
// // // //                         padding: const EdgeInsets.symmetric(vertical: 10),
// // // //                         child: Text(
// // // //                           '${latestTime.day}/${latestTime.month}/${latestTime.year}',
// // // //                           style: const TextStyle(
// // // //                             fontSize: 12,
// // // //                             color: Colors.grey,
// // // //                           ),
// // // //                         ),
// // // //                       ),
// // // //                     );
// // // //                   }
// // // //                   return const SizedBox.shrink();
// // // //                 }
// // // //                 // عرض الرسائل
// // // //                 final messageIndex = index - 1;
// // // //                 final message = _localMessages[messageIndex];
// // // //                 final isMe = message['isMe'] as bool;
// // // //                 return ChatsBubble(
// // // //                   isMe: isMe,
// // // //                   message: message,
// // // //                 );
// // // //               },
// // // //             ),
// // // //           ),
// // // //           Padding(
// // // //             padding: const EdgeInsets.all(8.0),
// // // //             child: Row(
// // // //               children: [
// // // //                 Container(
// // // //                   width: 40,
// // // //                   height: 40,
// // // //                   decoration: const BoxDecoration(
// // // //                     color: AppColors.primaryColor,
// // // //                     shape: BoxShape.circle,
// // // //                   ),
// // // //                   child: IconButton(
// // // //                     icon: const Icon(
// // // //                       Icons.mic,
// // // //                       color: Colors.white,
// // // //                       size: 24,
// // // //                     ),
// // // //                     onPressed: () {},
// // // //                   ),
// // // //                 ),
// // // //                 const SizedBox(width: 5),
// // // //                 Expanded(
// // // //                   child: ChatTextField(
// // // //                     messageController: _messageController,
// // // //                   ),
// // // //                 ),
// // // //                 IconButton(
// // // //                   icon: const Icon(
// // // //                     Icons.send,
// // // //                     color: AppColors.primaryColor,
// // // //                   ),
// // // //                   onPressed: () => _sendMessage(
// // // //                       Provider.of<ChatViewModel>(context, listen: false)),
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }

// // // //   @override
// // // //   void dispose() {
// // // //     _messageController.dispose();
// // // //     _scrollController.dispose();
// // // //     super.dispose();
// // // //   }
// // // // }

// // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // // import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
// // // import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
// // // import 'package:awesome_dialog/awesome_dialog.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter/scheduler.dart';
// // // import 'package:provider/provider.dart';
// // // import 'dart:io';

// // // class ChatView extends StatefulWidget {
// // //   final ChatModel chat;

// // //   const ChatView({super.key, required this.chat});

// // //   @override
// // //   _ChatViewState createState() => _ChatViewState();
// // // }

// // // class _ChatViewState extends State<ChatView> {
// // //   final TextEditingController _messageController = TextEditingController();
// // //   final ScrollController _scrollController = ScrollController();
// // //   List<Map<String, dynamic>> _localMessages = [];

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     // تهيئة الرسائل المحلية من ChatModel مع تحويل الوقت لـ 12 ساعة
// // //     _localMessages = List.from(widget.chat.messages.map((msg) {
// // //       final time = DateTime.parse(msg['time']);
// // //       final formattedTime = _formatTo12Hour(time);
// // //       return {
// // //         ...msg,
// // //         'time': formattedTime
// // //       };
// // //     }));

// // //     // التمرير لآخر رسالة بعد تحميل الـ UI
// // //     SchedulerBinding.instance.addPostFrameCallback((_) {
// // //       _scrollToBottom(attempts: 5);
// // //     });

// // //     // الاستماع لتحديثات الدردشة من Firestore
// // //     Provider.of<ChatViewModel>(context, listen: false)
// // //         .getChatsStream()
// // //         .listen((chats) {
// // //       final chat = chats.firstWhere((c) => c.id == widget.chat.id, orElse: () => widget.chat);
// // //       setState(() {
// // //         _localMessages = List.from(chat.messages.map((msg) {
// // //           final time = DateTime.parse(msg['time']);
// // //           final formattedTime = _formatTo12Hour(time);
// // //           return {
// // //             ...msg,
// // //             'time': formattedTime
// // //           };
// // //         }));
// // //       });
// // //       SchedulerBinding.instance.addPostFrameCallback((_) {
// // //         _scrollToBottom(attempts: 5);
// // //       });
// // //     });
// // //   }

// // //   String _formatTo12Hour(DateTime time) {
// // //     final hour = time.hour % 12;
// // //     final period = time.hour >= 12 ? 'PM' : 'AM';
// // //     final minute = time.minute.toString().padLeft(2, '0');
// // //     final displayHour = hour == 0 ? 12 : hour;
// // //     return '$displayHour:$minute $period';
// // //   }

// // //   void _scrollToBottom({int attempts = 5}) {
// // //     if (attempts <= 0) return;

// // //     if (_scrollController.hasClients) {
// // //       final currentExtent = _scrollController.position.maxScrollExtent;
// // //       _scrollController.animateTo(
// // //         currentExtent,
// // //         duration: const Duration(milliseconds: 300),
// // //         curve: Curves.easeOut,
// // //       );
// // //       Future.delayed(const Duration(milliseconds: 200), () {
// // //         if (_scrollController.hasClients &&
// // //             _scrollController.position.maxScrollExtent > currentExtent) {
// // //           _scrollToBottom(attempts: attempts - 1);
// // //         }
// // //       });
// // //     } else {
// // //       Future.delayed(const Duration(milliseconds: 200), () {
// // //         _scrollToBottom(attempts: attempts - 1);
// // //       });
// // //     }
// // //   }

// // //   void _sendMessage(ChatViewModel viewModel) {
// // //     if (_messageController.text.trim().isEmpty) return;

// // //     final now = DateTime.now();
// // //     final formattedTime = _formatTo12Hour(now);
// // //     final newMessage = {
// // //       'text': _messageController.text.trim(),
// // //       'isMe': true,
// // //       'time': formattedTime,
// // //     };

// // //     setState(() {
// // //       _localMessages.add(newMessage);
// // //     });

// // //     viewModel.sendMessage(widget.chat.id, _messageController.text.trim(), true);
// // //     _messageController.clear();

// // //     SchedulerBinding.instance.addPostFrameCallback((_) {
// // //       _scrollToBottom(attempts: 5);
// // //     });
// // //   }

// // //   void _showDeleteDialog(ChatViewModel viewModel) {
// // //     AwesomeDialog(
// // //       context: context,
// // //       dialogType: DialogType.warning,
// // //       animType: AnimType.scale,
// // //       title: 'Delete Chat',
// // //       desc: 'Are you sure you want to delete this chat?',
// // //       btnCancelOnPress: () {},
// // //       btnOkOnPress: () async {
// // //         try {
// // //           await viewModel.deleteChat(widget.chat.id);
// // //           Navigator.pop(context);
// // //         } catch (e) {
// // //           ScaffoldMessenger.of(context).showSnackBar(
// // //             SnackBar(content: Text('Failed to delete chat: $e')),
// // //           );
// // //         }
// // //       },
// // //       btnOkText: 'Delete',
// // //       btnCancelText: 'Cancel',
// // //     ).show();
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final viewModel = Provider.of<ChatViewModel>(context, listen: false);

// // //     final appBar = AppBar(
// // //       backgroundColor: AppColors.primaryColor,
// // //       elevation: 0,
// // //       leading: IconButton(
// // //         icon: const Icon(Icons.arrow_back, color: Colors.white),
// // //         onPressed: () => Navigator.pop(context),
// // //       ),
// // //       title: Row(
// // //         children: [
// // //           CircleAvatar(
// // //             backgroundImage: (widget.chat.avatar.startsWith('file://') ||
// // //                     File(widget.chat.avatar).existsSync())
// // //                 ? FileImage(File(widget.chat.avatar))
// // //                 : NetworkImage(widget.chat.avatar.isNotEmpty
// // //                     ? widget.chat.avatar
// // //                     : 'https://via.placeholder.com/150'),
// // //             radius: 20,
// // //           ),
// // //           const SizedBox(width: 10),
// // //           Expanded(
// // //             child: Text(
// // //               widget.chat.name,
// // //               style: const TextStyle(
// // //                 fontSize: 20,
// // //                 fontWeight: FontWeight.bold,
// // //                 color: Colors.white,
// // //               ),
// // //               overflow: TextOverflow.ellipsis,
// // //               maxLines: 1,
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //       actions: [
// // //         PopupMenuButton<String>(
// // //           icon: const Icon(Icons.more_vert, color: Colors.white),
// // //           onSelected: (value) {
// // //             if (value == 'delete') {
// // //               _showDeleteDialog(viewModel);
// // //             }
// // //           },
// // //           itemBuilder: (BuildContext context) => [
// // //             const PopupMenuItem<String>(
// // //               value: 'delete',
// // //               child: Text('Delete Chat'),
// // //             ),
// // //           ],
// // //         ),
// // //       ],
// // //     );

// // //     return Scaffold(
// // //       backgroundColor: Colors.white,
// // //       appBar: appBar,
// // //       body: Column(
// // //         children: [
// // //           Expanded(
// // //             child: ListView.builder(
// // //               controller: _scrollController,
// // //               physics: const AlwaysScrollableScrollPhysics(),
// // //               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
// // //               cacheExtent: 1000.0,
// // //               itemCount: _localMessages.length + 1,
// // //               itemBuilder: (context, index) {
// // //                 if (index == 0) {
// // //                   if (_localMessages.isNotEmpty) {
// // //                     final latestTime = DateTime.now();
// // //                     return Center(
// // //                       child: Padding(
// // //                         padding: const EdgeInsets.symmetric(vertical: 10),
// // //                         child: Text(
// // //                           '${latestTime.day}/${latestTime.month}/${latestTime.year}',
// // //                           style: const TextStyle(
// // //                             fontSize: 12,
// // //                             color: Colors.grey,
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     );
// // //                   }
// // //                   return const SizedBox.shrink();
// // //                 }
// // //                 final messageIndex = index - 1;
// // //                 final message = _localMessages[messageIndex];
// // //                 final isMe = message['isMe'] as bool;
// // //                 return ChatsBubble(
// // //                   isMe: isMe,
// // //                   message: message,
// // //                   chatId: widget.chat.id,
// // //                 );
// // //               },
// // //             ),
// // //           ),
// // //           Padding(
// // //             padding: const EdgeInsets.all(8.0),
// // //             child: Row(
// // //               children: [
// // //                 Container(
// // //                   width: 40,
// // //                   height: 40,
// // //                   decoration: const BoxDecoration(
// // //                     color: AppColors.primaryColor,
// // //                     shape: BoxShape.circle,
// // //                   ),
// // //                   child: IconButton(
// // //                     icon: const Icon(
// // //                       Icons.mic,
// // //                       color: Colors.white,
// // //                       size: 24,
// // //                     ),
// // //                     onPressed: () {},
// // //                   ),
// // //                 ),
// // //                 const SizedBox(width: 5),
// // //                 Expanded(
// // //                   child: ChatTextField(
// // //                     messageController: _messageController,
// // //                   ),
// // //                 ),
// // //                 IconButton(
// // //                   icon: const Icon(
// // //                     Icons.send,
// // //                     color: AppColors.primaryColor,
// // //                   ),
// // //                   onPressed: () => _sendMessage(viewModel),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _messageController.dispose();
// // //     _scrollController.dispose();
// // //     super.dispose();
// // //   }
// // // }

// // import 'package:attendance_app/core/utils/app_colors.dart';
// // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
// // import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
// // import 'package:awesome_dialog/awesome_dialog.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/scheduler.dart';
// // import 'package:provider/provider.dart';
// // import 'dart:async';
// // import 'dart:io';

// // class ChatView extends StatefulWidget {
// //   final ChatModel chat;

// //   const ChatView({super.key, required this.chat});

// //   @override
// //   _ChatViewState createState() => _ChatViewState();
// // }

// // class _ChatViewState extends State<ChatView> {
// //   final TextEditingController _messageController = TextEditingController();
// //   final ScrollController _scrollController = ScrollController();
// //   List<Map<String, dynamic>> _localMessages = [];
// //   StreamSubscription? _streamSubscription;

// //   @override
// //   void initState() {
// //     super.initState();
// //     // تهيئة الرسائل المحلية من ChatModel مع تحويل الوقت لـ 12 ساعة
// //     _localMessages = List.from(widget.chat.messages.map((msg) {
// //       final time = DateTime.parse(msg['time']);
// //       final formattedTime = _formatTo12Hour(time);
// //       return {
// //         ...msg,
// //         'time': formattedTime
// //       };
// //     }));

// //     // التمرير لآخر رسالة بعد تحميل الـ UI
// //     SchedulerBinding.instance.addPostFrameCallback((_) {
// //       _scrollToBottom(attempts: 5);
// //     });

// //     // الاستماع لتحديثات الدردشة من Firestore
// //     _streamSubscription = Provider.of<ChatViewModel>(context, listen: false)
// //         .getChatsStream()
// //         .listen(
// //       (chats) {
// //         final chat = chats.firstWhere((c) => c.id == widget.chat.id, orElse: () => widget.chat);
// //         if (mounted) {
// //           setState(() {
// //             _localMessages = List.from(chat.messages.map((msg) {
// //               final time = DateTime.parse(msg['time']);
// //               final formattedTime = _formatTo12Hour(time);
// //               return {
// //                 ...msg,
// //                 'time': formattedTime
// //               };
// //             }));
// //           });
// //           SchedulerBinding.instance.addPostFrameCallback((_) {
// //             _scrollToBottom(attempts: 5);
// //           });
// //         }
// //       },
// //       onError: (e) {
// //         if (mounted) {
// //           ScaffoldMessenger.of(context).showSnackBar(
// //             SnackBar(content: Text('Failed to load messages: $e')),
// //           );
// //         }
// //       },
// //     );
// //   }

// //   String _formatTo12Hour(DateTime time) {
// //     final hour = time.hour % 12;
// //     final period = time.hour >= 12 ? 'PM' : 'AM';
// //     final minute = time.minute.toString().padLeft(2, '0');
// //     final displayHour = hour == 0 ? 12 : hour;
// //     return '$displayHour:$minute $period';
// //   }

// //   void _scrollToBottom({int attempts = 5}) {
// //     if (attempts <= 0) return;

// //     if (_scrollController.hasClients) {
// //       final currentExtent = _scrollController.position.maxScrollExtent;
// //       _scrollController.animateTo(
// //         currentExtent,
// //         duration: const Duration(milliseconds: 300),
// //         curve: Curves.easeOut,
// //       );
// //       Future.delayed(const Duration(milliseconds: 200), () {
// //         if (_scrollController.hasClients &&
// //             _scrollController.position.maxScrollExtent > currentExtent) {
// //           _scrollToBottom(attempts: attempts - 1);
// //         }
// //       });
// //     } else {
// //       Future.delayed(const Duration(milliseconds: 200), () {
// //         _scrollToBottom(attempts: attempts - 1);
// //       });
// //     }
// //   }

// //   void _sendMessage(ChatViewModel viewModel) {
// //     if (_messageController.text.trim().isEmpty) return;

// //     final now = DateTime.now();
// //     final formattedTime = _formatTo12Hour(now);
// //     final newMessage = {
// //       'text': _messageController.text.trim(),
// //       'isMe': true,
// //       'time': formattedTime,
// //     };

// //     setState(() {
// //       _localMessages.add(newMessage);
// //     });

// //     viewModel.sendMessage(widget.chat.id, _messageController.text.trim(), true);
// //     _messageController.clear();

// //     SchedulerBinding.instance.addPostFrameCallback((_) {
// //       _scrollToBottom(attempts: 5);
// //     });
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

// //   @override
// //   Widget build(BuildContext context) {
// //     final viewModel = Provider.of<ChatViewModel>(context, listen: false);

// //     final appBar = AppBar(
// //       backgroundColor: AppColors.primaryColor,
// //       elevation: 0,
// //       leading: IconButton(
// //         icon: const Icon(Icons.arrow_back, color: Colors.white),
// //         onPressed: () => Navigator.pop(context),
// //       ),
// //       title: Row(
// //         children: [
// //           CircleAvatar(
// //             backgroundImage: (widget.chat.avatar.startsWith('file://') ||
// //                     File(widget.chat.avatar).existsSync())
// //                 ? FileImage(File(widget.chat.avatar))
// //                 : NetworkImage(widget.chat.avatar.isNotEmpty
// //                     ? widget.chat.avatar
// //                     : 'https://via.placeholder.com/150'),
// //             radius: 20,
// //           ),
// //           const SizedBox(width: 10),
// //           Expanded(
// //             child: Text(
// //               widget.chat.name,
// //               style: const TextStyle(
// //                 fontSize: 20,
// //                 fontWeight: FontWeight.bold,
// //                 color: Colors.white,
// //               ),
// //               overflow: TextOverflow.ellipsis,
// //               maxLines: 1,
// //             ),
// //           ),
// //         ],
// //       ),
// //       actions: [
// //         PopupMenuButton<String>(
// //           icon: const Icon(Icons.more_vert, color: Colors.white),
// //           onSelected: (value) {
// //             if (value == 'delete') {
// //               _showDeleteDialog(viewModel);
// //             }
// //           },
// //           itemBuilder: (BuildContext context) => [
// //             const PopupMenuItem<String>(
// //               value: 'delete',
// //               child: Text('Delete Chat'),
// //             ),
// //           ],
// //         ),
// //       ],
// //     );

// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: appBar,
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: ListView.builder(
// //               controller: _scrollController,
// //               physics: const AlwaysScrollableScrollPhysics(),
// //               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
// //               cacheExtent: 1000.0,
// //               itemCount: _localMessages.length + 1,
// //               itemBuilder: (context, index) {
// //                 if (index == 0) {
// //                   if (_localMessages.isNotEmpty) {
// //                     final latestTime = DateTime.now();
// //                     return Center(
// //                       child: Padding(
// //                         padding: const EdgeInsets.symmetric(vertical: 10),
// //                         child: Text(
// //                           '${latestTime.day}/${latestTime.month}/${latestTime.year}',
// //                           style: const TextStyle(
// //                             fontSize: 12,
// //                             color: Colors.grey,
// //                           ),
// //                         ),
// //                       ),
// //                     );
// //                   }
// //                   return const SizedBox.shrink();
// //                 }
// //                 final messageIndex = index - 1;
// //                 final message = _localMessages[messageIndex];
// //                 final isMe = message['isMe'] as bool;
// //                 return ChatsBubble(
// //                   isMe: isMe,
// //                   message: message,
// //                   chatId: widget.chat.id,
// //                 );
// //               },
// //             ),
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: Row(
// //               children: [
// //                 Container(
// //                   width: 40,
// //                   height: 40,
// //                   decoration: const BoxDecoration(
// //                     color: AppColors.primaryColor,
// //                     shape: BoxShape.circle,
// //                   ),
// //                   child: IconButton(
// //                     icon: const Icon(
// //                       Icons.mic,
// //                       color: Colors.white,
// //                       size: 24,
// //                     ),
// //                     onPressed: () {},
// //                   ),
// //                 ),
// //                 const SizedBox(width: 5),
// //                 Expanded(
// //                   child: ChatTextField(
// //                     messageController: _messageController,
// //                   ),
// //                 ),
// //                 IconButton(
// //                   icon: const Icon(
// //                     Icons.send,
// //                     color: AppColors.primaryColor,
// //                   ),
// //                   onPressed: () => _sendMessage(viewModel),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   @override
// //   void dispose() {
// //     _streamSubscription?.cancel();
// //     _messageController.dispose();
// //     _scrollController.dispose();
// //     super.dispose();
// //   }
// // }

// import 'package:attendance_app/core/utils/app_colors.dart';
// import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
// import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:provider/provider.dart';
// import 'dart:async';
// import 'dart:io';

// import 'package:uuid/uuid.dart';

// class ChatView extends StatefulWidget {
//   final ChatModel chat;

//   const ChatView({super.key, required this.chat});

//   @override
//   _ChatViewState createState() => _ChatViewState();
// }

// class _ChatViewState extends State<ChatView> {
//   final TextEditingController _messageController = TextEditingController();
//   final ScrollController _scrollController = ScrollController();
//   List<Map<String, dynamic>> _localMessages = [];
//   StreamSubscription? _streamSubscription;

//   @override
//   void initState() {
//     super.initState();
//     // تهيئة الرسائل المحلية من ChatModel مع تحويل الوقت لـ 12 ساعة
//     _localMessages = List.from(widget.chat.messages.map((msg) {
//       final time = DateTime.parse(msg['time']);
//       final formattedTime = _formatTo12Hour(time);
//       return {...msg, 'time': formattedTime};
//     }));

//     // التمرير لآخر رسالة بعد تحميل الـ UI
//     SchedulerBinding.instance.addPostFrameCallback((_) {
//       _scrollToBottom(attempts: 5);
//     });

//     // الاستماع لتحديثات الدردشة من Firestore
//     _streamSubscription = Provider.of<ChatViewModel>(context, listen: false)
//         .getChatsStream()
//         .listen(
//       (chats) {
//         final chat = chats.firstWhere((c) => c.id == widget.chat.id,
//             orElse: () => widget.chat);
//         if (mounted) {
//           setState(() {
//             _localMessages = List.from(chat.messages.map((msg) {
//               final time = DateTime.parse(msg['time']);
//               final formattedTime = _formatTo12Hour(time);
//               return {...msg, 'time': formattedTime};
//             }));
//           });
//           SchedulerBinding.instance.addPostFrameCallback((_) {
//             _scrollToBottom(attempts: 5);
//           });
//         }
//       },
//       onError: (e) {
//         if (mounted) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Failed to load messages: $e')),
//           );
//         }
//       },
//     );
//   }

//   String _formatTo12Hour(DateTime time) {
//     final hour = time.hour % 12;
//     final period = time.hour >= 12 ? 'PM' : 'AM';
//     final minute = time.minute.toString().padLeft(2, '0');
//     final displayHour = hour == 0 ? 12 : hour;
//     return '$displayHour:$minute $period';
//   }

//   void _scrollToBottom({int attempts = 5}) {
//     if (attempts <= 0) return;

//     if (_scrollController.hasClients) {
//       final currentExtent = _scrollController.position.maxScrollExtent;
//       _scrollController.animateTo(
//         currentExtent,
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeOut,
//       );
//       Future.delayed(const Duration(milliseconds: 200), () {
//         if (_scrollController.hasClients &&
//             _scrollController.position.maxScrollExtent > currentExtent) {
//           _scrollToBottom(attempts: attempts - 1);
//         }
//       });
//     } else {
//       Future.delayed(const Duration(milliseconds: 200), () {
//         _scrollToBottom(attempts: attempts - 1);
//       });
//     }
//   }

//   void _sendMessage(ChatViewModel viewModel) {
//     if (_messageController.text.trim().isEmpty) return;

//     final now = DateTime.now();
//     final formattedTime = _formatTo12Hour(now);
//     final newMessage = {
//       'text': _messageController.text.trim(),
//       'isMe': true,
//       'time': now.toIso8601String(),
//       'messageId': const Uuid().v4(),
//     };

//     setState(() {
//       _localMessages.add({
//         ...newMessage,
//         'time': formattedTime,
//       });
//     });

//     viewModel.sendMessage(widget.chat.id, _messageController.text.trim(), true);
//     _messageController.clear();

//     SchedulerBinding.instance.addPostFrameCallback((_) {
//       _scrollToBottom(attempts: 5);
//     });
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

//   @override
//   Widget build(BuildContext context) {
//     final viewModel = Provider.of<ChatViewModel>(context, listen: false);

//     final appBar = AppBar(
//       backgroundColor: AppColors.primaryColor,
//       elevation: 0,
//       leading: IconButton(
//         icon: const Icon(Icons.arrow_back, color: Colors.white),
//         onPressed: () => Navigator.pop(context),
//       ),
//       title: Row(
//         children: [
//           CircleAvatar(
//             backgroundImage: (widget.chat.avatar.startsWith('file://') ||
//                     File(widget.chat.avatar).existsSync())
//                 ? FileImage(File(widget.chat.avatar))
//                 : NetworkImage(widget.chat.avatar.isNotEmpty
//                     ? widget.chat.avatar
//                     : 'https://via.placeholder.com/150'),
//             radius: 20,
//           ),
//           const SizedBox(width: 10),
//           Expanded(
//             child: Text(
//               widget.chat.name,
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//               overflow: TextOverflow.ellipsis,
//               maxLines: 1,
//             ),
//           ),
//         ],
//       ),
//       actions: [
//         PopupMenuButton<String>(
//           icon: const Icon(Icons.more_vert, color: Colors.white),
//           onSelected: (value) {
//             if (value == 'delete') {
//               _showDeleteDialog(viewModel);
//             }
//           },
//           itemBuilder: (BuildContext context) => [
//             const PopupMenuItem<String>(
//               value: 'delete',
//               child: Text('Delete Chat'),
//             ),
//           ],
//         ),
//       ],
//     );

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: appBar,
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               controller: _scrollController,
//               physics: const AlwaysScrollableScrollPhysics(),
//               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//               cacheExtent: 1000.0,
//               itemCount: _localMessages.length + 1,
//               itemBuilder: (context, index) {
//                 if (index == 0) {
//                   if (_localMessages.isNotEmpty) {
//                     final latestTime = DateTime.now();
//                     return Center(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 10),
//                         child: Text(
//                           '${latestTime.day}/${latestTime.month}/${latestTime.year}',
//                           style: const TextStyle(
//                             fontSize: 12,
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ),
//                     );
//                   }
//                   return const SizedBox.shrink();
//                 }
//                 final messageIndex = index - 1;
//                 final message = _localMessages[messageIndex];
//                 final isMe = message['isMe'] as bool;
//                 return ChatsBubble(
//                   isMe: isMe,
//                   message: message,
//                   chatId: widget.chat.id,
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Container(
//                   width: 40,
//                   height: 40,
//                   decoration: const BoxDecoration(
//                     color: AppColors.primaryColor,
//                     shape: BoxShape.circle,
//                   ),
//                   child: IconButton(
//                     icon: const Icon(
//                       Icons.mic,
//                       color: Colors.white,
//                       size: 24,
//                     ),
//                     onPressed: () {},
//                   ),
//                 ),
//                 const SizedBox(width: 5),
//                 Expanded(
//                   child: ChatTextField(
//                     messageController: _messageController,
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(
//                     Icons.send,
//                     color: AppColors.primaryColor,
//                   ),
//                   onPressed: () => _sendMessage(viewModel),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _streamSubscription?.cancel();
//     _messageController.dispose();
//     _scrollController.dispose();
//     super.dispose();
//   }
// }

import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/chats/data/models/chat_model.dart';
import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'dart:io';
import 'package:uuid/uuid.dart';

class ChatView extends StatefulWidget {
  final ChatModel chat;

  const ChatView({super.key, required this.chat});

  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<Map<String, dynamic>> _localMessages = [];
  StreamSubscription? _streamSubscription;

  @override
  void initState() {
    super.initState();
    // تهيئة الرسائل المحلية من ChatModel مع تحويل الوقت لـ 12 ساعة
    _localMessages = List.from(widget.chat.messages.map((msg) {
      final time = DateTime.parse(msg['time']);
      final formattedTime = _formatTo12Hour(time);
      return {
        ...msg,
        'time': formattedTime,
        'originalTime': msg['time'], // الاحتفاظ بالوقت الأصلي
      };
    }));

    // التمرير لآخر رسالة بعد تحميل الـ UI
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom(attempts: 5);
    });

    // الاستماع لتحديثات الدردشة من Firestore
    _streamSubscription = Provider.of<ChatViewModel>(context, listen: false)
        .getChatsStream()
        .listen(
      (chats) {
        final chat = chats.firstWhere((c) => c.id == widget.chat.id,
            orElse: () => widget.chat);
        if (mounted) {
          setState(() {
            _localMessages = List.from(chat.messages.map((msg) {
              final time = DateTime.parse(msg['time']);
              final formattedTime = _formatTo12Hour(time);
              return {
                ...msg,
                'time': formattedTime,
                'originalTime': msg['time'],
              };
            }));
          });
          SchedulerBinding.instance.addPostFrameCallback((_) {
            _scrollToBottom(attempts: 5);
          });
        }
      },
      onError: (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to load messages: $e')),
          );
        }
      },
    );
  }

  String _formatTo12Hour(DateTime time) {
    final hour = time.hour % 12;
    final period = time.hour >= 12 ? 'PM' : 'AM';
    final minute = time.minute.toString().padLeft(2, '0');
    final displayHour = hour == 0 ? 12 : hour;
    return '$displayHour:$minute $period';
  }

  void _scrollToBottom({int attempts = 5}) {
    if (attempts <= 0) return;

    if (_scrollController.hasClients) {
      final currentExtent = _scrollController.position.maxScrollExtent;
      _scrollController.animateTo(
        currentExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
      Future.delayed(const Duration(milliseconds: 200), () {
        if (_scrollController.hasClients &&
            _scrollController.position.maxScrollExtent > currentExtent) {
          _scrollToBottom(attempts: attempts - 1);
        }
      });
    } else {
      Future.delayed(const Duration(milliseconds: 200), () {
        _scrollToBottom(attempts: attempts - 1);
      });
    }
  }

  void _sendMessage(ChatViewModel viewModel) {
    if (_messageController.text.trim().isEmpty) return;

    final now = DateTime.now();
    final formattedTime = _formatTo12Hour(now);
    final newMessage = {
      'text': _messageController.text.trim(),
      'isMe': true,
      'time': formattedTime,
      'originalTime': now.toIso8601String(),
      'messageId': const Uuid().v4(),
    };

    setState(() {
      _localMessages.add(newMessage);
    });

    viewModel.sendMessage(widget.chat.id, _messageController.text.trim(), true);
    _messageController.clear();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom(attempts: 5);
    });
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

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ChatViewModel>(context, listen: false);

    final appBar = AppBar(
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      title: Row(
        children: [
          CircleAvatar(
            backgroundImage: (widget.chat.avatar.startsWith('file://') ||
                    File(widget.chat.avatar).existsSync())
                ? FileImage(File(widget.chat.avatar))
                : NetworkImage(widget.chat.avatar.isNotEmpty
                    ? widget.chat.avatar
                    : 'https://via.placeholder.com/150'),
            radius: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              widget.chat.name,
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
            }
          },
          itemBuilder: (BuildContext context) => [
            const PopupMenuItem<String>(
              value: 'delete',
              child: Text('Delete Chat'),
            ),
          ],
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              cacheExtent: 1000.0,
              itemCount: _localMessages.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  if (_localMessages.isNotEmpty) {
                    final latestTime = DateTime.now();
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          '${latestTime.day}/${latestTime.month}/${latestTime.year}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                }
                final messageIndex = index - 1;
                final message = _localMessages[messageIndex];
                final isMe = message['isMe'] as bool;
                return ChatsBubble(
                  isMe: isMe,
                  message: message,
                  chatId: widget.chat.id,
                );
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
                Expanded(
                  child: ChatTextField(
                    messageController: _messageController,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: AppColors.primaryColor,
                  ),
                  onPressed: () => _sendMessage(viewModel),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
