// // // // // // // // // // // class ChatModel {
// // // // // // // // // // //   final String name;
// // // // // // // // // // //   final String message;
// // // // // // // // // // //   final String time;
// // // // // // // // // // //   final int unreadCount;
// // // // // // // // // // //   final String avatar;
// // // // // // // // // // //   final bool hasCheckmark;

// // // // // // // // // // //   ChatModel({
// // // // // // // // // // //     required this.name,
// // // // // // // // // // //     required this.message,
// // // // // // // // // // //     required this.time,
// // // // // // // // // // //     required this.unreadCount,
// // // // // // // // // // //     required this.avatar,
// // // // // // // // // // //     required this.hasCheckmark,
// // // // // // // // // // //   });
// // // // // // // // // // // }

// // // // // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';

// // // // // // // // // // class ChatModel {
// // // // // // // // // //   final String id; // إضافة معرف المستند
// // // // // // // // // //   final String name;
// // // // // // // // // //   final String message;
// // // // // // // // // //   final String time;
// // // // // // // // // //   final int unreadCount;
// // // // // // // // // //   final String avatar;
// // // // // // // // // //   final bool hasCheckmark;
// // // // // // // // // //   final String email;
// // // // // // // // // //   final List<Map<String, dynamic>> messages;

// // // // // // // // // //   ChatModel({
// // // // // // // // // //     required this.id,
// // // // // // // // // //     required this.name,
// // // // // // // // // //     required this.message,
// // // // // // // // // //     required this.time,
// // // // // // // // // //     required this.unreadCount,
// // // // // // // // // //     required this.avatar,
// // // // // // // // // //     required this.hasCheckmark,
// // // // // // // // // //     required this.email,
// // // // // // // // // //     required this.messages,
// // // // // // // // // //   });

// // // // // // // // // //   // تحويل من JSON (Firestore)
// // // // // // // // // //   factory ChatModel.fromFirestore(DocumentSnapshot doc) {
// // // // // // // // // //     final data = doc.data() as Map<String, dynamic>;
// // // // // // // // // //     return ChatModel(
// // // // // // // // // //       id: doc.id,
// // // // // // // // // //       name: data['name'] ?? '',
// // // // // // // // // //       message: data['messages']?.isNotEmpty == true
// // // // // // // // // //           ? (data['messages'].last['text'] ?? '')
// // // // // // // // // //           : '',
// // // // // // // // // //       time: data['timestamp']?.toDate().toString().substring(11, 16) ?? '',
// // // // // // // // // //       unreadCount: (data['unreadCount'] ?? 0).toInt(),
// // // // // // // // // //       avatar: data['avatar'] ?? '',
// // // // // // // // // //       hasCheckmark: data['hasCheckmark'] ?? false,
// // // // // // // // // //       email: data['email'] ?? '',
// // // // // // // // // //       messages: List<Map<String, dynamic>>.from(data['messages'] ?? []),
// // // // // // // // // //     );
// // // // // // // // // //   }

// // // // // // // // // //   // تحويل إلى JSON (Firestore)
// // // // // // // // // //   Map<String, dynamic> toFirestore() {
// // // // // // // // // //     return {
// // // // // // // // // //       'name': name,
// // // // // // // // // //       'email': email,
// // // // // // // // // //       'avatar': avatar,
// // // // // // // // // //       'timestamp': FieldValue.serverTimestamp(),
// // // // // // // // // //       'unreadCount': unreadCount,
// // // // // // // // // //       'hasCheckmark': hasCheckmark,
// // // // // // // // // //       'messages': messages,
// // // // // // // // // //     };
// // // // // // // // // //   }
// // // // // // // // // // }

// // // // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';

// // // // // // // // // class ChatModel {
// // // // // // // // //   final String id;
// // // // // // // // //   final String name;
// // // // // // // // //   final String message;
// // // // // // // // //   final String time;
// // // // // // // // //   final int unreadCount;
// // // // // // // // //   final String avatar;
// // // // // // // // //   final bool hasCheckmark;
// // // // // // // // //   final String email;
// // // // // // // // //   final List<Map<String, dynamic>> messages;

// // // // // // // // //   ChatModel({
// // // // // // // // //     required this.id,
// // // // // // // // //     required this.name,
// // // // // // // // //     required this.message,
// // // // // // // // //     required this.time,
// // // // // // // // //     required this.unreadCount,
// // // // // // // // //     required this.avatar,
// // // // // // // // //     required this.hasCheckmark,
// // // // // // // // //     required this.email,
// // // // // // // // //     required this.messages,
// // // // // // // // //   });

