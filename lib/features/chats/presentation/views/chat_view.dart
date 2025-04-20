// // // // // // // // // // // // // // // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // // // // // // // // // // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // // // // // // // // // // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
// // // // // // // // // // // // // // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
// // // // // // // // // // // // // // // // // // import 'package:flutter/material.dart';

// // // // // // // // // // // // // // // // // // class ChatView extends StatefulWidget {
// // // // // // // // // // // // // // // // // //   final ChatModel chat;

// // // // // // // // // // // // // // // // // //   const ChatView({super.key, required this.chat});

// // // // // // // // // // // // // // // // // //   @override
// // // // // // // // // // // // // // // // // //   _ChatViewState createState() => _ChatViewState();
// // // // // // // // // // // // // // // // // // }

// // // // // // // // // // // // // // // // // // class _ChatViewState extends State<ChatView> {
// // // // // // // // // // // // // // // // // //   final TextEditingController _messageController = TextEditingController();
// // // // // // // // // // // // // // // // // //   final ScrollController _scrollController = ScrollController();

// // // // // // // // // // // // // // // // // //   final List<Map<String, dynamic>> _messages = [
// // // // // // // // // // // // // // // // // //     {"text": "Hey, how are you?", "isMe": true, "time": "3:00 PM"},
// // // // // // // // // // // // // // // // // //     {"text": "Good, how about you?", "isMe": false, "time": "3:01 PM"},
// // // // // // // // // // // // // // // // // //     {"text": "I’m good too!", "isMe": true, "time": "3:02 PM"},
// // // // // // // // // // // // // // // // // //     {
// // // // // // // // // // // // // // // // // //       "text": "Hey, what’s your plan for today?",
// // // // // // // // // // // // // // // // // //       "isMe": true,
// // // // // // // // // // // // // // // // // //       "time": "3:03 PM"
// // // // // // // // // // // // // // // // // //     },
// // // // // // // // // // // // // // // // // //     {"text": "Not much, just chilling. You?", "isMe": false, "time": "3:04 PM"},
// // // // // // // // // // // // // // // // // //     {
// // // // // // // // // // // // // // // // // //       "text": "I’m thinking of going out later.",
// // // // // // // // // // // // // // // // // //       "isMe": false,
// // // // // // // // // // // // // // // // // //       "time": "3:05 PM"
// // // // // // // // // // // // // // // // // //     },
// // // // // // // // // // // // // // // // // //     {
// // // // // // // // // // // // // // // // // //       "text": "Hey, what’s your plan for today?",
// // // // // // // // // // // // // // // // // //       "isMe": true,
// // // // // // // // // // // // // // // // // //       "time": "3:03 PM"
// // // // // // // // // // // // // // // // // //     },
// // // // // // // // // // // // // // // // // //   ];

// // // // // // // // // // // // // // // // // //   void _sendMessage() {
// // // // // // // // // // // // // // // // // //     if (_messageController.text.trim().isEmpty) return;

// // // // // // // // // // // // // // // // // //     setState(() {
// // // // // // // // // // // // // // // // // //       _messages.add({
// // // // // // // // // // // // // // // // // //         'text': _messageController.text.trim(),
// // // // // // // // // // // // // // // // // //         'isMe': true,
// // // // // // // // // // // // // // // // // //         'time': DateTime.now().toString().substring(11, 16),
// // // // // // // // // // // // // // // // // //       });
// // // // // // // // // // // // // // // // // //       _messageController.clear();
// // // // // // // // // // // // // // // // // //     });

// // // // // // // // // // // // // // // // // //     // 👇 التمرير لآخر رسالة بعد إرسالها
// // // // // // // // // // // // // // // // // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // // // // // // // // // // // // // // // // //       if (_scrollController.hasClients) {
// // // // // // // // // // // // // // // // // //         _scrollController.animateTo(
// // // // // // // // // // // // // // // // // //           0.0, // لأنك عامل reverse: true
// // // // // // // // // // // // // // // // // //           duration: const Duration(milliseconds: 300),
// // // // // // // // // // // // // // // // // //           curve: Curves.easeOut,
// // // // // // // // // // // // // // // // // //         );
// // // // // // // // // // // // // // // // // //       }
// // // // // // // // // // // // // // // // // //     });
// // // // // // // // // // // // // // // // // //   }

// // // // // // // // // // // // // // // // // //   @override
// // // // // // // // // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // // // // // // // // //     return Scaffold(
// // // // // // // // // // // // // // // // // //       backgroundColor: Colors.white, // الخلفية بيضاء
// // // // // // // // // // // // // // // // // //       appBar: AppBar(
// // // // // // // // // // // // // // // // // //         backgroundColor: const Color(0xFF1565C0), // لون الـ AppBar أزرق غامق
// // // // // // // // // // // // // // // // // //         elevation: 0,
// // // // // // // // // // // // // // // // // //         leading: IconButton(
// // // // // // // // // // // // // // // // // //           icon: const Icon(Icons.arrow_back, color: Colors.white),
// // // // // // // // // // // // // // // // // //           onPressed: () => Navigator.pop(context),
// // // // // // // // // // // // // // // // // //         ),
// // // // // // // // // // // // // // // // // //         title: Row(
// // // // // // // // // // // // // // // // // //           children: [
// // // // // // // // // // // // // // // // // //             CircleAvatar(
// // // // // // // // // // // // // // // // // //               backgroundImage: NetworkImage(widget.chat.avatar),
// // // // // // // // // // // // // // // // // //               radius: 20,
// // // // // // // // // // // // // // // // // //             ),
// // // // // // // // // // // // // // // // // //             const SizedBox(width: 10),
// // // // // // // // // // // // // // // // // //             Expanded(
// // // // // // // // // // // // // // // // // //               child: Text(
// // // // // // // // // // // // // // // // // //                 widget.chat.name,
// // // // // // // // // // // // // // // // // //                 style: const TextStyle(
// // // // // // // // // // // // // // // // // //                   fontSize: 20,
// // // // // // // // // // // // // // // // // //                   fontWeight: FontWeight.bold,
// // // // // // // // // // // // // // // // // //                   color: Colors.white, // لون الاسم أبيض
// // // // // // // // // // // // // // // // // //                 ),
// // // // // // // // // // // // // // // // // //                 overflow: TextOverflow.ellipsis,
// // // // // // // // // // // // // // // // // //                 maxLines: 1,
// // // // // // // // // // // // // // // // // //               ),
// // // // // // // // // // // // // // // // // //             ),
// // // // // // // // // // // // // // // // // //           ],
// // // // // // // // // // // // // // // // // //         ),
// // // // // // // // // // // // // // // // // //         actions: [
// // // // // // // // // // // // // // // // // //           IconButton(
// // // // // // // // // // // // // // // // // //             icon: const Icon(Icons.videocam, color: Colors.white),
// // // // // // // // // // // // // // // // // //             onPressed: () {},
// // // // // // // // // // // // // // // // // //           ),
// // // // // // // // // // // // // // // // // //           IconButton(
// // // // // // // // // // // // // // // // // //             icon: const Icon(Icons.call, color: Colors.white),
// // // // // // // // // // // // // // // // // //             onPressed: () {},
// // // // // // // // // // // // // // // // // //           ),
// // // // // // // // // // // // // // // // // //           IconButton(
// // // // // // // // // // // // // // // // // //             icon: const Icon(Icons.more_vert, color: Colors.white),
// // // // // // // // // // // // // // // // // //             onPressed: () {},
// // // // // // // // // // // // // // // // // //           ),
// // // // // // // // // // // // // // // // // //         ],
// // // // // // // // // // // // // // // // // //       ),
// // // // // // // // // // // // // // // // // //       body: Column(
// // // // // // // // // // // // // // // // // //         children: [
// // // // // // // // // // // // // // // // // //           Expanded(
// // // // // // // // // // // // // // // // // //             child: ListView.builder(
// // // // // // // // // // // // // // // // // //               controller: _scrollController,
// // // // // // // // // // // // // // // // // //               reverse: true, // الرسائل تبدأ من الأسفل
// // // // // // // // // // // // // // // // // //               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
// // // // // // // // // // // // // // // // // //               itemCount: _messages.length,
// // // // // // // // // // // // // // // // // //               itemBuilder: (context, index) {
// // // // // // // // // // // // // // // // // //                 final message =
// // // // // // // // // // // // // // // // // //                     _messages[_messages.length - 1 - index]; // عكس الترتيب
// // // // // // // // // // // // // // // // // //                 final isMe = message['isMe'] as bool;
// // // // // // // // // // // // // // // // // //                 return ChatsBubble(isMe: isMe, message: message);
// // // // // // // // // // // // // // // // // //               },
// // // // // // // // // // // // // // // // // //             ),
// // // // // // // // // // // // // // // // // //           ),
// // // // // // // // // // // // // // // // // //           Padding(
// // // // // // // // // // // // // // // // // //             padding: const EdgeInsets.all(8.0),
// // // // // // // // // // // // // // // // // //             child: Row(
// // // // // // // // // // // // // // // // // //               children: [
// // // // // // // // // // // // // // // // // //                 Container(
// // // // // // // // // // // // // // // // // //                   width: 40,
// // // // // // // // // // // // // // // // // //                   height: 40,
// // // // // // // // // // // // // // // // // //                   decoration: const BoxDecoration(
// // // // // // // // // // // // // // // // // //                     color: AppColors.primaryColor,
// // // // // // // // // // // // // // // // // //                     shape: BoxShape.circle,
// // // // // // // // // // // // // // // // // //                   ),
// // // // // // // // // // // // // // // // // //                   child: IconButton(
// // // // // // // // // // // // // // // // // //                     icon: const Icon(
// // // // // // // // // // // // // // // // // //                       Icons.mic,
// // // // // // // // // // // // // // // // // //                       color: Colors.white,
// // // // // // // // // // // // // // // // // //                       size: 24,
// // // // // // // // // // // // // // // // // //                     ),
// // // // // // // // // // // // // // // // // //                     onPressed: () {},
// // // // // // // // // // // // // // // // // //                   ),
// // // // // // // // // // // // // // // // // //                 ),
// // // // // // // // // // // // // // // // // //                 const SizedBox(width: 5),
// // // // // // // // // // // // // // // // // //                 ChatTextField(
// // // // // // // // // // // // // // // // // //                   messageController: _messageController,
// // // // // // // // // // // // // // // // // //                 ),
// // // // // // // // // // // // // // // // // //                 IconButton(
// // // // // // // // // // // // // // // // // //                   icon: const Icon(
// // // // // // // // // // // // // // // // // //                     Icons.send,
// // // // // // // // // // // // // // // // // //                     color: Color(0xFF1565C0),
// // // // // // // // // // // // // // // // // //                   ),
// // // // // // // // // // // // // // // // // //                   onPressed: _sendMessage,
// // // // // // // // // // // // // // // // // //                 ),
// // // // // // // // // // // // // // // // // //               ],
// // // // // // // // // // // // // // // // // //             ),
// // // // // // // // // // // // // // // // // //           ),
// // // // // // // // // // // // // // // // // //         ],
// // // // // // // // // // // // // // // // // //       ),
// // // // // // // // // // // // // // // // // //     );
// // // // // // // // // // // // // // // // // //   }
// // // // // // // // // // // // // // // // // // }

// // // // // // // // // // // // // // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // // // // // // // // // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // // // // // // // // // // // // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // // // // // // // // // // // // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
// // // // // // // // // // // // // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
// // // // // // // // // // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // // // // // // // // // import 'package:provider/provider.dart';

// // // // // // // // // // // // // // // // // class ChatView extends StatefulWidget {
// // // // // // // // // // // // // // // // //   final ChatModel chat;

// // // // // // // // // // // // // // // // //   const ChatView({super.key, required this.chat});

// // // // // // // // // // // // // // // // //   @override
// // // // // // // // // // // // // // // // //   _ChatViewState createState() => _ChatViewState();
// // // // // // // // // // // // // // // // // }

// // // // // // // // // // // // // // // // // class _ChatViewState extends State<ChatView> {
// // // // // // // // // // // // // // // // //   final TextEditingController _messageController = TextEditingController();
// // // // // // // // // // // // // // // // //   final ScrollController _scrollController = ScrollController();

// // // // // // // // // // // // // // // // //   void _sendMessage(ChatViewModel viewModel) {
// // // // // // // // // // // // // // // // //     if (_messageController.text.trim().isEmpty) return;

// // // // // // // // // // // // // // // // //     viewModel.sendMessage(widget.chat.id, _messageController.text.trim(), true);
// // // // // // // // // // // // // // // // //     _messageController.clear();

// // // // // // // // // // // // // // // // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // // // // // // // // // // // // // // // //       if (_scrollController.hasClients) {
// // // // // // // // // // // // // // // // //         _scrollController.animateTo(
// // // // // // // // // // // // // // // // //           0.0,
// // // // // // // // // // // // // // // // //           duration: const Duration(milliseconds: 300),
// // // // // // // // // // // // // // // // //           curve: Curves.easeOut,
// // // // // // // // // // // // // // // // //         );
// // // // // // // // // // // // // // // // //       }
// // // // // // // // // // // // // // // // //     });
// // // // // // // // // // // // // // // // //   }

// // // // // // // // // // // // // // // // //   @override
// // // // // // // // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // // // // // // // //     return Consumer<ChatViewModel>(
// // // // // // // // // // // // // // // // //       builder: (context, viewModel, child) {
// // // // // // // // // // // // // // // // //         return Scaffold(
// // // // // // // // // // // // // // // // //           backgroundColor: Colors.white,
// // // // // // // // // // // // // // // // //           appBar: AppBar(
// // // // // // // // // // // // // // // // //             backgroundColor: AppColors.primaryColor,
// // // // // // // // // // // // // // // // //             elevation: 0,
// // // // // // // // // // // // // // // // //             leading: IconButton(
// // // // // // // // // // // // // // // // //               icon: const Icon(Icons.arrow_back, color: Colors.white),
// // // // // // // // // // // // // // // // //               onPressed: () => Navigator.pop(context),
// // // // // // // // // // // // // // // // //             ),
// // // // // // // // // // // // // // // // //             title: Row(
// // // // // // // // // // // // // // // // //               children: [
// // // // // // // // // // // // // // // // //                 CircleAvatar(
// // // // // // // // // // // // // // // // //                   backgroundImage: NetworkImage(widget.chat.avatar),
// // // // // // // // // // // // // // // // //                   radius: 20,
// // // // // // // // // // // // // // // // //                 ),
// // // // // // // // // // // // // // // // //                 const SizedBox(width: 10),
// // // // // // // // // // // // // // // // //                 Expanded(
// // // // // // // // // // // // // // // // //                   child: Text(
// // // // // // // // // // // // // // // // //                     widget.chat.name,
// // // // // // // // // // // // // // // // //                     style: const TextStyle(
// // // // // // // // // // // // // // // // //                       fontSize: 20,
// // // // // // // // // // // // // // // // //                       fontWeight: FontWeight.bold,
// // // // // // // // // // // // // // // // //                       color: Colors.white,
// // // // // // // // // // // // // // // // //                     ),
// // // // // // // // // // // // // // // // //                     overflow: TextOverflow.ellipsis,
// // // // // // // // // // // // // // // // //                     maxLines: 1,
// // // // // // // // // // // // // // // // //                   ),
// // // // // // // // // // // // // // // // //                 ),
// // // // // // // // // // // // // // // // //               ],
// // // // // // // // // // // // // // // // //             ),
// // // // // // // // // // // // // // // // //             actions: [
// // // // // // // // // // // // // // // // //               IconButton(
// // // // // // // // // // // // // // // // //                 icon: const Icon(Icons.videocam, color: Colors.white),
// // // // // // // // // // // // // // // // //                 onPressed: () {},
// // // // // // // // // // // // // // // // //               ),
// // // // // // // // // // // // // // // // //               IconButton(
// // // // // // // // // // // // // // // // //                 icon: const Icon(Icons.call, color: Colors.white),
// // // // // // // // // // // // // // // // //                 onPressed: () {},
// // // // // // // // // // // // // // // // //               ),
// // // // // // // // // // // // // // // // //               IconButton(
// // // // // // // // // // // // // // // // //                 icon: const Icon(Icons.more_vert, color: Colors.white),
// // // // // // // // // // // // // // // // //                 onPressed: () {},
// // // // // // // // // // // // // // // // //               ),
// // // // // // // // // // // // // // // // //             ],
// // // // // // // // // // // // // // // // //           ),
// // // // // // // // // // // // // // // // //           body: Column(
// // // // // // // // // // // // // // // // //             children: [
// // // // // // // // // // // // // // // // //               Expanded(
// // // // // // // // // // // // // // // // //                 child: ListView.builder(
// // // // // // // // // // // // // // // // //                   controller: _scrollController,
// // // // // // // // // // // // // // // // //                   reverse: true,
// // // // // // // // // // // // // // // // //                   padding:
// // // // // // // // // // // // // // // // //                       const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
// // // // // // // // // // // // // // // // //                   itemCount: widget.chat.messages.length,
// // // // // // // // // // // // // // // // //                   itemBuilder: (context, index) {
// // // // // // // // // // // // // // // // //                     final message = widget
// // // // // // // // // // // // // // // // //                         .chat.messages[widget.chat.messages.length - 1 - index];
// // // // // // // // // // // // // // // // //                     final isMe = message['isMe'] as bool;
// // // // // // // // // // // // // // // // //                     return ChatsBubble(isMe: isMe, message: message);
// // // // // // // // // // // // // // // // //                   },
// // // // // // // // // // // // // // // // //                 ),
// // // // // // // // // // // // // // // // //               ),
// // // // // // // // // // // // // // // // //               Padding(
// // // // // // // // // // // // // // // // //                 padding: const EdgeInsets.all(8.0),
// // // // // // // // // // // // // // // // //                 child: Row(
// // // // // // // // // // // // // // // // //                   children: [
// // // // // // // // // // // // // // // // //                     Container(
// // // // // // // // // // // // // // // // //                       width: 40,
// // // // // // // // // // // // // // // // //                       height: 40,
// // // // // // // // // // // // // // // // //                       decoration: const BoxDecoration(
// // // // // // // // // // // // // // // // //                         color: AppColors.primaryColor,
// // // // // // // // // // // // // // // // //                         shape: BoxShape.circle,
// // // // // // // // // // // // // // // // //                       ),
// // // // // // // // // // // // // // // // //                       child: IconButton(
// // // // // // // // // // // // // // // // //                         icon: const Icon(
// // // // // // // // // // // // // // // // //                           Icons.mic,
// // // // // // // // // // // // // // // // //                           color: Colors.white,
// // // // // // // // // // // // // // // // //                           size: 24,
// // // // // // // // // // // // // // // // //                         ),
// // // // // // // // // // // // // // // // //                         onPressed: () {},
// // // // // // // // // // // // // // // // //                       ),
// // // // // // // // // // // // // // // // //                     ),
// // // // // // // // // // // // // // // // //                     const SizedBox(width: 5),
// // // // // // // // // // // // // // // // //                     Expanded(
// // // // // // // // // // // // // // // // //                       child: ChatTextField(
// // // // // // // // // // // // // // // // //                         messageController: _messageController,
// // // // // // // // // // // // // // // // //                       ),
// // // // // // // // // // // // // // // // //                     ),
// // // // // // // // // // // // // // // // //                     IconButton(
// // // // // // // // // // // // // // // // //                       icon: const Icon(
// // // // // // // // // // // // // // // // //                         Icons.send,
// // // // // // // // // // // // // // // // //                         color: AppColors.primaryColor,
// // // // // // // // // // // // // // // // //                       ),
// // // // // // // // // // // // // // // // //                       onPressed: () => _sendMessage(viewModel),
// // // // // // // // // // // // // // // // //                     ),
// // // // // // // // // // // // // // // // //                   ],
// // // // // // // // // // // // // // // // //                 ),
// // // // // // // // // // // // // // // // //               ),
// // // // // // // // // // // // // // // // //             ],
// // // // // // // // // // // // // // // // //           ),
// // // // // // // // // // // // // // // // //         );
// // // // // // // // // // // // // // // // //       },
// // // // // // // // // // // // // // // // //     );
// // // // // // // // // // // // // // // // //   }
// // // // // // // // // // // // // // // // // }

// // // // // // // // // // // // // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // // // // // // // // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // // // // // // // // // // // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // // // // // // // // // // // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
// // // // // // // // // // // // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
// // // // // // // // // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // // // // // // // // import 'package:provider/provider.dart';
// // // // // // // // // // // // // // // // import 'dart:io';

// // // // // // // // // // // // // // // // class ChatView extends StatefulWidget {
// // // // // // // // // // // // // // // //   final ChatModel chat;

// // // // // // // // // // // // // // // //   const ChatView({super.key, required this.chat});

// // // // // // // // // // // // // // // //   @override
// // // // // // // // // // // // // // // //   _ChatViewState createState() => _ChatViewState();
// // // // // // // // // // // // // // // // }

// // // // // // // // // // // // // // // // class _ChatViewState extends State<ChatView> {
// // // // // // // // // // // // // // // //   final TextEditingController _messageController = TextEditingController();
// // // // // // // // // // // // // // // //   final ScrollController _scrollController = ScrollController();

// // // // // // // // // // // // // // // //   void _sendMessage(ChatViewModel viewModel) {
// // // // // // // // // // // // // // // //     if (_messageController.text.trim().isEmpty) return;

// // // // // // // // // // // // // // // //     viewModel.sendMessage(widget.chat.id, _messageController.text.trim(), true);
// // // // // // // // // // // // // // // //     _messageController.clear();

// // // // // // // // // // // // // // // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // // // // // // // // // // // // // // //       if (_scrollController.hasClients) {
// // // // // // // // // // // // // // // //         _scrollController.animateTo(
// // // // // // // // // // // // // // // //           0.0,
// // // // // // // // // // // // // // // //           duration: const Duration(milliseconds: 300),
// // // // // // // // // // // // // // // //           curve: Curves.easeOut,
// // // // // // // // // // // // // // // //         );
// // // // // // // // // // // // // // // //       }
// // // // // // // // // // // // // // // //     });
// // // // // // // // // // // // // // // //   }

// // // // // // // // // // // // // // // //   @override
// // // // // // // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // // // // // // //     return Consumer<ChatViewModel>(
// // // // // // // // // // // // // // // //       builder: (context, viewModel, child) {
// // // // // // // // // // // // // // // //         return Scaffold(
// // // // // // // // // // // // // // // //           backgroundColor: Colors.white,
// // // // // // // // // // // // // // // //           appBar: AppBar(
// // // // // // // // // // // // // // // //             backgroundColor: AppColors.primaryColor,
// // // // // // // // // // // // // // // //             elevation: 0,
// // // // // // // // // // // // // // // //             leading: IconButton(
// // // // // // // // // // // // // // // //               icon: const Icon(Icons.arrow_back, color: Colors.white),
// // // // // // // // // // // // // // // //               onPressed: () => Navigator.pop(context),
// // // // // // // // // // // // // // // //             ),
// // // // // // // // // // // // // // // //             title: Row(
// // // // // // // // // // // // // // // //               children: [
// // // // // // // // // // // // // // // //                 CircleAvatar(
// // // // // // // // // // // // // // // //                   backgroundImage: (widget.chat.avatar.startsWith('file://') ||
// // // // // // // // // // // // // // // //                           File(widget.chat.avatar).existsSync())
// // // // // // // // // // // // // // // //                       ? FileImage(File(widget.chat.avatar))
// // // // // // // // // // // // // // // //                       : NetworkImage(widget.chat.avatar.isNotEmpty
// // // // // // // // // // // // // // // //                           ? widget.chat.avatar
// // // // // // // // // // // // // // // //                           : 'https://via.placeholder.com/150'),
// // // // // // // // // // // // // // // //                   radius: 20,
// // // // // // // // // // // // // // // //                 ),
// // // // // // // // // // // // // // // //                 const SizedBox(width: 10),
// // // // // // // // // // // // // // // //                 Expanded(
// // // // // // // // // // // // // // // //                   child: Text(
// // // // // // // // // // // // // // // //                     widget.chat.name,
// // // // // // // // // // // // // // // //                     style: const TextStyle(
// // // // // // // // // // // // // // // //                       fontSize: 20,
// // // // // // // // // // // // // // // //                       fontWeight: FontWeight.bold,
// // // // // // // // // // // // // // // //                       color: Colors.white,
// // // // // // // // // // // // // // // //                     ),
// // // // // // // // // // // // // // // //                     overflow: TextOverflow.ellipsis,
// // // // // // // // // // // // // // // //                     maxLines: 1,
// // // // // // // // // // // // // // // //                   ),
// // // // // // // // // // // // // // // //                 ),
// // // // // // // // // // // // // // // //               ],
// // // // // // // // // // // // // // // //             ),
// // // // // // // // // // // // // // // //             actions: [
// // // // // // // // // // // // // // // //               // IconButton(
// // // // // // // // // // // // // // // //               //   icon: const Icon(Icons.videocam, color: Colors.white),
// // // // // // // // // // // // // // // //               //   onPressed: () {},
// // // // // // // // // // // // // // // //               // ),
// // // // // // // // // // // // // // // //               // IconButton(
// // // // // // // // // // // // // // // //               //   icon: const Icon(Icons.call, color: Colors.white),
// // // // // // // // // // // // // // // //               //   onPressed: () {},
// // // // // // // // // // // // // // // //               // ),
// // // // // // // // // // // // // // // //               IconButton(
// // // // // // // // // // // // // // // //                 icon: const Icon(Icons.more_vert, color: Colors.white),
// // // // // // // // // // // // // // // //                 onPressed: () {},
// // // // // // // // // // // // // // // //               ),
// // // // // // // // // // // // // // // //             ],
// // // // // // // // // // // // // // // //           ),
// // // // // // // // // // // // // // // //           body: Column(
// // // // // // // // // // // // // // // //             children: [
// // // // // // // // // // // // // // // //               Expanded(
// // // // // // // // // // // // // // // //                 child: ListView.builder(
// // // // // // // // // // // // // // // //                   controller: _scrollController,
// // // // // // // // // // // // // // // //                   reverse: true,
// // // // // // // // // // // // // // // //                   padding:
// // // // // // // // // // // // // // // //                       const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
// // // // // // // // // // // // // // // //                   itemCount: widget.chat.messages.length,
// // // // // // // // // // // // // // // //                   itemBuilder: (context, index) {
// // // // // // // // // // // // // // // //                     final message = widget
// // // // // // // // // // // // // // // //                         .chat.messages[widget.chat.messages.length - 1 - index];
// // // // // // // // // // // // // // // //                     final isMe = message['isMe'] as bool;
// // // // // // // // // // // // // // // //                     return ChatsBubble(isMe: isMe, message: message);
// // // // // // // // // // // // // // // //                   },
// // // // // // // // // // // // // // // //                 ),
// // // // // // // // // // // // // // // //               ),
// // // // // // // // // // // // // // // //               Padding(
// // // // // // // // // // // // // // // //                 padding: const EdgeInsets.all(8.0),
// // // // // // // // // // // // // // // //                 child: Row(
// // // // // // // // // // // // // // // //                   children: [
// // // // // // // // // // // // // // // //                     Container(
// // // // // // // // // // // // // // // //                       width: 40,
// // // // // // // // // // // // // // // //                       height: 40,
// // // // // // // // // // // // // // // //                       decoration: const BoxDecoration(
// // // // // // // // // // // // // // // //                         color: AppColors.primaryColor,
// // // // // // // // // // // // // // // //                         shape: BoxShape.circle,
// // // // // // // // // // // // // // // //                       ),
// // // // // // // // // // // // // // // //                       child: IconButton(
// // // // // // // // // // // // // // // //                         icon: const Icon(
// // // // // // // // // // // // // // // //                           Icons.mic,
// // // // // // // // // // // // // // // //                           color: Colors.white,
// // // // // // // // // // // // // // // //                           size: 24,
// // // // // // // // // // // // // // // //                         ),
// // // // // // // // // // // // // // // //                         onPressed: () {},
// // // // // // // // // // // // // // // //                       ),
// // // // // // // // // // // // // // // //                     ),
// // // // // // // // // // // // // // // //                     const SizedBox(width: 5),
// // // // // // // // // // // // // // // //                     Expanded(
// // // // // // // // // // // // // // // //                       child: ChatTextField(
// // // // // // // // // // // // // // // //                         messageController: _messageController,
// // // // // // // // // // // // // // // //                       ),
// // // // // // // // // // // // // // // //                     ),
// // // // // // // // // // // // // // // //                     IconButton(
// // // // // // // // // // // // // // // //                       icon: const Icon(
// // // // // // // // // // // // // // // //                         Icons.send,
// // // // // // // // // // // // // // // //                         color: AppColors.primaryColor,
// // // // // // // // // // // // // // // //                       ),
// // // // // // // // // // // // // // // //                       onPressed: () => _sendMessage(viewModel),
// // // // // // // // // // // // // // // //                     ),
// // // // // // // // // // // // // // // //                   ],
// // // // // // // // // // // // // // // //                 ),
// // // // // // // // // // // // // // // //               ),
// // // // // // // // // // // // // // // //             ],
// // // // // // // // // // // // // // // //           ),
// // // // // // // // // // // // // // // //         );
// // // // // // // // // // // // // // // //       },
// // // // // // // // // // // // // // // //     );
// // // // // // // // // // // // // // // //   }
// // // // // // // // // // // // // // // // }

// // // // // // // // // // // // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // // // // // // // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // // // // // // // // // // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // // // // // // // // // // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
// // // // // // // // // // // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
// // // // // // // // // // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // // // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // // // // // // // import 'package:provider/provider.dart';
// // // // // // // // // // // // // // // import 'dart:io';

// // // // // // // // // // // // // // // class ChatView extends StatefulWidget {
// // // // // // // // // // // // // // //   final ChatModel chat;

// // // // // // // // // // // // // // //   const ChatView({super.key, required this.chat});

// // // // // // // // // // // // // // //   @override
// // // // // // // // // // // // // // //   _ChatViewState createState() => _ChatViewState();
// // // // // // // // // // // // // // // }

// // // // // // // // // // // // // // // class _ChatViewState extends State<ChatView> {
// // // // // // // // // // // // // // //   final TextEditingController _messageController = TextEditingController();
// // // // // // // // // // // // // // //   final ScrollController _scrollController = ScrollController();

// // // // // // // // // // // // // // //   void _sendMessage(ChatViewModel viewModel) {
// // // // // // // // // // // // // // //     if (_messageController.text.trim().isEmpty) return;

// // // // // // // // // // // // // // //     viewModel.sendMessage(widget.chat.id, _messageController.text.trim(), true);
// // // // // // // // // // // // // // //     _messageController.clear();

// // // // // // // // // // // // // // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // // // // // // // // // // // // // //       if (_scrollController.hasClients) {
// // // // // // // // // // // // // // //         _scrollController.animateTo(
// // // // // // // // // // // // // // //           0.0,
// // // // // // // // // // // // // // //           duration: const Duration(milliseconds: 300),
// // // // // // // // // // // // // // //           curve: Curves.easeOut,
// // // // // // // // // // // // // // //         );
// // // // // // // // // // // // // // //       }
// // // // // // // // // // // // // // //     });
// // // // // // // // // // // // // // //   }

// // // // // // // // // // // // // // //   @override
// // // // // // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // // // // // //     return Consumer<ChatViewModel>(
// // // // // // // // // // // // // // //       builder: (context, viewModel, child) {
// // // // // // // // // // // // // // //         return Scaffold(
// // // // // // // // // // // // // // //           backgroundColor: Colors.white,
// // // // // // // // // // // // // // //           appBar: AppBar(
// // // // // // // // // // // // // // //             backgroundColor: AppColors.primaryColor,
// // // // // // // // // // // // // // //             elevation: 0,
// // // // // // // // // // // // // // //             leading: IconButton(
// // // // // // // // // // // // // // //               icon: const Icon(Icons.arrow_back, color: Colors.white),
// // // // // // // // // // // // // // //               onPressed: () => Navigator.pop(context),
// // // // // // // // // // // // // // //             ),
// // // // // // // // // // // // // // //             title: Row(
// // // // // // // // // // // // // // //               children: [
// // // // // // // // // // // // // // //                 CircleAvatar(
// // // // // // // // // // // // // // //                   backgroundImage: (widget.chat.avatar.startsWith('file://') ||
// // // // // // // // // // // // // // //                           File(widget.chat.avatar).existsSync())
// // // // // // // // // // // // // // //                       ? FileImage(File(widget.chat.avatar))
// // // // // // // // // // // // // // //                       : NetworkImage(widget.chat.avatar.isNotEmpty
// // // // // // // // // // // // // // //                           ? widget.chat.avatar
// // // // // // // // // // // // // // //                           : 'https://via.placeholder.com/150'),
// // // // // // // // // // // // // // //                   radius: 20,
// // // // // // // // // // // // // // //                 ),
// // // // // // // // // // // // // // //                 const SizedBox(width: 10),
// // // // // // // // // // // // // // //                 Expanded(
// // // // // // // // // // // // // // //                   child: Text(
// // // // // // // // // // // // // // //                     widget.chat.name,
// // // // // // // // // // // // // // //                     style: const TextStyle(
// // // // // // // // // // // // // // //                       fontSize: 20,
// // // // // // // // // // // // // // //                       fontWeight: FontWeight.bold,
// // // // // // // // // // // // // // //                       color: Colors.white,
// // // // // // // // // // // // // // //                     ),
// // // // // // // // // // // // // // //                     overflow: TextOverflow.ellipsis,
// // // // // // // // // // // // // // //                     maxLines: 1,
// // // // // // // // // // // // // // //                   ),
// // // // // // // // // // // // // // //                 ),
// // // // // // // // // // // // // // //               ],
// // // // // // // // // // // // // // //             ),
// // // // // // // // // // // // // // //             actions: [
// // // // // // // // // // // // // // //               IconButton(
// // // // // // // // // // // // // // //                 icon: const Icon(Icons.more_vert, color: Colors.white),
// // // // // // // // // // // // // // //                 onPressed: () {},
// // // // // // // // // // // // // // //               ),
// // // // // // // // // // // // // // //             ],
// // // // // // // // // // // // // // //           ),
// // // // // // // // // // // // // // //           body: StreamBuilder<DocumentSnapshot>(
// // // // // // // // // // // // // // //             stream: FirebaseFirestore.instance
// // // // // // // // // // // // // // //                 .collection('users_chats')
// // // // // // // // // // // // // // //                 .doc(widget.chat.id)
// // // // // // // // // // // // // // //                 .snapshots(),
// // // // // // // // // // // // // // //             builder: (context, snapshot) {
// // // // // // // // // // // // // // //               if (snapshot.connectionState == ConnectionState.waiting) {
// // // // // // // // // // // // // // //                 return const Center(child: CircularProgressIndicator());
// // // // // // // // // // // // // // //               }
// // // // // // // // // // // // // // //               if (snapshot.hasError) {
// // // // // // // // // // // // // // //                 return const Center(child: Text('Error fetching messages'));
// // // // // // // // // // // // // // //               }
// // // // // // // // // // // // // // //               if (!snapshot.hasData || !snapshot.data!.exists) {
// // // // // // // // // // // // // // //                 return const Center(child: Text('No messages yet'));
// // // // // // // // // // // // // // //               }

// // // // // // // // // // // // // // //               final chatData = snapshot.data!.data() as Map<String, dynamic>;
// // // // // // // // // // // // // // //               final messages =
// // // // // // // // // // // // // // //                   List<Map<String, dynamic>>.from(chatData['messages'] ?? []);

// // // // // // // // // // // // // // //               return Column(
// // // // // // // // // // // // // // //                 children: [
// // // // // // // // // // // // // // //                   Expanded(
// // // // // // // // // // // // // // //                     child: ListView.builder(
// // // // // // // // // // // // // // //                       controller: _scrollController,
// // // // // // // // // // // // // // //                       reverse: true,
// // // // // // // // // // // // // // //                       padding: const EdgeInsets.symmetric(
// // // // // // // // // // // // // // //                           vertical: 10, horizontal: 10),
// // // // // // // // // // // // // // //                       itemCount: messages.length,
// // // // // // // // // // // // // // //                       itemBuilder: (context, index) {
// // // // // // // // // // // // // // //                         final message = messages[messages.length - 1 - index];
// // // // // // // // // // // // // // //                         final isMe = message['isMe'] as bool;
// // // // // // // // // // // // // // //                         return ChatsBubble(isMe: isMe, message: message);
// // // // // // // // // // // // // // //                       },
// // // // // // // // // // // // // // //                     ),
// // // // // // // // // // // // // // //                   ),
// // // // // // // // // // // // // // //                   Padding(
// // // // // // // // // // // // // // //                     padding: const EdgeInsets.all(8.0),
// // // // // // // // // // // // // // //                     child: Row(
// // // // // // // // // // // // // // //                       children: [
// // // // // // // // // // // // // // //                         Container(
// // // // // // // // // // // // // // //                           width: 40,
// // // // // // // // // // // // // // //                           height: 40,
// // // // // // // // // // // // // // //                           decoration: const BoxDecoration(
// // // // // // // // // // // // // // //                             color: AppColors.primaryColor,
// // // // // // // // // // // // // // //                             shape: BoxShape.circle,
// // // // // // // // // // // // // // //                           ),
// // // // // // // // // // // // // // //                           child: IconButton(
// // // // // // // // // // // // // // //                             icon: const Icon(
// // // // // // // // // // // // // // //                               Icons.mic,
// // // // // // // // // // // // // // //                               color: Colors.white,
// // // // // // // // // // // // // // //                               size: 24,
// // // // // // // // // // // // // // //                             ),
// // // // // // // // // // // // // // //                             onPressed: () {},
// // // // // // // // // // // // // // //                           ),
// // // // // // // // // // // // // // //                         ),
// // // // // // // // // // // // // // //                         const SizedBox(width: 5),
// // // // // // // // // // // // // // //                         Expanded(
// // // // // // // // // // // // // // //                           child: ChatTextField(
// // // // // // // // // // // // // // //                             messageController: _messageController,
// // // // // // // // // // // // // // //                           ),
// // // // // // // // // // // // // // //                         ),
// // // // // // // // // // // // // // //                         IconButton(
// // // // // // // // // // // // // // //                           icon: const Icon(
// // // // // // // // // // // // // // //                             Icons.send,
// // // // // // // // // // // // // // //                             color: AppColors.primaryColor,
// // // // // // // // // // // // // // //                           ),
// // // // // // // // // // // // // // //                           onPressed: () => _sendMessage(viewModel),
// // // // // // // // // // // // // // //                         ),
// // // // // // // // // // // // // // //                       ],
// // // // // // // // // // // // // // //                     ),
// // // // // // // // // // // // // // //                   ),
// // // // // // // // // // // // // // //                 ],
// // // // // // // // // // // // // // //               );
// // // // // // // // // // // // // // //             },
// // // // // // // // // // // // // // //           ),
// // // // // // // // // // // // // // //         );
// // // // // // // // // // // // // // //       },
// // // // // // // // // // // // // // //     );
// // // // // // // // // // // // // // //   }

// // // // // // // // // // // // // // //   @override
// // // // // // // // // // // // // // //   void dispose() {
// // // // // // // // // // // // // // //     _messageController.dispose();
// // // // // // // // // // // // // // //     _scrollController.dispose();
// // // // // // // // // // // // // // //     super.dispose();
// // // // // // // // // // // // // // //   }
// // // // // // // // // // // // // // // }

// // // // // // // // // // // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // // // // // // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // // // // // // // // // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // // // // // // // // // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
// // // // // // // // // // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
// // // // // // // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // // // // // // import 'package:provider/provider.dart';
// // // // // // // // // // // // // // import 'dart:io';

// // // // // // // // // // // // // // class ChatView extends StatefulWidget {
// // // // // // // // // // // // // //   final ChatModel chat;

// // // // // // // // // // // // // //   const ChatView({super.key, required this.chat});

// // // // // // // // // // // // // //   @override
// // // // // // // // // // // // // //   _ChatViewState createState() => _ChatViewState();
// // // // // // // // // // // // // // }

// // // // // // // // // // // // // // class _ChatViewState extends State<ChatView> {
// // // // // // // // // // // // // //   final TextEditingController _messageController = TextEditingController();
// // // // // // // // // // // // // //   final ScrollController _scrollController = ScrollController();
// // // // // // // // // // // // // //   List<Map<String, dynamic>> _localMessages = [];

// // // // // // // // // // // // // //   @override
// // // // // // // // // // // // // //   void initState() {
// // // // // // // // // // // // // //     super.initState();
// // // // // // // // // // // // // //     // تهيئة الرسائل المحلية من ChatModel
// // // // // // // // // // // // // //     _localMessages = List.from(widget.chat.messages);
// // // // // // // // // // // // // //     // التمرير لآخر رسالة عند فتح الصفحة
// // // // // // // // // // // // // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // // // // // // // // // // // // //       if (_scrollController.hasClients) {
// // // // // // // // // // // // // //         _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
// // // // // // // // // // // // // //       }
// // // // // // // // // // // // // //     });
// // // // // // // // // // // // // //   }

// // // // // // // // // // // // // //   void _sendMessage(ChatViewModel viewModel) {
// // // // // // // // // // // // // //     if (_messageController.text.trim().isEmpty) return;

// // // // // // // // // // // // // //     // إنشاء الرسالة محليًا مع تحديد الوقت بشكل صحيح (06:23)
// // // // // // // // // // // // // //     final now = DateTime.now();
// // // // // // // // // // // // // //     final newMessage = {
// // // // // // // // // // // // // //       'text': _messageController.text.trim(),
// // // // // // // // // // // // // //       'isMe': true,
// // // // // // // // // // // // // //       'time':
// // // // // // // // // // // // // //           '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}',
// // // // // // // // // // // // // //     };

// // // // // // // // // // // // // //     // تحديث الرسائل المحلية بدون إعادة بناء الصفحة الكاملة
// // // // // // // // // // // // // //     setState(() {
// // // // // // // // // // // // // //       _localMessages.add(newMessage); // إضافة الرسالة في النهاية
// // // // // // // // // // // // // //     });

// // // // // // // // // // // // // //     // إرسال الرسالة إلى Firestore في الخلفية
// // // // // // // // // // // // // //     viewModel.sendMessage(widget.chat.id, _messageController.text.trim(), true);
// // // // // // // // // // // // // //     _messageController.clear();

// // // // // // // // // // // // // //     // التمرير لآخر رسالة
// // // // // // // // // // // // // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // // // // // // // // // // // // //       if (_scrollController.hasClients) {
// // // // // // // // // // // // // //         _scrollController.animateTo(
// // // // // // // // // // // // // //           _scrollController.position.maxScrollExtent,
// // // // // // // // // // // // // //           duration: const Duration(milliseconds: 300),
// // // // // // // // // // // // // //           curve: Curves.easeOut,
// // // // // // // // // // // // // //         );
// // // // // // // // // // // // // //       }
// // // // // // // // // // // // // //     });
// // // // // // // // // // // // // //   }

// // // // // // // // // // // // // //   @override
// // // // // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // // // // //     // فصل الـ AppBar عن الـ Consumer
// // // // // // // // // // // // // //     final appBar = AppBar(
// // // // // // // // // // // // // //       backgroundColor: AppColors.primaryColor,
// // // // // // // // // // // // // //       elevation: 0,
// // // // // // // // // // // // // //       leading: IconButton(
// // // // // // // // // // // // // //         icon: const Icon(Icons.arrow_back, color: Colors.white),
// // // // // // // // // // // // // //         onPressed: () => Navigator.pop(context),
// // // // // // // // // // // // // //       ),
// // // // // // // // // // // // // //       title: Row(
// // // // // // // // // // // // // //         children: [
// // // // // // // // // // // // // //           CircleAvatar(
// // // // // // // // // // // // // //             backgroundImage: (widget.chat.avatar.startsWith('file://') ||
// // // // // // // // // // // // // //                     File(widget.chat.avatar).existsSync())
// // // // // // // // // // // // // //                 ? FileImage(File(widget.chat.avatar))
// // // // // // // // // // // // // //                 : NetworkImage(widget.chat.avatar.isNotEmpty
// // // // // // // // // // // // // //                     ? widget.chat.avatar
// // // // // // // // // // // // // //                     : 'https://via.placeholder.com/150'),
// // // // // // // // // // // // // //             radius: 20,
// // // // // // // // // // // // // //           ),
// // // // // // // // // // // // // //           const SizedBox(width: 10),
// // // // // // // // // // // // // //           Expanded(
// // // // // // // // // // // // // //             child: Text(
// // // // // // // // // // // // // //               widget.chat.name,
// // // // // // // // // // // // // //               style: const TextStyle(
// // // // // // // // // // // // // //                 fontSize: 20,
// // // // // // // // // // // // // //                 fontWeight: FontWeight.bold,
// // // // // // // // // // // // // //                 color: Colors.white,
// // // // // // // // // // // // // //               ),
// // // // // // // // // // // // // //               overflow: TextOverflow.ellipsis,
// // // // // // // // // // // // // //               maxLines: 1,
// // // // // // // // // // // // // //             ),
// // // // // // // // // // // // // //           ),
// // // // // // // // // // // // // //         ],
// // // // // // // // // // // // // //       ),
// // // // // // // // // // // // // //       actions: [
// // // // // // // // // // // // // //         IconButton(
// // // // // // // // // // // // // //           icon: const Icon(Icons.more_vert, color: Colors.white),
// // // // // // // // // // // // // //           onPressed: () {},
// // // // // // // // // // // // // //         ),
// // // // // // // // // // // // // //       ],
// // // // // // // // // // // // // //     );

// // // // // // // // // // // // // //     return Scaffold(
// // // // // // // // // // // // // //       backgroundColor: Colors.white,
// // // // // // // // // // // // // //       appBar: appBar,
// // // // // // // // // // // // // //       body: Column(
// // // // // // // // // // // // // //         children: [
// // // // // // // // // // // // // //           Expanded(
// // // // // // // // // // // // // //             child: ListView.builder(
// // // // // // // // // // // // // //               controller: _scrollController,
// // // // // // // // // // // // // //               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
// // // // // // // // // // // // // //               itemCount: _localMessages.length + 1, // +1 للتاريخ
// // // // // // // // // // // // // //               itemBuilder: (context, index) {
// // // // // // // // // // // // // //                 if (index == 0) {
// // // // // // // // // // // // // //                   // عرض التاريخ في الأعلى
// // // // // // // // // // // // // //                   if (_localMessages.isNotEmpty) {
// // // // // // // // // // // // // //                     final latestTime =
// // // // // // // // // // // // // //                         DateTime.now(); // يمكن تعديله لأحدث رسالة
// // // // // // // // // // // // // //                     return Center(
// // // // // // // // // // // // // //                       child: Padding(
// // // // // // // // // // // // // //                         padding: const EdgeInsets.symmetric(vertical: 10),
// // // // // // // // // // // // // //                         child: Text(
// // // // // // // // // // // // // //                           '${latestTime.day}/${latestTime.month}/${latestTime.year}',
// // // // // // // // // // // // // //                           style: const TextStyle(
// // // // // // // // // // // // // //                             fontSize: 12,
// // // // // // // // // // // // // //                             color: Colors.grey,
// // // // // // // // // // // // // //                           ),
// // // // // // // // // // // // // //                         ),
// // // // // // // // // // // // // //                       ),
// // // // // // // // // // // // // //                     );
// // // // // // // // // // // // // //                   }
// // // // // // // // // // // // // //                   return const SizedBox.shrink();
// // // // // // // // // // // // // //                 }
// // // // // // // // // // // // // //                 // عرض الرسائل
// // // // // // // // // // // // // //                 final messageIndex = index - 1;
// // // // // // // // // // // // // //                 final message = _localMessages[messageIndex];
// // // // // // // // // // // // // //                 final isMe = message['isMe'] as bool;
// // // // // // // // // // // // // //                 return ChatsBubble(
// // // // // // // // // // // // // //                   isMe: isMe,
// // // // // // // // // // // // // //                   message: message,
// // // // // // // // // // // // // //                 );
// // // // // // // // // // // // // //               },
// // // // // // // // // // // // // //             ),
// // // // // // // // // // // // // //           ),
// // // // // // // // // // // // // //           Padding(
// // // // // // // // // // // // // //             padding: const EdgeInsets.all(8.0),
// // // // // // // // // // // // // //             child: Row(
// // // // // // // // // // // // // //               children: [
// // // // // // // // // // // // // //                 Container(
// // // // // // // // // // // // // //                   width: 40,
// // // // // // // // // // // // // //                   height: 40,
// // // // // // // // // // // // // //                   decoration: const BoxDecoration(
// // // // // // // // // // // // // //                     color: AppColors.primaryColor,
// // // // // // // // // // // // // //                     shape: BoxShape.circle,
// // // // // // // // // // // // // //                   ),
// // // // // // // // // // // // // //                   child: IconButton(
// // // // // // // // // // // // // //                     icon: const Icon(
// // // // // // // // // // // // // //                       Icons.mic,
// // // // // // // // // // // // // //                       color: Colors.white,
// // // // // // // // // // // // // //                       size: 24,
// // // // // // // // // // // // // //                     ),
// // // // // // // // // // // // // //                     onPressed: () {},
// // // // // // // // // // // // // //                   ),
// // // // // // // // // // // // // //                 ),
// // // // // // // // // // // // // //                 const SizedBox(width: 5),
// // // // // // // // // // // // // //                 Expanded(
// // // // // // // // // // // // // //                   child: ChatTextField(
// // // // // // // // // // // // // //                     messageController: _messageController,
// // // // // // // // // // // // // //                   ),
// // // // // // // // // // // // // //                 ),
// // // // // // // // // // // // // //                 IconButton(
// // // // // // // // // // // // // //                   icon: const Icon(
// // // // // // // // // // // // // //                     Icons.send,
// // // // // // // // // // // // // //                     color: AppColors.primaryColor,
// // // // // // // // // // // // // //                   ),
// // // // // // // // // // // // // //                   onPressed: () => _sendMessage(
// // // // // // // // // // // // // //                       Provider.of<ChatViewModel>(context, listen: false)),
// // // // // // // // // // // // // //                 ),
// // // // // // // // // // // // // //               ],
// // // // // // // // // // // // // //             ),
// // // // // // // // // // // // // //           ),
// // // // // // // // // // // // // //         ],
// // // // // // // // // // // // // //       ),
// // // // // // // // // // // // // //     );
// // // // // // // // // // // // // //   }

// // // // // // // // // // // // // //   @override
// // // // // // // // // // // // // //   void dispose() {
// // // // // // // // // // // // // //     _messageController.dispose();
// // // // // // // // // // // // // //     _scrollController.dispose();
// // // // // // // // // // // // // //     super.dispose();
// // // // // // // // // // // // // //   }
// // // // // // // // // // // // // // }

// // // // // // // // // // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // // // // // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // // // // // // // // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // // // // // // // // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
// // // // // // // // // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
// // // // // // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // // // // // import 'package:provider/provider.dart';
// // // // // // // // // // // // // import 'dart:io';

// // // // // // // // // // // // // class ChatView extends StatefulWidget {
// // // // // // // // // // // // //   final ChatModel chat;

// // // // // // // // // // // // //   const ChatView({super.key, required this.chat});

// // // // // // // // // // // // //   @override
// // // // // // // // // // // // //   _ChatViewState createState() => _ChatViewState();
// // // // // // // // // // // // // }

// // // // // // // // // // // // // class _ChatViewState extends State<ChatView> {
// // // // // // // // // // // // //   final TextEditingController _messageController = TextEditingController();
// // // // // // // // // // // // //   final ScrollController _scrollController = ScrollController();
// // // // // // // // // // // // //   List<Map<String, dynamic>> _localMessages = [];

// // // // // // // // // // // // //   @override
// // // // // // // // // // // // //   void initState() {
// // // // // // // // // // // // //     super.initState();
// // // // // // // // // // // // //     // تهيئة الرسائل المحلية من ChatModel
// // // // // // // // // // // // //     _localMessages = List.from(widget.chat.messages.map((msg) {
// // // // // // // // // // // // //       final time = DateTime.parse(msg['time']).toString().substring(11, 16);
// // // // // // // // // // // // //       return {...msg, 'time': time}; // تحويل الـ timestamp لـ HH:MM
// // // // // // // // // // // // //     }));
// // // // // // // // // // // // //     // التمرير لآخر رسالة عند فتح الصفحة
// // // // // // // // // // // // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // // // // // // // // // // // //       if (_scrollController.hasClients) {
// // // // // // // // // // // // //         _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
// // // // // // // // // // // // //       }
// // // // // // // // // // // // //     });
// // // // // // // // // // // // //   }

