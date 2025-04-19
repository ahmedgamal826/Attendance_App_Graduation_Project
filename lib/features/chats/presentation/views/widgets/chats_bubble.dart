// // // // // // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // // // // // // import 'package:awesome_dialog/awesome_dialog.dart';
// // // // // // // import 'package:flutter/material.dart';
// // // // // // // import 'package:provider/provider.dart';

// // // // // // // class ChatsBubble extends StatefulWidget {
// // // // // // //   const ChatsBubble({
// // // // // // //     super.key,
// // // // // // //     required this.isMe,
// // // // // // //     required this.message,
// // // // // // //     required this.chatId,
// // // // // // //   });

// // // // // // //   final bool isMe;
// // // // // // //   final Map<String, dynamic> message;
// // // // // // //   final String chatId;

// // // // // // //   @override
// // // // // // //   _ChatsBubbleState createState() => _ChatsBubbleState();
// // // // // // // }

// // // // // // // class _ChatsBubbleState extends State<ChatsBubble> {
// // // // // // //   bool _isHighlighted = false;

// // // // // // //   bool _isArabic(String text) {
// // // // // // //     if (text.isEmpty) return false;
// // // // // // //     return RegExp(r'[\u0600-\u06FF]').hasMatch(text);
// // // // // // //   }

// // // // // // //   void _showDeleteDialog() {
// // // // // // //     if (mounted) {
// // // // // // //       setState(() {
// // // // // // //         _isHighlighted = true;
// // // // // // //       });
// // // // // // //     }

// // // // // // //     final viewModel = Provider.of<ChatViewModel>(context, listen: false);
// // // // // // //     AwesomeDialog(
// // // // // // //       context: context,
// // // // // // //       dialogType: DialogType.warning,
// // // // // // //       animType: AnimType.scale,
// // // // // // //       title: 'Delete Message',
// // // // // // //       desc: 'Are you sure you want to delete this message?',
// // // // // // //       btnCancelOnPress: () {
// // // // // // //         if (mounted) {
// // // // // // //           setState(() {
// // // // // // //             _isHighlighted = false;
// // // // // // //           });
// // // // // // //         }
// // // // // // //       },
// // // // // // //       btnOkOnPress: () async {
// // // // // // //         try {
// // // // // // //           final messageToDelete = {
// // // // // // //             'text': widget.message['text'],
// // // // // // //             'isMe': widget.message['isMe'],
// // // // // // //             'time': widget.message['originalTime'],
// // // // // // //             if (widget.message.containsKey('messageId'))
// // // // // // //               'messageId': widget.message['messageId'],
// // // // // // //           };
// // // // // // //           await viewModel.deleteMessage(widget.chatId, messageToDelete);
// // // // // // //           if (mounted) {
// // // // // // //             setState(() {
// // // // // // //               _isHighlighted = false;
// // // // // // //             });
// // // // // // //           }
// // // // // // //           ScaffoldMessenger.of(context).showSnackBar(
// // // // // // //             const SnackBar(content: Text('Message deleted')),
// // // // // // //           );
// // // // // // //         } catch (e) {
// // // // // // //           if (mounted) {
// // // // // // //             setState(() {
// // // // // // //               _isHighlighted = false;
// // // // // // //             });
// // // // // // //           }
// // // // // // //           ScaffoldMessenger.of(context).showSnackBar(
// // // // // // //             SnackBar(content: Text('Failed to delete message: $e')),
// // // // // // //           );
// // // // // // //         }
// // // // // // //       },
// // // // // // //       btnOkText: 'Delete',
// // // // // // //       btnCancelText: 'Cancel',
// // // // // // //     ).show();
// // // // // // //   }

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     final isArabicText = _isArabic(widget.message['text'] ?? '');
// // // // // // //     final textDirection = isArabicText ? TextDirection.rtl : TextDirection.ltr;
// // // // // // //     final textAlign = isArabicText ? TextAlign.right : TextAlign.left;