// // // // // // // // //   factory ChatModel.fromFirestore(DocumentSnapshot doc) {
// // // // // // // // //     final data = doc.data() as Map<String, dynamic>;
// // // // // // // // //     return ChatModel(
// // // // // // // // //       id: doc.id,
// // // // // // // // //       name: data['name'] ?? '',
// // // // // // // // //       message: data['message'] ??
// // // // // // // // //           (data['messages']?.isNotEmpty == true
// // // // // // // // //               ? (data['messages'].last['text'] ?? '')
// // // // // // // // //               : ''),
// // // // // // // // //       time: data['timestamp']?.toDate().toString().substring(11, 16) ?? '',
// // // // // // // // //       unreadCount: (data['unreadCount'] ?? 0).toInt(),
// // // // // // // // //       avatar: data['avatar'] ?? '',
// // // // // // // // //       hasCheckmark: data['hasCheckmark'] ?? false,
// // // // // // // // //       email: data['email'] ?? '',
// // // // // // // // //       messages: List<Map<String, dynamic>>.from(data['messages'] ?? []),
// // // // // // // // //     );
// // // // // // // // //   }

// // // // // // // // //   Map<String, dynamic> toFirestore() {
// // // // // // // // //     return {
// // // // // // // // //       'name': name,
// // // // // // // // //       'email': email,
// // // // // // // // //       'avatar': avatar,
// // // // // // // // //       'timestamp': FieldValue.serverTimestamp(),
// // // // // // // // //       'unreadCount': unreadCount,
// // // // // // // // //       'hasCheckmark': hasCheckmark,
// // // // // // // // //       'messages': messages,
// // // // // // // // //       'message': message,
// // // // // // // // //     };
// // // // // // // // //   }
// // // // // // // // // }

// // // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';

// // // // // // // // class ChatModel {
// // // // // // // //   final String id;
// // // // // // // //   final String name;
// // // // // // // //   final String message;
// // // // // // // //   final String time;
// // // // // // // //   final int unreadCount;
// // // // // // // //   final String avatar;
// // // // // // // //   final bool hasCheckmark;
// // // // // // // //   final String email;
// // // // // // // //   final List<Map<String, dynamic>> messages;

// // // // // // // //   ChatModel({
// // // // // // // //     required this.id,
// // // // // // // //     required this.name,
// // // // // // // //     required this.message,
// // // // // // // //     required this.time,
// // // // // // // //     required this.unreadCount,
// // // // // // // //     required this.avatar,
// // // // // // // //     required this.hasCheckmark,
// // // // // // // //     required this.email,
// // // // // // // //     required this.messages,
// // // // // // // //   });

// // // // // // // //   factory ChatModel.fromFirestore(DocumentSnapshot doc) {
// // // // // // // //     final data = doc.data() as Map<String, dynamic>;
// // // // // // // //     return ChatModel(
// // // // // // // //       id: doc.id,
// // // // // // // //       name: data['name'] ?? '',
// // // // // // // //       message: data['message'] ??
// // // // // // // //           (data['messages']?.isNotEmpty == true
// // // // // // // //               ? (data['messages'].last['text'] ?? '')
// // // // // // // //               : ''),
// // // // // // // //       time: data['timestamp']?.toDate().toString().substring(11, 16) ?? '',
// // // // // // // //       unreadCount: (data['unreadCount'] ?? 0).toInt(),
// // // // // // // //       avatar: data['avatar'] ?? '',
// // // // // // // //       hasCheckmark: data['hasCheckmark'] ?? false,
// // // // // // // //       email: data['email'] ?? '',
// // // // // // // //       messages: List<Map<String, dynamic>>.from(data['messages'] ?? []),
// // // // // // // //     );
// // // // // // // //   }

// // // // // // // //   Map<String, dynamic> toFirestore() {
// // // // // // // //     return {
// // // // // // // //       'name': name,
// // // // // // // //       'email': email,
// // // // // // // //       'avatar': avatar,
// // // // // // // //       'timestamp': FieldValue.serverTimestamp(),
// // // // // // // //       'unreadCount': unreadCount,
// // // // // // // //       'hasCheckmark': hasCheckmark,
// // // // // // // //       'messages': messages,
// // // // // // // //       'message': message,
// // // // // // // //     };
// // // // // // // //   }
// // // // // // // // }

// // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';

