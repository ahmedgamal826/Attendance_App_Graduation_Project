// // // // // // // // // import 'package:flutter/material.dart';

// // // // // // // // // class ChatsBubble extends StatelessWidget {
// // // // // // // // //   const ChatsBubble({
// // // // // // // // //     super.key,
// // // // // // // // //     required this.isMe,
// // // // // // // // //     required this.message,
// // // // // // // // //   });

// // // // // // // // //   final bool isMe;
// // // // // // // // //   final Map<String, dynamic> message;

// // // // // // // // //   @override
// // // // // // // // //   Widget build(BuildContext context) {
// // // // // // // // //     return Align(
// // // // // // // // //       alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
// // // // // // // // //       child: Column(
// // // // // // // // //         crossAxisAlignment:
// // // // // // // // //             isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
// // // // // // // // //         children: [
// // // // // // // // //           Padding(
// // // // // // // // //             padding: const EdgeInsets.only(
// // // // // // // // //               top: 10,
// // // // // // // // //               bottom: 10,
// // // // // // // // //             ),
// // // // // // // // //             child: Container(
// // // // // // // // //               margin: const EdgeInsets.symmetric(vertical: 5),
// // // // // // // // //               padding: const EdgeInsets.all(10),
// // // // // // // // //               decoration: BoxDecoration(
// // // // // // // // //                 color: isMe
// // // // // // // // //                     ? const Color(0xFF1565C0) // الرسائل منك: أزرق غامق
// // // // // // // // //                     : Colors.grey[500], // الرسائل من الطرف التاني: رمادي فاتح
// // // // // // // // //                 borderRadius: BorderRadius.circular(15),
// // // // // // // // //               ),
// // // // // // // // //               child: SelectableText(
// // // // // // // // //                 message['text'],
// // // // // // // // //                 style: const TextStyle(
// // // // // // // // //                   color: Colors.white,
// // // // // // // // //                   fontSize: 16,
// // // // // // // // //                 ),
// // // // // // // // //               ),
// // // // // // // // //             ),
// // // // // // // // //           ),
// // // // // // // // //           Row(
// // // // // // // // //             mainAxisAlignment:
// // // // // // // // //                 isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
// // // // // // // // //             children: [
// // // // // // // // //               if (isMe) // إضافة الـ ticks للرسائل اللي منك بس
// // // // // // // // //                 const Icon(
// // // // // // // // //                   Icons.done_all,
// // // // // // // // //                   size: 16,
// // // // // // // // //                   color: Colors.blue,
// // // // // // // // //                 ),
// // // // // // // // //               if (isMe) const SizedBox(width: 5),
// // // // // // // // //               Text(
// // // // // // // // //                 message['time'],
// // // // // // // // //                 style: const TextStyle(
// // // // // // // // //                   color: Colors.grey,
// // // // // // // // //                   fontSize: 12,
// // // // // // // // //                 ),
// // // // // // // // //               ),
// // // // // // // // //             ],
// // // // // // // // //           ),
// // // // // // // // //         ],
// // // // // // // // //       ),
// // // // // // // // //     );
// // // // // // // // //   }
// // // // // // // // // }

// // // // // // // // import 'package:flutter/material.dart';

// // // // // // // // class ChatsBubble extends StatelessWidget {
// // // // // // // //   const ChatsBubble({
// // // // // // // //     super.key,
// // // // // // // //     required this.isMe,
// // // // // // // //     required this.message,
// // // // // // // //   });

// // // // // // // //   final bool isMe;
// // // // // // // //   final Map<String, dynamic> message;