// // // // // // //     return GestureDetector(
// // // // // // //       onLongPress: _showDeleteDialog,
// // // // // // //       child: Align(
// // // // // // //         alignment: widget.isMe ? Alignment.centerRight : Alignment.centerLeft,
// // // // // // //         child: Container(
// // // // // // //           constraints: const BoxConstraints(
// // // // // // //             maxWidth: 250,
// // // // // // //           ),
// // // // // // //           margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
// // // // // // //           padding:
// // // // // // //               const EdgeInsets.only(left: 10, right: 5, top: 10, bottom: 10),
// // // // // // //           decoration: BoxDecoration(
// // // // // // //             color: _isHighlighted
// // // // // // //                 ? Colors.blue
// // // // // // //                 : widget.isMe
// // // // // // //                     ? const Color(0xFFEEFFDE)
// // // // // // //                     : Colors.grey[500],
// // // // // // //             borderRadius: const BorderRadius.only(
// // // // // // //               topLeft: Radius.circular(15),
// // // // // // //               topRight: Radius.circular(15),
// // // // // // //               bottomLeft: Radius.circular(15),
// // // // // // //               bottomRight:
// // // // // // //                   Radius.circular(0), // Only bottom-right corner is rounded
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //           child: Directionality(
// // // // // // //             textDirection: textDirection,
// // // // // // //             child: Column(
// // // // // // //               crossAxisAlignment: CrossAxisAlignment.start,
// // // // // // //               children: [
// // // // // // //                 SelectableText(
// // // // // // //                   widget.message['text'],
// // // // // // //                   style: const TextStyle(
// // // // // // //                     fontSize: 16,
// // // // // // //                     color: Colors.black,
// // // // // // //                   ),
// // // // // // //                   textDirection: textDirection,
// // // // // // //                   textAlign: textAlign,
// // // // // // //                 ),
// // // // // // //                 const SizedBox(height: 5),
// // // // // // //                 Row(
// // // // // // //                   mainAxisAlignment: MainAxisAlignment.end, // Always right
// // // // // // //                   crossAxisAlignment: CrossAxisAlignment.end,
// // // // // // //                   textDirection:
// // // // // // //                       TextDirection.ltr, // Force LTR for row alignment
// // // // // // //                   children: [
// // // // // // //                     Directionality(
// // // // // // //                       textDirection:
// // // // // // //                           TextDirection.ltr, // Force LTR for time text
// // // // // // //                       child: Text(
// // // // // // //                         widget.message['time'],
// // // // // // //                         style: const TextStyle(
// // // // // // //                           fontSize: 12,
// // // // // // //                           color: Colors.black,
// // // // // // //                         ),
// // // // // // //                       ),
// // // // // // //                     ),
// // // // // // //                     if (widget.isMe) const SizedBox(width: 8),
// // // // // // //                     if (widget.isMe)
// // // // // // //                       const Icon(
// // // // // // //                         Icons.done_all,
// // // // // // //                         size: 16,
// // // // // // //                         color: Colors.blue,
// // // // // // //                       ),
// // // // // // //                   ],
// // // // // // //                 ),
// // // // // // //               ],
// // // // // // //             ),
// // // // // // //           ),
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // // // // // import 'package:awesome_dialog/awesome_dialog.dart';
// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'package:provider/provider.dart';

// // // // // // class ChatsBubble extends StatefulWidget {
// // // // // //   const ChatsBubble({
// // // // // //     super.key,
// // // // // //     required this.isMe,
// // // // // //     required this.message,
// // // // // //     required this.chatId,
// // // // // //   });

// // // // // //   final bool isMe;
// // // // // //   final Map<String, dynamic> message;
// // // // // //   final String chatId;

// // // // // //   @override
// // // // // //   _ChatsBubbleState createState() => _ChatsBubbleState();
// // // // // // }

// // // // // // class _ChatsBubbleState extends State<ChatsBubble> {
// // // // // //   bool _isHighlighted = false;

// // // // // //   bool _isArabic(String text) {
// // // // // //     if (text.isEmpty) return false;
// // // // // //     return RegExp(r'[\u0600-\u06FF]').hasMatch(text);
// // // // // //   }

// // // // // //   void _showDeleteDialog() {
// // // // // //     if (mounted) {
// // // // // //       setState(() {
// // // // // //         _isHighlighted = true;
// // // // // //       });
// // // // // //     }