// // // // // // // class ChatModel {
// // // // // // //   final String id;
// // // // // // //   final String name;
// // // // // // //   final String message;
// // // // // // //   final String time;
// // // // // // //   final int unreadCount;
// // // // // // //   final String avatar;
// // // // // // //   final bool hasCheckmark;
// // // // // // //   final String email;
// // // // // // //   final List<Map<String, dynamic>> messages;

// // // // // // //   ChatModel({
// // // // // // //     required this.id,
// // // // // // //     required this.name,
// // // // // // //     required this.message,
// // // // // // //     required this.time,
// // // // // // //     required this.unreadCount,
// // // // // // //     required this.avatar,
// // // // // // //     required this.hasCheckmark,
// // // // // // //     required this.email,
// // // // // // //     required this.messages,
// // // // // // //   });

// // // // // // //   factory ChatModel.fromFirestore(DocumentSnapshot doc) {
// // // // // // //     final data = doc.data() as Map<String, dynamic>;
// // // // // // //     String time = '';
// // // // // // //     if (data['messages'] != null && (data['messages'] as List).isNotEmpty) {
// // // // // // //       final lastMessage = data['messages'].last;
// // // // // // //       try {
// // // // // // //         final messageTime = DateTime.parse(lastMessage['time']);
// // // // // // //         final hour = messageTime.hour.toString().padLeft(2, '0');
// // // // // // //         final minute = messageTime.minute.toString().padLeft(2, '0');
// // // // // // //         time = '$hour:$minute';
// // // // // // //       } catch (e) {
// // // // // // //         time = '';
// // // // // // //       }
// // // // // // //     } else if (data['timestamp'] != null) {
// // // // // // //       // الرجوع إلى timestamp إذا لم يكن هناك رسائل
// // // // // // //       try {
// // // // // // //         final timestamp = data['timestamp'].toDate();
// // // // // // //         final hour = timestamp.hour.toString().padLeft(2, '0');
// // // // // // //         final minute = timestamp.minute.toString().padLeft(2, '0');
// // // // // // //         time = '$hour:$minute';
// // // // // // //       } catch (e) {
// // // // // // //         time = '';
// // // // // // //       }
// // // // // // //     }

// // // // // // //     return ChatModel(
// // // // // // //       id: doc.id,
// // // // // // //       name: data['name'] ?? '',
// // // // // // //       message: data['message'] ??
// // // // // // //           (data['messages']?.isNotEmpty == true
// // // // // // //               ? (data['messages'].last['text'] ?? '')
// // // // // // //               : ''),
// // // // // // //       time: time,
// // // // // // //       unreadCount: (data['unreadCount'] ?? 0).toInt(),
// // // // // // //       avatar: data['avatar'] ?? '',
// // // // // // //       hasCheckmark: data['hasCheckmark'] ?? false,
// // // // // // //       email: data['email'] ?? '',
// // // // // // //       messages: List<Map<String, dynamic>>.from(data['messages'] ?? []),
// // // // // // //     );
// // // // // // //   }

// // // // // // //   Map<String, dynamic> toFirestore() {
// // // // // // //     return {
// // // // // // //       'name': name,
// // // // // // //       'email': email,
// // // // // // //       'avatar': avatar,
// // // // // // //       'timestamp': FieldValue.serverTimestamp(),
// // // // // // //       'unreadCount': unreadCount,
// // // // // // //       'hasCheckmark': hasCheckmark,
// // // // // // //       'messages': messages,
// // // // // // //       'message': message,
// // // // // // //     };
// // // // // // //   }
// // // // // // // }

// // // // // // import 'package:cloud_firestore/cloud_firestore.dart';

// // // // // // class ChatModel {
// // // // // //   final String id;
// // // // // //   final String userId; // أضفنا userId
// // // // // //   final String name;
// // // // // //   final String message;
// // // // // //   final String time;
// // // // // //   final int unreadCount;
// // // // // //   final String avatar;
// // // // // //   final bool hasCheckmark;
// // // // // //   final String email;
// // // // // //   final List<Map<String, dynamic>> messages;

// // // // // //   ChatModel({
// // // // // //     required this.id,
// // // // // //     required this.userId,
// // // // // //     required this.name,
// // // // // //     required this.message,
// // // // // //     required this.time,
// // // // // //     required this.unreadCount,
// // // // // //     required this.avatar,
// // // // // //     required this.hasCheckmark,
// // // // // //     required this.email,
// // // // // //     required this.messages,
// // // // // //   });