// // // // // // // //   @override
// // // // // // // //   Widget build(BuildContext context) {
// // // // // // // //     return Align(
// // // // // // // //       alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
// // // // // // // //       child: Column(
// // // // // // // //         crossAxisAlignment:
// // // // // // // //             isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
// // // // // // // //         children: [
// // // // // // // //           Padding(
// // // // // // // //             padding: const EdgeInsets.only(
// // // // // // // //               top: 10,
// // // // // // // //               bottom: 10,
// // // // // // // //             ),
// // // // // // // //             child: Container(
// // // // // // // //               margin: const EdgeInsets.symmetric(vertical: 5),
// // // // // // // //               padding: const EdgeInsets.all(10),
// // // // // // // //               decoration: BoxDecoration(
// // // // // // // //                 color: isMe
// // // // // // // //                     ? const Color(0xFF1565C0) // الرسائل منك: أزرق غامق
// // // // // // // //                     : Colors.grey[500], // الرسائل من الطرف التاني: رمادي فاتح
// // // // // // // //                 borderRadius: BorderRadius.circular(15),
// // // // // // // //               ),
// // // // // // // //               child: SelectableText(
// // // // // // // //                 message['text'],
// // // // // // // //                 style: const TextStyle(
// // // // // // // //                   color: Colors.white,
// // // // // // // //                   fontSize: 16,
// // // // // // // //                 ),
// // // // // // // //               ),
// // // // // // // //             ),
// // // // // // // //           ),
// // // // // // // //           Row(
// // // // // // // //             mainAxisAlignment:
// // // // // // // //                 isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
// // // // // // // //             children: [
// // // // // // // //               if (isMe) // إضافة الـ ticks للرسائل اللي منك بس
// // // // // // // //                 const Icon(
// // // // // // // //                   Icons.done_all,
// // // // // // // //                   size: 16,
// // // // // // // //                   color: Colors.blue,
// // // // // // // //                 ),
// // // // // // // //               if (isMe) const SizedBox(width: 5),
// // // // // // // //               Text(
// // // // // // // //                 message['time'], // الوقت (06:23)
// // // // // // // //                 style: const TextStyle(
// // // // // // // //                   color: Colors.grey,
// // // // // // // //                   fontSize: 12,
// // // // // // // //                 ),
// // // // // // // //               ),
// // // // // // // //             ],
// // // // // // // //           ),
// // // // // // // //         ],
// // // // // // // //       ),
// // // // // // // //     );
// // // // // // // //   }
// // // // // // // // }

// // // // // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // // // // import 'package:flutter/material.dart';

// // // // // // // // class ChatsBubble extends StatelessWidget {
// // // // // // // //   const ChatsBubble({
// // // // // // // //     super.key,
// // // // // // // //     required this.isMe,
// // // // // // // //     required this.message,
// // // // // // // //   });

// // // // // // // //   final bool isMe;
// // // // // // // //   final Map<String, dynamic> message;

// // // // // // // //   @override
// // // // // // // //   Widget build(BuildContext context) {
// // // // // // // //     return Align(
// // // // // // // //       alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
// // // // // // // //       child: Container(
// // // // // // // //         margin: const EdgeInsets.symmetric(vertical: 5),
// // // // // // // //         padding: const EdgeInsets.all(10),
// // // // // // // //         decoration: BoxDecoration(
// // // // // // // //           color: isMe
// // // // // // // //               ? const Color.fromARGB(255, 153, 191, 234) // لون أخضر زي الواتساب
// // // // // // // //               : Colors.grey[500], // الرسائل من الطرف التاني: رمادي فاتح
// // // // // // // //           borderRadius: BorderRadius.circular(15),
// // // // // // // //         ),
// // // // // // // //         child: Column(
// // // // // // // //           crossAxisAlignment:
// // // // // // // //               isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
// // // // // // // //           children: [
// // // // // // // //             SelectableText(
// // // // // // // //               message['text'],
// // // // // // // //               style: const TextStyle(
// // // // // // // //                 color: Colors.white,
// // // // // // // //                 fontSize: 16,
// // // // // // // //               ),
// // // // // // // //             ),
// // // // // // // //             const SizedBox(height: 5),
// // // // // // // //             Row(
// // // // // // // //               mainAxisAlignment:
// // // // // // // //                   isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
// // // // // // // //               crossAxisAlignment: CrossAxisAlignment.end,
// // // // // // // //               children: [
// // // // // // // //                 if (isMe)
// // // // // // // //                   const Icon(
// // // // // // // //                     Icons.done_all,
// // // // // // // //                     size: 16,
// // // // // // // //                     color: Colors.blue,
// // // // // // // //                   ),
// // // // // // // //                 if (isMe) const SizedBox(width: 3),
// // // // // // // //                 Text(
// // // // // // // //                   message['time'], // الوقت (05:25)
// // // // // // // //                   style: const TextStyle(
// // // // // // // //                     color: Colors.white70,
// // // // // // // //                     fontSize: 12,
// // // // // // // //                   ),
// // // // // // // //                 ),
// // // // // // // //               ],
// // // // // // // //             ),
// // // // // // // //           ],
// // // // // // // //         ),
// // // // // // // //       ),
// // // // // // // //     );
// // // // // // // //   }
// // // // // // // // }