// // // // // //     final viewModel = Provider.of<ChatViewModel>(context, listen: false);
// // // // // //     AwesomeDialog(
// // // // // //       context: context,
// // // // // //       dialogType: DialogType.warning,
// // // // // //       animType: AnimType.scale,
// // // // // //       title: 'Delete Message',
// // // // // //       desc: 'Are you sure you want to delete this message?',
// // // // // //       btnCancelOnPress: () {
// // // // // //         if (mounted) {
// // // // // //           setState(() {
// // // // // //             _isHighlighted = false;
// // // // // //           });
// // // // // //         }
// // // // // //       },
// // // // // //       btnOkOnPress: () async {
// // // // // //         try {
// // // // // //           // إنشاء الرسالة المطابقة لـ Firestore
// // // // // //           final messageToDelete = {
// // // // // //             'text': widget.message['text'],
// // // // // //             'isMe': widget.message['isMe'],
// // // // // //             'messageId': widget.message['messageId'],
// // // // // //             'time': widget.message[
// // // // // //                 'originalTime'], // استخدام originalTime للتطابق مع Firestore
// // // // // //           };
// // // // // //           final success =
// // // // // //               await viewModel.deleteMessage(widget.chatId, messageToDelete);
// // // // // //           if (success && mounted) {
// // // // // //             setState(() {
// // // // // //               _isHighlighted = false;
// // // // // //             });
// // // // // //             ScaffoldMessenger.of(context).showSnackBar(
// // // // // //               const SnackBar(content: Text('Message deleted')),
// // // // // //             );
// // // // // //           } else if (mounted) {
// // // // // //             setState(() {
// // // // // //               _isHighlighted = false;
// // // // // //             });
// // // // // //             ScaffoldMessenger.of(context).showSnackBar(
// // // // // //               const SnackBar(content: Text('Failed to delete message')),
// // // // // //             );
// // // // // //           }
// // // // // //         } catch (e) {
// // // // // //           if (mounted) {
// // // // // //             setState(() {
// // // // // //               _isHighlighted = false;
// // // // // //             });
// // // // // //             ScaffoldMessenger.of(context).showSnackBar(
// // // // // //               SnackBar(content: Text('Failed to delete message: $e')),
// // // // // //             );
// // // // // //           }
// // // // // //         }
// // // // // //       },
// // // // // //       btnOkText: 'Delete',
// // // // // //       btnCancelText: 'Cancel',
// // // // // //     ).show();
// // // // // //   }

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     final isArabicText = _isArabic(widget.message['text'] ?? '');
// // // // // //     final textDirection = isArabicText ? TextDirection.rtl : TextDirection.ltr;
// // // // // //     final textAlign = isArabicText ? TextAlign.right : TextAlign.left;

// // // // // //     return GestureDetector(
// // // // // //       onLongPress: _showDeleteDialog,
// // // // // //       child: Align(
// // // // // //         alignment: widget.isMe ? Alignment.centerRight : Alignment.centerLeft,
// // // // // //         child: Container(
// // // // // //           constraints: const BoxConstraints(
// // // // // //             maxWidth: 250,
// // // // // //           ),
// // // // // //           margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
// // // // // //           padding:
// // // // // //               const EdgeInsets.only(left: 10, right: 5, top: 10, bottom: 10),
// // // // // //           decoration: BoxDecoration(
// // // // // //             color: _isHighlighted
// // // // // //                 ? Colors.blue
// // // // // //                 : widget.isMe
// // // // // //                     ? const Color(0xFFEEFFDE)
// // // // // //                     : Colors.grey[500],
// // // // // //             borderRadius: const BorderRadius.only(
// // // // // //               topLeft: Radius.circular(15),
// // // // // //               topRight: Radius.circular(15),
// // // // // //               bottomLeft: Radius.circular(15),
// // // // // //               bottomRight: Radius.circular(0),
// // // // // //             ),
// // // // // //           ),
// // // // // //           child: Directionality(
// // // // // //             textDirection: textDirection,
// // // // // //             child: Column(
// // // // // //               crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //               children: [
// // // // // //                 SelectableText(
// // // // // //                   widget.message['text'],
// // // // // //                   style: const TextStyle(
// // // // // //                     fontSize: 16,
// // // // // //                     color: Colors.black,
// // // // // //                   ),
// // // // // //                   textDirection: textDirection,
// // // // // //                   textAlign: textAlign,
// // // // // //                 ),
// // // // // //                 const SizedBox(height: 5),
// // // // // //                 Row(
// // // // // //                   mainAxisAlignment: MainAxisAlignment.end,
// // // // // //                   crossAxisAlignment: CrossAxisAlignment.end,
// // // // // //                   textDirection: TextDirection.ltr,
// // // // // //                   children: [
// // // // // //                     Directionality(
// // // // // //                       textDirection: TextDirection.ltr,
// // // // // //                       child: Text(
// // // // // //                         widget.message['time'],
// // // // // //                         style: const TextStyle(
// // // // // //                           fontSize: 12,
// // // // // //                           color: Colors.black,
// // // // // //                         ),
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                     if (widget.isMe) const SizedBox(width: 8),
// // // // // //                     if (widget.isMe)
// // // // // //                       const Icon(
// // // // // //                         Icons.done_all,
// // // // // //                         size: 16,
// // // // // //                         color: Colors.blue,
// // // // // //                       ),
// // // // // //                   ],
// // // // // //                 ),
// // // // // //               ],
// // // // // //             ),
// // // // // //           ),
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }

// import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ChatsBubble extends StatefulWidget {
//   const ChatsBubble({
//     super.key,
//     required this.isMe,
//     required this.message,
//     required this.chatId,
//   });

//   final bool isMe;
//   final Map<String, dynamic> message;
//   final String chatId;

//   @override
//   _ChatsBubbleState createState() => _ChatsBubbleState();
// }

// class _ChatsBubbleState extends State<ChatsBubble> {
//   bool _isHighlighted = false;

//   bool _isArabic(String text) {
//     if (text.isEmpty) return false;
//     return RegExp(r'[\u0600-\u06FF]').hasMatch(text);
//   }

//   void _showDeleteDialog() {
//     if (mounted) {
//       setState(() {
//         _isHighlighted = true;
//       });
//     }

//     final viewModel = Provider.of<ChatViewModel>(context, listen: false);
//     AwesomeDialog(
//       context: context,
//       dialogType: DialogType.warning,
//       animType: AnimType.scale,
//       title: 'Delete Message',
//       desc: 'Are you sure you want to delete this message?',
//       btnCancelOnPress: () {
//         if (mounted) {
//           setState(() {
//             _isHighlighted = false;
//           });
//         }
//       },
//       btnOkOnPress: () async {
//         try {
//           // إنشاء الرسالة المطابقة لـ Firestore
//           final messageToDelete = {
//             'text': widget.message['text'],
//             'isMe': widget.message['isMe'],
//             'messageId': widget.message['messageId'],
//             'time': widget.message.containsKey('originalTime')
//                 ? widget.message['originalTime']
//                 : widget.message['time'], // استخدام originalTime أو time كبديل
//           };
//           final success =
//               await viewModel.deleteMessage(widget.chatId, messageToDelete);
//           if (success && mounted) {
//             setState(() {
//               _isHighlighted = false;
//             });
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('Message deleted')),
//             );
//           } else if (mounted) {
//             setState(() {
//               _isHighlighted = false;
//             });
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('Failed to delete message')),
//             );
//           }
//         } catch (e) {
//           if (mounted) {
//             setState(() {
//               _isHighlighted = false;
//             });
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text('Failed to delete message: $e')),
//             );
//           }
//         }
//       },
//       btnOkText: 'Delete',
//       btnCancelText: 'Cancel',
//     ).show();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isArabicText = _isArabic(widget.message['text'] ?? '');
//     final textDirection = isArabicText ? TextDirection.rtl : TextDirection.ltr;
//     final textAlign = isArabicText ? TextAlign.right : TextAlign.left;

//     return GestureDetector(
//       onLongPress: _showDeleteDialog,
//       child: Align(
//         alignment: widget.isMe ? Alignment.centerRight : Alignment.centerLeft,
//         child: Container(
//           constraints: const BoxConstraints(
//             maxWidth: 250,
//           ),
//           margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//           padding:
//               const EdgeInsets.only(left: 10, right: 5, top: 10, bottom: 10),
//           decoration: BoxDecoration(
//             color: _isHighlighted
//                 ? Colors.blue
//                 : widget.isMe
//                     ? const Color(0xFFEEFFDE)
//                     : Colors.grey[500],
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(15),
//               topRight: Radius.circular(15),
//               bottomLeft: Radius.circular(15),
//               bottomRight: Radius.circular(0),
//             ),
//           ),
//           child: Directionality(
//             textDirection: textDirection,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SelectableText(
//                   widget.message['text'],
//                   style: const TextStyle(
//                     fontSize: 16,
//                     color: Colors.black,
//                   ),
//                   textDirection: textDirection,
//                   textAlign: textAlign,
//                 ),
//                 const SizedBox(height: 5),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   textDirection: TextDirection.ltr,
//                   children: [
//                     Directionality(
//                       textDirection: TextDirection.ltr,
//                       child: Text(
//                         widget.message['time'],
//                         style: const TextStyle(
//                           fontSize: 12,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                     if (widget.isMe) const SizedBox(width: 8),
//                     if (widget.isMe)
//                       const Icon(
//                         Icons.done_all,
//                         size: 16,
//                         color: Colors.blue,
//                       ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ChatsBubble extends StatefulWidget {
//   const ChatsBubble({
//     super.key,
//     required this.isMe,
//     required this.message,
//     required this.chatId,
//   });

//   final bool isMe;
//   final Map<String, dynamic> message;
//   final String chatId;

//   @override
//   _ChatsBubbleState createState() => _ChatsBubbleState();
// }

// class _ChatsBubbleState extends State<ChatsBubble> {
//   bool _isHighlighted = false;