// // // // // //   factory ChatModel.fromFirestore(DocumentSnapshot doc) {
// // // // // //     final data = doc.data() as Map<String, dynamic>;
// // // // // //     String time = '';
// // // // // //     if (data['messages'] != null && (data['messages'] as List).isNotEmpty) {
// // // // // //       final lastMessage = data['messages'].last;
// // // // // //       try {
// // // // // //         final messageTime = DateTime.parse(lastMessage['time']);
// // // // // //         final hour = messageTime.hour.toString().padLeft(2, '0');
// // // // // //         final minute = messageTime.minute.toString().padLeft(2, '0');
// // // // // //         time = '$hour:$minute';
// // // // // //       } catch (e) {
// // // // // //         time = '';
// // // // // //       }
// // // // // //     } else if (data['timestamp'] != null) {
// // // // // //       try {
// // // // // //         final timestamp = data['timestamp'].toDate();
// // // // // //         final hour = timestamp.hour.toString().padLeft(2, '0');
// // // // // //         final minute = timestamp.minute.toString().padLeft(2, '0');
// // // // // //         time = '$hour:$minute';
// // // // // //       } catch (e) {
// // // // // //         time = '';
// // // // // //       }
// // // // // //     }

// // // // // //     return ChatModel(
// // // // // //       id: doc.id,
// // // // // //       userId: data['userId'] ?? '', // أضفنا userId
// // // // // //       name: data['name'] ?? '',
// // // // // //       message: data['message'] ??
// // // // // //           (data['messages']?.isNotEmpty == true
// // // // // //               ? (data['messages'].last['text'] ?? '')
// // // // // //               : ''),
// // // // // //       time: time,
// // // // // //       unreadCount: (data['unreadCount'] ?? 0).toInt(),
// // // // // //       avatar: data['avatar'] ?? '',
// // // // // //       hasCheckmark: data['hasCheckmark'] ?? false,
// // // // // //       email: data['email'] ?? '',
// // // // // //       messages: List<Map<String, dynamic>>.from(data['messages'] ?? []),
// // // // // //     );
// // // // // //   }

// // // // // //   Map<String, dynamic> toFirestore() {
// // // // // //     return {
// // // // // //       'userId': userId, // أضفنا userId
// // // // // //       'name': name,
// // // // // //       'email': email,
// // // // // //       'avatar': avatar,
// // // // // //       'timestamp': FieldValue.serverTimestamp(),
// // // // // //       'unreadCount': unreadCount,
// // // // // //       'hasCheckmark': hasCheckmark,
// // // // // //       'messages': messages,
// // // // // //       'message': message,
// // // // // //     };
// // // // // //   }
// // // // // // }

// // // // // import 'package:cloud_firestore/cloud_firestore.dart';

// // // // // class ChatModel {
// // // // //   final String id;
// // // // //   final String userId;
// // // // //   final String name;
// // // // //   final String email;
// // // // //   final String message;
// // // // //   final String avatar;
// // // // //   final String time; // String زي ما هو
// // // // //   final int unreadCount;
// // // // //   final bool hasCheckmark;
// // // // //   final List<Map<String, dynamic>> messages;

// // // // //   ChatModel({
// // // // //     required this.id,
// // // // //     required this.userId,
// // // // //     required this.name,
// // // // //     required this.email,
// // // // //     required this.message,
// // // // //     required this.avatar,
// // // // //     required this.time,
// // // // //     required this.unreadCount,
// // // // //     required this.hasCheckmark,
// // // // //     required this.messages,
// // // // //   });

// // // // //   // factory ChatModel.fromFirestore(DocumentSnapshot doc) {
// // // // //   //   Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
// // // // //   //   String timeString = '';

// // // // //   //   // التحقق من نوع حقل timestamp
// // // // //   //   if (data['timestamp'] is Timestamp) {
// // // // //   //     timeString = (data['timestamp'] as Timestamp).toDate().toIso8601String();
// // // // //   //   } else if (data['timestamp'] is String && data['timestamp'] != '') {
// // // // //   //     // لو الـ timestamp هو String، نحاول نحوله إلى DateTime وبعدين نرجعه كـ ISO 8601
// // // // //   //     try {
// // // // //   //       timeString = DateTime.parse(data['timestamp']).toIso8601String();
// // // // //   //     } catch (e) {
// // // // //   //       print(
// // // // //   //           'Error parsing timestamp string: ${data['timestamp']}, error: $e');
// // // // //   //       timeString = '';
// // // // //   //     }
// // // // //   //   } else {
// // // // //   //     // لو مفيش timestamp أو قيمته مش متوقعة، نرجع String فاضي
// // // // //   //     timeString = '';
// // // // //   //   }