// // // // // // // import 'package:flutter/material.dart';

// // // // // // // class ChatsBubble extends StatelessWidget {
// // // // // // //   const ChatsBubble({
// // // // // // //     super.key,
// // // // // // //     required this.isMe,
// // // // // // //     required this.message,
// // // // // // //   });

// // // // // // //   final bool isMe;
// // // // // // //   final Map<String, dynamic> message;

// // // // // // //   @override
// // // // // // //   Widget build(BuildContext context) {
// // // // // // //     return Align(
// // // // // // //       alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
// // // // // // //       child: Container(
// // // // // // //         constraints: const BoxConstraints(
// // // // // // //           maxWidth: 250, // تحديد عرض أقصى للـ Container
// // // // // // //         ),
// // // // // // //         margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
// // // // // // //         padding: const EdgeInsets.all(10),
// // // // // // //         decoration: BoxDecoration(
// // // // // // //           color: isMe
// // // // // // //               ? const Color(0xFFEEFFDE) // لون أزرق موحد
// // // // // // //               : Colors.grey[500], // الرسائل الواردة: رمادي فاتح
// // // // // // //           borderRadius: BorderRadius.only(
// // // // // // //             topLeft: const Radius.circular(15),
// // // // // // //             topRight: const Radius.circular(15),
// // // // // // //             bottomLeft: const Radius.circular(15),
// // // // // // //             bottomRight: isMe
// // // // // // //                 ? const Radius.circular(0)
// // // // // // //                 : const Radius.circular(15), // سن أسفل يمين
// // // // // // //           ),
// // // // // // //         ),
// // // // // // //         child: Column(
// // // // // // //           crossAxisAlignment:
// // // // // // //               isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
// // // // // // //           children: [
// // // // // // //             SelectableText(
// // // // // // //               message['text'],
// // // // // // //               style: const TextStyle(
// // // // // // //                 fontSize: 16,
// // // // // // //               ),
// // // // // // //             ),
// // // // // // //             const SizedBox(height: 5),
// // // // // // //             Row(
// // // // // // //               mainAxisAlignment:
// // // // // // //                   isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
// // // // // // //               crossAxisAlignment: CrossAxisAlignment.end,
// // // // // // //               children: [
// // // // // // //                 Text(
// // // // // // //                   message['time'], // الوقت (05:25)
// // // // // // //                   style: const TextStyle(
// // // // // // //                     fontSize: 12,
// // // // // // //                   ),
// // // // // // //                 ),
// // // // // // //                 const SizedBox(width: 10),
// // // // // // //                 if (isMe)
// // // // // // //                   const Icon(
// // // // // // //                     Icons.done_all,
// // // // // // //                     size: 16,
// // // // // // //                     color: Colors.blue,
// // // // // // //                   ),
// // // // // // //                 if (isMe) const SizedBox(width: 3),
// // // // // // //               ],
// // // // // // //             ),
// // // // // // //           ],
// // // // // // //         ),
// // // // // // //       ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // import 'package:flutter/material.dart';

// // // // // // class ChatsBubble extends StatelessWidget {
// // // // // //   const ChatsBubble({
// // // // // //     super.key,
// // // // // //     required this.isMe,
// // // // // //     required this.message,
// // // // // //   });