// // // // // // // // // // // // //   void _sendMessage(ChatViewModel viewModel) {
// // // // // // // // // // // // //     if (_messageController.text.trim().isEmpty) return;

// // // // // // // // // // // // //     // إنشاء الرسالة محليًا مع تحديد الوقت بشكل صحيح (05:25)
// // // // // // // // // // // // //     final now = DateTime.now();
// // // // // // // // // // // // //     final newMessage = {
// // // // // // // // // // // // //       'text': _messageController.text.trim(),
// // // // // // // // // // // // //       'isMe': true,
// // // // // // // // // // // // //       'time':
// // // // // // // // // // // // //           '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}',
// // // // // // // // // // // // //     };

// // // // // // // // // // // // //     // تحديث الرسائل المحلية بدون إعادة بناء الصفحة الكاملة
// // // // // // // // // // // // //     setState(() {
// // // // // // // // // // // // //       _localMessages.add(newMessage); // إضافة الرسالة في النهاية
// // // // // // // // // // // // //     });

// // // // // // // // // // // // //     // إرسال الرسالة إلى Firestore في الخلفية مع الـ timestamp الكامل
// // // // // // // // // // // // //     final firestoreMessage = {
// // // // // // // // // // // // //       'text': _messageController.text.trim(),
// // // // // // // // // // // // //       'isMe': true,
// // // // // // // // // // // // //       'time': DateTime.now().toIso8601String(),
// // // // // // // // // // // // //     };
// // // // // // // // // // // // //     viewModel.sendMessage(widget.chat.id, _messageController.text.trim(), true);
// // // // // // // // // // // // //     _messageController.clear();

// // // // // // // // // // // // //     // التمرير لآخر رسالة
// // // // // // // // // // // // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // // // // // // // // // // // //       if (_scrollController.hasClients) {
// // // // // // // // // // // // //         _scrollController.animateTo(
// // // // // // // // // // // // //           _scrollController.position.maxScrollExtent,
// // // // // // // // // // // // //           duration: const Duration(milliseconds: 300),
// // // // // // // // // // // // //           curve: Curves.easeOut,
// // // // // // // // // // // // //         );
// // // // // // // // // // // // //       }
// // // // // // // // // // // // //     });
// // // // // // // // // // // // //   }

// // // // // // // // // // // // //   @override
// // // // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // // // //     // فصل الـ AppBar عن الـ Consumer
// // // // // // // // // // // // //     final appBar = AppBar(
// // // // // // // // // // // // //       backgroundColor: AppColors.primaryColor,
// // // // // // // // // // // // //       elevation: 0,
// // // // // // // // // // // // //       leading: IconButton(
// // // // // // // // // // // // //         icon: const Icon(Icons.arrow_back, color: Colors.white),
// // // // // // // // // // // // //         onPressed: () => Navigator.pop(context),
// // // // // // // // // // // // //       ),
// // // // // // // // // // // // //       title: Row(
// // // // // // // // // // // // //         children: [
// // // // // // // // // // // // //           CircleAvatar(
// // // // // // // // // // // // //             backgroundImage: (widget.chat.avatar.startsWith('file://') ||
// // // // // // // // // // // // //                     File(widget.chat.avatar).existsSync())
// // // // // // // // // // // // //                 ? FileImage(File(widget.chat.avatar))
// // // // // // // // // // // // //                 : NetworkImage(widget.chat.avatar.isNotEmpty
// // // // // // // // // // // // //                     ? widget.chat.avatar
// // // // // // // // // // // // //                     : 'https://via.placeholder.com/150'),
// // // // // // // // // // // // //             radius: 20,
// // // // // // // // // // // // //           ),
// // // // // // // // // // // // //           const SizedBox(width: 10),
// // // // // // // // // // // // //           Expanded(
// // // // // // // // // // // // //             child: Text(
// // // // // // // // // // // // //               widget.chat.name,
// // // // // // // // // // // // //               style: const TextStyle(
// // // // // // // // // // // // //                 fontSize: 20,
// // // // // // // // // // // // //                 fontWeight: FontWeight.bold,
// // // // // // // // // // // // //                 color: Colors.white,
// // // // // // // // // // // // //               ),
// // // // // // // // // // // // //               overflow: TextOverflow.ellipsis,
// // // // // // // // // // // // //               maxLines: 1,
// // // // // // // // // // // // //             ),
// // // // // // // // // // // // //           ),
// // // // // // // // // // // // //         ],
// // // // // // // // // // // // //       ),
// // // // // // // // // // // // //       actions: [
// // // // // // // // // // // // //         IconButton(
// // // // // // // // // // // // //           icon: const Icon(Icons.more_vert, color: Colors.white),
// // // // // // // // // // // // //           onPressed: () {},
// // // // // // // // // // // // //         ),
// // // // // // // // // // // // //       ],
// // // // // // // // // // // // //     );

// // // // // // // // // // // // //     return Scaffold(
// // // // // // // // // // // // //       backgroundColor: Colors.white,
// // // // // // // // // // // // //       appBar: appBar,
// // // // // // // // // // // // //       body: Column(
// // // // // // // // // // // // //         children: [
// // // // // // // // // // // // //           Expanded(
// // // // // // // // // // // // //             child: ListView.builder(
// // // // // // // // // // // // //               controller: _scrollController,
// // // // // // // // // // // // //               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
// // // // // // // // // // // // //               itemCount: _localMessages.length + 1, // +1 للتاريخ
// // // // // // // // // // // // //               itemBuilder: (context, index) {
// // // // // // // // // // // // //                 if (index == 0) {
// // // // // // // // // // // // //                   // عرض التاريخ في الأعلى
// // // // // // // // // // // // //                   if (_localMessages.isNotEmpty) {
// // // // // // // // // // // // //                     final latestTime = DateTime.now(); // يمكن تعديله لآخر رسالة
// // // // // // // // // // // // //                     return Center(
// // // // // // // // // // // // //                       child: Padding(
// // // // // // // // // // // // //                         padding: const EdgeInsets.symmetric(vertical: 10),
// // // // // // // // // // // // //                         child: Text(
// // // // // // // // // // // // //                           '${latestTime.day}/${latestTime.month}/${latestTime.year}',
// // // // // // // // // // // // //                           style: const TextStyle(
// // // // // // // // // // // // //                             fontSize: 12,
// // // // // // // // // // // // //                             color: Colors.grey,
// // // // // // // // // // // // //                           ),
// // // // // // // // // // // // //                         ),
// // // // // // // // // // // // //                       ),
// // // // // // // // // // // // //                     );
// // // // // // // // // // // // //                   }
// // // // // // // // // // // // //                   return const SizedBox.shrink();
// // // // // // // // // // // // //                 }
// // // // // // // // // // // // //                 // عرض الرسائل
// // // // // // // // // // // // //                 final messageIndex = index - 1;
// // // // // // // // // // // // //                 final message = _localMessages[messageIndex];
// // // // // // // // // // // // //                 final isMe = message['isMe'] as bool;
// // // // // // // // // // // // //                 return ChatsBubble(
// // // // // // // // // // // // //                   isMe: isMe,
// // // // // // // // // // // // //                   message: message,
// // // // // // // // // // // // //                 );
// // // // // // // // // // // // //               },
// // // // // // // // // // // // //             ),
// // // // // // // // // // // // //           ),
// // // // // // // // // // // // //           Padding(
// // // // // // // // // // // // //             padding: const EdgeInsets.all(8.0),
// // // // // // // // // // // // //             child: Row(
// // // // // // // // // // // // //               children: [
// // // // // // // // // // // // //                 Container(
// // // // // // // // // // // // //                   width: 40,
// // // // // // // // // // // // //                   height: 40,
// // // // // // // // // // // // //                   decoration: const BoxDecoration(
// // // // // // // // // // // // //                     color: AppColors.primaryColor,
// // // // // // // // // // // // //                     shape: BoxShape.circle,
// // // // // // // // // // // // //                   ),
// // // // // // // // // // // // //                   child: IconButton(
// // // // // // // // // // // // //                     icon: const Icon(
// // // // // // // // // // // // //                       Icons.mic,
// // // // // // // // // // // // //                       color: Colors.white,
// // // // // // // // // // // // //                       size: 24,
// // // // // // // // // // // // //                     ),
// // // // // // // // // // // // //                     onPressed: () {},
// // // // // // // // // // // // //                   ),
// // // // // // // // // // // // //                 ),
// // // // // // // // // // // // //                 const SizedBox(width: 5),
// // // // // // // // // // // // //                 Expanded(
// // // // // // // // // // // // //                   child: ChatTextField(
// // // // // // // // // // // // //                     messageController: _messageController,
// // // // // // // // // // // // //                   ),
// // // // // // // // // // // // //                 ),
// // // // // // // // // // // // //                 IconButton(
// // // // // // // // // // // // //                   icon: const Icon(
// // // // // // // // // // // // //                     Icons.send,
// // // // // // // // // // // // //                     color: AppColors.primaryColor,
// // // // // // // // // // // // //                   ),
// // // // // // // // // // // // //                   onPressed: () => _sendMessage(
// // // // // // // // // // // // //                       Provider.of<ChatViewModel>(context, listen: false)),
// // // // // // // // // // // // //                 ),
// // // // // // // // // // // // //               ],
// // // // // // // // // // // // //             ),
// // // // // // // // // // // // //           ),
// // // // // // // // // // // // //         ],
// // // // // // // // // // // // //       ),
// // // // // // // // // // // // //     );
// // // // // // // // // // // // //   }

// // // // // // // // // // // // //   @override
// // // // // // // // // // // // //   void dispose() {
// // // // // // // // // // // // //     _messageController.dispose();
// // // // // // // // // // // // //     _scrollController.dispose();
// // // // // // // // // // // // //     super.dispose();
// // // // // // // // // // // // //   }
// // // // // // // // // // // // // }

// // // // // // // // // // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // // // // // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // // // // // // // // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // // // // // // // // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
// // // // // // // // // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
// // // // // // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // // // // // import 'package:provider/provider.dart';
// // // // // // // // // // // // // import 'dart:io';

// // // // // // // // // // // // // class ChatView extends StatefulWidget {
// // // // // // // // // // // // //   final ChatModel chat;

// // // // // // // // // // // // //   const ChatView({super.key, required this.chat});

// // // // // // // // // // // // //   @override
// // // // // // // // // // // // //   _ChatViewState createState() => _ChatViewState();
// // // // // // // // // // // // // }

// // // // // // // // // // // // // class _ChatViewState extends State<ChatView> {
// // // // // // // // // // // // //   final TextEditingController _messageController = TextEditingController();
// // // // // // // // // // // // //   final ScrollController _scrollController = ScrollController();
// // // // // // // // // // // // //   List<Map<String, dynamic>> _localMessages = [];

// // // // // // // // // // // // //   @override
// // // // // // // // // // // // //   void initState() {
// // // // // // // // // // // // //     super.initState();
// // // // // // // // // // // // //     // تهيئة الرسائل المحلية من ChatModel مع تحويل الوقت لـ 12 ساعة
// // // // // // // // // // // // //     _localMessages = List.from(widget.chat.messages.map((msg) {
// // // // // // // // // // // // //       final time = DateTime.parse(msg['time']);
// // // // // // // // // // // // //       final formattedTime = _formatTo12Hour(time);
// // // // // // // // // // // // //       return {
// // // // // // // // // // // // //         ...msg,
// // // // // // // // // // // // //         'time': formattedTime
// // // // // // // // // // // // //       }; // تحويل الـ timestamp لـ HH:MM AM/PM
// // // // // // // // // // // // //     }));
// // // // // // // // // // // // //     // التمرير لآخر رسالة عند فتح الصفحة
// // // // // // // // // // // // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // // // // // // // // // // // //       if (_scrollController.hasClients) {
// // // // // // // // // // // // //         _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
// // // // // // // // // // // // //       }
// // // // // // // // // // // // //     });
// // // // // // // // // // // // //   }

// // // // // // // // // // // // //   String _formatTo12Hour(DateTime time) {
// // // // // // // // // // // // //     final hour = time.hour % 12;
// // // // // // // // // // // // //     final period = time.hour >= 12 ? 'PM' : 'AM';
// // // // // // // // // // // // //     final minute = time.minute.toString().padLeft(2, '0');
// // // // // // // // // // // // //     final displayHour = hour == 0 ? 12 : hour; // تحويل 0 إلى 12
// // // // // // // // // // // // //     return '$displayHour:$minute $period';
// // // // // // // // // // // // //   }

// // // // // // // // // // // // //   void _sendMessage(ChatViewModel viewModel) {
// // // // // // // // // // // // //     if (_messageController.text.trim().isEmpty) return;

// // // // // // // // // // // // //     // إنشاء الرسالة محليًا مع تحديد الوقت بصيغة 12 ساعة
// // // // // // // // // // // // //     final now = DateTime.now();
// // // // // // // // // // // // //     final formattedTime = _formatTo12Hour(now);
// // // // // // // // // // // // //     final newMessage = {
// // // // // // // // // // // // //       'text': _messageController.text.trim(),
// // // // // // // // // // // // //       'isMe': true,
// // // // // // // // // // // // //       'time': formattedTime,
// // // // // // // // // // // // //     };

// // // // // // // // // // // // //     // تحديث الرسائل المحلية بدون إعادة بناء الصفحة الكاملة
// // // // // // // // // // // // //     setState(() {
// // // // // // // // // // // // //       _localMessages.add(newMessage); // إضافة الرسالة في النهاية
// // // // // // // // // // // // //     });

// // // // // // // // // // // // //     // إرسال الرسالة إلى Firestore في الخلفية مع الـ timestamp الكامل
// // // // // // // // // // // // //     final firestoreMessage = {
// // // // // // // // // // // // //       'text': _messageController.text.trim(),
// // // // // // // // // // // // //       'isMe': true,
// // // // // // // // // // // // //       'time': DateTime.now().toIso8601String(),
// // // // // // // // // // // // //     };
// // // // // // // // // // // // //     viewModel.sendMessage(widget.chat.id, _messageController.text.trim(), true);
// // // // // // // // // // // // //     _messageController.clear();

// // // // // // // // // // // // //     // التمرير لآخر رسالة
// // // // // // // // // // // // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // // // // // // // // // // // //       if (_scrollController.hasClients) {
// // // // // // // // // // // // //         _scrollController.animateTo(
// // // // // // // // // // // // //           _scrollController.position.maxScrollExtent,
// // // // // // // // // // // // //           duration: const Duration(milliseconds: 300),
// // // // // // // // // // // // //           curve: Curves.easeOut,
// // // // // // // // // // // // //         );
// // // // // // // // // // // // //       }
// // // // // // // // // // // // //     });
// // // // // // // // // // // // //   }

// // // // // // // // // // // // //   @override
// // // // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // // // //     // فصل الـ AppBar عن الـ Consumer
// // // // // // // // // // // // //     final appBar = AppBar(
// // // // // // // // // // // // //       backgroundColor: AppColors.primaryColor,
// // // // // // // // // // // // //       elevation: 0,
// // // // // // // // // // // // //       leading: IconButton(
// // // // // // // // // // // // //         icon: const Icon(Icons.arrow_back, color: Colors.white),
// // // // // // // // // // // // //         onPressed: () => Navigator.pop(context),
// // // // // // // // // // // // //       ),
// // // // // // // // // // // // //       title: Row(
// // // // // // // // // // // // //         children: [
// // // // // // // // // // // // //           CircleAvatar(
// // // // // // // // // // // // //             backgroundImage: (widget.chat.avatar.startsWith('file://') ||
// // // // // // // // // // // // //                     File(widget.chat.avatar).existsSync())
// // // // // // // // // // // // //                 ? FileImage(File(widget.chat.avatar))
// // // // // // // // // // // // //                 : NetworkImage(widget.chat.avatar.isNotEmpty
// // // // // // // // // // // // //                     ? widget.chat.avatar
// // // // // // // // // // // // //                     : 'https://via.placeholder.com/150'),
// // // // // // // // // // // // //             radius: 20,
// // // // // // // // // // // // //           ),
// // // // // // // // // // // // //           const SizedBox(width: 10),
// // // // // // // // // // // // //           Expanded(
// // // // // // // // // // // // //             child: Text(
// // // // // // // // // // // // //               widget.chat.name,
// // // // // // // // // // // // //               style: const TextStyle(
// // // // // // // // // // // // //                 fontSize: 20,
// // // // // // // // // // // // //                 fontWeight: FontWeight.bold,
// // // // // // // // // // // // //                 color: Colors.white,
// // // // // // // // // // // // //               ),
// // // // // // // // // // // // //               overflow: TextOverflow.ellipsis,
// // // // // // // // // // // // //               maxLines: 1,
// // // // // // // // // // // // //             ),
// // // // // // // // // // // // //           ),
// // // // // // // // // // // // //         ],
// // // // // // // // // // // // //       ),
// // // // // // // // // // // // //       actions: [
// // // // // // // // // // // // //         IconButton(
// // // // // // // // // // // // //           icon: const Icon(Icons.more_vert, color: Colors.white),
// // // // // // // // // // // // //           onPressed: () {},
// // // // // // // // // // // // //         ),
// // // // // // // // // // // // //       ],
// // // // // // // // // // // // //     );

// // // // // // // // // // // // //     return Scaffold(
// // // // // // // // // // // // //       backgroundColor: Colors.white,
// // // // // // // // // // // // //       appBar: appBar,
// // // // // // // // // // // // //       body: Column(
// // // // // // // // // // // // //         children: [
// // // // // // // // // // // // //           Expanded(
// // // // // // // // // // // // //             child: ListView.builder(
// // // // // // // // // // // // //               controller: _scrollController,
// // // // // // // // // // // // //               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
// // // // // // // // // // // // //               itemCount: _localMessages.length + 1, // +1 للتاريخ
// // // // // // // // // // // // //               itemBuilder: (context, index) {
// // // // // // // // // // // // //                 if (index == 0) {
// // // // // // // // // // // // //                   // عرض التاريخ في الأعلى
// // // // // // // // // // // // //                   if (_localMessages.isNotEmpty) {
// // // // // // // // // // // // //                     final latestTime = DateTime.now(); // يمكن تعديله لآخر رسالة
// // // // // // // // // // // // //                     return Center(
// // // // // // // // // // // // //                       child: Padding(
// // // // // // // // // // // // //                         padding: const EdgeInsets.symmetric(vertical: 10),
// // // // // // // // // // // // //                         child: Text(
// // // // // // // // // // // // //                           '${latestTime.day}/${latestTime.month}/${latestTime.year}',
// // // // // // // // // // // // //                           style: const TextStyle(
// // // // // // // // // // // // //                             fontSize: 12,
// // // // // // // // // // // // //                             color: Colors.grey,
// // // // // // // // // // // // //                           ),
// // // // // // // // // // // // //                         ),
// // // // // // // // // // // // //                       ),
// // // // // // // // // // // // //                     );
// // // // // // // // // // // // //                   }
// // // // // // // // // // // // //                   return const SizedBox.shrink();
// // // // // // // // // // // // //                 }
// // // // // // // // // // // // //                 // عرض الرسائل
// // // // // // // // // // // // //                 final messageIndex = index - 1;
// // // // // // // // // // // // //                 final message = _localMessages[messageIndex];
// // // // // // // // // // // // //                 final isMe = message['isMe'] as bool;
// // // // // // // // // // // // //                 return ChatsBubble(
// // // // // // // // // // // // //                   isMe: isMe,
// // // // // // // // // // // // //                   message: message,
// // // // // // // // // // // // //                 );
// // // // // // // // // // // // //               },
// // // // // // // // // // // // //             ),
// // // // // // // // // // // // //           ),
// // // // // // // // // // // // //           Padding(
// // // // // // // // // // // // //             padding: const EdgeInsets.all(8.0),
// // // // // // // // // // // // //             child: Row(
// // // // // // // // // // // // //               children: [
// // // // // // // // // // // // //                 Container(
// // // // // // // // // // // // //                   width: 40,
// // // // // // // // // // // // //                   height: 40,
// // // // // // // // // // // // //                   decoration: const BoxDecoration(
// // // // // // // // // // // // //                     color: AppColors.primaryColor,
// // // // // // // // // // // // //                     shape: BoxShape.circle,
// // // // // // // // // // // // //                   ),
// // // // // // // // // // // // //                   child: IconButton(
// // // // // // // // // // // // //                     icon: const Icon(
// // // // // // // // // // // // //                       Icons.mic,
// // // // // // // // // // // // //                       color: Colors.white,
// // // // // // // // // // // // //                       size: 24,
// // // // // // // // // // // // //                     ),
// // // // // // // // // // // // //                     onPressed: () {},
// // // // // // // // // // // // //                   ),
// // // // // // // // // // // // //                 ),
// // // // // // // // // // // // //                 const SizedBox(width: 5),
// // // // // // // // // // // // //                 Expanded(
// // // // // // // // // // // // //                   child: ChatTextField(
// // // // // // // // // // // // //                     messageController: _messageController,
// // // // // // // // // // // // //                   ),
// // // // // // // // // // // // //                 ),
// // // // // // // // // // // // //                 IconButton(
// // // // // // // // // // // // //                   icon: const Icon(
// // // // // // // // // // // // //                     Icons.send,
// // // // // // // // // // // // //                     color: AppColors.primaryColor,
// // // // // // // // // // // // //                   ),
// // // // // // // // // // // // //                   onPressed: () => _sendMessage(
// // // // // // // // // // // // //                       Provider.of<ChatViewModel>(context, listen: false)),
// // // // // // // // // // // // //                 ),
// // // // // // // // // // // // //               ],
// // // // // // // // // // // // //             ),
// // // // // // // // // // // // //           ),
// // // // // // // // // // // // //         ],
// // // // // // // // // // // // //       ),
// // // // // // // // // // // // //     );
// // // // // // // // // // // // //   }

// // // // // // // // // // // // //   @override
// // // // // // // // // // // // //   void dispose() {
// // // // // // // // // // // // //     _messageController.dispose();
// // // // // // // // // // // // //     _scrollController.dispose();
// // // // // // // // // // // // //     super.dispose();
// // // // // // // // // // // // //   }
// // // // // // // // // // // // // }

// // // // // // // // // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // // // // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // // // // // // // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // // // // // // // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
// // // // // // // // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
// // // // // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // // // // import 'package:flutter/scheduler.dart';
// // // // // // // // // // // // import 'package:provider/provider.dart';
// // // // // // // // // // // // import 'dart:io';

// // // // // // // // // // // // class ChatView extends StatefulWidget {
// // // // // // // // // // // //   final ChatModel chat;

// // // // // // // // // // // //   const ChatView({super.key, required this.chat});

// // // // // // // // // // // //   @override
// // // // // // // // // // // //   _ChatViewState createState() => _ChatViewState();
// // // // // // // // // // // // }

// // // // // // // // // // // // class _ChatViewState extends State<ChatView> {
// // // // // // // // // // // //   final TextEditingController _messageController = TextEditingController();
// // // // // // // // // // // //   final ScrollController _scrollController = ScrollController();
// // // // // // // // // // // //   List<Map<String, dynamic>> _localMessages = [];

// // // // // // // // // // // //   @override
// // // // // // // // // // // //   void initState() {
// // // // // // // // // // // //     super.initState();
// // // // // // // // // // // //     // تهيئة الرسائل المحلية من ChatModel مع تحويل الوقت لـ 12 ساعة
// // // // // // // // // // // //     _localMessages = List.from(widget.chat.messages.map((msg) {
// // // // // // // // // // // //       final time = DateTime.parse(msg['time']);
// // // // // // // // // // // //       final formattedTime = _formatTo12Hour(time);
// // // // // // // // // // // //       return {...msg, 'time': formattedTime};
// // // // // // // // // // // //     }));

// // // // // // // // // // // //     // التمرير لآخر رسالة بعد تحميل الـ UI
// // // // // // // // // // // //     SchedulerBinding.instance.addPostFrameCallback((_) {
// // // // // // // // // // // //       _scrollToBottom(attempts: 5); // حاول 5 مرات كحد أقصى
// // // // // // // // // // // //     });
// // // // // // // // // // // //   }

// // // // // // // // // // // //   String _formatTo12Hour(DateTime time) {
// // // // // // // // // // // //     final hour = time.hour % 12;
// // // // // // // // // // // //     final period = time.hour >= 12 ? 'PM' : 'AM';
// // // // // // // // // // // //     final minute = time.minute.toString().padLeft(2, '0');
// // // // // // // // // // // //     final displayHour = hour == 0 ? 12 : hour;
// // // // // // // // // // // //     return '$displayHour:$minute $period';
// // // // // // // // // // // //   }

// // // // // // // // // // // //   void _scrollToBottom({int attempts = 5}) {
// // // // // // // // // // // //     if (attempts <= 0) return; // توقف بعد 5 محاولات

// // // // // // // // // // // //     if (_scrollController.hasClients) {
// // // // // // // // // // // //       final currentExtent = _scrollController.position.maxScrollExtent;
// // // // // // // // // // // //       _scrollController.animateTo(
// // // // // // // // // // // //         currentExtent,
// // // // // // // // // // // //         duration: const Duration(milliseconds: 300),
// // // // // // // // // // // //         curve: Curves.easeOut,
// // // // // // // // // // // //       );
// // // // // // // // // // // //       // التحقق إذا كان الـ maxScrollExtent لسه بيتغير (بمعنى إن الـ ListView لسه بترندر)
// // // // // // // // // // // //       Future.delayed(const Duration(milliseconds: 200), () {
// // // // // // // // // // // //         if (_scrollController.hasClients &&
// // // // // // // // // // // //             _scrollController.position.maxScrollExtent > currentExtent) {
// // // // // // // // // // // //           _scrollToBottom(
// // // // // // // // // // // //               attempts: attempts - 1); // إعادة المحاولة لو الـ extent اتغير
// // // // // // // // // // // //         }
// // // // // // // // // // // //       });
// // // // // // // // // // // //     } else {
// // // // // // // // // // // //       // إعادة المحاولة بعد تأخير إذا لم يكن الـ ListView جاهزًا
// // // // // // // // // // // //       Future.delayed(const Duration(milliseconds: 200), () {
// // // // // // // // // // // //         _scrollToBottom(attempts: attempts - 1);
// // // // // // // // // // // //       });
// // // // // // // // // // // //     }
// // // // // // // // // // // //   }

// // // // // // // // // // // //   void _sendMessage(ChatViewModel viewModel) {
// // // // // // // // // // // //     if (_messageController.text.trim().isEmpty) return;