// // // // //   //   return ChatModel(
// // // // //   //     id: doc.id,
// // // // //   //     userId: data['userId'] ?? '',
// // // // //   //     name: data['name'] ?? '',
// // // // //   //     email: data['email'] ?? '',
// // // // //   //     message: data['message'] ?? '',
// // // // //   //     avatar: data['avatar'] ?? '',
// // // // //   //     time: timeString,
// // // // //   //     unreadCount: data['unreadCount'] ?? 0,
// // // // //   //     hasCheckmark: data['hasCheckmark'] ?? false,
// // // // //   //     messages: List<Map<String, dynamic>>.from(data['messages'] ?? []),
// // // // //   //   );
// // // // //   // }

// // // // //   factory ChatModel.fromFirestore(DocumentSnapshot doc) {
// // // // //     Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
// // // // //     String timeString = '';

// // // // //     // دالة مساعدة لتحويل DateTime إلى صيغة 12 ساعة
// // // // //     String formatTo12Hour(DateTime dateTime) {
// // // // //       final hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
// // // // //       final minute = dateTime.minute.toString().padLeft(2, '0');
// // // // //       final period = dateTime.hour >= 12 ? 'PM' : 'AM';
// // // // //       return '${hour.toString().padLeft(2, '0')}:$minute $period';
// // // // //     }

// // // // //     // التحقق من نوع حقل timestamp
// // // // //     if (data['timestamp'] is Timestamp) {
// // // // //       DateTime dateTime = (data['timestamp'] as Timestamp).toDate();
// // // // //       timeString = formatTo12Hour(dateTime);
// // // // //     } else if (data['timestamp'] is String && data['timestamp'] != '') {
// // // // //       try {
// // // // //         DateTime dateTime = DateTime.parse(data['timestamp']);
// // // // //         timeString = formatTo12Hour(dateTime);
// // // // //       } catch (e) {
// // // // //         print(
// // // // //             'Error parsing timestamp string: ${data['timestamp']}, error: $e');
// // // // //         timeString = '';
// // // // //       }
// // // // //     } else {
// // // // //       timeString = '';
// // // // //     }

// // // // //     return ChatModel(
// // // // //       id: doc.id,
// // // // //       userId: data['userId'] ?? '',
// // // // //       name: data['name'] ?? '',
// // // // //       email: data['email'] ?? '',
// // // // //       message: data['message'] ?? '',
// // // // //       avatar: data['avatar'] ?? '',
// // // // //       time: timeString, // الوقت الآن بالصيغة المطلوبة
// // // // //       unreadCount: data['unreadCount'] ?? 0,
// // // // //       hasCheckmark: data['hasCheckmark'] ?? false,
// // // // //       messages: List<Map<String, dynamic>>.from(data['messages'] ?? []),
// // // // //     );
// // // // //   }

// // // // //   Map<String, dynamic> toFirestore() {
// // // // //     return {
// // // // //       'userId': userId,
// // // // //       'name': name,
// // // // //       'email': email,
// // // // //       'message': message,
// // // // //       'avatar': avatar,
// // // // //       'timestamp': FieldValue.serverTimestamp(),
// // // // //       'unreadCount': unreadCount,
// // // // //       'hasCheckmark': hasCheckmark,
// // // // //       'messages': messages,
// // // // //     };
// // // // //   }
// // // // // }

// // // // import 'package:cloud_firestore/cloud_firestore.dart';

// // // // class ChatModel {
// // // //   final String id;
// // // //   final String userId;
// // // //   final String name;
// // // //   final String email;
// // // //   final String message;
// // // //   final String avatar;
// // // //   final String time; // للعرض فقط بتنسيق 12 ساعة
// // // //   final DateTime? timestamp; // للترتيب
// // // //   final int unreadCount;
// // // //   final bool hasCheckmark;
// // // //   final List<Map<String, dynamic>> messages;

// // // //   ChatModel({
// // // //     required this.id,
// // // //     required this.userId,
// // // //     required this.name,
// // // //     required this.email,
// // // //     required this.message,
// // // //     required this.avatar,
// // // //     required this.time,
// // // //     this.timestamp, // حقل جديد اختياري
// // // //     required this.unreadCount,
// // // //     required this.hasCheckmark,
// // // //     required this.messages,
// // // //   });