//   bool _isArabic(String text) {
//     if (text.isEmpty) return false;
//     return RegExp(r'[\u0600-\u06FF]').hasMatch(text);
//   }

//   void _showDeleteDialog() {
//     if (mounted) {
//       setState(() {
//         _isHighlighted = true;
//       });
//     }

//     final viewModel = Provider.of<ChatViewModel>(context, listen: false);
//     AwesomeDialog(
//       context: context,
//       dialogType: DialogType.warning,
//       animType: AnimType.scale,
//       title: 'Delete Message',
//       desc: 'Are you sure you want to delete this message?',
//       btnCancelOnPress: () {
//         if (mounted) {
//           setState(() {
//             _isHighlighted = false;
//           });
//         }
//       },
//       btnOkOnPress: () async {
//         try {
//           // إرسال الرسالة بالكامل للحفاظ على التوافق
//           final messageToDelete = {
//             'text': widget.message['text'],
//             'isMe': widget.message['isMe'],
//             'messageId': widget.message['messageId'],
//             'time': widget.message['originalTime'] ?? widget.message['time'],
//           };
//           print(
//               'Message to delete from ChatsBubble: $messageToDelete'); // تصحيح
//           final success =
//               await viewModel.deleteMessage(widget.chatId, messageToDelete);
//           if (success && mounted) {
//             setState(() {
//               _isHighlighted = false;
//             });
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('Message deleted')),
//             );
//           } else if (mounted) {
//             setState(() {
//               _isHighlighted = false;
//             });
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('Failed to delete message')),
//             );
//           }
//         } catch (e) {
//           if (mounted) {
//             setState(() {
//               _isHighlighted = false;
//             });
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text('Failed to delete message: $e')),
//             );
//           }
//         }
//       },
//       btnOkText: 'Delete',
//       btnCancelText: 'Cancel',
//     ).show();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isArabicText = _isArabic(widget.message['text'] ?? '');
//     final textDirection = isArabicText ? TextDirection.rtl : TextDirection.ltr;
//     final textAlign = isArabicText ? TextAlign.right : TextAlign.left;

//     return GestureDetector(
//       onLongPress: _showDeleteDialog,
//       child: Align(
//         alignment: widget.isMe ? Alignment.centerRight : Alignment.centerLeft,
//         child: Container(
//           constraints: const BoxConstraints(
//             maxWidth: 250,
//           ),
//           margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//           padding:
//               const EdgeInsets.only(left: 10, right: 5, top: 10, bottom: 10),
//           decoration: BoxDecoration(
//             color: _isHighlighted
//                 ? Colors.blue
//                 : widget.isMe
//                     ? const Color(0xFFEEFFDE)
//                     : Colors.grey[500],
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(15),
//               topRight: Radius.circular(15),
//               bottomLeft: Radius.circular(15),
//               bottomRight: Radius.circular(0),
//             ),
//           ),
//           child: Directionality(
//             textDirection: textDirection,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SelectableText(
//                   widget.message['text'],
//                   style: const TextStyle(
//                     fontSize: 16,
//                     color: Colors.black,
//                   ),
//                   textDirection: textDirection,
//                   textAlign: textAlign,
//                 ),
//                 const SizedBox(height: 5),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   textDirection: TextDirection.ltr,
//                   children: [
//                     Directionality(
//                       textDirection: TextDirection.ltr,
//                       child: Text(
//                         widget.message['time'],
//                         style: const TextStyle(
//                           fontSize: 12,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                     if (widget.isMe) const SizedBox(width: 8),
//                     if (widget.isMe)
//                       const Icon(
//                         Icons.done_all,
//                         size: 16,
//                         color: Colors.blue,
//                       ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:attendance_app/core/utils/app_colors.dart';

// class ChatsBubble extends StatelessWidget {
//   const ChatsBubble({
//     super.key,
//     required this.isMe,
//     required this.message,
//     required this.chatId,
//   });

//   final bool isMe;
//   final Map<String, dynamic> message;
//   final String chatId;

