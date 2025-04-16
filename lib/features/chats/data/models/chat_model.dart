// // // class ChatModel {
// // //   final String name;
// // //   final String message;
// // //   final String time;
// // //   final int unreadCount;
// // //   final String avatar;
// // //   final bool hasCheckmark;

// // //   ChatModel({
// // //     required this.name,
// // //     required this.message,
// // //     required this.time,
// // //     required this.unreadCount,
// // //     required this.avatar,
// // //     required this.hasCheckmark,
// // //   });
// // // }

// // import 'package:cloud_firestore/cloud_firestore.dart';

// // class ChatModel {
// //   final String id; // إضافة معرف المستند
// //   final String name;
// //   final String message;
// //   final String time;
// //   final int unreadCount;
// //   final String avatar;
// //   final bool hasCheckmark;
// //   final String email;
// //   final List<Map<String, dynamic>> messages;

// //   ChatModel({
// //     required this.id,
// //     required this.name,
// //     required this.message,
// //     required this.time,
// //     required this.unreadCount,
// //     required this.avatar,
// //     required this.hasCheckmark,
// //     required this.email,
// //     required this.messages,
// //   });

// //   // تحويل من JSON (Firestore)
// //   factory ChatModel.fromFirestore(DocumentSnapshot doc) {
// //     final data = doc.data() as Map<String, dynamic>;
// //     return ChatModel(
// //       id: doc.id,
// //       name: data['name'] ?? '',
// //       message: data['messages']?.isNotEmpty == true
// //           ? (data['messages'].last['text'] ?? '')
// //           : '',
// //       time: data['timestamp']?.toDate().toString().substring(11, 16) ?? '',
// //       unreadCount: (data['unreadCount'] ?? 0).toInt(),
// //       avatar: data['avatar'] ?? '',
// //       hasCheckmark: data['hasCheckmark'] ?? false,
// //       email: data['email'] ?? '',
// //       messages: List<Map<String, dynamic>>.from(data['messages'] ?? []),
// //     );
// //   }

// //   // تحويل إلى JSON (Firestore)
// //   Map<String, dynamic> toFirestore() {
// //     return {
// //       'name': name,
// //       'email': email,
// //       'avatar': avatar,
// //       'timestamp': FieldValue.serverTimestamp(),
// //       'unreadCount': unreadCount,
// //       'hasCheckmark': hasCheckmark,
// //       'messages': messages,
// //     };
// //   }
// // }

// import 'package:cloud_firestore/cloud_firestore.dart';

// class ChatModel {
//   final String id;
//   final String name;
//   final String message;
//   final String time;
//   final int unreadCount;
//   final String avatar;
//   final bool hasCheckmark;
//   final String email;
//   final List<Map<String, dynamic>> messages;

//   ChatModel({
//     required this.id,
//     required this.name,
//     required this.message,
//     required this.time,
//     required this.unreadCount,
//     required this.avatar,
//     required this.hasCheckmark,
//     required this.email,
//     required this.messages,
//   });

//   factory ChatModel.fromFirestore(DocumentSnapshot doc) {
//     final data = doc.data() as Map<String, dynamic>;
//     return ChatModel(
//       id: doc.id,
//       name: data['name'] ?? '',
//       message: data['message'] ??
//           (data['messages']?.isNotEmpty == true
//               ? (data['messages'].last['text'] ?? '')
//               : ''),
//       time: data['timestamp']?.toDate().toString().substring(11, 16) ?? '',
//       unreadCount: (data['unreadCount'] ?? 0).toInt(),
//       avatar: data['avatar'] ?? '',
//       hasCheckmark: data['hasCheckmark'] ?? false,
//       email: data['email'] ?? '',
//       messages: List<Map<String, dynamic>>.from(data['messages'] ?? []),
//     );
//   }

//   Map<String, dynamic> toFirestore() {
//     return {
//       'name': name,
//       'email': email,
//       'avatar': avatar,
//       'timestamp': FieldValue.serverTimestamp(),
//       'unreadCount': unreadCount,
//       'hasCheckmark': hasCheckmark,
//       'messages': messages,
//       'message': message,
//     };
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  final String id;
  final String name;
  final String message;
  final String time;
  final int unreadCount;
  final String avatar;
  final bool hasCheckmark;
  final String email;
  final List<Map<String, dynamic>> messages;

  ChatModel({
    required this.id,
    required this.name,
    required this.message,
    required this.time,
    required this.unreadCount,
    required this.avatar,
    required this.hasCheckmark,
    required this.email,
    required this.messages,
  });

  factory ChatModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ChatModel(
      id: doc.id,
      name: data['name'] ?? '',
      message: data['message'] ??
          (data['messages']?.isNotEmpty == true
              ? (data['messages'].last['text'] ?? '')
              : ''),
      time: data['timestamp']?.toDate().toString().substring(11, 16) ?? '',
      unreadCount: (data['unreadCount'] ?? 0).toInt(),
      avatar: data['avatar'] ?? '',
      hasCheckmark: data['hasCheckmark'] ?? false,
      email: data['email'] ?? '',
      messages: List<Map<String, dynamic>>.from(data['messages'] ?? []),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'email': email,
      'avatar': avatar,
      'timestamp': FieldValue.serverTimestamp(),
      'unreadCount': unreadCount,
      'hasCheckmark': hasCheckmark,
      'messages': messages,
      'message': message,
    };
  }
}