// // // // // // // // // // // //     // إنشاء الرسالة محليًا مع تحديد الوقت بصيغة 12 ساعة
// // // // // // // // // // // //     final now = DateTime.now();
// // // // // // // // // // // //     final formattedTime = _formatTo12Hour(now);
// // // // // // // // // // // //     final newMessage = {
// // // // // // // // // // // //       'text': _messageController.text.trim(),
// // // // // // // // // // // //       'isMe': true,
// // // // // // // // // // // //       'time': formattedTime,
// // // // // // // // // // // //     };

// // // // // // // // // // // //     // تحديث الرسائل المحلية
// // // // // // // // // // // //     setState(() {
// // // // // // // // // // // //       _localMessages.add(newMessage);
// // // // // // // // // // // //     });

// // // // // // // // // // // //     // إرسال الرسالة إلى Firestore
// // // // // // // // // // // //     final firestoreMessage = {
// // // // // // // // // // // //       'text': _messageController.text.trim(),
// // // // // // // // // // // //       'isMe': true,
// // // // // // // // // // // //       'time': DateTime.now().toIso8601String(),
// // // // // // // // // // // //     };
// // // // // // // // // // // //     viewModel.sendMessage(widget.chat.id, _messageController.text.trim(), true);
// // // // // // // // // // // //     _messageController.clear();

// // // // // // // // // // // //     // التمرير لآخر رسالة
// // // // // // // // // // // //     SchedulerBinding.instance.addPostFrameCallback((_) {
// // // // // // // // // // // //       _scrollToBottom(attempts: 5); // حاول 5 مرات بعد إرسال الرسالة
// // // // // // // // // // // //     });
// // // // // // // // // // // //   }

// // // // // // // // // // // //   @override
// // // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // // //     final appBar = AppBar(
// // // // // // // // // // // //       backgroundColor: AppColors.primaryColor,
// // // // // // // // // // // //       elevation: 0,
// // // // // // // // // // // //       leading: IconButton(
// // // // // // // // // // // //         icon: const Icon(Icons.arrow_back, color: Colors.white),
// // // // // // // // // // // //         onPressed: () => Navigator.pop(context),
// // // // // // // // // // // //       ),
// // // // // // // // // // // //       title: Row(
// // // // // // // // // // // //         children: [
// // // // // // // // // // // //           CircleAvatar(
// // // // // // // // // // // //             backgroundImage: (widget.chat.avatar.startsWith('file://') ||
// // // // // // // // // // // //                     File(widget.chat.avatar).existsSync())
// // // // // // // // // // // //                 ? FileImage(File(widget.chat.avatar))
// // // // // // // // // // // //                 : NetworkImage(widget.chat.avatar.isNotEmpty
// // // // // // // // // // // //                     ? widget.chat.avatar
// // // // // // // // // // // //                     : 'https://via.placeholder.com/150'),
// // // // // // // // // // // //             radius: 20,
// // // // // // // // // // // //           ),
// // // // // // // // // // // //           const SizedBox(width: 10),
// // // // // // // // // // // //           Expanded(
// // // // // // // // // // // //             child: Text(
// // // // // // // // // // // //               widget.chat.name,
// // // // // // // // // // // //               style: const TextStyle(
// // // // // // // // // // // //                 fontSize: 20,
// // // // // // // // // // // //                 fontWeight: FontWeight.bold,
// // // // // // // // // // // //                 color: Colors.white,
// // // // // // // // // // // //               ),
// // // // // // // // // // // //               overflow: TextOverflow.ellipsis,
// // // // // // // // // // // //               maxLines: 1,
// // // // // // // // // // // //             ),
// // // // // // // // // // // //           ),
// // // // // // // // // // // //         ],
// // // // // // // // // // // //       ),
// // // // // // // // // // // //       // actions: [
// // // // // // // // // // // //       //   IconButton(
// // // // // // // // // // // //       //     icon: const Icon(Icons.more_vert, color: Colors.white),
// // // // // // // // // // // //       //     onPressed: () {},
// // // // // // // // // // // //       //   ),
// // // // // // // // // // // //       // ],
// // // // // // // // // // // //     );

// // // // // // // // // // // //     return Scaffold(
// // // // // // // // // // // //       backgroundColor: Colors.white,
// // // // // // // // // // // //       appBar: appBar,
// // // // // // // // // // // //       body: Column(
// // // // // // // // // // // //         children: [
// // // // // // // // // // // //           Expanded(
// // // // // // // // // // // //             child: ListView.builder(
// // // // // // // // // // // //               controller: _scrollController,
// // // // // // // // // // // //               physics: const AlwaysScrollableScrollPhysics(),
// // // // // // // // // // // //               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
// // // // // // // // // // // //               cacheExtent:
// // // // // // // // // // // //                   1000.0, // زيادة cacheExtent لتحسين الأداء مع الرسايل الكتير
// // // // // // // // // // // //               itemCount: _localMessages.length + 1, // +1 للتاريخ
// // // // // // // // // // // //               itemBuilder: (context, index) {
// // // // // // // // // // // //                 if (index == 0) {
// // // // // // // // // // // //                   // عرض التاريخ في الأعلى
// // // // // // // // // // // //                   if (_localMessages.isNotEmpty) {
// // // // // // // // // // // //                     final latestTime = DateTime.now();
// // // // // // // // // // // //                     return Center(
// // // // // // // // // // // //                       child: Padding(
// // // // // // // // // // // //                         padding: const EdgeInsets.symmetric(vertical: 10),
// // // // // // // // // // // //                         child: Text(
// // // // // // // // // // // //                           '${latestTime.day}/${latestTime.month}/${latestTime.year}',
// // // // // // // // // // // //                           style: const TextStyle(
// // // // // // // // // // // //                             fontSize: 12,
// // // // // // // // // // // //                             color: Colors.grey,
// // // // // // // // // // // //                           ),
// // // // // // // // // // // //                         ),
// // // // // // // // // // // //                       ),
// // // // // // // // // // // //                     );
// // // // // // // // // // // //                   }
// // // // // // // // // // // //                   return const SizedBox.shrink();
// // // // // // // // // // // //                 }
// // // // // // // // // // // //                 // عرض الرسائل
// // // // // // // // // // // //                 final messageIndex = index - 1;
// // // // // // // // // // // //                 final message = _localMessages[messageIndex];
// // // // // // // // // // // //                 final isMe = message['isMe'] as bool;
// // // // // // // // // // // //                 return ChatsBubble(
// // // // // // // // // // // //                   isMe: isMe,
// // // // // // // // // // // //                   message: message,
// // // // // // // // // // // //                 );
// // // // // // // // // // // //               },
// // // // // // // // // // // //             ),
// // // // // // // // // // // //           ),
// // // // // // // // // // // //           Padding(
// // // // // // // // // // // //             padding: const EdgeInsets.all(8.0),
// // // // // // // // // // // //             child: Row(
// // // // // // // // // // // //               children: [
// // // // // // // // // // // //                 Container(
// // // // // // // // // // // //                   width: 40,
// // // // // // // // // // // //                   height: 40,
// // // // // // // // // // // //                   decoration: const BoxDecoration(
// // // // // // // // // // // //                     color: AppColors.primaryColor,
// // // // // // // // // // // //                     shape: BoxShape.circle,
// // // // // // // // // // // //                   ),
// // // // // // // // // // // //                   child: IconButton(
// // // // // // // // // // // //                     icon: const Icon(
// // // // // // // // // // // //                       Icons.mic,
// // // // // // // // // // // //                       color: Colors.white,
// // // // // // // // // // // //                       size: 24,
// // // // // // // // // // // //                     ),
// // // // // // // // // // // //                     onPressed: () {},
// // // // // // // // // // // //                   ),
// // // // // // // // // // // //                 ),
// // // // // // // // // // // //                 const SizedBox(width: 5),
// // // // // // // // // // // //                 Expanded(
// // // // // // // // // // // //                   child: ChatTextField(
// // // // // // // // // // // //                     messageController: _messageController,
// // // // // // // // // // // //                   ),
// // // // // // // // // // // //                 ),
// // // // // // // // // // // //                 IconButton(
// // // // // // // // // // // //                   icon: const Icon(
// // // // // // // // // // // //                     Icons.send,
// // // // // // // // // // // //                     color: AppColors.primaryColor,
// // // // // // // // // // // //                   ),
// // // // // // // // // // // //                   onPressed: () => _sendMessage(
// // // // // // // // // // // //                       Provider.of<ChatViewModel>(context, listen: false)),
// // // // // // // // // // // //                 ),
// // // // // // // // // // // //               ],
// // // // // // // // // // // //             ),
// // // // // // // // // // // //           ),
// // // // // // // // // // // //         ],
// // // // // // // // // // // //       ),
// // // // // // // // // // // //     );
// // // // // // // // // // // //   }

// // // // // // // // // // // //   @override
// // // // // // // // // // // //   void dispose() {
// // // // // // // // // // // //     _messageController.dispose();
// // // // // // // // // // // //     _scrollController.dispose();
// // // // // // // // // // // //     super.dispose();
// // // // // // // // // // // //   }
// // // // // // // // // // // // }

// // // // // // // // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // // // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // // // // // // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // // // // // // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
// // // // // // // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
// // // // // // // // // // // import 'package:awesome_dialog/awesome_dialog.dart';
// // // // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // // // import 'package:flutter/scheduler.dart';
// // // // // // // // // // // import 'package:provider/provider.dart';
// // // // // // // // // // // import 'dart:io';

// // // // // // // // // // // class ChatView extends StatefulWidget {
// // // // // // // // // // //   final ChatModel chat;

// // // // // // // // // // //   const ChatView({super.key, required this.chat});

// // // // // // // // // // //   @override
// // // // // // // // // // //   _ChatViewState createState() => _ChatViewState();
// // // // // // // // // // // }

// // // // // // // // // // // class _ChatViewState extends State<ChatView> {
// // // // // // // // // // //   final TextEditingController _messageController = TextEditingController();
// // // // // // // // // // //   final ScrollController _scrollController = ScrollController();
// // // // // // // // // // //   List<Map<String, dynamic>> _localMessages = [];

// // // // // // // // // // //   @override
// // // // // // // // // // //   void initState() {
// // // // // // // // // // //     super.initState();
// // // // // // // // // // //     // تهيئة الرسائل المحلية من ChatModel مع تحويل الوقت لـ 12 ساعة
// // // // // // // // // // //     _localMessages = List.from(widget.chat.messages.map((msg) {
// // // // // // // // // // //       final time = DateTime.parse(msg['time']);
// // // // // // // // // // //       final formattedTime = _formatTo12Hour(time);
// // // // // // // // // // //       return {
// // // // // // // // // // //         ...msg,
// // // // // // // // // // //         'time': formattedTime
// // // // // // // // // // //       };
// // // // // // // // // // //     }));

// // // // // // // // // // //     // التمرير لآخر رسالة بعد تحميل الـ UI
// // // // // // // // // // //     SchedulerBinding.instance.addPostFrameCallback((_) {
// // // // // // // // // // //       _scrollToBottom(attempts: 5);
// // // // // // // // // // //     });

// // // // // // // // // // //     // الاستماع لتحديثات الدردشة من Firestore
// // // // // // // // // // //     Provider.of<ChatViewModel>(context, listen: false)
// // // // // // // // // // //         .getChatsStream()
// // // // // // // // // // //         .listen((chats) {
// // // // // // // // // // //       final chat = chats.firstWhere((c) => c.id == widget.chat.id, orElse: () => widget.chat);
// // // // // // // // // // //       setState(() {
// // // // // // // // // // //         _localMessages = List.from(chat.messages.map((msg) {
// // // // // // // // // // //           final time = DateTime.parse(msg['time']);
// // // // // // // // // // //           final formattedTime = _formatTo12Hour(time);
// // // // // // // // // // //           return {
// // // // // // // // // // //             ...msg,
// // // // // // // // // // //             'time': formattedTime
// // // // // // // // // // //           };
// // // // // // // // // // //         }));
// // // // // // // // // // //       });
// // // // // // // // // // //       SchedulerBinding.instance.addPostFrameCallback((_) {
// // // // // // // // // // //         _scrollToBottom(attempts: 5);
// // // // // // // // // // //       });
// // // // // // // // // // //     });
// // // // // // // // // // //   }

// // // // // // // // // // //   String _formatTo12Hour(DateTime time) {
// // // // // // // // // // //     final hour = time.hour % 12;
// // // // // // // // // // //     final period = time.hour >= 12 ? 'PM' : 'AM';
// // // // // // // // // // //     final minute = time.minute.toString().padLeft(2, '0');
// // // // // // // // // // //     final displayHour = hour == 0 ? 12 : hour;
// // // // // // // // // // //     return '$displayHour:$minute $period';
// // // // // // // // // // //   }

// // // // // // // // // // //   void _scrollToBottom({int attempts = 5}) {
// // // // // // // // // // //     if (attempts <= 0) return;

// // // // // // // // // // //     if (_scrollController.hasClients) {
// // // // // // // // // // //       final currentExtent = _scrollController.position.maxScrollExtent;
// // // // // // // // // // //       _scrollController.animateTo(
// // // // // // // // // // //         currentExtent,
// // // // // // // // // // //         duration: const Duration(milliseconds: 300),
// // // // // // // // // // //         curve: Curves.easeOut,
// // // // // // // // // // //       );
// // // // // // // // // // //       Future.delayed(const Duration(milliseconds: 200), () {
// // // // // // // // // // //         if (_scrollController.hasClients &&
// // // // // // // // // // //             _scrollController.position.maxScrollExtent > currentExtent) {
// // // // // // // // // // //           _scrollToBottom(attempts: attempts - 1);
// // // // // // // // // // //         }
// // // // // // // // // // //       });
// // // // // // // // // // //     } else {
// // // // // // // // // // //       Future.delayed(const Duration(milliseconds: 200), () {
// // // // // // // // // // //         _scrollToBottom(attempts: attempts - 1);
// // // // // // // // // // //       });
// // // // // // // // // // //     }
// // // // // // // // // // //   }

// // // // // // // // // // //   void _sendMessage(ChatViewModel viewModel) {
// // // // // // // // // // //     if (_messageController.text.trim().isEmpty) return;

// // // // // // // // // // //     final now = DateTime.now();
// // // // // // // // // // //     final formattedTime = _formatTo12Hour(now);
// // // // // // // // // // //     final newMessage = {
// // // // // // // // // // //       'text': _messageController.text.trim(),
// // // // // // // // // // //       'isMe': true,
// // // // // // // // // // //       'time': formattedTime,
// // // // // // // // // // //     };

// // // // // // // // // // //     setState(() {
// // // // // // // // // // //       _localMessages.add(newMessage);
// // // // // // // // // // //     });

// // // // // // // // // // //     viewModel.sendMessage(widget.chat.id, _messageController.text.trim(), true);
// // // // // // // // // // //     _messageController.clear();

// // // // // // // // // // //     SchedulerBinding.instance.addPostFrameCallback((_) {
// // // // // // // // // // //       _scrollToBottom(attempts: 5);
// // // // // // // // // // //     });
// // // // // // // // // // //   }

// // // // // // // // // // //   void _showDeleteDialog(ChatViewModel viewModel) {
// // // // // // // // // // //     AwesomeDialog(
// // // // // // // // // // //       context: context,
// // // // // // // // // // //       dialogType: DialogType.warning,
// // // // // // // // // // //       animType: AnimType.scale,
// // // // // // // // // // //       title: 'Delete Chat',
// // // // // // // // // // //       desc: 'Are you sure you want to delete this chat?',
// // // // // // // // // // //       btnCancelOnPress: () {},
// // // // // // // // // // //       btnOkOnPress: () async {
// // // // // // // // // // //         try {
// // // // // // // // // // //           await viewModel.deleteChat(widget.chat.id);
// // // // // // // // // // //           Navigator.pop(context);
// // // // // // // // // // //         } catch (e) {
// // // // // // // // // // //           ScaffoldMessenger.of(context).showSnackBar(
// // // // // // // // // // //             SnackBar(content: Text('Failed to delete chat: $e')),
// // // // // // // // // // //           );
// // // // // // // // // // //         }
// // // // // // // // // // //       },
// // // // // // // // // // //       btnOkText: 'Delete',
// // // // // // // // // // //       btnCancelText: 'Cancel',
// // // // // // // // // // //     ).show();
// // // // // // // // // // //   }

// // // // // // // // // // //   @override
// // // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // // //     final viewModel = Provider.of<ChatViewModel>(context, listen: false);

// // // // // // // // // // //     final appBar = AppBar(
// // // // // // // // // // //       backgroundColor: AppColors.primaryColor,
// // // // // // // // // // //       elevation: 0,
// // // // // // // // // // //       leading: IconButton(
// // // // // // // // // // //         icon: const Icon(Icons.arrow_back, color: Colors.white),
// // // // // // // // // // //         onPressed: () => Navigator.pop(context),
// // // // // // // // // // //       ),
// // // // // // // // // // //       title: Row(
// // // // // // // // // // //         children: [
// // // // // // // // // // //           CircleAvatar(
// // // // // // // // // // //             backgroundImage: (widget.chat.avatar.startsWith('file://') ||
// // // // // // // // // // //                     File(widget.chat.avatar).existsSync())
// // // // // // // // // // //                 ? FileImage(File(widget.chat.avatar))
// // // // // // // // // // //                 : NetworkImage(widget.chat.avatar.isNotEmpty
// // // // // // // // // // //                     ? widget.chat.avatar
// // // // // // // // // // //                     : 'https://via.placeholder.com/150'),
// // // // // // // // // // //             radius: 20,
// // // // // // // // // // //           ),
// // // // // // // // // // //           const SizedBox(width: 10),
// // // // // // // // // // //           Expanded(
// // // // // // // // // // //             child: Text(
// // // // // // // // // // //               widget.chat.name,
// // // // // // // // // // //               style: const TextStyle(
// // // // // // // // // // //                 fontSize: 20,
// // // // // // // // // // //                 fontWeight: FontWeight.bold,
// // // // // // // // // // //                 color: Colors.white,
// // // // // // // // // // //               ),
// // // // // // // // // // //               overflow: TextOverflow.ellipsis,
// // // // // // // // // // //               maxLines: 1,
// // // // // // // // // // //             ),
// // // // // // // // // // //           ),
// // // // // // // // // // //         ],
// // // // // // // // // // //       ),
// // // // // // // // // // //       actions: [
// // // // // // // // // // //         PopupMenuButton<String>(
// // // // // // // // // // //           icon: const Icon(Icons.more_vert, color: Colors.white),
// // // // // // // // // // //           onSelected: (value) {
// // // // // // // // // // //             if (value == 'delete') {
// // // // // // // // // // //               _showDeleteDialog(viewModel);
// // // // // // // // // // //             }
// // // // // // // // // // //           },
// // // // // // // // // // //           itemBuilder: (BuildContext context) => [
// // // // // // // // // // //             const PopupMenuItem<String>(
// // // // // // // // // // //               value: 'delete',
// // // // // // // // // // //               child: Text('Delete Chat'),
// // // // // // // // // // //             ),
// // // // // // // // // // //           ],
// // // // // // // // // // //         ),
// // // // // // // // // // //       ],
// // // // // // // // // // //     );

// // // // // // // // // // //     return Scaffold(
// // // // // // // // // // //       backgroundColor: Colors.white,
// // // // // // // // // // //       appBar: appBar,
// // // // // // // // // // //       body: Column(
// // // // // // // // // // //         children: [
// // // // // // // // // // //           Expanded(
// // // // // // // // // // //             child: ListView.builder(
// // // // // // // // // // //               controller: _scrollController,
// // // // // // // // // // //               physics: const AlwaysScrollableScrollPhysics(),
// // // // // // // // // // //               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
// // // // // // // // // // //               cacheExtent: 1000.0,
// // // // // // // // // // //               itemCount: _localMessages.length + 1,
// // // // // // // // // // //               itemBuilder: (context, index) {
// // // // // // // // // // //                 if (index == 0) {
// // // // // // // // // // //                   if (_localMessages.isNotEmpty) {
// // // // // // // // // // //                     final latestTime = DateTime.now();
// // // // // // // // // // //                     return Center(
// // // // // // // // // // //                       child: Padding(
// // // // // // // // // // //                         padding: const EdgeInsets.symmetric(vertical: 10),
// // // // // // // // // // //                         child: Text(
// // // // // // // // // // //                           '${latestTime.day}/${latestTime.month}/${latestTime.year}',
// // // // // // // // // // //                           style: const TextStyle(
// // // // // // // // // // //                             fontSize: 12,
// // // // // // // // // // //                             color: Colors.grey,
// // // // // // // // // // //                           ),
// // // // // // // // // // //                         ),
// // // // // // // // // // //                       ),
// // // // // // // // // // //                     );
// // // // // // // // // // //                   }
// // // // // // // // // // //                   return const SizedBox.shrink();
// // // // // // // // // // //                 }
// // // // // // // // // // //                 final messageIndex = index - 1;
// // // // // // // // // // //                 final message = _localMessages[messageIndex];
// // // // // // // // // // //                 final isMe = message['isMe'] as bool;
// // // // // // // // // // //                 return ChatsBubble(
// // // // // // // // // // //                   isMe: isMe,
// // // // // // // // // // //                   message: message,
// // // // // // // // // // //                   chatId: widget.chat.id,
// // // // // // // // // // //                 );
// // // // // // // // // // //               },
// // // // // // // // // // //             ),
// // // // // // // // // // //           ),
// // // // // // // // // // //           Padding(
// // // // // // // // // // //             padding: const EdgeInsets.all(8.0),
// // // // // // // // // // //             child: Row(
// // // // // // // // // // //               children: [
// // // // // // // // // // //                 Container(
// // // // // // // // // // //                   width: 40,
// // // // // // // // // // //                   height: 40,
// // // // // // // // // // //                   decoration: const BoxDecoration(
// // // // // // // // // // //                     color: AppColors.primaryColor,
// // // // // // // // // // //                     shape: BoxShape.circle,
// // // // // // // // // // //                   ),
// // // // // // // // // // //                   child: IconButton(
// // // // // // // // // // //                     icon: const Icon(
// // // // // // // // // // //                       Icons.mic,
// // // // // // // // // // //                       color: Colors.white,
// // // // // // // // // // //                       size: 24,
// // // // // // // // // // //                     ),
// // // // // // // // // // //                     onPressed: () {},
// // // // // // // // // // //                   ),
// // // // // // // // // // //                 ),
// // // // // // // // // // //                 const SizedBox(width: 5),
// // // // // // // // // // //                 Expanded(
// // // // // // // // // // //                   child: ChatTextField(
// // // // // // // // // // //                     messageController: _messageController,
// // // // // // // // // // //                   ),
// // // // // // // // // // //                 ),
// // // // // // // // // // //                 IconButton(
// // // // // // // // // // //                   icon: const Icon(
// // // // // // // // // // //                     Icons.send,
// // // // // // // // // // //                     color: AppColors.primaryColor,
// // // // // // // // // // //                   ),
// // // // // // // // // // //                   onPressed: () => _sendMessage(viewModel),
// // // // // // // // // // //                 ),
// // // // // // // // // // //               ],
// // // // // // // // // // //             ),
// // // // // // // // // // //           ),
// // // // // // // // // // //         ],
// // // // // // // // // // //       ),
// // // // // // // // // // //     );
// // // // // // // // // // //   }

// // // // // // // // // // //   @override
// // // // // // // // // // //   void dispose() {
// // // // // // // // // // //     _messageController.dispose();
// // // // // // // // // // //     _scrollController.dispose();
// // // // // // // // // // //     super.dispose();
// // // // // // // // // // //   }
// // // // // // // // // // // }

// // // // // // // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // // // // // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // // // // // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
// // // // // // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
// // // // // // // // // // import 'package:awesome_dialog/awesome_dialog.dart';
// // // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // // import 'package:flutter/scheduler.dart';
// // // // // // // // // // import 'package:provider/provider.dart';
// // // // // // // // // // import 'dart:async';
// // // // // // // // // // import 'dart:io';

// // // // // // // // // // class ChatView extends StatefulWidget {
// // // // // // // // // //   final ChatModel chat;

// // // // // // // // // //   const ChatView({super.key, required this.chat});

// // // // // // // // // //   @override
// // // // // // // // // //   _ChatViewState createState() => _ChatViewState();
// // // // // // // // // // }

// // // // // // // // // // class _ChatViewState extends State<ChatView> {
// // // // // // // // // //   final TextEditingController _messageController = TextEditingController();
// // // // // // // // // //   final ScrollController _scrollController = ScrollController();
// // // // // // // // // //   List<Map<String, dynamic>> _localMessages = [];
// // // // // // // // // //   StreamSubscription? _streamSubscription;

// // // // // // // // // //   @override
// // // // // // // // // //   void initState() {
// // // // // // // // // //     super.initState();
// // // // // // // // // //     // تهيئة الرسائل المحلية من ChatModel مع تحويل الوقت لـ 12 ساعة
// // // // // // // // // //     _localMessages = List.from(widget.chat.messages.map((msg) {
// // // // // // // // // //       final time = DateTime.parse(msg['time']);
// // // // // // // // // //       final formattedTime = _formatTo12Hour(time);
// // // // // // // // // //       return {
// // // // // // // // // //         ...msg,
// // // // // // // // // //         'time': formattedTime
// // // // // // // // // //       };
// // // // // // // // // //     }));

// // // // // // // // // //     // التمرير لآخر رسالة بعد تحميل الـ UI
// // // // // // // // // //     SchedulerBinding.instance.addPostFrameCallback((_) {
// // // // // // // // // //       _scrollToBottom(attempts: 5);
// // // // // // // // // //     });

// // // // // // // // // //     // الاستماع لتحديثات الدردشة من Firestore
// // // // // // // // // //     _streamSubscription = Provider.of<ChatViewModel>(context, listen: false)
// // // // // // // // // //         .getChatsStream()
// // // // // // // // // //         .listen(
// // // // // // // // // //       (chats) {
// // // // // // // // // //         final chat = chats.firstWhere((c) => c.id == widget.chat.id, orElse: () => widget.chat);
// // // // // // // // // //         if (mounted) {
// // // // // // // // // //           setState(() {
// // // // // // // // // //             _localMessages = List.from(chat.messages.map((msg) {
// // // // // // // // // //               final time = DateTime.parse(msg['time']);
// // // // // // // // // //               final formattedTime = _formatTo12Hour(time);
// // // // // // // // // //               return {
// // // // // // // // // //                 ...msg,
// // // // // // // // // //                 'time': formattedTime
// // // // // // // // // //               };
// // // // // // // // // //             }));
// // // // // // // // // //           });
// // // // // // // // // //           SchedulerBinding.instance.addPostFrameCallback((_) {
// // // // // // // // // //             _scrollToBottom(attempts: 5);
// // // // // // // // // //           });
// // // // // // // // // //         }
// // // // // // // // // //       },
// // // // // // // // // //       onError: (e) {
// // // // // // // // // //         if (mounted) {
// // // // // // // // // //           ScaffoldMessenger.of(context).showSnackBar(
// // // // // // // // // //             SnackBar(content: Text('Failed to load messages: $e')),
// // // // // // // // // //           );
// // // // // // // // // //         }
// // // // // // // // // //       },
// // // // // // // // // //     );
// // // // // // // // // //   }