// // // //   factory ChatModel.fromFirestore(DocumentSnapshot doc) {
// // // //     Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
// // // //     String timeString = '';
// // // //     DateTime? timestamp;

// // // //     // دالة مساعدة لتحويل DateTime إلى صيغة 12 ساعة
// // // //     String formatTo12Hour(DateTime dateTime) {
// // // //       final hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
// // // //       final minute = dateTime.minute.toString().padLeft(2, '0');
// // // //       final period = dateTime.hour >= 12 ? 'PM' : 'AM';
// // // //       return '${hour.toString().padLeft(2, '0')}:$minute $period';
// // // //     }

// // // //     // التحقق من نوع حقل timestamp
// // // //     if (data['timestamp'] is Timestamp) {
// // // //       timestamp = (data['timestamp'] as Timestamp).toDate();
// // // //       timeString = formatTo12Hour(timestamp);
// // // //     } else if (data['timestamp'] is String && data['timestamp'] != '') {
// // // //       try {
// // // //         timestamp = DateTime.parse(data['timestamp']);
// // // //         timeString = formatTo12Hour(timestamp);
// // // //       } catch (e) {
// // // //         print(
// // // //             'Error parsing timestamp string: ${data['timestamp']}, error: $e');
// // // //         timeString = '';
// // // //         timestamp = null;
// // // //       }
// // // //     } else {
// // // //       timeString = '';
// // // //       timestamp = null;
// // // //     }

// // // //     return ChatModel(
// // // //       id: doc.id,
// // // //       userId: data['userId'] ?? '',
// // // //       name: data['name'] ?? '',
// // // //       email: data['email'] ?? '',
// // // //       message: data['message'] ?? '',
// // // //       avatar: data['avatar'] ?? '',
// // // //       time: timeString,
// // // //       timestamp: timestamp, // تخزين الـ timestamp للترتيب
// // // //       unreadCount: data['unreadCount'] ?? 0,
// // // //       hasCheckmark: data['hasCheckmark'] ?? false,
// // // //       messages: List<Map<String, dynamic>>.from(data['messages'] ?? []),
// // // //     );
// // // //   }

// // // //   Map<String, dynamic> toFirestore() {
// // // //     return {
// // // //       'userId': userId,
// // // //       'name': name,
// // // //       'email': email,
// // // //       'message': message,
// // // //       'avatar': avatar,
// // // //       'timestamp': FieldValue.serverTimestamp(),
// // // //       'unreadCount': unreadCount,
// // // //       'hasCheckmark': hasCheckmark,
// // // //       'messages': messages,
// // // //     };
// // // //   }
// // // // }

// // // import 'package:cloud_firestore/cloud_firestore.dart';

// // // class ChatModel {
// // //   final String id;
// // //   final List<String> participants; // قايمة المستخدمين
// // //   final String lastMessage;
// // //   final String avatar; // صورة الشخص الآخر
// // //   final String name; // اسم الشخص الآخر
// // //   final String email; // إيميل الشخص الآخر
// // //   final String time; // وقت آخر رسالة (للعرض)
// // //   final DateTime? timestamp; // للترتيب
// // //   final int unreadCount; // عدد الرسايل الغير مقروءة
// // //   final bool hasCheckmark;
// // //   final List<Map<String, dynamic>> messages;

// // //   ChatModel({
// // //     required this.id,
// // //     required this.participants,
// // //     required this.lastMessage,
// // //     required this.avatar,
// // //     required this.name,
// // //     required this.email,
// // //     required this.time,
// // //     this.timestamp,
// // //     required this.unreadCount,
// // //     required this.hasCheckmark,
// // //     required this.messages,
// // //   });

// // //   factory ChatModel.fromFirestore(DocumentSnapshot doc, String currentUserId) {
// // //     Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
// // //     String timeString = '';
// // //     DateTime? timestamp;

// // //     String formatTo12Hour(DateTime dateTime) {
// // //       final hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
// // //       final minute = dateTime.minute.toString().padLeft(2, '0');
// // //       final period = dateTime.hour >= 12 ? 'PM' : 'AM';
// // //       return '${hour.toString().padLeft(2, '0')}:$minute $period';
// // //     }

// // //     if (data['timestamp'] is Timestamp) {
// // //       timestamp = (data['timestamp'] as Timestamp).toDate();
// // //       timeString = formatTo12Hour(timestamp);
// // //     } else {
// // //       timeString = '';
// // //       timestamp = null;
// // //     }