//   @override
//   Widget build(BuildContext context) {
//     final isImage = message['isImage'] == true;
//     return Align(
//       alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//         padding: isImage
//             ? const EdgeInsets.all(5)
//             : const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//         decoration: BoxDecoration(
//           color: isMe ? AppColors.primaryColor : Colors.grey[300],
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: isImage
//             ? GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => ImageViewPage(
//                         imageUrl: message['message'],
//                       ),
//                     ),
//                   );
//                 },
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: CachedNetworkImage(
//                     imageUrl: message['message'],
//                     width: 200,
//                     height: 200,
//                     fit: BoxFit.cover,
//                     placeholder: (context, url) => const Center(
//                       child: CircularProgressIndicator(),
//                     ),
//                     errorWidget: (context, url, error) => const Icon(
//                       Icons.error,
//                       color: Colors.red,
//                     ),
//                   ),
//                 ),
//               )
//             : Text(
//                 message['message'],
//                 style: TextStyle(
//                   color: isMe ? Colors.white : Colors.black,
//                 ),
//               ),
//       ),
//     );
//   }
// }

// // // class ImageViewPage extends StatelessWidget {
// // //   final String imageUrl;

// // //   const ImageViewPage({super.key, required this.imageUrl});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: Colors.black,
// // //       appBar: AppBar(
// // //         backgroundColor: Colors.black,
// // //         leading: IconButton(
// // //           icon: const Icon(Icons.arrow_back, color: Colors.white),
// // //           onPressed: () => Navigator.pop(context),
// // //         ),
// // //       ),
// // //       body: Center(
// // //         child: CachedNetworkImage(
// // //           imageUrl: imageUrl,
// // //           fit: BoxFit.contain,
// // //           placeholder: (context, url) => const CircularProgressIndicator(
// // //             color: Colors.white,
// // //           ),
// // //           errorWidget: (context, url, error) => const Icon(
// // //             Icons.error,
// // //             color: Colors.red,
// // //             size: 50,
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:cached_network_image/cached_network_image.dart';
// // import 'package:flutter/material.dart';
// // import 'package:attendance_app/core/utils/app_colors.dart';

// // class ChatsBubble extends StatelessWidget {
// //   const ChatsBubble({
// //     super.key,
// //     required this.isMe,
// //     required this.message,
// //     required this.chatId,
// //   });

// //   final bool isMe;
// //   final Map<String, dynamic> message;
// //   final String chatId;

// //   @override
// //   Widget build(BuildContext context) {
// //     final isImage = message['isImage'] == true;
// //     return Align(
// //       alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
// //       child: Container(
// //         margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
// //         padding: isImage
// //             ? const EdgeInsets.all(5)
// //             : const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
// //         decoration: BoxDecoration(
// //           color: isMe ? AppColors.primaryColor : Colors.grey[300],
// //           borderRadius: BorderRadius.circular(15),
// //         ),
// //         child: isImage
// //             ? GestureDetector(
// //                 onTap: () {
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) => ImageViewPage(
// //                         imageUrl: message['text'], // تغيير 'message' إلى 'text'
// //                       ),
// //                     ),
// //                   );
// //                 },
// //                 child: ClipRRect(
// //                   borderRadius: BorderRadius.circular(10),
// //                   child: CachedNetworkImage(
// //                     imageUrl: message['text'], // تغيير 'message' إلى 'text'
// //                     width: 200,
// //                     height: 200,
// //                     fit: BoxFit.cover,
// //                     placeholder: (context, url) => const Center(
// //                       child: CircularProgressIndicator(),
// //                     ),
// //                     errorWidget: (context, url, error) => const Icon(
// //                       Icons.error,
// //                       color: Colors.red,
// //                     ),
// //                   ),
// //                 ),
// //               )
// //             : Text(
// //                 message['text'],
// //                 style: TextStyle(
// //                   color: isMe ? Colors.white : Colors.black,
// //                 ),
// //               ),
// //       ),
// //     );
// //   }
// // }

// // class ImageViewPage extends StatelessWidget {
// //   final String imageUrl;

// //   const ImageViewPage({super.key, required this.imageUrl});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.black,
// //       appBar: AppBar(
// //         backgroundColor: Colors.black,
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back, color: Colors.white),
// //           onPressed: () => Navigator.pop(context),
// //         ),
// //       ),
// //       body: Center(
// //         child: CachedNetworkImage(
// //           imageUrl: imageUrl,
// //           fit: BoxFit.contain,
// //           placeholder: (context, url) => const CircularProgressIndicator(
// //             color: Colors.white,
// //           ),
// //           errorWidget: (context, url, error) => const Icon(
// //             Icons.error,
// //             color: Colors.red,
// //             size: 50,
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:attendance_app/core/utils/app_colors.dart';
// import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// import 'package:attendance_app/features/chats/presentation/views/widgets/show_image.dart';
// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ChatsBubble extends StatefulWidget {
//   const ChatsBubble({
//     super.key,
//     required this.isMe,
//     required this.message,
//     required this.chatId,
//   });

//   final bool isMe;
//   final Map<String, dynamic> message;
//   final String chatId;