// // // // // // // // // //   String _formatTo12Hour(DateTime time) {
// // // // // // // // // //     final hour = time.hour % 12;
// // // // // // // // // //     final period = time.hour >= 12 ? 'PM' : 'AM';
// // // // // // // // // //     final minute = time.minute.toString().padLeft(2, '0');
// // // // // // // // // //     final displayHour = hour == 0 ? 12 : hour;
// // // // // // // // // //     return '$displayHour:$minute $period';
// // // // // // // // // //   }

// // // // // // // // // //   void _scrollToBottom({int attempts = 5}) {
// // // // // // // // // //     if (attempts <= 0) return;

// // // // // // // // // //     if (_scrollController.hasClients) {
// // // // // // // // // //       final currentExtent = _scrollController.position.maxScrollExtent;
// // // // // // // // // //       _scrollController.animateTo(
// // // // // // // // // //         currentExtent,
// // // // // // // // // //         duration: const Duration(milliseconds: 300),
// // // // // // // // // //         curve: Curves.easeOut,
// // // // // // // // // //       );
// // // // // // // // // //       Future.delayed(const Duration(milliseconds: 200), () {
// // // // // // // // // //         if (_scrollController.hasClients &&
// // // // // // // // // //             _scrollController.position.maxScrollExtent > currentExtent) {
// // // // // // // // // //           _scrollToBottom(attempts: attempts - 1);
// // // // // // // // // //         }
// // // // // // // // // //       });
// // // // // // // // // //     } else {
// // // // // // // // // //       Future.delayed(const Duration(milliseconds: 200), () {
// // // // // // // // // //         _scrollToBottom(attempts: attempts - 1);
// // // // // // // // // //       });
// // // // // // // // // //     }
// // // // // // // // // //   }

// // // // // // // // // //   void _sendMessage(ChatViewModel viewModel) {
// // // // // // // // // //     if (_messageController.text.trim().isEmpty) return;

// // // // // // // // // //     final now = DateTime.now();
// // // // // // // // // //     final formattedTime = _formatTo12Hour(now);
// // // // // // // // // //     final newMessage = {
// // // // // // // // // //       'text': _messageController.text.trim(),
// // // // // // // // // //       'isMe': true,
// // // // // // // // // //       'time': formattedTime,
// // // // // // // // // //     };

// // // // // // // // // //     setState(() {
// // // // // // // // // //       _localMessages.add(newMessage);
// // // // // // // // // //     });

// // // // // // // // // //     viewModel.sendMessage(widget.chat.id, _messageController.text.trim(), true);
// // // // // // // // // //     _messageController.clear();

// // // // // // // // // //     SchedulerBinding.instance.addPostFrameCallback((_) {
// // // // // // // // // //       _scrollToBottom(attempts: 5);
// // // // // // // // // //     });
// // // // // // // // // //   }

// // // // // // // // // //   void _showDeleteDialog(ChatViewModel viewModel) {
// // // // // // // // // //     AwesomeDialog(
// // // // // // // // // //       context: context,
// // // // // // // // // //       dialogType: DialogType.warning,
// // // // // // // // // //       animType: AnimType.scale,
// // // // // // // // // //       title: 'Delete Chat',
// // // // // // // // // //       desc: 'Are you sure you want to delete this chat?',
// // // // // // // // // //       btnCancelOnPress: () {},
// // // // // // // // // //       btnOkOnPress: () async {
// // // // // // // // // //         try {
// // // // // // // // // //           await viewModel.deleteChat(widget.chat.id);
// // // // // // // // // //           Navigator.pop(context);
// // // // // // // // // //         } catch (e) {
// // // // // // // // // //           ScaffoldMessenger.of(context).showSnackBar(
// // // // // // // // // //             SnackBar(content: Text('Failed to delete chat: $e')),
// // // // // // // // // //           );
// // // // // // // // // //         }
// // // // // // // // // //       },
// // // // // // // // // //       btnOkText: 'Delete',
// // // // // // // // // //       btnCancelText: 'Cancel',
// // // // // // // // // //     ).show();
// // // // // // // // // //   }

// // // // // // // // // //   @override
// // // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // // //     final viewModel = Provider.of<ChatViewModel>(context, listen: false);

// // // // // // // // // //     final appBar = AppBar(
// // // // // // // // // //       backgroundColor: AppColors.primaryColor,
// // // // // // // // // //       elevation: 0,
// // // // // // // // // //       leading: IconButton(
// // // // // // // // // //         icon: const Icon(Icons.arrow_back, color: Colors.white),
// // // // // // // // // //         onPressed: () => Navigator.pop(context),
// // // // // // // // // //       ),
// // // // // // // // // //       title: Row(
// // // // // // // // // //         children: [
// // // // // // // // // //           CircleAvatar(
// // // // // // // // // //             backgroundImage: (widget.chat.avatar.startsWith('file://') ||
// // // // // // // // // //                     File(widget.chat.avatar).existsSync())
// // // // // // // // // //                 ? FileImage(File(widget.chat.avatar))
// // // // // // // // // //                 : NetworkImage(widget.chat.avatar.isNotEmpty
// // // // // // // // // //                     ? widget.chat.avatar
// // // // // // // // // //                     : 'https://via.placeholder.com/150'),
// // // // // // // // // //             radius: 20,
// // // // // // // // // //           ),
// // // // // // // // // //           const SizedBox(width: 10),
// // // // // // // // // //           Expanded(
// // // // // // // // // //             child: Text(
// // // // // // // // // //               widget.chat.name,
// // // // // // // // // //               style: const TextStyle(
// // // // // // // // // //                 fontSize: 20,
// // // // // // // // // //                 fontWeight: FontWeight.bold,
// // // // // // // // // //                 color: Colors.white,
// // // // // // // // // //               ),
// // // // // // // // // //               overflow: TextOverflow.ellipsis,
// // // // // // // // // //               maxLines: 1,
// // // // // // // // // //             ),
// // // // // // // // // //           ),
// // // // // // // // // //         ],
// // // // // // // // // //       ),
// // // // // // // // // //       actions: [
// // // // // // // // // //         PopupMenuButton<String>(
// // // // // // // // // //           icon: const Icon(Icons.more_vert, color: Colors.white),
// // // // // // // // // //           onSelected: (value) {
// // // // // // // // // //             if (value == 'delete') {
// // // // // // // // // //               _showDeleteDialog(viewModel);
// // // // // // // // // //             }
// // // // // // // // // //           },
// // // // // // // // // //           itemBuilder: (BuildContext context) => [
// // // // // // // // // //             const PopupMenuItem<String>(
// // // // // // // // // //               value: 'delete',
// // // // // // // // // //               child: Text('Delete Chat'),
// // // // // // // // // //             ),
// // // // // // // // // //           ],
// // // // // // // // // //         ),
// // // // // // // // // //       ],
// // // // // // // // // //     );

// // // // // // // // // //     return Scaffold(
// // // // // // // // // //       backgroundColor: Colors.white,
// // // // // // // // // //       appBar: appBar,
// // // // // // // // // //       body: Column(
// // // // // // // // // //         children: [
// // // // // // // // // //           Expanded(
// // // // // // // // // //             child: ListView.builder(
// // // // // // // // // //               controller: _scrollController,
// // // // // // // // // //               physics: const AlwaysScrollableScrollPhysics(),
// // // // // // // // // //               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
// // // // // // // // // //               cacheExtent: 1000.0,
// // // // // // // // // //               itemCount: _localMessages.length + 1,
// // // // // // // // // //               itemBuilder: (context, index) {
// // // // // // // // // //                 if (index == 0) {
// // // // // // // // // //                   if (_localMessages.isNotEmpty) {
// // // // // // // // // //                     final latestTime = DateTime.now();
// // // // // // // // // //                     return Center(
// // // // // // // // // //                       child: Padding(
// // // // // // // // // //                         padding: const EdgeInsets.symmetric(vertical: 10),
// // // // // // // // // //                         child: Text(
// // // // // // // // // //                           '${latestTime.day}/${latestTime.month}/${latestTime.year}',
// // // // // // // // // //                           style: const TextStyle(
// // // // // // // // // //                             fontSize: 12,
// // // // // // // // // //                             color: Colors.grey,
// // // // // // // // // //                           ),
// // // // // // // // // //                         ),
// // // // // // // // // //                       ),
// // // // // // // // // //                     );
// // // // // // // // // //                   }
// // // // // // // // // //                   return const SizedBox.shrink();
// // // // // // // // // //                 }
// // // // // // // // // //                 final messageIndex = index - 1;
// // // // // // // // // //                 final message = _localMessages[messageIndex];
// // // // // // // // // //                 final isMe = message['isMe'] as bool;
// // // // // // // // // //                 return ChatsBubble(
// // // // // // // // // //                   isMe: isMe,
// // // // // // // // // //                   message: message,
// // // // // // // // // //                   chatId: widget.chat.id,
// // // // // // // // // //                 );
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
// // // // // // // // // //                 Expanded(
// // // // // // // // // //                   child: ChatTextField(
// // // // // // // // // //                     messageController: _messageController,
// // // // // // // // // //                   ),
// // // // // // // // // //                 ),
// // // // // // // // // //                 IconButton(
// // // // // // // // // //                   icon: const Icon(
// // // // // // // // // //                     Icons.send,
// // // // // // // // // //                     color: AppColors.primaryColor,
// // // // // // // // // //                   ),
// // // // // // // // // //                   onPressed: () => _sendMessage(viewModel),
// // // // // // // // // //                 ),
// // // // // // // // // //               ],
// // // // // // // // // //             ),
// // // // // // // // // //           ),
// // // // // // // // // //         ],
// // // // // // // // // //       ),
// // // // // // // // // //     );
// // // // // // // // // //   }

// // // // // // // // // //   @override
// // // // // // // // // //   void dispose() {
// // // // // // // // // //     _streamSubscription?.cancel();
// // // // // // // // // //     _messageController.dispose();
// // // // // // // // // //     _scrollController.dispose();
// // // // // // // // // //     super.dispose();
// // // // // // // // // //   }
// // // // // // // // // // }

// // // // // // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // // // // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // // // // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
// // // // // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
// // // // // // // // // import 'package:awesome_dialog/awesome_dialog.dart';
// // // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // // import 'package:flutter/scheduler.dart';
// // // // // // // // // import 'package:provider/provider.dart';
// // // // // // // // // import 'dart:async';
// // // // // // // // // import 'dart:io';

// // // // // // // // // import 'package:uuid/uuid.dart';

// // // // // // // // // class ChatView extends StatefulWidget {
// // // // // // // // //   final ChatModel chat;

// // // // // // // // //   const ChatView({super.key, required this.chat});

// // // // // // // // //   @override
// // // // // // // // //   _ChatViewState createState() => _ChatViewState();
// // // // // // // // // }

// // // // // // // // // class _ChatViewState extends State<ChatView> {
// // // // // // // // //   final TextEditingController _messageController = TextEditingController();
// // // // // // // // //   final ScrollController _scrollController = ScrollController();
// // // // // // // // //   List<Map<String, dynamic>> _localMessages = [];
// // // // // // // // //   StreamSubscription? _streamSubscription;

// // // // // // // // //   @override
// // // // // // // // //   void initState() {
// // // // // // // // //     super.initState();
// // // // // // // // //     // تهيئة الرسائل المحلية من ChatModel مع تحويل الوقت لـ 12 ساعة
// // // // // // // // //     _localMessages = List.from(widget.chat.messages.map((msg) {
// // // // // // // // //       final time = DateTime.parse(msg['time']);
// // // // // // // // //       final formattedTime = _formatTo12Hour(time);
// // // // // // // // //       return {...msg, 'time': formattedTime};
// // // // // // // // //     }));

// // // // // // // // //     // التمرير لآخر رسالة بعد تحميل الـ UI
// // // // // // // // //     SchedulerBinding.instance.addPostFrameCallback((_) {
// // // // // // // // //       _scrollToBottom(attempts: 5);
// // // // // // // // //     });

// // // // // // // // //     // الاستماع لتحديثات الدردشة من Firestore
// // // // // // // // //     _streamSubscription = Provider.of<ChatViewModel>(context, listen: false)
// // // // // // // // //         .getChatsStream()
// // // // // // // // //         .listen(
// // // // // // // // //       (chats) {
// // // // // // // // //         final chat = chats.firstWhere((c) => c.id == widget.chat.id,
// // // // // // // // //             orElse: () => widget.chat);
// // // // // // // // //         if (mounted) {
// // // // // // // // //           setState(() {
// // // // // // // // //             _localMessages = List.from(chat.messages.map((msg) {
// // // // // // // // //               final time = DateTime.parse(msg['time']);
// // // // // // // // //               final formattedTime = _formatTo12Hour(time);
// // // // // // // // //               return {...msg, 'time': formattedTime};
// // // // // // // // //             }));
// // // // // // // // //           });
// // // // // // // // //           SchedulerBinding.instance.addPostFrameCallback((_) {
// // // // // // // // //             _scrollToBottom(attempts: 5);
// // // // // // // // //           });
// // // // // // // // //         }
// // // // // // // // //       },
// // // // // // // // //       onError: (e) {
// // // // // // // // //         if (mounted) {
// // // // // // // // //           ScaffoldMessenger.of(context).showSnackBar(
// // // // // // // // //             SnackBar(content: Text('Failed to load messages: $e')),
// // // // // // // // //           );
// // // // // // // // //         }
// // // // // // // // //       },
// // // // // // // // //     );
// // // // // // // // //   }

// // // // // // // // //   String _formatTo12Hour(DateTime time) {
// // // // // // // // //     final hour = time.hour % 12;
// // // // // // // // //     final period = time.hour >= 12 ? 'PM' : 'AM';
// // // // // // // // //     final minute = time.minute.toString().padLeft(2, '0');
// // // // // // // // //     final displayHour = hour == 0 ? 12 : hour;
// // // // // // // // //     return '$displayHour:$minute $period';
// // // // // // // // //   }

// // // // // // // // //   void _scrollToBottom({int attempts = 5}) {
// // // // // // // // //     if (attempts <= 0) return;

// // // // // // // // //     if (_scrollController.hasClients) {
// // // // // // // // //       final currentExtent = _scrollController.position.maxScrollExtent;
// // // // // // // // //       _scrollController.animateTo(
// // // // // // // // //         currentExtent,
// // // // // // // // //         duration: const Duration(milliseconds: 300),
// // // // // // // // //         curve: Curves.easeOut,
// // // // // // // // //       );
// // // // // // // // //       Future.delayed(const Duration(milliseconds: 200), () {
// // // // // // // // //         if (_scrollController.hasClients &&
// // // // // // // // //             _scrollController.position.maxScrollExtent > currentExtent) {
// // // // // // // // //           _scrollToBottom(attempts: attempts - 1);
// // // // // // // // //         }
// // // // // // // // //       });
// // // // // // // // //     } else {
// // // // // // // // //       Future.delayed(const Duration(milliseconds: 200), () {
// // // // // // // // //         _scrollToBottom(attempts: attempts - 1);
// // // // // // // // //       });
// // // // // // // // //     }
// // // // // // // // //   }

// // // // // // // // //   void _sendMessage(ChatViewModel viewModel) {
// // // // // // // // //     if (_messageController.text.trim().isEmpty) return;

// // // // // // // // //     final now = DateTime.now();
// // // // // // // // //     final formattedTime = _formatTo12Hour(now);
// // // // // // // // //     final newMessage = {
// // // // // // // // //       'text': _messageController.text.trim(),
// // // // // // // // //       'isMe': true,
// // // // // // // // //       'time': now.toIso8601String(),
// // // // // // // // //       'messageId': const Uuid().v4(),
// // // // // // // // //     };

// // // // // // // // //     setState(() {
// // // // // // // // //       _localMessages.add({
// // // // // // // // //         ...newMessage,
// // // // // // // // //         'time': formattedTime,
// // // // // // // // //       });
// // // // // // // // //     });

// // // // // // // // //     viewModel.sendMessage(widget.chat.id, _messageController.text.trim(), true);
// // // // // // // // //     _messageController.clear();

// // // // // // // // //     SchedulerBinding.instance.addPostFrameCallback((_) {
// // // // // // // // //       _scrollToBottom(attempts: 5);
// // // // // // // // //     });
// // // // // // // // //   }

// // // // // // // // //   void _showDeleteDialog(ChatViewModel viewModel) {
// // // // // // // // //     AwesomeDialog(
// // // // // // // // //       context: context,
// // // // // // // // //       dialogType: DialogType.warning,
// // // // // // // // //       animType: AnimType.scale,
// // // // // // // // //       title: 'Delete Chat',
// // // // // // // // //       desc: 'Are you sure you want to delete this chat?',
// // // // // // // // //       btnCancelOnPress: () {},
// // // // // // // // //       btnOkOnPress: () async {
// // // // // // // // //         try {
// // // // // // // // //           await viewModel.deleteChat(widget.chat.id);
// // // // // // // // //           Navigator.pop(context);
// // // // // // // // //         } catch (e) {
// // // // // // // // //           ScaffoldMessenger.of(context).showSnackBar(
// // // // // // // // //             SnackBar(content: Text('Failed to delete chat: $e')),
// // // // // // // // //           );
// // // // // // // // //         }
// // // // // // // // //       },
// // // // // // // // //       btnOkText: 'Delete',
// // // // // // // // //       btnCancelText: 'Cancel',
// // // // // // // // //     ).show();
// // // // // // // // //   }

// // // // // // // // //   @override
// // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // //     final viewModel = Provider.of<ChatViewModel>(context, listen: false);

// // // // // // // // //     final appBar = AppBar(
// // // // // // // // //       backgroundColor: AppColors.primaryColor,
// // // // // // // // //       elevation: 0,
// // // // // // // // //       leading: IconButton(
// // // // // // // // //         icon: const Icon(Icons.arrow_back, color: Colors.white),
// // // // // // // // //         onPressed: () => Navigator.pop(context),
// // // // // // // // //       ),
// // // // // // // // //       title: Row(
// // // // // // // // //         children: [
// // // // // // // // //           CircleAvatar(
// // // // // // // // //             backgroundImage: (widget.chat.avatar.startsWith('file://') ||
// // // // // // // // //                     File(widget.chat.avatar).existsSync())
// // // // // // // // //                 ? FileImage(File(widget.chat.avatar))
// // // // // // // // //                 : NetworkImage(widget.chat.avatar.isNotEmpty
// // // // // // // // //                     ? widget.chat.avatar
// // // // // // // // //                     : 'https://via.placeholder.com/150'),
// // // // // // // // //             radius: 20,
// // // // // // // // //           ),
// // // // // // // // //           const SizedBox(width: 10),
// // // // // // // // //           Expanded(
// // // // // // // // //             child: Text(
// // // // // // // // //               widget.chat.name,
// // // // // // // // //               style: const TextStyle(
// // // // // // // // //                 fontSize: 20,
// // // // // // // // //                 fontWeight: FontWeight.bold,
// // // // // // // // //                 color: Colors.white,
// // // // // // // // //               ),
// // // // // // // // //               overflow: TextOverflow.ellipsis,
// // // // // // // // //               maxLines: 1,
// // // // // // // // //             ),
// // // // // // // // //           ),
// // // // // // // // //         ],
// // // // // // // // //       ),
// // // // // // // // //       actions: [
// // // // // // // // //         PopupMenuButton<String>(
// // // // // // // // //           icon: const Icon(Icons.more_vert, color: Colors.white),
// // // // // // // // //           onSelected: (value) {
// // // // // // // // //             if (value == 'delete') {
// // // // // // // // //               _showDeleteDialog(viewModel);
// // // // // // // // //             }
// // // // // // // // //           },
// // // // // // // // //           itemBuilder: (BuildContext context) => [
// // // // // // // // //             const PopupMenuItem<String>(
// // // // // // // // //               value: 'delete',
// // // // // // // // //               child: Text('Delete Chat'),
// // // // // // // // //             ),
// // // // // // // // //           ],
// // // // // // // // //         ),
// // // // // // // // //       ],
// // // // // // // // //     );

// // // // // // // // //     return Scaffold(
// // // // // // // // //       backgroundColor: Colors.white,
// // // // // // // // //       appBar: appBar,
// // // // // // // // //       body: Column(
// // // // // // // // //         children: [
// // // // // // // // //           Expanded(
// // // // // // // // //             child: ListView.builder(
// // // // // // // // //               controller: _scrollController,
// // // // // // // // //               physics: const AlwaysScrollableScrollPhysics(),
// // // // // // // // //               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
// // // // // // // // //               cacheExtent: 1000.0,
// // // // // // // // //               itemCount: _localMessages.length + 1,
// // // // // // // // //               itemBuilder: (context, index) {
// // // // // // // // //                 if (index == 0) {
// // // // // // // // //                   if (_localMessages.isNotEmpty) {
// // // // // // // // //                     final latestTime = DateTime.now();
// // // // // // // // //                     return Center(
// // // // // // // // //                       child: Padding(
// // // // // // // // //                         padding: const EdgeInsets.symmetric(vertical: 10),
// // // // // // // // //                         child: Text(
// // // // // // // // //                           '${latestTime.day}/${latestTime.month}/${latestTime.year}',
// // // // // // // // //                           style: const TextStyle(
// // // // // // // // //                             fontSize: 12,
// // // // // // // // //                             color: Colors.grey,
// // // // // // // // //                           ),
// // // // // // // // //                         ),
// // // // // // // // //                       ),
// // // // // // // // //                     );
// // // // // // // // //                   }
// // // // // // // // //                   return const SizedBox.shrink();
// // // // // // // // //                 }
// // // // // // // // //                 final messageIndex = index - 1;
// // // // // // // // //                 final message = _localMessages[messageIndex];
// // // // // // // // //                 final isMe = message['isMe'] as bool;
// // // // // // // // //                 return ChatsBubble(
// // // // // // // // //                   isMe: isMe,
// // // // // // // // //                   message: message,
// // // // // // // // //                   chatId: widget.chat.id,
// // // // // // // // //                 );
// // // // // // // // //               },
// // // // // // // // //             ),
// // // // // // // // //           ),
// // // // // // // // //           Padding(
// // // // // // // // //             padding: const EdgeInsets.all(8.0),
// // // // // // // // //             child: Row(
// // // // // // // // //               children: [
// // // // // // // // //                 Container(
// // // // // // // // //                   width: 40,
// // // // // // // // //                   height: 40,
// // // // // // // // //                   decoration: const BoxDecoration(
// // // // // // // // //                     color: AppColors.primaryColor,
// // // // // // // // //                     shape: BoxShape.circle,
// // // // // // // // //                   ),
// // // // // // // // //                   child: IconButton(
// // // // // // // // //                     icon: const Icon(
// // // // // // // // //                       Icons.mic,
// // // // // // // // //                       color: Colors.white,
// // // // // // // // //                       size: 24,
// // // // // // // // //                     ),
// // // // // // // // //                     onPressed: () {},
// // // // // // // // //                   ),
// // // // // // // // //                 ),
// // // // // // // // //                 const SizedBox(width: 5),
// // // // // // // // //                 Expanded(
// // // // // // // // //                   child: ChatTextField(
// // // // // // // // //                     messageController: _messageController,
// // // // // // // // //                   ),
// // // // // // // // //                 ),
// // // // // // // // //                 IconButton(
// // // // // // // // //                   icon: const Icon(
// // // // // // // // //                     Icons.send,
// // // // // // // // //                     color: AppColors.primaryColor,
// // // // // // // // //                   ),
// // // // // // // // //                   onPressed: () => _sendMessage(viewModel),
// // // // // // // // //                 ),
// // // // // // // // //               ],
// // // // // // // // //             ),
// // // // // // // // //           ),
// // // // // // // // //         ],
// // // // // // // // //       ),
// // // // // // // // //     );
// // // // // // // // //   }

// // // // // // // // //   @override
// // // // // // // // //   void dispose() {
// // // // // // // // //     _streamSubscription?.cancel();
// // // // // // // // //     _messageController.dispose();
// // // // // // // // //     _scrollController.dispose();
// // // // // // // // //     super.dispose();
// // // // // // // // //   }
// // // // // // // // // }

// // // // // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // // // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // // // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
// // // // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
// // // // // // // // import 'package:awesome_dialog/awesome_dialog.dart';
// // // // // // // // import 'package:flutter/material.dart';
// // // // // // // // import 'package:flutter/scheduler.dart';
// // // // // // // // import 'package:provider/provider.dart';
// // // // // // // // import 'dart:async';
// // // // // // // // import 'dart:io';
// // // // // // // // import 'package:uuid/uuid.dart';

// // // // // // // // class ChatView extends StatefulWidget {
// // // // // // // //   final ChatModel chat;

// // // // // // // //   const ChatView({super.key, required this.chat});

// // // // // // // //   @override
// // // // // // // //   _ChatViewState createState() => _ChatViewState();
// // // // // // // // }

// // // // // // // // class _ChatViewState extends State<ChatView> {
// // // // // // // //   final TextEditingController _messageController = TextEditingController();
// // // // // // // //   final ScrollController _scrollController = ScrollController();
// // // // // // // //   List<Map<String, dynamic>> _localMessages = [];
// // // // // // // //   StreamSubscription? _streamSubscription;

// // // // // // // //   @override
// // // // // // // //   void initState() {
// // // // // // // //     super.initState();
// // // // // // // //     // تهيئة الرسائل المحلية من ChatModel مع تحويل الوقت لـ 12 ساعة
// // // // // // // //     _localMessages = List.from(widget.chat.messages.map((msg) {
// // // // // // // //       final time = DateTime.parse(msg['time']);
// // // // // // // //       final formattedTime = _formatTo12Hour(time);
// // // // // // // //       return {
// // // // // // // //         ...msg,
// // // // // // // //         'time': formattedTime,
// // // // // // // //         'originalTime': msg['time'], // الاحتفاظ بالوقت الأصلي
// // // // // // // //       };
// // // // // // // //     }));