// // //     // جلب بيانات الشخص الآخر (مش الـ current user)
// // //     final participants = List<String>.from(data['participants'] ?? []);
// // //     final otherUserId =
// // //         participants.firstWhere((id) => id != currentUserId, orElse: () => '');

// // //     return ChatModel(
// // //       id: doc.id,
// // //       participants: participants,
// // //       lastMessage: data['lastMessage'] ?? '',
// // //       avatar: data['avatar'] ?? '',
// // //       name: data['name'] ?? '',
// // //       email: data['email'] ?? '',
// // //       time: timeString,
// // //       timestamp: timestamp,
// // //       unreadCount: (data['unreadCounts']?[currentUserId] ?? 0) as int,
// // //       hasCheckmark: data['hasCheckmark'] ?? false,
// // //       messages: List<Map<String, dynamic>>.from(data['messages'] ?? []),
// // //     );
// // //   }

// // //   Map<String, dynamic> toFirestore() {
// // //     return {
// // //       'participants': participants,
// // //       'lastMessage': lastMessage,
// // //       'avatar': avatar,
// // //       'name': name,
// // //       'email': email,
// // //       'timestamp': FieldValue.serverTimestamp(),
// // //       'unreadCounts': {for (var id in participants) id: unreadCount},
// // //       'hasCheckmark': hasCheckmark,
// // //       'messages': messages,
// // //     };
// // //   }
// // // }

// // import 'package:cloud_firestore/cloud_firestore.dart';

// // class ChatModel {
// //   final String id;
// //   final List<String> participants;
// //   final String lastMessage;
// //   final String name;
// //   final String email;
// //   final String time;
// //   final DateTime? timestamp;
// //   final int unreadCount;
// //   final String avatar;
// //   final bool hasCheckmark;
// //   final List<Map<String, dynamic>> messages;

// //   ChatModel({
// //     required this.id,
// //     required this.participants,
// //     this.lastMessage = '',
// //     required this.name,
// //     required this.email,
// //     this.time = '',
// //     this.timestamp,
// //     this.unreadCount = 0,
// //     this.avatar = '',
// //     this.hasCheckmark = false,
// //     this.messages = const [],
// //   });

// //   factory ChatModel.fromFirestore(DocumentSnapshot doc, String currentUserId) {
// //     final data = doc.data() as Map<String, dynamic>;
// //     final messages = List<Map<String, dynamic>>.from(data['messages'] ?? []);
// //     final unreadCounts = data['unreadCounts'] as Map<String, dynamic>? ?? {};
// //     final timestamp = data['timestamp'] as Timestamp?;

// //     return ChatModel(
// //       id: doc.id,
// //       participants: List<String>.from(data['participants'] ?? []),
// //       lastMessage: data['lastMessage'] ?? '',
// //       name: data['name'] ?? '',
// //       email: data['email'] ?? '',
// //       time: data['time'] ?? '',
// //       timestamp: timestamp?.toDate(),
// //       unreadCount: unreadCounts[currentUserId] ?? 0,
// //       avatar: data['avatar'] ?? '',
// //       hasCheckmark: data['hasCheckmark'] ?? false,
// //       messages: messages,
// //     );
// //   }
// // }

// import 'package:cloud_firestore/cloud_firestore.dart';

// class ChatModel {
//   final String id;
//   final List<String> participants;
//   final String lastMessage;
//   final String name; // اسم الطرف الآخر
//   final String email;
//   final String time;
//   final DateTime? timestamp;
//   final int unreadCount;
//   final String avatar; // صورة الطرف الآخر
//   final bool hasCheckmark;
//   final List<Map<String, dynamic>> messages;

//   ChatModel({
//     required this.id,
//     required this.participants,
//     this.lastMessage = '',
//     required this.name,
//     required this.email,
//     this.time = '',
//     this.timestamp,
//     this.unreadCount = 0,
//     this.avatar = '',
//     this.hasCheckmark = false,
//     this.messages = const [],
//   });

//   // factory ChatModel.fromFirestore(DocumentSnapshot doc, String currentUserId) {
//   //   final data = doc.data() as Map<String, dynamic>;
//   //   final messages = List<Map<String, dynamic>>.from(data['messages'] ?? []);
//   //   final unreadCounts = data['unreadCounts'] as Map<String, dynamic>? ?? {};
//   //   final timestamp = data['timestamp'] as Timestamp?;
//   //   final names = data['names'] as Map<String, dynamic>? ?? {};
//   //   final avatars = data['avatars'] as Map<String, dynamic>? ?? {};
//   //   final participants = List<String>.from(data['participants'] ?? []);