// // // // // //   final bool isMe;
// // // // // //   final Map<String, dynamic> message;

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Align(
// // // // // //       alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
// // // // // //       child: Container(
// // // // // //         constraints: const BoxConstraints(
// // // // // //           maxWidth: 250, // تحديد عرض أقصى للـ Container
// // // // // //         ),
// // // // // //         margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
// // // // // //         padding: const EdgeInsets.all(10),
// // // // // //         decoration: BoxDecoration(
// // // // // //           color: isMe
// // // // // //               ? const Color(0xFFEEFFDE) // لون أخضر فاتح
// // // // // //               : Colors.grey[500], // الرسائل الواردة: رمادي فاتح
// // // // // //           borderRadius: BorderRadius.only(
// // // // // //             topLeft: const Radius.circular(15),
// // // // // //             topRight: const Radius.circular(15),
// // // // // //             bottomLeft: const Radius.circular(15),
// // // // // //             bottomRight: isMe
// // // // // //                 ? const Radius.circular(0)
// // // // // //                 : const Radius.circular(15), // سن أسفل يمين
// // // // // //           ),
// // // // // //         ),
// // // // // //         child: Column(
// // // // // //           crossAxisAlignment:
// // // // // //               isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
// // // // // //           children: [
// // // // // //             SelectableText(
// // // // // //               message['text'],
// // // // // //               style: const TextStyle(
// // // // // //                 fontSize: 16,
// // // // // //               ),
// // // // // //             ),
// // // // // //             const SizedBox(height: 5),
// // // // // //             Row(
// // // // // //               mainAxisAlignment:
// // // // // //                   isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
// // // // // //               crossAxisAlignment: CrossAxisAlignment.end,
// // // // // //               children: [
// // // // // //                 Text(
// // // // // //                   message['time'], // الوقت (05:25 AM/PM)
// // // // // //                   style: const TextStyle(
// // // // // //                     fontSize: 12,
// // // // // //                   ),
// // // // // //                 ),
// // // // // //                 const SizedBox(width: 10),
// // // // // //                 if (isMe)
// // // // // //                   const Icon(
// // // // // //                     Icons.done_all,
// // // // // //                     size: 16,
// // // // // //                     color: Colors.blue,
// // // // // //                   ),
// // // // // //                 if (isMe) const SizedBox(width: 3),
// // // // // //               ],
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // import 'package:flutter/material.dart';

// // // // // class ChatsBubble extends StatelessWidget {
// // // // //   const ChatsBubble({
// // // // //     super.key,
// // // // //     required this.isMe,
// // // // //     required this.message,
// // // // //   });

// // // // //   final bool isMe;
// // // // //   final Map<String, dynamic> message;

// // // // //   bool _isArabic(String text) {
// // // // //     // دالة بسيطة للكشف عن اللغة العربية
// // // // //     return RegExp(r'[\u0600-\u06FF]').hasMatch(text);
// // // // //   }

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     final isArabicText = _isArabic(message['text'] ?? '');
// // // // //     final textDirection = isArabicText ? TextDirection.rtl : TextDirection.ltr;

// // // // //     return Align(
// // // // //       alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
// // // // //       child: Container(
// // // // //         constraints: const BoxConstraints(
// // // // //           maxWidth: 250, // تحديد عرض أقصى للـ Container
// // // // //         ),
// // // // //         margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
// // // // //         padding: const EdgeInsets.all(10),
// // // // //         decoration: BoxDecoration(
// // // // //           color: isMe
// // // // //               ? const Color(0xFFEEFFDE) // لون أخضر فاتح
// // // // //               : Colors.grey[500], // الرسائل الواردة: رمادي فاتح
// // // // //           borderRadius: BorderRadius.only(
// // // // //             topLeft: const Radius.circular(15),
// // // // //             topRight: const Radius.circular(15),
// // // // //             bottomLeft: const Radius.circular(15),
// // // // //             bottomRight: isMe
// // // // //                 ? const Radius.circular(0)
// // // // //                 : const Radius.circular(15), // سن أسفل يمين
// // // // //           ),
// // // // //         ),
// // // // //         child: Directionality(
// // // // //           textDirection: textDirection,
// // // // //           child: Column(
// // // // //             crossAxisAlignment: isArabicText
// // // // //                 ? CrossAxisAlignment.end
// // // // //                 : CrossAxisAlignment.start,
// // // // //             children: [
// // // // //               SelectableText(
// // // // //                 message['text'],
// // // // //                 style: const TextStyle(
// // // // //                   fontSize: 16,
// // // // //                   color: Colors.black,
// // // // //                 ),
// // // // //                 textDirection: textDirection,
// // // // //               ),
// // // // //               const SizedBox(height: 5),
// // // // //               Row(
// // // // //                 mainAxisAlignment: isArabicText
// // // // //                     ? MainAxisAlignment.end
// // // // //                     : MainAxisAlignment.start,
// // // // //                 crossAxisAlignment: CrossAxisAlignment.end,
// // // // //                 children: [
// // // // //                   Text(
// // // // //                     message['time'], // الوقت (05:25 AM/PM)
// // // // //                     style: const TextStyle(
// // // // //                       fontSize: 12,
// // // // //                       color: Colors.black,
// // // // //                     ),
// // // // //                   ),
// // // // //                   const SizedBox(width: 10),
// // // // //                   if (isMe)
// // // // //                     const Icon(
// // // // //                       Icons.done_all,
// // // // //                       size: 16,
// // // // //                       color: Colors.blue,
// // // // //                     ),
// // // // //                   if (isMe) const SizedBox(width: 3),
// // // // //                 ],
// // // // //               ),
// // // // //             ],
// // // // //           ),
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // import 'package:flutter/material.dart';

// // // // class ChatsBubble extends StatelessWidget {
// // // //   const ChatsBubble({
// // // //     super.key,
// // // //     required this.isMe,
// // // //     required this.message,
// // // //   });

// // // //   final bool isMe;
// // // //   final Map<String, dynamic> message;

// // // //   bool _isArabic(String text) {
// // // //     // تحسين الكشف عن اللغة العربية، حتى لو الكلمة قصيرة
// // // //     if (text == null || text.isEmpty) return false;
// // // //     return RegExp(r'[\u0600-\u06FF]').hasMatch(text) ||
// // // //         text.trim().contains(RegExp(r'[\u0600-\u06FF]'));
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     final isArabicText = _isArabic(message['text'] ?? '');
// // // //     final textDirection = isArabicText ? TextDirection.rtl : TextDirection.ltr;

// // // //     return Align(
// // // //       alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
// // // //       child: Container(
// // // //         constraints: const BoxConstraints(
// // // //           maxWidth: 250, // تحديد عرض أقصى للـ Container
// // // //         ),
// // // //         margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
// // // //         padding: const EdgeInsets.all(10),
// // // //         decoration: BoxDecoration(
// // // //           color: isMe
// // // //               ? const Color(0xFFEEFFDE) // لون أخضر فاتح
// // // //               : Colors.grey[500], // الرسائل الواردة: رمادي فاتح
// // // //           borderRadius: BorderRadius.only(
// // // //             topLeft: const Radius.circular(15),
// // // //             topRight: const Radius.circular(15),
// // // //             bottomLeft: const Radius.circular(15),
// // // //             bottomRight: isMe
// // // //                 ? const Radius.circular(0)
// // // //                 : const Radius.circular(15), // سن أسفل يمين
// // // //           ),
// // // //         ),
// // // //         child: Directionality(
// // // //           textDirection: textDirection,
// // // //           child: Column(
// // // //             crossAxisAlignment: isArabicText
// // // //                 ? CrossAxisAlignment.end
// // // //                 : CrossAxisAlignment.start,
// // // //             children: [
// // // //               SelectableText(
// // // //                 message['text'],
// // // //                 style: const TextStyle(
// // // //                   fontSize: 16,
// // // //                   color: Colors.black,
// // // //                 ),
// // // //                 textDirection: textDirection,
// // // //               ),
// // // //               const SizedBox(height: 5),
// // // //               Row(
// // // //                 mainAxisAlignment: isArabicText
// // // //                     ? MainAxisAlignment.end
// // // //                     : MainAxisAlignment.start,
// // // //                 crossAxisAlignment: CrossAxisAlignment.end,
// // // //                 children: [
// // // //                   Text(
// // // //                     message['time'], // الوقت (05:25 AM/PM)
// // // //                     style: const TextStyle(
// // // //                       fontSize: 12,
// // // //                       color: Colors.black,
// // // //                     ),
// // // //                   ),
// // // //                   const SizedBox(width: 10),
// // // //                   if (isMe)
// // // //                     const Icon(
// // // //                       Icons.done_all,
// // // //                       size: 16,
// // // //                       color: Colors.blue,
// // // //                     ),
// // // //                   if (isMe) const SizedBox(width: 3),
// // // //                 ],
// // // //               ),
// // // //             ],
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // // import 'package:awesome_dialog/awesome_dialog.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:provider/provider.dart';

// // // class ChatsBubble extends StatelessWidget {
// // //   const ChatsBubble({
// // //     super.key,
// // //     required this.isMe,
// // //     required this.message,
// // //     required this.chatId, // إضافة chatId لتحديد الدردشة
// // //   });

// // //   final bool isMe;
// // //   final Map<String, dynamic> message;
// // //   final String chatId;

// // //   bool _isArabic(String text) {
// // //     if (text.isEmpty) return false;
// // //     return RegExp(r'[\u0600-\u06FF]').hasMatch(text);
// // //   }

// // //   void _showDeleteDialog(BuildContext context) {
// // //     final viewModel = Provider.of<ChatViewModel>(context, listen: false);
// // //     AwesomeDialog(
// // //       context: context,
// // //       dialogType: DialogType.warning,
// // //       animType: AnimType.scale,
// // //       title: 'Delete Message',
// // //       desc: 'Are you sure you want to delete this message?',
// // //       btnCancelOnPress: () {},
// // //       btnOkOnPress: () async {
// // //         try {
// // //           await viewModel.deleteMessage(chatId, message);
// // //         } catch (e) {
// // //           ScaffoldMessenger.of(context).showSnackBar(
// // //             SnackBar(content: Text('Failed to delete message: $e')),
// // //           );
// // //         }
// // //       },
// // //       btnOkText: 'Delete',
// // //       btnCancelText: 'Cancel',
// // //     ).show();
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final isArabicText = _isArabic(message['text'] ?? '');
// // //     final textDirection = isArabicText ? TextDirection.rtl : TextDirection.ltr;

// // //     return GestureDetector(
// // //       onLongPress: () => _showDeleteDialog(context),
// // //       child: Align(
// // //         alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
// // //         child: Container(
// // //           constraints: const BoxConstraints(
// // //             maxWidth: 250,
// // //           ),
// // //           margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
// // //           padding: const EdgeInsets.all(10),
// // //           decoration: BoxDecoration(
// // //             color: isMe ? const Color(0xFFEEFFDE) : Colors.grey[500],
// // //             borderRadius: BorderRadius.only(
// // //               topLeft: const Radius.circular(15),
// // //               topRight: const Radius.circular(15),
// // //               bottomLeft:
// // //                   isMe ? const Radius.circular(15) : const Radius.circular(0),
// // //               bottomRight:
// // //                   isMe ? const Radius.circular(0) : const Radius.circular(15),
// // //             ),
// // //           ),
// // //           child: Directionality(
// // //             textDirection: textDirection,
// // //             child: Column(
// // //               crossAxisAlignment:
// // //                   isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
// // //               children: [
// // //                 SelectableText(
// // //                   message['text'],
// // //                   style: const TextStyle(
// // //                     fontSize: 16,
// // //                     color: Colors.black,
// // //                   ),
// // //                   textDirection: textDirection,
// // //                   textAlign: isMe ? TextAlign.right : TextAlign.left,
// // //                 ),
// // //                 const SizedBox(height: 5),
// // //                 Row(
// // //                   mainAxisAlignment:
// // //                       isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
// // //                   crossAxisAlignment: CrossAxisAlignment.end,
// // //                   children: [
// // //                     Text(
// // //                       message['time'],
// // //                       style: const TextStyle(
// // //                         fontSize: 12,
// // //                         color: Colors.black,
// // //                       ),
// // //                     ),
// // //                     const SizedBox(width: 10),
// // //                     if (isMe)
// // //                       const Icon(
// // //                         Icons.done_all,
// // //                         size: 16,
// // //                         color: Colors.blue,
// // //                       ),
// // //                     if (isMe) const SizedBox(width: 3),
// // //                   ],
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// // import 'package:awesome_dialog/awesome_dialog.dart';
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';

// // class ChatsBubble extends StatefulWidget {
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
// //   _ChatsBubbleState createState() => _ChatsBubbleState();
// // }

// // class _ChatsBubbleState extends State<ChatsBubble> {
// //   bool _isHighlighted = false;

// //   bool _isArabic(String text) {
// //     if (text.isEmpty) return false;
// //     return RegExp(r'[\u0600-\u06FF]').hasMatch(text);
// //   }

// //   void _showDeleteDialog() {
// //     setState(() {
// //       _isHighlighted = true; // تغيير اللون للأزرق
// //     });
// //     final viewModel = Provider.of<ChatViewModel>(context, listen: false);
// //     AwesomeDialog(
// //       context: context,
// //       dialogType: DialogType.warning,
// //       animType: AnimType.scale,
// //       title: 'Delete Message',
// //       desc: 'Are you sure you want to delete this message?',
// //       btnCancelOnPress: () {
// //         setState(() {
// //           _isHighlighted = false; // إرجاع اللون الأصلي
// //         });
// //       },
// //       btnOkOnPress: () async {
// //         try {
// //           await viewModel.deleteMessage(widget.chatId, widget.message);
// //           setState(() {
// //             _isHighlighted = false; // إرجاع اللون الأصلي بعد الحذف
// //           });
// //         } catch (e) {
// //           setState(() {
// //             _isHighlighted = false; // إرجاع اللون الأصلي لو حصل خطأ
// //           });
// //           ScaffoldMessenger.of(context).showSnackBar(
// //             SnackBar(content: Text('Failed to delete message: $e')),
// //           );
// //         }
// //       },
// //       btnOkText: 'Delete',
// //       btnCancelText: 'Cancel',
// //     ).show();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final isArabicText = _isArabic(widget.message['text'] ?? '');
// //     final textDirection = isArabicText ? TextDirection.rtl : TextDirection.ltr;

// //     return GestureDetector(
// //       onLongPress: _showDeleteDialog,
// //       child: Align(
// //         alignment: widget.isMe ? Alignment.centerRight : Alignment.centerLeft,
// //         child: Container(
// //           constraints: const BoxConstraints(
// //             maxWidth: 250,
// //           ),
// //           margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
// //           padding: const EdgeInsets.all(10),
// //           decoration: BoxDecoration(
// //             color: _isHighlighted
// //                 ? Colors.blue // لون أزرق بعد الضغطة المطولة
// //                 : widget.isMe
// //                     ? const Color(0xFFEEFFDE)
// //                     : Colors.grey[500],
// //             borderRadius: BorderRadius.only(
// //               topLeft: const Radius.circular(15),
// //               topRight: const Radius.circular(15),
// //               bottomLeft: widget.isMe
// //                   ? const Radius.circular(15)
// //                   : const Radius.circular(0),
// //               bottomRight: widget.isMe
// //                   ? const Radius.circular(0)
// //                   : const Radius.circular(15),
// //             ),
// //           ),
// //           child: Directionality(
// //             textDirection: textDirection,
// //             child: Column(
// //               crossAxisAlignment: widget.isMe
// //                   ? CrossAxisAlignment.end
// //                   : CrossAxisAlignment.start,
// //               children: [
// //                 SelectableText(
// //                   widget.message['text'],
// //                   style: const TextStyle(
// //                     fontSize: 16,
// //                     color: Colors.black,
// //                   ),
// //                   textDirection: textDirection,
// //                   textAlign: widget.isMe ? TextAlign.right : TextAlign.left,
// //                 ),
// //                 const SizedBox(height: 5),
// //                 Row(
// //                   mainAxisAlignment: widget.isMe
// //                       ? MainAxisAlignment.end
// //                       : MainAxisAlignment.start,
// //                   crossAxisAlignment: CrossAxisAlignment.end,
// //                   children: [
// //                     Text(
// //                       widget.message['time'],
// //                       style: const TextStyle(
// //                         fontSize: 12,
// //                         color: Colors.black,
// //                       ),
// //                     ),
// //                     const SizedBox(width: 10),
// //                     if (widget.isMe)
// //                       const Icon(
// //                         Icons.done_all,
// //                         size: 16,
// //                         color: Colors.blue,
// //                       ),
// //                     if (widget.isMe) const SizedBox(width: 3),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

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
//     setState(() {
//       _isHighlighted = true;
//     });
//     final viewModel = Provider.of<ChatViewModel>(context, listen: false);
//     AwesomeDialog(
//       context: context,
//       dialogType: DialogType.warning,
//       animType: AnimType.scale,
//       title: 'Delete Message',
//       desc: 'Are you sure you want to delete this message?',
//       btnCancelOnPress: () {
//         setState(() {
//           _isHighlighted = false;
//         });
//       },
//       btnOkOnPress: () async {
//         try {
//           // تمرير الرسالة الأصلية من Firestore
//           final messageToDelete = {
//             'text': widget.message['text'],
//             'isMe': widget.message['isMe'],
//             'time': DateTime.parse(widget.message['time']).toIso8601String(),
//             if (widget.message.containsKey('messageId'))
//               'messageId': widget.message['messageId'],
//           };
//           await viewModel.deleteMessage(widget.chatId, messageToDelete);
//           setState(() {
//             _isHighlighted = false;
//           });
//         } catch (e) {
//           setState(() {
//             _isHighlighted = false;
//           });
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Failed to delete message: $e')),
//           );
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

//     return GestureDetector(
//       onLongPress: _showDeleteDialog,
//       child: Align(
//         alignment: widget.isMe ? Alignment.centerRight : Alignment.centerLeft,
//         child: Container(
//           constraints: const BoxConstraints(
//             maxWidth: 250,
//           ),
//           margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//           padding: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             color: _isHighlighted
//                 ? Colors.blue
//                 : widget.isMe
//                     ? const Color(0xFFEEFFDE)
//                     : Colors.grey[500],
//             borderRadius: BorderRadius.only(
//               topLeft: const Radius.circular(15),
//               topRight: const Radius.circular(15),
//               bottomLeft: widget.isMe
//                   ? const Radius.circular(15)
//                   : const Radius.circular(0),
//               bottomRight: widget.isMe
//                   ? const Radius.circular(0)
//                   : const Radius.circular(15),
//             ),
//           ),
//           child: Directionality(
//             textDirection: textDirection,
//             child: Column(
//               crossAxisAlignment: widget.isMe
//                   ? CrossAxisAlignment.end
//                   : CrossAxisAlignment.start,
//               children: [
//                 SelectableText(
//                   widget.message['text'],
//                   style: const TextStyle(
//                     fontSize: 16,
//                     color: Colors.black,
//                   ),
//                   textDirection: textDirection,
//                   textAlign: widget.isMe ? TextAlign.right : TextAlign.left,
//                 ),
//                 const SizedBox(height: 5),
//                 Row(
//                   mainAxisAlignment: widget.isMe
//                       ? MainAxisAlignment.end
//                       : MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   children: [
//                     Text(
//                       widget.message['time'],
//                       style: const TextStyle(
//                         fontSize: 12,
//                         color: Colors.black,
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     if (widget.isMe)
//                       const Icon(
//                         Icons.done_all,
//                         size: 16,
//                         color: Colors.blue,
//                       ),
//                     if (widget.isMe) const SizedBox(width: 3),
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

import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
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
    setState(() {
      _isHighlighted = true;
    });
    final viewModel = Provider.of<ChatViewModel>(context, listen: false);
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      animType: AnimType.scale,
      title: 'Delete Message',
      desc: 'Are you sure you want to delete this message?',
      btnCancelOnPress: () {
        setState(() {
          _isHighlighted = false;
        });
      },
      btnOkOnPress: () async {
        try {
          // استخدام originalTime بدل time
          final messageToDelete = {
            'text': widget.message['text'],
            'isMe': widget.message['isMe'],
            'time': widget.message['originalTime'], // وقت ISO8601 الأصلي
            if (widget.message.containsKey('messageId'))
              'messageId': widget.message['messageId'],
          };
          await viewModel.deleteMessage(widget.chatId, messageToDelete);
          setState(() {
            _isHighlighted = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Message deleted')),
          );
        } catch (e) {
          setState(() {
            _isHighlighted = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to delete message: $e')),
          );
        }
      },
      btnOkText: 'Delete',
      btnCancelText: 'Cancel',
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    final isArabicText = _isArabic(widget.message['text'] ?? '');
    final textDirection = isArabicText ? TextDirection.rtl : TextDirection.ltr;

    return GestureDetector(
      onLongPress: _showDeleteDialog,
      child: Align(
        alignment: widget.isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 250,
          ),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: _isHighlighted
                ? Colors.blue
                : widget.isMe
                    ? const Color(0xFFEEFFDE)
                    : Colors.grey[500],
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(15),
              topRight: const Radius.circular(15),
              bottomLeft: widget.isMe
                  ? const Radius.circular(15)
                  : const Radius.circular(0),
              bottomRight: widget.isMe
                  ? const Radius.circular(0)
                  : const Radius.circular(15),
            ),
          ),
          child: Directionality(
            textDirection: textDirection,
            child: Column(
              crossAxisAlignment: widget.isMe
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                SelectableText(
                  widget.message['text'],
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  textDirection: textDirection,
                  textAlign: widget.isMe ? TextAlign.right : TextAlign.left,
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: widget.isMe
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.message['time'],
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 10),
                    if (widget.isMe)
                      const Icon(
                        Icons.done_all,
                        size: 16,
                        color: Colors.blue,
                      ),
                    if (widget.isMe) const SizedBox(width: 3),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