// // // // // // // //     // التمرير لآخر رسالة بعد تحميل الـ UI
// // // // // // // //     SchedulerBinding.instance.addPostFrameCallback((_) {
// // // // // // // //       _scrollToBottom(attempts: 5);
// // // // // // // //     });

// // // // // // // //     // الاستماع لتحديثات الدردشة من Firestore
// // // // // // // //     _streamSubscription = Provider.of<ChatViewModel>(context, listen: false)
// // // // // // // //         .getChatsStream()
// // // // // // // //         .listen(
// // // // // // // //       (chats) {
// // // // // // // //         final chat = chats.firstWhere((c) => c.id == widget.chat.id,
// // // // // // // //             orElse: () => widget.chat);
// // // // // // // //         if (mounted) {
// // // // // // // //           setState(() {
// // // // // // // //             _localMessages = List.from(chat.messages.map((msg) {
// // // // // // // //               final time = DateTime.parse(msg['time']);
// // // // // // // //               final formattedTime = _formatTo12Hour(time);
// // // // // // // //               return {
// // // // // // // //                 ...msg,
// // // // // // // //                 'time': formattedTime,
// // // // // // // //                 'originalTime': msg['time'],
// // // // // // // //               };
// // // // // // // //             }));
// // // // // // // //           });
// // // // // // // //           SchedulerBinding.instance.addPostFrameCallback((_) {
// // // // // // // //             _scrollToBottom(attempts: 5);
// // // // // // // //           });
// // // // // // // //         }
// // // // // // // //       },
// // // // // // // //       onError: (e) {
// // // // // // // //         if (mounted) {
// // // // // // // //           ScaffoldMessenger.of(context).showSnackBar(
// // // // // // // //             SnackBar(content: Text('Failed to load messages: $e')),
// // // // // // // //           );
// // // // // // // //         }
// // // // // // // //       },
// // // // // // // //     );
// // // // // // // //   }

// // // // // // // //   String _formatTo12Hour(DateTime time) {
// // // // // // // //     final hour = time.hour % 12;
// // // // // // // //     final period = time.hour >= 12 ? 'PM' : 'AM';
// // // // // // // //     final minute = time.minute.toString().padLeft(2, '0');
// // // // // // // //     final displayHour = hour == 0 ? 12 : hour;
// // // // // // // //     return '$displayHour:$minute $period';
// // // // // // // //   }

// // // // // // // //   void _scrollToBottom({int attempts = 5}) {
// // // // // // // //     if (attempts <= 0) return;

// // // // // // // //     if (_scrollController.hasClients) {
// // // // // // // //       final currentExtent = _scrollController.position.maxScrollExtent;
// // // // // // // //       _scrollController.animateTo(
// // // // // // // //         currentExtent,
// // // // // // // //         duration: const Duration(milliseconds: 300),
// // // // // // // //         curve: Curves.easeOut,
// // // // // // // //       );
// // // // // // // //       Future.delayed(const Duration(milliseconds: 200), () {
// // // // // // // //         if (_scrollController.hasClients &&
// // // // // // // //             _scrollController.position.maxScrollExtent > currentExtent) {
// // // // // // // //           _scrollToBottom(attempts: attempts - 1);
// // // // // // // //         }
// // // // // // // //       });
// // // // // // // //     } else {
// // // // // // // //       Future.delayed(const Duration(milliseconds: 200), () {
// // // // // // // //         _scrollToBottom(attempts: attempts - 1);
// // // // // // // //       });
// // // // // // // //     }
// // // // // // // //   }

// // // // // // // //   void _sendMessage(ChatViewModel viewModel) {
// // // // // // // //     if (_messageController.text.trim().isEmpty) return;

// // // // // // // //     final now = DateTime.now();
// // // // // // // //     final formattedTime = _formatTo12Hour(now);
// // // // // // // //     final newMessage = {
// // // // // // // //       'text': _messageController.text.trim(),
// // // // // // // //       'isMe': true,
// // // // // // // //       'time': formattedTime,
// // // // // // // //       'originalTime': now.toIso8601String(),
// // // // // // // //       'messageId': const Uuid().v4(),
// // // // // // // //     };

// // // // // // // //     setState(() {
// // // // // // // //       _localMessages.add(newMessage);
// // // // // // // //     });

// // // // // // // //     viewModel.sendMessage(widget.chat.id, _messageController.text.trim(), true);
// // // // // // // //     _messageController.clear();

// // // // // // // //     SchedulerBinding.instance.addPostFrameCallback((_) {
// // // // // // // //       _scrollToBottom(attempts: 5);
// // // // // // // //     });
// // // // // // // //   }

// // // // // // // //   void _showDeleteDialog(ChatViewModel viewModel) {
// // // // // // // //     AwesomeDialog(
// // // // // // // //       context: context,
// // // // // // // //       dialogType: DialogType.warning,
// // // // // // // //       animType: AnimType.scale,
// // // // // // // //       title: 'Delete Chat',
// // // // // // // //       desc: 'Are you sure you want to delete this chat?',
// // // // // // // //       btnCancelOnPress: () {},
// // // // // // // //       btnOkOnPress: () async {
// // // // // // // //         try {
// // // // // // // //           await viewModel.deleteChat(widget.chat.id);
// // // // // // // //           Navigator.pop(context);
// // // // // // // //         } catch (e) {
// // // // // // // //           ScaffoldMessenger.of(context).showSnackBar(
// // // // // // // //             SnackBar(content: Text('Failed to delete chat: $e')),
// // // // // // // //           );
// // // // // // // //         }
// // // // // // // //       },
// // // // // // // //       btnOkText: 'Delete',
// // // // // // // //       btnCancelText: 'Cancel',
// // // // // // // //     ).show();
// // // // // // // //   }

// // // // // // // //   @override
// // // // // // // //   Widget build(BuildContext context) {
// // // // // // // //     final viewModel = Provider.of<ChatViewModel>(context, listen: false);

// // // // // // // //     final appBar = AppBar(
// // // // // // // //       backgroundColor: AppColors.primaryColor,
// // // // // // // //       elevation: 0,
// // // // // // // //       leading: IconButton(
// // // // // // // //         icon: const Icon(Icons.arrow_back, color: Colors.white),
// // // // // // // //         onPressed: () => Navigator.pop(context),
// // // // // // // //       ),
// // // // // // // //       title: Row(
// // // // // // // //         children: [
// // // // // // // //           CircleAvatar(
// // // // // // // //             backgroundImage: (widget.chat.avatar.startsWith('file://') ||
// // // // // // // //                     File(widget.chat.avatar).existsSync())
// // // // // // // //                 ? FileImage(File(widget.chat.avatar))
// // // // // // // //                 : NetworkImage(widget.chat.avatar.isNotEmpty
// // // // // // // //                     ? widget.chat.avatar
// // // // // // // //                     : 'https://via.placeholder.com/150'),
// // // // // // // //             radius: 20,
// // // // // // // //           ),
// // // // // // // //           const SizedBox(width: 10),
// // // // // // // //           Expanded(
// // // // // // // //             child: Text(
// // // // // // // //               widget.chat.name,
// // // // // // // //               style: const TextStyle(
// // // // // // // //                 fontSize: 20,
// // // // // // // //                 fontWeight: FontWeight.bold,
// // // // // // // //                 color: Colors.white,
// // // // // // // //               ),
// // // // // // // //               overflow: TextOverflow.ellipsis,
// // // // // // // //               maxLines: 1,
// // // // // // // //             ),
// // // // // // // //           ),
// // // // // // // //         ],
// // // // // // // //       ),
// // // // // // // //       actions: [
// // // // // // // //         PopupMenuButton<String>(
// // // // // // // //           icon: const Icon(Icons.more_vert, color: Colors.white),
// // // // // // // //           onSelected: (value) {
// // // // // // // //             if (value == 'delete') {
// // // // // // // //               _showDeleteDialog(viewModel);
// // // // // // // //             }
// // // // // // // //           },
// // // // // // // //           itemBuilder: (BuildContext context) => [
// // // // // // // //             const PopupMenuItem<String>(
// // // // // // // //               value: 'delete',
// // // // // // // //               child: Text('Delete Chat'),
// // // // // // // //             ),
// // // // // // // //           ],
// // // // // // // //         ),
// // // // // // // //       ],
// // // // // // // //     );

// // // // // // // //     return Scaffold(
// // // // // // // //       backgroundColor: Colors.white,
// // // // // // // //       appBar: appBar,
// // // // // // // //       body: Column(
// // // // // // // //         children: [
// // // // // // // //           Expanded(
// // // // // // // //             child: ListView.builder(
// // // // // // // //               controller: _scrollController,
// // // // // // // //               physics: const AlwaysScrollableScrollPhysics(),
// // // // // // // //               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
// // // // // // // //               cacheExtent: 1000.0,
// // // // // // // //               itemCount: _localMessages.length + 1,
// // // // // // // //               itemBuilder: (context, index) {
// // // // // // // //                 if (index == 0) {
// // // // // // // //                   if (_localMessages.isNotEmpty) {
// // // // // // // //                     final latestTime = DateTime.now();
// // // // // // // //                     return Center(
// // // // // // // //                       child: Padding(
// // // // // // // //                         padding: const EdgeInsets.symmetric(vertical: 10),
// // // // // // // //                         child: Text(
// // // // // // // //                           '${latestTime.day}/${latestTime.month}/${latestTime.year}',
// // // // // // // //                           style: const TextStyle(
// // // // // // // //                             fontSize: 12,
// // // // // // // //                             color: Colors.grey,
// // // // // // // //                           ),
// // // // // // // //                         ),
// // // // // // // //                       ),
// // // // // // // //                     );
// // // // // // // //                   }
// // // // // // // //                   return const SizedBox.shrink();
// // // // // // // //                 }
// // // // // // // //                 final messageIndex = index - 1;
// // // // // // // //                 final message = _localMessages[messageIndex];
// // // // // // // //                 final isMe = message['isMe'] as bool;
// // // // // // // //                 return ChatsBubble(
// // // // // // // //                   isMe: isMe,
// // // // // // // //                   message: message,
// // // // // // // //                   chatId: widget.chat.id,
// // // // // // // //                 );
// // // // // // // //               },
// // // // // // // //             ),
// // // // // // // //           ),
// // // // // // // //           Padding(
// // // // // // // //             padding: const EdgeInsets.all(8.0),
// // // // // // // //             child: Row(
// // // // // // // //               children: [
// // // // // // // //                 Container(
// // // // // // // //                   width: 40,
// // // // // // // //                   height: 40,
// // // // // // // //                   decoration: const BoxDecoration(
// // // // // // // //                     color: AppColors.primaryColor,
// // // // // // // //                     shape: BoxShape.circle,
// // // // // // // //                   ),
// // // // // // // //                   child: IconButton(
// // // // // // // //                     icon: const Icon(
// // // // // // // //                       Icons.mic,
// // // // // // // //                       color: Colors.white,
// // // // // // // //                       size: 24,
// // // // // // // //                     ),
// // // // // // // //                     onPressed: () {},
// // // // // // // //                   ),
// // // // // // // //                 ),
// // // // // // // //                 const SizedBox(width: 5),
// // // // // // // //                 Expanded(
// // // // // // // //                   child: ChatTextField(
// // // // // // // //                     messageController: _messageController,
// // // // // // // //                   ),
// // // // // // // //                 ),
// // // // // // // //                 IconButton(
// // // // // // // //                   icon: const Icon(
// // // // // // // //                     Icons.send,
// // // // // // // //                     color: AppColors.primaryColor,
// // // // // // // //                   ),
// // // // // // // //                   onPressed: () => _sendMessage(viewModel),
// // // // // // // //                 ),
// // // // // // // //               ],
// // // // // // // //             ),
// // // // // // // //           ),
// // // // // // // //         ],
// // // // // // // //       ),
// // // // // // // //     );
// // // // // // // //   }

// // // // // // // //   @override
// // // // // // // //   void dispose() {
// // // // // // // //     _streamSubscription?.cancel();
// // // // // // // //     _messageController.dispose();
// // // // // // // //     _scrollController.dispose();
// // // // // // // //     super.dispose();
// // // // // // // //   }
// // // // // // // // }

// // // // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
// // // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
// // // // // // // import 'package:awesome_dialog/awesome_dialog.dart';
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
// // // // // // //   @override
// // // // // // //   void initState() {
// // // // // // //     super.initState();
// // // // // // //     // تهيئة الرسائل في ViewModel
// // // // // // //     Provider.of<ChatViewModel>(context, listen: false)
// // // // // // //         .initChatMessages(widget.chat);
// // // // // // //   }

// // // // // // //   void _showDeleteDialog(ChatViewModel viewModel) {
// // // // // // //     AwesomeDialog(
// // // // // // //       context: context,
// // // // // // //       dialogType: DialogType.warning,
// // // // // // //       animType: AnimType.scale,
// // // // // // //       title: 'Delete Chat',
// // // // // // //       desc: 'Are you sure you want to delete this chat?',
// // // // // // //       btnCancelOnPress: () {},
// // // // // // //       btnOkOnPress: () async {
// // // // // // //         try {
// // // // // // //           await viewModel.deleteChat(widget.chat.id);
// // // // // // //           Navigator.pop(context);
// // // // // // //         } catch (e) {
// // // // // // //           ScaffoldMessenger.of(context).showSnackBar(
// // // // // // //             SnackBar(content: Text('Failed to delete chat: $e')),
// // // // // // //           );
// // // // // // //         }
// // // // // // //       },
// // // // // // //       btnOkText: 'Delete',
// // // // // // //       btnCancelText: 'Cancel',
// // // // // // //     ).show();
// // // // // // //   }

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return Consumer<ChatViewModel>(
// // // // // // //       builder: (context, viewModel, child) {
// // // // // // //         final appBar = AppBar(
// // // // // // //           backgroundColor: AppColors.primaryColor,
// // // // // // //           elevation: 0,
// // // // // // //           leading: IconButton(
// // // // // // //             icon: const Icon(Icons.arrow_back, color: Colors.white),
// // // // // // //             onPressed: () => Navigator.pop(context),
// // // // // // //           ),
// // // // // // //           title: Row(
// // // // // // //             children: [
// // // // // // //               CircleAvatar(
// // // // // // //                 backgroundImage: (widget.chat.avatar.startsWith('file://') ||
// // // // // // //                         File(widget.chat.avatar).existsSync())
// // // // // // //                     ? FileImage(File(widget.chat.avatar))
// // // // // // //                     : NetworkImage(widget.chat.avatar.isNotEmpty
// // // // // // //                         ? widget.chat.avatar
// // // // // // //                         : 'https://via.placeholder.com/150'),
// // // // // // //                 radius: 20,
// // // // // // //               ),
// // // // // // //               const SizedBox(width: 10),
// // // // // // //               Expanded(
// // // // // // //                 child: Text(
// // // // // // //                   widget.chat.name,
// // // // // // //                   style: const TextStyle(
// // // // // // //                     fontSize: 20,
// // // // // // //                     fontWeight: FontWeight.bold,
// // // // // // //                     color: Colors.white,
// // // // // // //                   ),
// // // // // // //                   overflow: TextOverflow.ellipsis,
// // // // // // //                   maxLines: 1,
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //             ],
// // // // // // //           ),
// // // // // // //           actions: [
// // // // // // //             PopupMenuButton<String>(
// // // // // // //               icon: const Icon(Icons.more_vert, color: Colors.white),
// // // // // // //               onSelected: (value) {
// // // // // // //                 if (value == 'delete') {
// // // // // // //                   _showDeleteDialog(viewModel);
// // // // // // //                 }
// // // // // // //               },
// // // // // // //               itemBuilder: (BuildContext context) => [
// // // // // // //                 const PopupMenuItem<String>(
// // // // // // //                   value: 'delete',
// // // // // // //                   child: Text('Delete Chat'),
// // // // // // //                 ),
// // // // // // //               ],
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //         );

// // // // // // //         return Scaffold(
// // // // // // //           backgroundColor: Colors.white,
// // // // // // //           appBar: appBar,
// // // // // // //           body: Column(
// // // // // // //             children: [
// // // // // // //               Expanded(
// // // // // // //                 child: ListView.builder(
// // // // // // //                   controller: viewModel.scrollController,
// // // // // // //                   physics: const AlwaysScrollableScrollPhysics(),
// // // // // // //                   padding:
// // // // // // //                       const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
// // // // // // //                   cacheExtent: 1000.0,
// // // // // // //                   itemCount: viewModel.localMessages.length + 1,
// // // // // // //                   itemBuilder: (context, index) {
// // // // // // //                     if (index == 0) {
// // // // // // //                       if (viewModel.localMessages.isNotEmpty) {
// // // // // // //                         final latestTime = DateTime.now();
// // // // // // //                         return Center(
// // // // // // //                           child: Padding(
// // // // // // //                             padding: const EdgeInsets.symmetric(vertical: 10),
// // // // // // //                             child: Text(
// // // // // // //                               '${latestTime.day}/${latestTime.month}/${latestTime.year}',
// // // // // // //                               style: const TextStyle(
// // // // // // //                                 fontSize: 12,
// // // // // // //                                 color: Colors.grey,
// // // // // // //                               ),
// // // // // // //                             ),
// // // // // // //                           ),
// // // // // // //                         );
// // // // // // //                       }
// // // // // // //                       return const SizedBox.shrink();
// // // // // // //                     }
// // // // // // //                     final messageIndex = index - 1;
// // // // // // //                     final message = viewModel.localMessages[messageIndex];
// // // // // // //                     final isMe = message['isMe'] as bool;
// // // // // // //                     return ChatsBubble(
// // // // // // //                       isMe: isMe,
// // // // // // //                       message: message,
// // // // // // //                       chatId: widget.chat.id,
// // // // // // //                     );
// // // // // // //                   },
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //               Padding(
// // // // // // //                 padding: const EdgeInsets.all(8.0),
// // // // // // //                 child: Row(
// // // // // // //                   children: [
// // // // // // //                     Container(
// // // // // // //                       width: 40,
// // // // // // //                       height: 40,
// // // // // // //                       decoration: const BoxDecoration(
// // // // // // //                         color: AppColors.primaryColor,
// // // // // // //                         shape: BoxShape.circle,
// // // // // // //                       ),
// // // // // // //                       child: IconButton(
// // // // // // //                         icon: const Icon(
// // // // // // //                           Icons.mic,
// // // // // // //                           color: Colors.white,
// // // // // // //                           size: 24,
// // // // // // //                         ),
// // // // // // //                         onPressed: () {},
// // // // // // //                       ),
// // // // // // //                     ),
// // // // // // //                     const SizedBox(width: 5),
// // // // // // //                     Expanded(
// // // // // // //                       child: ChatTextField(
// // // // // // //                         messageController: viewModel.messageController,
// // // // // // //                       ),
// // // // // // //                     ),
// // // // // // //                     IconButton(
// // // // // // //                       icon: const Icon(
// // // // // // //                         Icons.send,
// // // // // // //                         color: AppColors.primaryColor,
// // // // // // //                       ),
// // // // // // //                       onPressed: () => viewModel.sendMessage(
// // // // // // //                         widget.chat.id,
// // // // // // //                         viewModel.messageController.text,
// // // // // // //                         true,
// // // // // // //                       ),
// // // // // // //                     ),
// // // // // // //                   ],
// // // // // // //                 ),
// // // // // // //               ),
// // // // // // //             ],
// // // // // // //           ),
// // // // // // //         );
// // // // // // //       },
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
// // // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
// // // // // // import 'package:awesome_dialog/awesome_dialog.dart';
// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'package:flutter/scheduler.dart';
// // // // // // import 'package:provider/provider.dart';
// // // // // // import 'dart:io';

// // // // // // class ChatView extends StatefulWidget {
// // // // // //   final ChatModel chat;

// // // // // //   const ChatView({super.key, required this.chat});

// // // // // //   @override
// // // // // //   _ChatViewState createState() => _ChatViewState();
// // // // // // }

// // // // // // class _ChatViewState extends State<ChatView> {
// // // // // //   @override
// // // // // //   void initState() {
// // // // // //     super.initState();
// // // // // //     // تأجيل تهيئة الرسايل لحد ما الـ build يكتمل
// // // // // //     SchedulerBinding.instance.addPostFrameCallback((_) {
// // // // // //       Provider.of<ChatViewModel>(context, listen: false)
// // // // // //           .initChatMessages(widget.chat);
// // // // // //     });
// // // // // //   }

// // // // // //   void _showDeleteDialog(ChatViewModel viewModel) {
// // // // // //     AwesomeDialog(
// // // // // //       context: context,
// // // // // //       dialogType: DialogType.warning,
// // // // // //       animType: AnimType.scale,
// // // // // //       title: 'Delete Chat',
// // // // // //       desc: 'Are you sure you want to delete this chat?',
// // // // // //       btnCancelOnPress: () {},
// // // // // //       btnOkOnPress: () async {
// // // // // //         try {
// // // // // //           await viewModel.deleteChat(widget.chat.id);
// // // // // //           Navigator.pop(context);
// // // // // //         } catch (e) {
// // // // // //           ScaffoldMessenger.of(context).showSnackBar(
// // // // // //             SnackBar(content: Text('Failed to delete chat: $e')),
// // // // // //           );
// // // // // //         }
// // // // // //       },
// // // // // //       btnOkText: 'Delete',
// // // // // //       btnCancelText: 'Cancel',
// // // // // //     ).show();
// // // // // //   }

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Consumer<ChatViewModel>(
// // // // // //       builder: (context, viewModel, child) {
// // // // // //         final appBar = AppBar(
// // // // // //           backgroundColor: AppColors.primaryColor,
// // // // // //           elevation: 0,
// // // // // //           leading: IconButton(
// // // // // //             icon: const Icon(Icons.arrow_back, color: Colors.white),
// // // // // //             onPressed: () => Navigator.pop(context),
// // // // // //           ),
// // // // // //           title: Row(
// // // // // //             children: [
// // // // // //               // CircleAvatar(
// // // // // //               //   backgroundImage: (widget.chat.avatar.startsWith('file://') ||
// // // // // //               //           File(widget.chat.avatar).existsSync())
// // // // // //               //       ? FileImage(File(widget.chat.avatar))
// // // // // //               //       :  NetworkImage(
// // // // // //               //           ? widget.chat.avatar
// // // // // //               //           : 'https://via.placeholder.com/150'),
// // // // // //               //   radius: 20,
// // // // // //               // ),

// // // // // //               CircleAvatar(
// // // // // //                 radius: 20,
// // // // // //                 backgroundImage: widget.chat.avatar.isNotEmpty &&
// // // // // //                         !(widget.chat.avatar.startsWith('file://') ||
// // // // // //                             File(widget.chat.avatar).existsSync())
// // // // // //                     ? NetworkImage(widget.chat.avatar)
// // // // // //                     : (widget.chat.avatar.startsWith('file://') ||
// // // // // //                             File(widget.chat.avatar).existsSync())
// // // // // //                         ? FileImage(File(widget.chat.avatar))
// // // // // //                         : null,
// // // // // //                 onBackgroundImageError: (exception, stackTrace) {
// // // // // //                   // Do nothing, let child handle the error case
// // // // // //                 },
// // // // // //                 child: widget.chat.avatar.isEmpty ||
// // // // // //                         (!(widget.chat.avatar.startsWith('file://') ||
// // // // // //                                 File(widget.chat.avatar).existsSync()) &&
// // // // // //                             widget.chat.avatar.isNotEmpty)
// // // // // //                     ? const Icon(
// // // // // //                         Icons.person,
// // // // // //                         color: Colors.white,
// // // // // //                         size: 24,
// // // // // //                       )
// // // // // //                     : null,
// // // // // //               ),
// // // // // //               const SizedBox(width: 10),
// // // // // //               Expanded(
// // // // // //                 child: Text(
// // // // // //                   widget.chat.name,
// // // // // //                   style: const TextStyle(
// // // // // //                     fontSize: 20,
// // // // // //                     fontWeight: FontWeight.bold,
// // // // // //                     color: Colors.white,
// // // // // //                   ),
// // // // // //                   overflow: TextOverflow.ellipsis,
// // // // // //                   maxLines: 1,
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ],
// // // // // //           ),
// // // // // //           actions: [
// // // // // //             PopupMenuButton<String>(
// // // // // //               icon: const Icon(Icons.more_vert, color: Colors.white),
// // // // // //               onSelected: (value) {
// // // // // //                 if (value == 'delete') {
// // // // // //                   _showDeleteDialog(viewModel);
// // // // // //                 }
// // // // // //               },
// // // // // //               itemBuilder: (BuildContext context) => [
// // // // // //                 const PopupMenuItem<String>(
// // // // // //                   value: 'delete',
// // // // // //                   child: Text('Delete Chat'),
// // // // // //                 ),
// // // // // //               ],
// // // // // //             ),
// // // // // //           ],
// // // // // //         );

// // // // // //         return Scaffold(
// // // // // //           backgroundColor: Colors.white,
// // // // // //           appBar: appBar,
// // // // // //           body: Column(
// // // // // //             children: [
// // // // // //               Expanded(
// // // // // //                 child: ListView.builder(
// // // // // //                   controller: viewModel.scrollController,
// // // // // //                   physics: const AlwaysScrollableScrollPhysics(),
// // // // // //                   padding:
// // // // // //                       const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
// // // // // //                   cacheExtent: 1000.0,
// // // // // //                   itemCount: viewModel.localMessages.length + 1,
// // // // // //                   itemBuilder: (context, index) {
// // // // // //                     if (index == 0) {
// // // // // //                       if (viewModel.localMessages.isNotEmpty) {
// // // // // //                         final latestTime = DateTime.now();
// // // // // //                         return Center(
// // // // // //                           child: Padding(
// // // // // //                             padding: const EdgeInsets.symmetric(vertical: 10),
// // // // // //                             child: Text(
// // // // // //                               '${latestTime.day}/${latestTime.month}/${latestTime.year}',
// // // // // //                               style: const TextStyle(
// // // // // //                                 fontSize: 12,
// // // // // //                                 color: Colors.grey,
// // // // // //                               ),
// // // // // //                             ),
// // // // // //                           ),
// // // // // //                         );
// // // // // //                       }
// // // // // //                       return const SizedBox.shrink();
// // // // // //                     }
// // // // // //                     final messageIndex = index - 1;
// // // // // //                     final message = viewModel.localMessages[messageIndex];
// // // // // //                     final isMe = message['isMe'] as bool;
// // // // // //                     return ChatsBubble(
// // // // // //                       isMe: isMe,
// // // // // //                       message: message,
// // // // // //                       chatId: widget.chat.id,
// // // // // //                     );
// // // // // //                   },
// // // // // //                 ),
// // // // // //               ),
// // // // // //               Padding(
// // // // // //                 padding: const EdgeInsets.all(8.0),
// // // // // //                 child: Row(
// // // // // //                   children: [
// // // // // //                     Container(
// // // // // //                       width: 40,
// // // // // //                       height: 40,
// // // // // //                       decoration: const BoxDecoration(
// // // // // //                         color: AppColors.primaryColor,
// // // // // //                         shape: BoxShape.circle,
// // // // // //                       ),
// // // // // //                       child: IconButton(
// // // // // //                         icon: const Icon(
// // // // // //                           Icons.mic,
// // // // // //                           color: Colors.white,
// // // // // //                           size: 24,
// // // // // //                         ),
// // // // // //                         onPressed: () {},
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                     const SizedBox(width: 5),
// // // // // //                     Expanded(
// // // // // //                       child: ChatTextField(
// // // // // //                         messageController: viewModel.messageController,
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                     IconButton(
// // // // // //                       icon: const Icon(
// // // // // //                         Icons.send,
// // // // // //                         color: AppColors.primaryColor,
// // // // // //                       ),
// // // // // //                       onPressed: () => viewModel.sendMessage(
// // // // // //                         widget.chat.id,
// // // // // //                         viewModel.messageController.text,
// // // // // //                         true,
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                   ],
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ],
// // // // // //           ),
// // // // // //         );
// // // // // //       },
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
// // // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
// // // // // import 'package:awesome_dialog/awesome_dialog.dart';
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:flutter/scheduler.dart';
// // // // // import 'package:provider/provider.dart';