//   //   // تحديد الطرف الآخر
//   //   final otherUserId =
//   //       participants.firstWhere((id) => id != currentUserId, orElse: () => '');

//   //   // جلب الاسم والصورة بتوع الطرف الآخر
//   //   final otherUserName = names[otherUserId] ?? '';
//   //   final otherUserAvatar = avatars[otherUserId] ?? '';

//   //   return ChatModel(
//   //     id: doc.id,
//   //     participants: participants,
//   //     lastMessage: data['lastMessage'] ?? '',
//   //     name: otherUserName, // اسم الطرف الآخر
//   //     email: data['email'] ?? '',
//   //     time: data['time'] ?? '',
//   //     timestamp: timestamp?.toDate(),
//   //     unreadCount: unreadCounts[currentUserId] ?? 0,
//   //     avatar: otherUserAvatar, // صورة الطرف الآخر
//   //     hasCheckmark: data['hasCheckmark'] ?? false,
//   //     messages: messages,
//   //   );
//   // }

//   factory ChatModel.fromFirestore(DocumentSnapshot doc, String currentUserId) {
//     final data = doc.data() as Map<String, dynamic>;
//     final messages = List<Map<String, dynamic>>.from(data['messages'] ?? []);
//     final unreadCounts = data['unreadCounts'] as Map<String, dynamic>? ?? {};
//     final timestamp = data['timestamp'] as Timestamp?;
//     final names = data['names'] as Map<String, dynamic>? ?? {};
//     final avatars = data['avatars'] as Map<String, dynamic>? ?? {};
//     final participants = List<String>.from(data['participants'] ?? []);

//     // تحديد الطرف الآخر
//     final otherUserId =
//         participants.firstWhere((id) => id != currentUserId, orElse: () => '');

//     // جلب الاسم والصورة بتوع الطرف الآخر
//     final otherUserName = names[otherUserId] ?? '';
//     final otherUserAvatar = avatars[otherUserId] ?? '';

//     return ChatModel(
//       id: doc.id,
//       participants: participants,
//       lastMessage: data['lastMessage'] ?? '',
//       name: otherUserName.isNotEmpty
//           ? otherUserName
//           : 'Unknown', // Fallback إذا كان الاسم فاضي
//       email: data['email'] ?? '',
//       time: data['time'] ?? '',
//       timestamp: timestamp?.toDate(),
//       unreadCount: unreadCounts[currentUserId] ?? 0,
//       avatar: otherUserAvatar, // صورة الطرف الآخر
//       hasCheckmark: data['hasCheckmark'] ?? false,
//       messages: messages,
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  final String id;
  final List<String> participants;
  final String lastMessage;
  final String name;
  final String email;
  final String time;
  final DateTime? timestamp;
  final int unreadCount;
  final String avatar;
  final bool hasCheckmark;
  final List<Map<String, dynamic>> messages;

  ChatModel({
    required this.id,
    required this.participants,
    required this.lastMessage,
    required this.name,
    required this.email,
    required this.time,
    this.timestamp,
    required this.unreadCount,
    required this.avatar,
    required this.hasCheckmark,
    required this.messages,
  });

  factory ChatModel.fromFirestore(DocumentSnapshot doc, String currentUserId) {
    final data = doc.data() as Map<String, dynamic>;
    final messages = List<Map<String, dynamic>>.from(data['messages'] ?? []);
    final unreadCounts = data['unreadCounts'] as Map<String, dynamic>? ?? {};
    final timestamp = data['timestamp'] as Timestamp?;
    final names = data['names'] as Map<String, dynamic>? ?? {};
    final avatars = data['avatars'] as Map<String, dynamic>? ?? {};
    final participants = List<String>.from(data['participants'] ?? []);

    final otherUserId =
        participants.firstWhere((id) => id != currentUserId, orElse: () => '');

    final otherUserName = names[otherUserId] ?? '';
    final otherUserAvatar = avatars[otherUserId] ?? '';

    return ChatModel(
      id: doc.id,
      participants: participants,
      lastMessage: data['lastMessage'] ?? '',
      name: otherUserName.isNotEmpty ? otherUserName : 'Unknown',
      email: data['email'] ?? '',
      time: data['time'] ?? '',
      timestamp: timestamp?.toDate(),
      unreadCount: unreadCounts[currentUserId] ?? 0,
      avatar: otherUserAvatar,
      hasCheckmark: data['hasCheckmark'] ?? false,
      messages: messages,
    );
  }
}