//   @override
//   _ChatsBubbleState createState() => _ChatsBubbleState();
// }

// class _ChatsBubbleState extends State<ChatsBubble> {
//   bool _isHighlighted = false;

//   bool _isArabic(String text) {
//     if (text.isEmpty) return false;
//     return RegExp(r'[\u0600-\u06FF]').hasMatch(text);
//   }

//   void _showDeleteDialog() {
//     if (mounted) {
//       setState(() {
//         _isHighlighted = true;
//       });
//     }

//     final viewModel = Provider.of<ChatViewModel>(context, listen: false);
//     AwesomeDialog(
//       context: context,
//       dialogType: DialogType.warning,
//       animType: AnimType.scale,
//       title: 'Delete Message',
//       desc: 'Are you sure you want to delete this message?',
//       btnCancelOnPress: () {
//         if (mounted) {
//           setState(() {
//             _isHighlighted = false;
//           });
//         }
//       },
//       btnOkOnPress: () async {
//         try {
//           // إرسال الرسالة بالكامل للحفاظ على التوافق
//           final messageToDelete = {
//             'text': widget.message['text'],
//             'isMe': widget.message['isMe'],
//             'messageId': widget.message['messageId'],
//             'time': widget.message['originalTime'] ?? widget.message['time'],
//             'isImage': widget.message['isImage'] ?? false, // إضافة isImage
//           };
//           print('Message to delete from ChatsBubble: $messageToDelete');
//           final success =
//               await viewModel.deleteMessage(widget.chatId, messageToDelete);
//           if (success && mounted) {
//             setState(() {
//               _isHighlighted = false;
//             });
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('Message deleted')),
//             );
//           } else if (mounted) {
//             setState(() {
//               _isHighlighted = false;
//             });
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('Failed to delete message')),
//             );
//           }
//         } catch (e) {
//           if (mounted) {
//             setState(() {
//               _isHighlighted = false;
//             });
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text('Failed to delete message: $e')),
//             );
//           }
//         }
//       },
//       btnOkText: 'Delete',
//       btnCancelText: 'Cancel',
//     ).show();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isImage = widget.message['isImage'] == true;
//     final isArabicText = _isArabic(widget.message['text'] ?? '');
//     final textDirection = isArabicText ? TextDirection.rtl : TextDirection.ltr;
//     final textAlign = isArabicText ? TextAlign.right : TextAlign.left;

//     return GestureDetector(
//       onLongPress: _showDeleteDialog,
//       onTap: isImage
//           ? () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => ShowImage(
//                     imageUrl: widget.message['text'],
//                   ),
//                 ),
//               );
//             }
//           : null,
//       child: Align(
//         alignment: widget.isMe ? Alignment.centerRight : Alignment.centerLeft,
//         child: Container(
//           constraints: const BoxConstraints(
//             maxWidth: 250,
//           ),
//           margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//           padding: isImage
//               ? const EdgeInsets.all(5)
//               : const EdgeInsets.only(left: 10, right: 5, top: 10, bottom: 10),
//           decoration: BoxDecoration(
//             color: _isHighlighted
//                 ? Colors.blue
//                 : widget.isMe
//                     ? const Color(0xFFEEFFDE)
//                     : Colors.grey[500],
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(15),
//               topRight: Radius.circular(15),
//               bottomLeft: Radius.circular(15),
//               bottomRight: Radius.circular(0),
//             ),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               if (isImage)
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: CachedNetworkImage(
//                     imageUrl: widget.message['text'],
//                     width: 200,
//                     height: 200,
//                     fit: BoxFit.cover,
//                     placeholder: (context, url) => const Center(
//                       child: CircularProgressIndicator(
//                         color: AppColors.primaryColor,
//                       ),
//                     ),
//                     errorWidget: (context, url, error) => const Icon(
//                       Icons.error,
//                       color: Colors.red,
//                     ),
//                   ),
//                 )
//               else
//                 Directionality(
//                   textDirection: textDirection,
//                   child: SelectableText(
//                     widget.message['text'],
//                     style: const TextStyle(
//                       fontSize: 16,
//                       color: Colors.black,
//                     ),
//                     textDirection: textDirection,
//                     textAlign: textAlign,
//                   ),
//                 ),
//               const SizedBox(height: 5),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 textDirection: TextDirection.ltr,
//                 children: [
//                   Directionality(
//                     textDirection: TextDirection.ltr,
//                     child: Text(
//                       widget.message['time'],
//                       style: const TextStyle(
//                         fontSize: 12,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                   if (widget.isMe) const SizedBox(width: 8),
//                   if (widget.isMe)
//                     const Icon(
//                       Icons.done_all,
//                       size: 16,
//                       color: Colors.blue,
//                     ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
import 'package:attendance_app/features/chats/presentation/views/widgets/show_image.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatsBubble extends StatefulWidget {
  const ChatsBubble({
    super.key,
    required this.isMe,
    required this.message,
    required this.chatId,
  });

  final bool isMe;
  final Map<String, dynamic> message;
  final String chatId;

  @override
  _ChatsBubbleState createState() => _ChatsBubbleState();
}