// // // // // class ChatView extends StatefulWidget {
// // // // //   final ChatModel chat;

// // // // //   const ChatView({super.key, required this.chat});

// // // // //   @override
// // // // //   _ChatViewState createState() => _ChatViewState();
// // // // // }

// // // // // // class _ChatViewState extends State<ChatView> {
// // // // // //   @override
// // // // // //   void initState() {
// // // // // //     super.initState();
// // // // // //     SchedulerBinding.instance.addPostFrameCallback((_) {
// // // // // //       Provider.of<ChatViewModel>(context, listen: false)
// // // // // //           .initChatMessages(widget.chat);
// // // // // //     });
// // // // // //   }

// // // // // //   void _showDeleteDialog(ChatViewModel viewModel) {
// // // // // //     AwesomeDialog(
// // // // // //       context: context,
// // // // // //       dialogType: DialogType.warning,
// // // // // //       animType: AnimType.scale,
// // // // // //       title: 'Delete Chat',
// // // // // //       desc: 'Are you sure you want to delete this chat?',
// // // // // //       btnCancelOnPress: () {},
// // // // // //       btnOkOnPress: () async {
// // // // // //         try {
// // // // // //           await viewModel.deleteChat(widget.chat.id);
// // // // // //           Navigator.pop(context);
// // // // // //         } catch (e) {
// // // // // //           ScaffoldMessenger.of(context).showSnackBar(
// // // // // //             SnackBar(content: Text('Failed to delete chat: $e')),
// // // // // //           );
// // // // // //         }
// // // // // //       },
// // // // // //       btnOkText: 'Delete',
// // // // // //       btnCancelText: 'Cancel',
// // // // // //     ).show();
// // // // // //   }

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Consumer<ChatViewModel>(
// // // // // //       builder: (context, viewModel, child) {
// // // // // //         final appBar = AppBar(
// // // // // //           backgroundColor: AppColors.primaryColor,
// // // // // //           elevation: 0,
// // // // // //           leading: IconButton(
// // // // // //             icon: const Icon(Icons.arrow_back, color: Colors.white),
// // // // // //             onPressed: () => Navigator.pop(context),
// // // // // //           ),
// // // // // //           title: Row(
// // // // // //             children: [
// // // // // //               CircleAvatar(
// // // // // //                 radius: 20,
// // // // // //                 backgroundColor: AppColors.primaryColor,
// // // // // //                 child: widget.chat.avatar.isNotEmpty
// // // // // //                     ? ClipOval(
// // // // // //                         child: Image.network(
// // // // // //                           widget.chat.avatar,
// // // // // //                           width: 40,
// // // // // //                           height: 40,
// // // // // //                           fit: BoxFit.cover,
// // // // // //                           errorBuilder: (context, error, stackTrace) {
// // // // // //                             print('Error loading avatar in ChatView: $error');
// // // // // //                             return const Icon(
// // // // // //                               Icons.person,
// // // // // //                               color: Colors.white,
// // // // // //                               size: 24,
// // // // // //                             );
// // // // // //                           },
// // // // // //                         ),
// // // // // //                       )
// // // // // //                     : const Icon(
// // // // // //                         Icons.person,
// // // // // //                         color: Colors.white,
// // // // // //                         size: 24,
// // // // // //                       ),
// // // // // //               ),
// // // // // //               const SizedBox(width: 10),
// // // // // //               Expanded(
// // // // // //                 child: Text(
// // // // // //                   widget.chat.name,
// // // // // //                   style: const TextStyle(
// // // // // //                     fontSize: 20,
// // // // // //                     fontWeight: FontWeight.bold,
// // // // // //                     color: Colors.white,
// // // // // //                   ),
// // // // // //                   overflow: TextOverflow.ellipsis,
// // // // // //                   maxLines: 1,
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ],
// // // // // //           ),
// // // // // //           actions: [
// // // // // //             PopupMenuButton<String>(
// // // // // //               icon: const Icon(Icons.more_vert, color: Colors.white),
// // // // // //               onSelected: (value) {
// // // // // //                 if (value == 'delete') {
// // // // // //                   _showDeleteDialog(viewModel);
// // // // // //                 }
// // // // // //               },
// // // // // //               itemBuilder: (BuildContext context) => [
// // // // // //                 const PopupMenuItem<String>(
// // // // // //                   value: 'delete',
// // // // // //                   child: Text('Delete Chat'),
// // // // // //                 ),
// // // // // //               ],
// // // // // //             ),
// // // // // //           ],
// // // // // //         );

// // // // // //         return Scaffold(
// // // // // //           backgroundColor: Colors.white,
// // // // // //           appBar: appBar,
// // // // // //           body: Column(
// // // // // //             children: [
// // // // // //               Expanded(
// // // // // //                 child: ListView.builder(
// // // // // //                   controller: viewModel.scrollController,
// // // // // //                   physics: const AlwaysScrollableScrollPhysics(),
// // // // // //                   padding:
// // // // // //                       const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
// // // // // //                   cacheExtent: 1000.0,
// // // // // //                   itemCount: viewModel.localMessages.length + 1,
// // // // // //                   itemBuilder: (context, index) {
// // // // // //                     if (index == 0) {
// // // // // //                       if (viewModel.localMessages.isNotEmpty) {
// // // // // //                         final latestTime = DateTime.now();
// // // // // //                         return Center(
// // // // // //                           child: Padding(
// // // // // //                             padding: const EdgeInsets.symmetric(vertical: 10),
// // // // // //                             child: Text(
// // // // // //                               '${latestTime.day}/${latestTime.month}/${latestTime.year}',
// // // // // //                               style: const TextStyle(
// // // // // //                                 fontSize: 12,
// // // // // //                                 color: Colors.grey,
// // // // // //                               ),
// // // // // //                             ),
// // // // // //                           ),
// // // // // //                         );
// // // // // //                       }
// // // // // //                       return const SizedBox.shrink();
// // // // // //                     }
// // // // // //                     final messageIndex = index - 1;
// // // // // //                     final message = viewModel.localMessages[messageIndex];
// // // // // //                     final isMe = message['isMe'] as bool;
// // // // // //                     return ChatsBubble(
// // // // // //                       isMe: isMe,
// // // // // //                       message: message,
// // // // // //                       chatId: widget.chat.id,
// // // // // //                     );
// // // // // //                   },
// // // // // //                 ),
// // // // // //               ),
// // // // // //               Padding(
// // // // // //                 padding: const EdgeInsets.all(8.0),
// // // // // //                 child: Row(
// // // // // //                   children: [
// // // // // //                     Container(
// // // // // //                       width: 40,
// // // // // //                       height: 40,
// // // // // //                       decoration: const BoxDecoration(
// // // // // //                         color: AppColors.primaryColor,
// // // // // //                         shape: BoxShape.circle,
// // // // // //                       ),
// // // // // //                       child: IconButton(
// // // // // //                         icon: const Icon(
// // // // // //                           Icons.mic,
// // // // // //                           color: Colors.white,
// // // // // //                           size: 24,
// // // // // //                         ),
// // // // // //                         onPressed: () {},
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                     const SizedBox(width: 5),
// // // // // //                     Expanded(
// // // // // //                       child: ChatTextField(
// // // // // //                         messageController: viewModel.messageController,
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                     IconButton(
// // // // // //                       icon: const Icon(
// // // // // //                         Icons.send,
// // // // // //                         color: AppColors.primaryColor,
// // // // // //                       ),
// // // // // //                       onPressed: () => viewModel.sendMessage(
// // // // // //                         widget.chat.id,
// // // // // //                         viewModel.messageController.text,
// // // // // //                         true,
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                   ],
// // // // // //                 ),
// // // // // //               ),
// // // // // //             ],
// // // // // //           ),
// // // // // //         );
// // // // // //       },
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // class _ChatViewState extends State<ChatView> {
// // // // //   @override
// // // // //   void initState() {
// // // // //     super.initState();
// // // // //     SchedulerBinding.instance.addPostFrameCallback((_) {
// // // // //       Provider.of<ChatViewModel>(context, listen: false)
// // // // //           .initChatMessages(widget.chat);
// // // // //     });
// // // // //   }