class _ChatsBubbleState extends State<ChatsBubble> {
  bool _isHighlighted = false;

  bool _isArabic(String text) {
    if (text.isEmpty) return false;
    return RegExp(r'[\u0600-\u06FF]').hasMatch(text);
  }

  void _showDeleteDialog() {
    if (mounted) {
      setState(() {
        _isHighlighted = true;
      });
    }

    final viewModel = Provider.of<ChatViewModel>(context, listen: false);
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.scale,
      title: 'Delete Message',
      desc: 'Are you sure you want to delete this message?',
      btnCancelOnPress: () {
        if (mounted) {
          setState(() {
            _isHighlighted = false;
          });
        }
      },
      btnOkOnPress: () async {
        try {
          final messageToDelete = {
            'text': widget.message['text'],
            'isMe': widget.message['isMe'],
            'messageId': widget.message['messageId'],
            'time': widget.message['originalTime'] ?? widget.message['time'],
            'isImage': widget.message['isImage'] ?? false,
          };
          print('Message to delete from ChatsBubble: $messageToDelete');
          final success =
              await viewModel.deleteMessage(widget.chatId, messageToDelete);
          if (success && mounted) {
            setState(() {
              _isHighlighted = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Message deleted')),
            );
          } else if (mounted) {
            setState(() {
              _isHighlighted = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Failed to delete message')),
            );
          }
        } catch (e) {
          if (mounted) {
            setState(() {
              _isHighlighted = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Failed to delete message: $e')),
            );
          }
        }
      },
      btnOkText: 'Delete',
      btnCancelText: 'Cancel',
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    final isImage = widget.message['isImage'] == true;
    final isArabicText = _isArabic(widget.message['text'] ?? '');
    final textDirection = isArabicText ? TextDirection.rtl : TextDirection.ltr;
    final textAlign = isArabicText
        ? TextAlign.right
        : TextAlign.left; // إضافة نفس المنطق بتاع الكود القديم

    return GestureDetector(
      onLongPress: _showDeleteDialog,
      onTap: isImage
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShowImage(
                    imageUrl: widget.message['text'],
                  ),
                ),
              );
            }
          : null,
      child: Align(
        alignment: widget.isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 250,
          ),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: isImage
              ? const EdgeInsets.all(5)
              : const EdgeInsets.only(left: 10, right: 5, top: 10, bottom: 10),
          decoration: BoxDecoration(
            color: _isHighlighted
                ? Colors.blue
                : widget.isMe
                    ? const Color(0xFFEEFFDE)
                    : Colors.grey[500],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isImage)
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: widget.message['text'],
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  ),
                )
              else
                //   Directionality(
                //     textDirection: textDirection,
                //     child: SelectableText(
                //       widget.message['text'],
                //       style: const TextStyle(
                //         fontSize: 16,
                //         color: Colors.black,
                //       ),
                //       textDirection: textDirection,
                //       textAlign: textAlign, // النص بيتحكم في محاذاته هنا
                //     ),
                //   ),
                // const SizedBox(height: 5),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   crossAxisAlignment: CrossAxisAlignment.end,
                //   textDirection: TextDirection.ltr,
                //   children: [
                //     Directionality(
                //       textDirection: TextDirection.ltr,
                //       child: Text(
                //         widget.message['time'],
                //         style: const TextStyle(
                //           fontSize: 12,
                //           color: Colors.black,
                //         ),
                //       ),
                //     ),
                //     if (widget.isMe) const SizedBox(width: 8),
                //     if (widget.isMe)
                //       const Icon(
                //         Icons.done_all,
                //         size: 16,
                //         color: Colors.blue,
                //       ),
                //   ],
                // ),

                Directionality(
                  textDirection: textDirection,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SelectableText(
                        widget.message['text'],
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        textDirection: textDirection,
                        textAlign: textAlign,
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                textDirection: TextDirection.ltr,
                children: [
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Text(
                      widget.message['time'],
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  if (widget.isMe) const SizedBox(width: 8),
                  if (widget.isMe)
                    const Icon(
                      Icons.done_all,
                      size: 16,
                      color: Colors.blue,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