// // // // //   void _showDeleteDialog(ChatViewModel viewModel) {
// // // // //     AwesomeDialog(
// // // // //       context: context,
// // // // //       dialogType: DialogType.warning,
// // // // //       animType: AnimType.scale,
// // // // //       title: 'Delete Chat',
// // // // //       desc: 'Are you sure you want to delete this chat?',
// // // // //       btnCancelOnPress: () {},
// // // // //       btnOkOnPress: () async {
// // // // //         try {
// // // // //           await viewModel.deleteChat(widget.chat.id);
// // // // //           Navigator.pop(context);
// // // // //         } catch (e) {
// // // // //           ScaffoldMessenger.of(context).showSnackBar(
// // // // //             SnackBar(content: Text('Failed to delete chat: $e')),
// // // // //           );
// // // // //         }
// // // // //       },
// // // // //       btnOkText: 'Delete',
// // // // //       btnCancelText: 'Cancel',
// // // // //     ).show();
// // // // //   }

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Consumer<ChatViewModel>(
// // // // //       builder: (context, viewModel, child) {
// // // // //         final appBar = AppBar(
// // // // //           backgroundColor: AppColors.primaryColor,
// // // // //           elevation: 0,
// // // // //           leading: IconButton(
// // // // //             icon: const Icon(Icons.arrow_back, color: Colors.white),
// // // // //             onPressed: () => Navigator.pop(context),
// // // // //           ),
// // // // //           title: Row(
// // // // //             children: [
// // // // //               CircleAvatar(
// // // // //                 radius: 20,
// // // // //                 backgroundColor: AppColors.primaryColor,
// // // // //                 child: widget.chat.avatar.isNotEmpty &&
// // // // //                         widget.chat.avatar.startsWith('http')
// // // // //                     ? ClipOval(
// // // // //                         child: Image.network(
// // // // //                           widget.chat.avatar,
// // // // //                           width: 40,
// // // // //                           height: 40,
// // // // //                           fit: BoxFit.cover,
// // // // //                           errorBuilder: (context, error, stackTrace) {
// // // // //                             print('Error loading avatar in ChatView: $error');
// // // // //                             return const Icon(
// // // // //                               Icons.person,
// // // // //                               color: Colors.white,
// // // // //                               size: 24,
// // // // //                             );
// // // // //                           },
// // // // //                         ),
// // // // //                       )
// // // // //                     : const Icon(
// // // // //                         Icons.person,
// // // // //                         color: Colors.white,
// // // // //                         size: 24,
// // // // //                       ),
// // // // //               ),
// // // // //               const SizedBox(width: 10),
// // // // //               Expanded(
// // // // //                 child: Text(
// // // // //                   widget.chat.name,
// // // // //                   style: const TextStyle(
// // // // //                     fontSize: 20,
// // // // //                     fontWeight: FontWeight.bold,
// // // // //                     color: Colors.white,
// // // // //                   ),
// // // // //                   overflow: TextOverflow.ellipsis,
// // // // //                   maxLines: 1,
// // // // //                 ),
// // // // //               ),
// // // // //             ],
// // // // //           ),
// // // // //           actions: [
// // // // //             PopupMenuButton<String>(
// // // // //               icon: const Icon(Icons.more_vert, color: Colors.white),
// // // // //               onSelected: (value) {
// // // // //                 if (value == 'delete') {
// // // // //                   _showDeleteDialog(viewModel);
// // // // //                 }
// // // // //               },
// // // // //               itemBuilder: (BuildContext context) => [
// // // // //                 const PopupMenuItem<String>(
// // // // //                   value: 'delete',
// // // // //                   child: Text('Delete Chat'),
// // // // //                 ),
// // // // //               ],
// // // // //             ),
// // // // //           ],
// // // // //         );

// // // // //         return Scaffold(
// // // // //           backgroundColor: Colors.white,
// // // // //           appBar: appBar,
// // // // //           body: Column(
// // // // //             children: [
// // // // //               Expanded(
// // // // //                 child: ListView.builder(
// // // // //                   controller: viewModel.scrollController,
// // // // //                   physics: const AlwaysScrollableScrollPhysics(),
// // // // //                   padding:
// // // // //                       const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
// // // // //                   cacheExtent: 1000.0,
// // // // //                   itemCount: viewModel.localMessages.length + 1,
// // // // //                   itemBuilder: (context, index) {
// // // // //                     if (index == 0) {
// // // // //                       if (viewModel.localMessages.isNotEmpty) {
// // // // //                         final latestTime = DateTime.now();
// // // // //                         return Center(
// // // // //                           child: Padding(
// // // // //                             padding: const EdgeInsets.symmetric(vertical: 10),
// // // // //                             child: Text(
// // // // //                               '${latestTime.day}/${latestTime.month}/${latestTime.year}',
// // // // //                               style: const TextStyle(
// // // // //                                 fontSize: 12,
// // // // //                                 color: Colors.grey,
// // // // //                               ),
// // // // //                             ),
// // // // //                           ),
// // // // //                         );
// // // // //                       }
// // // // //                       return const SizedBox.shrink();
// // // // //                     }
// // // // //                     final messageIndex = index - 1;
// // // // //                     final message = viewModel.localMessages[messageIndex];
// // // // //                     final isMe = message['isMe'] as bool;
// // // // //                     return ChatsBubble(
// // // // //                       isMe: isMe,
// // // // //                       message: message,
// // // // //                       chatId: widget.chat.id,
// // // // //                     );
// // // // //                   },
// // // // //                 ),
// // // // //               ),
// // // // //               Padding(
// // // // //                 padding: const EdgeInsets.all(8.0),
// // // // //                 child: Row(
// // // // //                   children: [
// // // // //                     Container(
// // // // //                       width: 40,
// // // // //                       height: 40,
// // // // //                       decoration: const BoxDecoration(
// // // // //                         color: AppColors.primaryColor,
// // // // //                         shape: BoxShape.circle,
// // // // //                       ),
// // // // //                       child: IconButton(
// // // // //                         icon: const Icon(
// // // // //                           Icons.mic,
// // // // //                           color: Colors.white,
// // // // //                           size: 24,
// // // // //                         ),
// // // // //                         onPressed: () {},
// // // // //                       ),
// // // // //                     ),
// // // // //                     const SizedBox(width: 5),
// // // // //                     Expanded(
// // // // //                       child: ChatTextField(
// // // // //                         messageController: viewModel.messageController,
// // // // //                       ),
// // // // //                     ),
// // // // //                     IconButton(
// // // // //                       icon: const Icon(
// // // // //                         Icons.send,
// // // // //                         color: AppColors.primaryColor,
// // // // //                       ),
// // // // //                       onPressed: () => viewModel.sendMessage(
// // // // //                         widget.chat.id,
// // // // //                         viewModel.messageController.text,
// // // // //                         true,
// // // // //                       ),
// // // // //                     ),
// // // // //                   ],
// // // // //                 ),
// // // // //               ),
// // // // //             ],
// // // // //           ),
// // // // //         );
// // // // //       },
// // // // //     );
// // // // //   }
// // // // // }

// // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // // // import 'package:attendance_app/features/chats/presentation/views/update_chat_view.dart';
// // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
// // // // import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
// // // // import 'package:awesome_dialog/awesome_dialog.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:flutter/scheduler.dart';
// // // // import 'package:provider/provider.dart';

// // // // class ChatView extends StatefulWidget {
// // // //   final ChatModel chat;

// // // //   const ChatView({super.key, required this.chat});

// // // //   @override
// // // //   _ChatViewState createState() => _ChatViewState();
// // // // }

// // // // class _ChatViewState extends State<ChatView> {
// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     SchedulerBinding.instance.addPostFrameCallback((_) {
// // // //       Provider.of<ChatViewModel>(context, listen: false)
// // // //           .initChatMessages(widget.chat);
// // // //     });
// // // //   }

// // // //   void _showDeleteDialog(ChatViewModel viewModel) {
// // // //     AwesomeDialog(
// // // //       context: context,
// // // //       dialogType: DialogType.warning,
// // // //       animType: AnimType.scale,
// // // //       title: 'Delete Chat',
// // // //       desc: 'Are you sure you want to delete this chat?',
// // // //       btnCancelOnPress: () {},
// // // //       btnOkOnPress: () async {
// // // //         try {
// // // //           await viewModel.deleteChat(widget.chat.id);
// // // //           Navigator.pop(context);
// // // //         } catch (e) {
// // // //           ScaffoldMessenger.of(context).showSnackBar(
// // // //             SnackBar(content: Text('Failed to delete chat: $e')),
// // // //           );
// // // //         }
// // // //       },
// // // //       btnOkText: 'Delete',
// // // //       btnCancelText: 'Cancel',
// // // //     ).show();
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Consumer<ChatViewModel>(
// // // //       builder: (context, viewModel, child) {
// // // //         final appBar = AppBar(
// // // //           backgroundColor: AppColors.primaryColor,
// // // //           elevation: 0,
// // // //           leading: IconButton(
// // // //             icon: const Icon(Icons.arrow_back, color: Colors.white),
// // // //             onPressed: () => Navigator.pop(context),
// // // //           ),
// // // //           title: Row(
// // // //             children: [
// // // //               CircleAvatar(
// // // //                 radius: 20,
// // // //                 backgroundColor: AppColors.primaryColor,
// // // //                 child: widget.chat.avatar.isNotEmpty &&
// // // //                         widget.chat.avatar.startsWith('http')
// // // //                     ? ClipOval(
// // // //                         child: Image.network(
// // // //                           widget.chat.avatar,
// // // //                           width: 40,
// // // //                           height: 40,
// // // //                           fit: BoxFit.cover,
// // // //                           errorBuilder: (context, error, stackTrace) {
// // // //                             print('Error loading avatar in ChatView: $error');
// // // //                             return const Icon(
// // // //                               Icons.person,
// // // //                               color: Colors.white,
// // // //                               size: 24,
// // // //                             );
// // // //                           },
// // // //                         ),
// // // //                       )
// // // //                     : const Icon(
// // // //                         Icons.person,
// // // //                         color: Colors.white,
// // // //                         size: 24,
// // // //                       ),
// // // //               ),
// // // //               const SizedBox(width: 10),
// // // //               Expanded(
// // // //                 child: Text(
// // // //                   widget.chat.name,
// // // //                   style: const TextStyle(
// // // //                     fontSize: 20,
// // // //                     fontWeight: FontWeight.bold,
// // // //                     color: Colors.white,
// // // //                   ),
// // // //                   overflow: TextOverflow.ellipsis,
// // // //                   maxLines: 1,
// // // //                 ),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //           // actions: [
// // // //           //   PopupMenuButton<String>(
// // // //           //     icon: const Icon(Icons.more_vert, color: Colors.white),
// // // //           //     onSelected: (value) {
// // // //           //       if (value == 'delete') {
// // // //           //         _showDeleteDialog(viewModel);
// // // //           //       } else if (value == 'update') {
// // // //           //         Navigator.push(
// // // //           //           context,
// // // //           //           MaterialPageRoute(
// // // //           //             builder: (context) => UpdateChatView(chat: widget.chat),
// // // //           //           ),
// // // //           //         );
// // // //           //       }
// // // //           //     },
// // // //           //     itemBuilder: (BuildContext context) => [
// // // //           //       const PopupMenuItem<String>(
// // // //           //         value: 'delete',
// // // //           //         child: Text('Delete Chat'),
// // // //           //       ),
// // // //           //       const PopupMenuItem<String>(
// // // //           //         value: 'update',
// // // //           //         child: Text('Update Chat'),
// // // //           //       ),
// // // //           //     ],
// // // //           //   ),
// // // //           // ],

// // // //           actions: [
// // // //             PopupMenuButton<String>(
// // // //               icon: const Icon(Icons.more_vert, color: Colors.white),
// // // //               onSelected: (value) {
// // // //                 if (value == 'delete') {
// // // //                   _showDeleteDialog(viewModel);
// // // //                 } else if (value == 'update') {
// // // //                   Navigator.push(
// // // //                     context,
// // // //                     MaterialPageRoute(
// // // //                       builder: (context) => UpdateChatView(chat: widget.chat),
// // // //                     ),
// // // //                   );
// // // //                 }
// // // //               },
// // // //               itemBuilder: (BuildContext context) => [
// // // //                 const PopupMenuItem<String>(
// // // //                   value: 'update',
// // // //                   child: Text('Update Chat Name'),
// // // //                 ),
// // // //                 const PopupMenuItem<String>(
// // // //                   value: 'delete',
// // // //                   child: Text('Delete Chat'),
// // // //                 ),
// // // //               ],
// // // //               offset: const Offset(0, 50), // تخلي القايمة تنزل لتحت
// // // //             ),
// // // //           ],
// // // //         );

// // // //         return Scaffold(
// // // //           backgroundColor: Colors.white,
// // // //           appBar: appBar,
// // // //           body: Column(
// // // //             children: [
// // // //               Expanded(
// // // //                 child: ListView.builder(
// // // //                   controller: viewModel.scrollController,
// // // //                   physics: const AlwaysScrollableScrollPhysics(),
// // // //                   padding:
// // // //                       const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
// // // //                   cacheExtent: 1000.0,
// // // //                   itemCount: viewModel.localMessages.length + 1,
// // // //                   itemBuilder: (context, index) {
// // // //                     if (index == 0) {
// // // //                       if (viewModel.localMessages.isNotEmpty) {
// // // //                         final latestTime = DateTime.now();
// // // //                         // return Center(
// // // //                         //   child: Padding(
// // // //                         //     padding: const EdgeInsets.symmetric(vertical: 10),
// // // //                         //     child: Container(
// // // //                         //       color: Colors.green,
// // // //                         //       child: Text(
// // // //                         //         '${latestTime.day}/${latestTime.month}/${latestTime.year}',
// // // //                         //         style: const TextStyle(
// // // //                         //           fontSize: 18,
// // // //                         //           color: Colors.grey,
// // // //                         //         ),
// // // //                         //       ),
// // // //                         //     ),
// // // //                         //   ),
// // // //                         // );

// // // //                         return Center(
// // // //                           child: Padding(
// // // //                             padding: const EdgeInsets.symmetric(vertical: 10),
// // // //                             child: Container(
// // // //                               padding: const EdgeInsets.symmetric(
// // // //                                   horizontal: 12, vertical: 6),
// // // //                               decoration: BoxDecoration(
// // // //                                 color: Colors.green.withOpacity(0.2),
// // // //                                 borderRadius: BorderRadius.circular(16),
// // // //                               ),
// // // //                               child: Text(
// // // //                                 '${latestTime.day}/${latestTime.month}/${latestTime.year}',
// // // //                                 style: const TextStyle(
// // // //                                   fontSize: 14,
// // // //                                   color: Colors.black54,
// // // //                                   fontWeight: FontWeight.w500,
// // // //                                 ),
// // // //                               ),
// // // //                             ),
// // // //                           ),
// // // //                         );
// // // //                       }
// // // //                       return const SizedBox.shrink();
// // // //                     }
// // // //                     final messageIndex = index - 1;
// // // //                     final message = viewModel.localMessages[messageIndex];
// // // //                     final isMe = message['isMe'] as bool;
// // // //                     return ChatsBubble(
// // // //                       isMe: isMe,
// // // //                       message: message,
// // // //                       chatId: widget.chat.id,
// // // //                     );
// // // //                   },
// // // //                 ),
// // // //               ),
// // // //               Padding(
// // // //                 padding: const EdgeInsets.all(8.0),
// // // //                 child: Row(
// // // //                   children: [
// // // //                     Container(
// // // //                       width: 40,
// // // //                       height: 40,
// // // //                       decoration: const BoxDecoration(
// // // //                         color: AppColors.primaryColor,
// // // //                         shape: BoxShape.circle,
// // // //                       ),
// // // //                       child: IconButton(
// // // //                         icon: const Icon(
// // // //                           Icons.mic,
// // // //                           color: Colors.white,
// // // //                           size: 24,
// // // //                         ),
// // // //                         onPressed: () {},
// // // //                       ),
// // // //                     ),
// // // //                     const SizedBox(width: 5),
// // // //                     Expanded(
// // // //                       child: ChatTextField(
// // // //                         chatId: widget.chat.id,
// // // //                         messageController: viewModel.messageController,
// // // //                       ),
// // // //                     ),
// // // //                     IconButton(
// // // //                       icon: const Icon(
// // // //                         Icons.send,
// // // //                         color: AppColors.primaryColor,
// // // //                       ),
// // // //                       onPressed: () => viewModel.sendMessage(
// // // //                         widget.chat.id,
// // // //                         viewModel.messageController.text,
// // // //                         true,
// // // //                       ),
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //         );
// // // //       },
// // // //     );
// // // //   }
// // // // }

// // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // // import 'package:attendance_app/features/chats/presentation/views/update_chat_view.dart';
// // // import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
// // // import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
// // // import 'package:attendance_app/features/chats/presentation/views/widgets/show_image.dart';
// // // import 'package:awesome_dialog/awesome_dialog.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter/scheduler.dart';
// // // import 'package:provider/provider.dart';

// // // class ChatView extends StatefulWidget {
// // //   final ChatModel chat;

// // //   const ChatView({super.key, required this.chat});

// // //   @override
// // //   _ChatViewState createState() => _ChatViewState();
// // // }

// // // class _ChatViewState extends State<ChatView> {
// // //   bool _isUploadingImage = false; // حالة التحميل

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     SchedulerBinding.instance.addPostFrameCallback((_) {
// // //       Provider.of<ChatViewModel>(context, listen: false)
// // //           .initChatMessages(widget.chat);
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

// // //   // دالة لتغيير حالة التحميل
// // //   void _setUploadingImage(bool value) {
// // //     if (mounted) {
// // //       setState(() {
// // //         _isUploadingImage = value;
// // //       });
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Consumer<ChatViewModel>(
// // //       builder: (context, viewModel, child) {
// // //         final appBar = AppBar(
// // //           backgroundColor: AppColors.primaryColor,
// // //           elevation: 0,
// // //           leading: IconButton(
// // //             icon: const Icon(Icons.arrow_back, color: Colors.white),
// // //             onPressed: () => Navigator.pop(context),
// // //           ),
// // //           title: Row(
// // //             children: [
// // //               GestureDetector(
// // //                 onTap: () {
// // //                   if (widget.chat.avatar.isNotEmpty &&
// // //                       widget.chat.avatar.startsWith('http')) {
// // //                     Navigator.push(
// // //                       context,
// // //                       MaterialPageRoute(
// // //                         builder: (context) => ShowImage(
// // //                           imageUrl: widget.chat.avatar,
// // //                         ),
// // //                       ),
// // //                     );
// // //                   }
// // //                 },
// // //                 child: CircleAvatar(
// // //                   radius: 20,
// // //                   backgroundColor: AppColors.primaryColor,
// // //                   child: widget.chat.avatar.isNotEmpty &&
// // //                           widget.chat.avatar.startsWith('http')
// // //                       ? ClipOval(
// // //                           child: Image.network(
// // //                             widget.chat.avatar,
// // //                             width: 40,
// // //                             height: 40,
// // //                             fit: BoxFit.cover,
// // //                             errorBuilder: (context, error, stackTrace) {
// // //                               print('Error loading avatar in ChatView: $error');
// // //                               return const Icon(
// // //                                 Icons.person,
// // //                                 color: Colors.white,
// // //                                 size: 24,
// // //                               );
// // //                             },
// // //                           ),
// // //                         )
// // //                       : const Icon(
// // //                           Icons.person,
// // //                           color: Colors.white,
// // //                           size: 24,
// // //                         ),
// // //                 ),
// // //               ),
// // //               const SizedBox(width: 10),
// // //               Expanded(
// // //                 child: Text(
// // //                   widget.chat.name,
// // //                   style: const TextStyle(
// // //                     fontSize: 20,
// // //                     fontWeight: FontWeight.bold,
// // //                     color: Colors.white,
// // //                   ),
// // //                   overflow: TextOverflow.ellipsis,
// // //                   maxLines: 1,
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //           actions: [
// // //             PopupMenuButton<String>(
// // //               icon: const Icon(Icons.more_vert, color: Colors.white),
// // //               onSelected: (value) {
// // //                 if (value == 'delete') {
// // //                   _showDeleteDialog(viewModel);
// // //                 } else if (value == 'update') {
// // //                   Navigator.push(
// // //                     context,
// // //                     MaterialPageRoute(
// // //                       builder: (context) => UpdateChatView(chat: widget.chat),
// // //                     ),
// // //                   );
// // //                 }
// // //               },
// // //               itemBuilder: (BuildContext context) => [
// // //                 const PopupMenuItem<String>(
// // //                   value: 'update',
// // //                   child: Text('Update Chat Name'),
// // //                 ),
// // //                 const PopupMenuItem<String>(
// // //                   value: 'delete',
// // //                   child: Text('Delete Chat'),
// // //                 ),
// // //               ],
// // //               offset: const Offset(0, 50),
// // //             ),
// // //           ],
// // //         );

// // //         return Scaffold(
// // //           backgroundColor: Colors.white,
// // //           appBar: appBar,
// // //           body: Stack(
// // //             children: [
// // //               Column(
// // //                 children: [
// // //                   Expanded(
// // //                     child: ListView.builder(
// // //                       controller: viewModel.scrollController,
// // //                       physics: const AlwaysScrollableScrollPhysics(),
// // //                       padding: const EdgeInsets.symmetric(
// // //                           vertical: 10, horizontal: 10),
// // //                       cacheExtent: 1000.0,
// // //                       itemCount: viewModel.localMessages.length + 1,
// // //                       itemBuilder: (context, index) {
// // //                         if (index == 0) {
// // //                           if (viewModel.localMessages.isNotEmpty) {
// // //                             final latestTime = DateTime.now();
// // //                             return Center(
// // //                               child: Padding(
// // //                                 padding:
// // //                                     const EdgeInsets.symmetric(vertical: 10),
// // //                                 child: Container(
// // //                                   padding: const EdgeInsets.symmetric(
// // //                                       horizontal: 12, vertical: 6),
// // //                                   decoration: BoxDecoration(
// // //                                     color: Colors.green.withOpacity(0.2),
// // //                                     borderRadius: BorderRadius.circular(16),
// // //                                   ),
// // //                                   child: Text(
// // //                                     '${latestTime.day}/${latestTime.month}/${latestTime.year}',
// // //                                     style: const TextStyle(
// // //                                       fontSize: 14,
// // //                                       color: Colors.black54,
// // //                                       fontWeight: FontWeight.w500,
// // //                                     ),
// // //                                   ),
// // //                                 ),
// // //                               ),
// // //                             );
// // //                           }
// // //                           return const SizedBox.shrink();
// // //                         }
// // //                         final messageIndex = index - 1;
// // //                         final message = viewModel.localMessages[messageIndex];
// // //                         final isMe = message['isMe'] as bool;
// // //                         return ChatsBubble(
// // //                           isMe: isMe,
// // //                           message: message,
// // //                           chatId: widget.chat.id,
// // //                         );
// // //                       },
// // //                     ),
// // //                   ),
// // //                   Padding(
// // //                     padding: const EdgeInsets.all(8.0),
// // //                     child: Row(
// // //                       children: [
// // //                         Container(
// // //                           width: 40,
// // //                           height: 40,
// // //                           decoration: const BoxDecoration(
// // //                             color: AppColors.primaryColor,
// // //                             shape: BoxShape.circle,
// // //                           ),
// // //                           child: IconButton(
// // //                             icon: const Icon(
// // //                               Icons.mic,
// // //                               color: Colors.white,
// // //                               size: 24,
// // //                             ),
// // //                             onPressed: () {},
// // //                           ),
// // //                         ),
// // //                         const SizedBox(width: 5),
// // //                         Expanded(
// // //                           child: ChatTextField(
// // //                             messageController: viewModel.messageController,
// // //                             chatId: widget.chat.id,
// // //                             onUploadingImage:
// // //                                 _setUploadingImage, // تمرير الدالة
// // //                           ),
// // //                         ),
// // //                         IconButton(
// // //                           icon: const Icon(
// // //                             Icons.send,
// // //                             color: AppColors.primaryColor,
// // //                           ),
// // //                           onPressed: () => viewModel.sendMessage(
// // //                             widget.chat.id,
// // //                             viewModel.messageController.text,
// // //                             true,
// // //                           ),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //               if (_isUploadingImage)
// // //                 const Center(
// // //                   child: CircularProgressIndicator(
// // //                     color: AppColors.primaryColor,
// // //                   ),
// // //                 ),
// // //             ],
// // //           ),
// // //         );
// // //       },
// // //     );
// // //   }
// // // }

// // import 'package:attendance_app/core/utils/app_colors.dart';
// // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // import 'package:attendance_app/features/chats/presentation/views/update_chat_view.dart';
// // import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
// // import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
// // import 'package:attendance_app/features/chats/presentation/views/widgets/show_image.dart';
// // import 'package:awesome_dialog/awesome_dialog.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
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
// //       Provider.of<ChatViewModel>(context, listen: false)
// //           .initChatMessages(widget.chat);
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

// //   void _setUploadingImage(bool value) {
// //     if (mounted) {
// //       setState(() {
// //         _isUploadingImage = value;
// //       });
// //     }
// //   }

// //   // جلب اسم المستخدم الآخر
// //   Future<String> _getOtherUserName() async {
// //     final currentUser = FirebaseAuth.instance.currentUser;
// //     if (currentUser == null) return widget.chat.name;

// //     final otherUserId =
// //         widget.chat.participants.firstWhere((id) => id != currentUser.uid);
// //     final userDoc = await FirebaseFirestore.instance
// //         .collection('users')
// //         .doc(otherUserId)
// //         .get();
// //     return userDoc.exists
// //         ? userDoc['name'] ?? widget.chat.name
// //         : widget.chat.name;
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Consumer<ChatViewModel>(
// //       builder: (context, viewModel, child) {
// //         return FutureBuilder<String>(
// //           future: _getOtherUserName(),
// //           builder: (context, snapshot) {
// //             final otherUserName = snapshot.data ?? widget.chat.name;

// //             final appBar = AppBar(
// //               backgroundColor: AppColors.primaryColor,
// //               elevation: 0,
// //               leading: IconButton(
// //                 icon: const Icon(Icons.arrow_back, color: Colors.white),
// //                 onPressed: () => Navigator.pop(context),
// //               ),
// //               title: Row(
// //                 children: [
// //                   GestureDetector(
// //                     onTap: () {
// //                       if (widget.chat.avatar.isNotEmpty &&
// //                           widget.chat.avatar.startsWith('http')) {
// //                         Navigator.push(
// //                           context,
// //                           MaterialPageRoute(
// //                             builder: (context) => ShowImage(
// //                               imageUrl: widget.chat.avatar,
// //                             ),
// //                           ),
// //                         );
// //                       }
// //                     },
// //                     child: CircleAvatar(
// //                       radius: 20,
// //                       backgroundColor: AppColors.primaryColor,
// //                       child: widget.chat.avatar.isNotEmpty &&
// //                               widget.chat.avatar.startsWith('http')
// //                           ? ClipOval(
// //                               child: Image.network(
// //                                 widget.chat.avatar,
// //                                 width: 40,
// //                                 height: 40,
// //                                 fit: BoxFit.cover,
// //                                 errorBuilder: (context, error, stackTrace) {
// //                                   print(
// //                                       'Error loading avatar in ChatView: $error');
// //                                   return const Icon(
// //                                     Icons.person,
// //                                     color: Colors.white,
// //                                     size: 24,
// //                                   );
// //                                 },
// //                               ),
// //                             )
// //                           : const Icon(
// //                               Icons.person,
// //                               color: Colors.white,
// //                               size: 24,
// //                             ),
// //                     ),
// //                   ),
// //                   const SizedBox(width: 10),
// //                   Expanded(
// //                     child: Text(
// //                       otherUserName, // استخدام اسم المستخدم الآخر
// //                       style: const TextStyle(
// //                         fontSize: 20,
// //                         fontWeight: FontWeight.bold,
// //                         color: Colors.white,
// //                       ),
// //                       overflow: TextOverflow.ellipsis,
// //                       maxLines: 1,
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //               actions: [
// //                 PopupMenuButton<String>(
// //                   icon: const Icon(Icons.more_vert, color: Colors.white),
// //                   onSelected: (value) {
// //                     if (value == 'delete') {
// //                       _showDeleteDialog(viewModel);
// //                     } else if (value == 'update') {
// //                       Navigator.push(
// //                         context,
// //                         MaterialPageRoute(
// //                           builder: (context) =>
// //                               UpdateChatView(chat: widget.chat),
// //                         ),
// //                       );
// //                     }
// //                   },
// //                   itemBuilder: (BuildContext context) => [
// //                     const PopupMenuItem<String>(
// //                       value: 'update',
// //                       child: Text('Update Chat Name'),
// //                     ),
// //                     const PopupMenuItem<String>(
// //                       value: 'delete',
// //                       child: Text('Delete Chat'),
// //                     ),
// //                   ],
// //                   offset: const Offset(0, 50),
// //                 ),
// //               ],
// //             );

// //             return Scaffold(
// //               backgroundColor: Colors.white,
// //               appBar: appBar,
// //               body: Stack(
// //                 children: [
// //                   Column(
// //                     children: [
// //                       Expanded(
// //                         child: ListView.builder(
// //                           controller: viewModel.scrollController,
// //                           physics: const AlwaysScrollableScrollPhysics(),
// //                           padding: const EdgeInsets.symmetric(
// //                               vertical: 10, horizontal: 10),
// //                           cacheExtent: 1000.0,
// //                           itemCount: viewModel.localMessages.length + 1,
// //                           itemBuilder: (context, index) {
// //                             if (index == 0) {
// //                               if (viewModel.localMessages.isNotEmpty) {
// //                                 final latestTime = DateTime.now();
// //                                 return Center(
// //                                   child: Padding(
// //                                     padding: const EdgeInsets.symmetric(
// //                                         vertical: 10),
// //                                     child: Container(
// //                                       padding: const EdgeInsets.symmetric(
// //                                           horizontal: 12, vertical: 6),
// //                                       decoration: BoxDecoration(
// //                                         color: Colors.green.withOpacity(0.2),
// //                                         borderRadius: BorderRadius.circular(16),
// //                                       ),
// //                                       child: Text(
// //                                         '${latestTime.day}/${latestTime.month}/${latestTime.year}',
// //                                         style: const TextStyle(
// //                                           fontSize: 14,
// //                                           color: Colors.black54,
// //                                           fontWeight: FontWeight.w500,
// //                                         ),
// //                                       ),
// //                                     ),
// //                                   ),
// //                                 );
// //                               }
// //                               return const SizedBox.shrink();
// //                             }
// //                             final messageIndex = index - 1;
// //                             final message =
// //                                 viewModel.localMessages[messageIndex];
// //                             final isMe = message['isMe'] as bool;
// //                             return ChatsBubble(
// //                               isMe: isMe,
// //                               message: message,
// //                               chatId: widget.chat.id,
// //                             );
// //                           },
// //                         ),
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.all(8.0),
// //                         child: Row(
// //                           children: [
// //                             Container(
// //                               width: 40,
// //                               height: 40,
// //                               decoration: const BoxDecoration(
// //                                 color: AppColors.primaryColor,
// //                                 shape: BoxShape.circle,
// //                               ),
// //                               child: IconButton(
// //                                 icon: const Icon(
// //                                   Icons.mic,
// //                                   color: Colors.white,
// //                                   size: 24,
// //                                 ),
// //                                 onPressed: () {},
// //                               ),
// //                             ),
// //                             const SizedBox(width: 5),
// //                             Expanded(
// //                               child: ChatTextField(
// //                                 messageController: viewModel.messageController,
// //                                 chatId: widget.chat.id,
// //                                 onUploadingImage: _setUploadingImage,
// //                               ),
// //                             ),
// //                             IconButton(
// //                               icon: const Icon(
// //                                 Icons.send,
// //                                 color: AppColors.primaryColor,
// //                               ),
// //                               onPressed: () => viewModel.sendMessage(
// //                                 widget.chat.id,
// //                                 viewModel.messageController.text,
// //                                 true,
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                   if (_isUploadingImage)
// //                     const Center(
// //                       child: CircularProgressIndicator(
// //                         color: AppColors.primaryColor,
// //                       ),
// //                     ),
// //                 ],
// //               ),
// //             );
// //           },
// //         );
// //       },
// //     );
// //   }
// // }

import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/chats/data/models/chat_model.dart';
import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
import 'package:attendance_app/features/chats/presentation/views/update_chat_view.dart';
import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
import 'package:attendance_app/features/chats/presentation/views/widgets/show_image.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
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
      Provider.of<ChatViewModel>(context, listen: false)
          .initChatMessages(widget.chat);
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

  void _setUploadingImage(bool value) {
    if (mounted) {
      setState(() {
        _isUploadingImage = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatViewModel>(
      builder: (context, viewModel, child) {
        final appBar = AppBar(
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          // title: Row(
          //   children: [
          //     GestureDetector(
          //       onTap: () {
          //         if (widget.chat.avatar.isNotEmpty &&
          //             widget.chat.avatar.startsWith('http')) {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //               builder: (context) => ShowImage(
          //                 imageUrl: widget.chat.avatar,
          //               ),
          //             ),
          //           );
          //         }
          //       },
          //       child: CircleAvatar(
          //         radius: 20,
          //         backgroundColor: AppColors.primaryColor,
          //         child: widget.chat.avatar.isNotEmpty &&
          //                 widget.chat.avatar.startsWith('http')
          //             ? ClipOval(
          //                 child: Image.network(
          //                   widget.chat.avatar,
          //                   width: 40,
          //                   height: 40,
          //                   fit: BoxFit.cover,
          //                   errorBuilder: (context, error, stackTrace) {
          //                     print('Error loading avatar in ChatView: $error');
          //                     return const Icon(
          //                       Icons.person,
          //                       color: Colors.white,
          //                       size: 24,
          //                     );
          //                   },
          //                 ),
          //               )
          //             : const Icon(
          //                 Icons.person,
          //                 color: Colors.white,
          //                 size: 24,
          //               ),
          //       ),
          //     ),
          //     const SizedBox(width: 10),
          //     Expanded(
          //       child: Text(
          //         widget.chat.name, // الاسم بتاع الطرف الآخر
          //         style: const TextStyle(
          //           fontSize: 20,
          //           fontWeight: FontWeight.bold,
          //           color: Colors.white,
          //         ),
          //         overflow: TextOverflow.ellipsis,
          //         maxLines: 1,
          //       ),
          //     ),
          //   ],
          // ),

          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (widget.chat.avatar.isNotEmpty &&
                      widget.chat.avatar.startsWith('http')) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowImage(
                          imageUrl: widget.chat.avatar,
                        ),
                      ),
                    );
                  }
                },
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.primaryColor,
                  child: widget.chat.avatar.isNotEmpty &&
                          widget.chat.avatar.startsWith('http')
                      ? ClipOval(
                          child: Image.network(
                            widget.chat.avatar,
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              print('Error loading avatar in ChatView: $error');
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
                  widget.chat.name, // الاسم بتاع الطرف الآخر
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

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: appBar,
          body: Stack(
            children: [
              Column(
                children: [
                  // Expanded(
                  //   child: ListView.builder(
                  //     controller: viewModel.scrollController,
                  //     physics: const AlwaysScrollableScrollPhysics(),
                  //     padding: const EdgeInsets.symmetric(
                  //         vertical: 10, horizontal: 10),
                  //     cacheExtent: 1000.0,
                  //     itemCount: viewModel.localMessages.length + 1,
                  //     itemBuilder: (context, index) {
                  //       if (index == 0) {
                  //         if (viewModel.localMessages.isNotEmpty) {
                  //           final latestTime = DateTime.now();
                  //           return Center(
                  //             child: Padding(
                  //               padding:
                  //                   const EdgeInsets.symmetric(vertical: 10),
                  //               child: Container(
                  //                 padding: const EdgeInsets.symmetric(
                  //                     horizontal: 12, vertical: 6),
                  //                 decoration: BoxDecoration(
                  //                   color: Colors.green.withOpacity(0.2),
                  //                   borderRadius: BorderRadius.circular(16),
                  //                 ),
                  //                 child: Text(
                  //                   '${latestTime.day}/${latestTime.month}/${latestTime.year}',
                  //                   style: const TextStyle(
                  //                     fontSize: 14,
                  //                     color: Colors.black54,
                  //                     fontWeight: FontWeight.w500,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           );
                  //         }
                  //         return const SizedBox.shrink();
                  //       }
                  //       final messageIndex = index - 1;
                  //       final message = viewModel.localMessages[messageIndex];
                  //       final isMe = message['isMe'] as bool;
                  //       return ChatsBubble(
                  //         isMe: isMe,
                  //         message: message,
                  //         chatId: widget.chat.id,
                  //       );
                  //     },
                  //   ),
                  // ),

                  Expanded(
                    child: ListView.builder(
                      controller: viewModel.scrollController,
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      cacheExtent: 1000.0,
                      itemCount: viewModel.localMessages.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          if (viewModel.localMessages.isNotEmpty) {
                            final latestTime = DateTime.now();
                            return Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Text(
                                    '${latestTime.day}/${latestTime.month}/${latestTime.year}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        }
                        final messageIndex = index - 1;
                        final message = viewModel.localMessages[messageIndex];
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



// import 'package:attendance_app/core/utils/app_colors.dart';
// import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
// import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:intl/intl.dart';

// class ChatView extends StatelessWidget {
//   final ChatModel chat;

//   const ChatView({super.key, required this.chat});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => ChatViewModel(ChatRepository()),
//       child: Consumer<ChatViewModel>(
//         builder: (context, viewModel, child) {
//           viewModel.initChatMessages(chat);

//           return Scaffold(
//             backgroundColor: Colors.white,
//             appBar: AppBar(
//               backgroundColor: AppColors.primaryColor,
//               title: Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       if (chat.avatar.isNotEmpty && chat.avatar.startsWith('http')) {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => ShowImage(imageUrl: chat.avatar),
//                           ),
//                         );
//                       }
//                     },
//                     child: CircleAvatar(
//                       radius: 20,
//                       backgroundColor: AppColors.primaryColor,
//                       child: chat.avatar.isNotEmpty && chat.avatar.startsWith('http')
//                           ? ClipOval(
//                               child: Image.network(
//                                 chat.avatar,
//                                 width: 40,
//                                 height: 40,
//                                 fit: BoxFit.cover,
//                                 errorBuilder: (context, error, stackTrace) {
//                                   return const Icon(
//                                     Icons.person,
//                                     color: Colors.white,
//                                     size: 24,
//                                   );
//                                 },
//                               ),
//                             )
//                           : const Icon(
//                               Icons.person,
//                               color: Colors.white,
//                               size: 24,
//                             ),
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: Text(
//                       chat.name,
//                       style: const TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                       overflow: TextOverflow.ellipsis,
//                       maxLines: 1,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             body: Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     controller: viewModel.scrollController,
//                     physics: const AlwaysScrollableScrollPhysics(),
//                     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                     cacheExtent: 1000.0,
//                     itemCount: viewModel.localMessages.length + 1,
//                     itemBuilder: (context, index) {
//                       if (index == 0) {
//                         if (viewModel.localMessages.isNotEmpty) {
//                           final latestTime = DateTime.now();
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
//                                   '${latestTime.day}/${latestTime.month}/${latestTime.year}',
//                                   style: const TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.black54,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           );
//                         }
//                         return const SizedBox.shrink();
//                       }
//                       final messageIndex = index - 1;
//                       final message = viewModel.localMessages[messageIndex];
//                       final isMe = message['isMe'] as bool;
//                       return GestureDetector(
//                         onLongPress: () {
//                           if (isMe) {
//                             showDialog(
//                               context: context,
//                               builder: (context) => AlertDialog(
//                                 title: const Text('حذف الرسالة'),
//                                 content: const Text('هل تريد حذف هذه الرسالة؟'),
//                                 actions: [
//                                   TextButton(
//                                     onPressed: () => Navigator.pop(context),
//                                     child: const Text('إلغاء'),
//                                   ),
//                                   TextButton(
//                                     onPressed: () async {
//                                       await viewModel.deleteMessage(
//                                         chat.id,
//                                         message['messageId'],
//                                       );
//                                       Navigator.pop(context);
//                                       if (viewModel.errorMessage != null) {
//                                         ScaffoldMessenger.of(context).showSnackBar(
//                                           SnackBar(
//                                               content: Text(viewModel.errorMessage!)),
//                                         );
//                                       }
//                                     },
//                                     child: const Text('حذف'),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           }
//                         },
//                         child: ChatsBubble(
//                           isMe: isMe,
//                           message: message,
//                           chatId: chat.id,
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: TextField(
//                           controller: viewModel.messageController,
//                           decoration: InputDecoration(
//                             hintText: 'اكتب رسالتك...',
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(30),
//                               borderSide: BorderSide.none,
//                             ),
//                             filled: true,
//                             fillColor: Colors.grey[200],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       CircleAvatar(
//                         backgroundColor: AppColors.primaryColor,
//                         child: IconButton(
//                           icon: const Icon(Icons.send, color: Colors.white),
//                           onPressed: () {
//                             if (viewModel.messageController.text.isNotEmpty) {
//                               viewModel.sendMessage(
//                                 chat.id,
//                                 viewModel.messageController.text,
//                                 true,
//                               );
//                             }
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class ChatsBubble extends StatelessWidget {
//   final bool isMe;
//   final Map<String, dynamic> message;
//   final String chatId;

//   const ChatsBubble({
//     super.key,
//     required this.isMe,
//     required this.message,
//     required this.chatId,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final text = message['text'] as String;
//     final time = DateTime.parse(message['time'] as String);
//     final isRead = message['isRead'] as bool? ?? false;

//     return Align(
//       alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//         decoration: BoxDecoration(
//           color: isMe ? AppColors.primaryColor : Colors.grey[200],
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Column(
//           crossAxisAlignment:
//               isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//           children: [
//             Text(
//               text,
//               style: TextStyle(
//                 color: isMe ? Colors.white : Colors.black,
//                 fontSize: 16,
//               ),
//             ),
//             const SizedBox(height: 5),
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   DateFormat('h:mm a').format(time),
//                   style: TextStyle(
//                     color: isMe ? Colors.white70 : Colors.black54,
//                     fontSize: 12,
//                   ),
//                 ),
//                 if (isMe) ...[
//                   const SizedBox(width: 5),
//                   Icon(
//                     Icons.done_all,
//                     size: 16,
//                     color: isRead ? Colors.blue : Colors.grey,
//                   ),
//                 ],
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ShowImage extends StatelessWidget {
//   final String imageUrl;

//   const ShowImage({super.key, required this.imageUrl});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Image.network(
//           imageUrl,
//           fit: BoxFit.contain,
//           errorBuilder: (context, error, stackTrace) {
//             return const Icon(Icons.error, size: 50);
//           },
//         ),
//       ),
//     );
//   }
// }