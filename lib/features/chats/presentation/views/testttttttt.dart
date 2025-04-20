
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
//       name: otherUserName, // اسم الطرف الآخر
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
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:uuid/uuid.dart';

// class ChatRepository {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final Uuid _uuid = const Uuid();Stream<List<ChatModel>> getChatsStream() {
//     final currentUser = FirebaseAuth.instance.currentUser;
//     if (currentUser == null) {
//       return Stream.value([]);
//     }

//     return FirebaseFirestore.instance
//         .collection('chats')
//         .where('participants', arrayContains: currentUser.uid)
//         .snapshots()
//         .map((snapshot) {
//       return snapshot.docs.map((doc) {
//         return ChatModel.fromFirestore(doc, currentUser.uid);
//       }).toList();
//     });
//   }

//   /// إنشاء شات جديد بين المستخدم الحالي ومستخدم آخر
//   Future<String> createChat(
//       String otherUserId, String name, String email, String avatar) async {
//     try {
//       final currentUser = FirebaseAuth.instance.currentUser;
//       if (currentUser == null) {
//         throw Exception('لا يوجد مستخدم مسجل دخول');
//       }

//       // التحقق من وجود شات بين المستخدمين
//       final existingChat = await _firestore
//           .collection('chats')
//           .where('participants', arrayContains: currentUser.uid)
//           .where('participants', arrayContains: otherUserId)
//           .limit(1)
//           .get();

//       if (existingChat.docs.isNotEmpty) {
//         print('المحادثة موجودة بالفعل بين ${currentUser.uid} و $otherUserId');
//         return existingChat.docs.first.id; // إرجاع معرف الشات الموجود
//       }

//       // إنشاء شات جديد
//       final chatRef = await _firestore.collection('chats').add({
//         'participants': [currentUser.uid, otherUserId],
//         'lastMessage': '',
//         'avatar': avatar,
//         'name': name,
//         'email': email,
//         'timestamp': FieldValue.serverTimestamp(),
//         'unreadCounts': {
//           currentUser.uid: 0,
//           otherUserId: 0,
//         },
//         'hasCheckmark': false,
//         'messages': [],
//       });

//       print('تم إنشاء محادثة جديدة بمعرف: ${chatRef.id}');
//       return chatRef.id;
//     } catch (e) {
//       print('خطأ في إنشاء المحادثة: $e');
//       rethrow;
//     }
//   }

//   /// حذف شات
//   // Future<void> deleteChat(String chatId) async {
//   //   try {
//   //     await _firestore.collection('chats').doc(chatId).delete();
//   //     print('تم حذف المحادثة بمعرف: $chatId');
//   //   } catch (e) {
//   //     print('خطأ في حذف المحادثة: $e');
//   //     rethrow;
//   //   }
//   // }

//   Future<void> deleteChat(String chatId) async {
//     try {
//       await FirebaseFirestore.instance.collection('chats').doc(chatId).delete();
//     } catch (e) {
//       throw Exception('خطأ في حذف المحادثة: $e');
//     }
//   }

//   /// تحديث اسم الشات
//   // Future<void> updateChatName(String chatId, String newName) async {
//   //   try {
//   //     await _firestore.collection('chats').doc(chatId).update({
//   //       'name': newName,
//   //       'timestamp': FieldValue.serverTimestamp(),
//   //     });
//   //     print('تم تحديث اسم المحادثة بمعرف: $chatId إلى: $newName');
//   //   } catch (e) {
//   //     print('خطأ في تحديث اسم المحادثة: $e');
//   //     rethrow;
//   //   }
//   // }

//   Future<void> updateChatName(String chatId, String newName) async {
//     try {
//       await FirebaseFirestore.instance
//           .collection('chats')
//           .doc(chatId)
//           .update({'name': newName});
//     } catch (e) {
//       throw Exception('خطأ في تحديث اسم المحادثة: $e');
//     }
//   }

//   /// تحديث اسم المستخدم في collection المستخدمين
//   Future<void> updateUserName(String name) async {
//     try {
//       final user = FirebaseAuth.instance.currentUser;
//       if (user == null) {
//         throw Exception('لا يوجد مستخدم مسجل حاليًا');
//       }

//       final docRef = _firestore.collection('users').doc(user.uid);
//       final docSnapshot = await docRef.get();

//       if (docSnapshot.exists) {
//         await docRef.update({
//           'name': name,
//         });
//       } else {
//         await docRef.set({
//           'uid': user.uid,
//           'email': user.email ?? '',
//           'name': name,
//           'image': user.photoURL ?? '',
//         });
//       }
//       print('تم تحديث اسم المستخدم إلى: $name');
//     } catch (e) {
//       print('خطأ في تحديث اسم المستخدم: $e');
//       rethrow;
//     }
//   }

//   /// إضافة رسالة جديدة إلى الشات
//   // Future<void> updateMessages(
//   //     String chatId, Map<String, dynamic> message, String recipientId) async {
//   //   try {
//   //     final currentUser = FirebaseAuth.instance.currentUser;
//   //     if (currentUser == null) {
//   //       throw Exception('لا يوجد مستخدم مسجل دخول');
//   //     }

//   //     await _firestore.collection('chats').doc(chatId).update({
//   //       'messages': FieldValue.arrayUnion([
//   //         {
//   //           ...message,
//   //           'senderId': currentUser.uid,
//   //           'originalTime': DateTime.now().toIso8601String(),
//   //         }
//   //       ]),
//   //       'lastMessage': message['isImage'] == true ? 'Photo' : message['text'],
//   //       'timestamp': FieldValue.serverTimestamp(),
//   //       'unreadCounts': {
//   //         currentUser.uid: 0, // المرسل مش هيبقى عنده رسايل غير مقروءة
//   //         recipientId:
//   //             FieldValue.increment(1), // زيادة عدد الرسايل الغير مقروءة للمستلم
//   //       },
//   //     });
//   //     print('تم إرسال الرسالة بنجاح إلى المحادثة: $chatId');
//   //   } catch (e) {
//   //     print('خطأ في تحديث الرسائل: $e');
//   //     rethrow;
//   //   }
//   //}
//   Future<void> updateMessages(
//       String chatId, Map<String, dynamic> message, String recipientId) async {
//     try {
//       final currentUser = FirebaseAuth.instance.currentUser;
//       if (currentUser == null) {
//         throw Exception('لا يوجد مستخدم مسجل دخول');
//       }

//       await FirebaseFirestore.instance.collection('chats').doc(chatId).update({
//         'messages': FieldValue.arrayUnion([message]),
//         'lastMessage': message['isImage'] ? 'Photo' : message['text'],
//         'timestamp': FieldValue.serverTimestamp(),
//         'unreadCounts.$recipientId': FieldValue.increment(1),
//       });
//     } catch (e) {
//       throw Exception('خطأ في إرسال الرسالة: $e');
//     }
//   }

//   /// حذف رسالة من الشات
//   // Future<void> deleteMessage(String chatId, String messageId) async {
//   //   try {
//   //     final docRef = _firestore.collection('chats').doc(chatId);
//   //     final docSnapshot = await docRef.get();

//   //     if (!docSnapshot.exists) {
//   //       throw Exception('وثيقة المحادثة غير موجودة');
//   //     }

//   //     final data = docSnapshot.data() as Map<String, dynamic>;
//   //     List<dynamic> messages = List.from(data['messages'] ?? []);

//   //     final updatedMessages =
//   //         messages.where((msg) => msg['messageId'] != messageId).toList();

//   //     final lastMessage = updatedMessages.isNotEmpty
//   //         ? (updatedMessages.last['isImage'] == true
//   //             ? 'Photo'
//   //             : updatedMessages.last['text'] as String)
//   //         : '';

//   //     await docRef.update({
//   //       'messages': updatedMessages,
//   //       'lastMessage': lastMessage,
//   //       'timestamp': FieldValue.serverTimestamp(),
//   //     });

//   //     print('تم حذف الرسالة بمعرف $messageId بنجاح');
//   //   } catch (e) {
//   //     print('خطأ في حذف الرسالة: $e');
//   //     rethrow;
//   //   }
//   // }

//   Future<void> deleteMessage(String chatId, String messageId) async {
//     try {
//       final chatDoc = await FirebaseFirestore.instance
//           .collection('chats')
//           .doc(chatId)
//           .get();
//       final messages = List<Map<String, dynamic>>.from(chatDoc['messages']);
//       messages.removeWhere((msg) => msg['messageId'] == messageId);

//       String lastMessage = '';
//       Timestamp? lastTimestamp;
//       if (messages.isNotEmpty) {
//         final lastMsg = messages.last;
//         lastMessage = lastMsg['isImage'] == true ? 'Photo' : lastMsg['text'];
//         lastTimestamp = lastMsg['time'] != null
//             ? Timestamp.fromDate(DateTime.parse(lastMsg['time']))
//             : Timestamp.now();
//       }

//       await FirebaseFirestore.instance.collection('chats').doc(chatId).update({
//         'messages': messages,
//         'lastMessage': lastMessage,
//         'timestamp': lastTimestamp ?? FieldValue.serverTimestamp(),
//       });
//     } catch (e) {
//       throw Exception('خطأ في حذف الرسالة: $e');
//     }
//   }

//   /// التحقق من وجود شات بين المستخدم الحالي ومستخدم آخر
//   // Future<bool> checkIfChatExists(
//   //     String currentUserId, String otherUserId) async {
//   //   try {
//   //     print('التحقق من وجود محادثة بين $currentUserId و $otherUserId');
//   //     final chatSnapshot = await _firestore
//   //         .collection('chats')
//   //         .where('participants', arrayContains: currentUserId)
//   //         .where('participants', arrayContains: otherUserId)
//   //         .limit(1)
//   //         .get();

//   //     if (chatSnapshot.docs.isNotEmpty) {
//   //       print('تم العثور على محادثة بين $currentUserId و $otherUserId');
//   //       return true;
//   //     }

//   //     print('لم يتم العثور على محادثة بين $currentUserId و $otherUserId');
//   //     return false;
//   //   } catch (e) {
//   //     print('خطأ أثناء التحقق من وجود المحادثة: $e');
//   //     return false;
//   //   }
//   // }

//   Future<bool> checkIfChatExists(
//       String currentUserId, String otherUserId) async {
//     try {
//       // استخدام arrayContains مرة واحدة بس للمستخدم الحالي
//       final querySnapshot = await FirebaseFirestore.instance
//           .collection('chats')
//           .where('participants', arrayContains: currentUserId)
//           .get();

//       // فحص النتايج يدويًا للتأكد إن المستخدم الآخر موجود
//       for (var doc in querySnapshot.docs) {
//         final participants = List<String>.from(doc['participants']);
//         if (participants.contains(otherUserId)) {
//           return true; // الشات موجود
//         }
//       }
//       return false; // الشات مش موجود
//     } catch (e) {
//       throw Exception('خطأ أثناء التحقق من وجود المحادثة: $e');
//     }
//   }

//   /// إضافة شات جديد مع مستخدم بناءً على الإيميل
//   // Future<void> addChatWithUser(String email, String name, String avatar) async {
//   //   try {
//   //     final currentUser = FirebaseAuth.instance.currentUser;
//   //     if (currentUser == null) {
//   //       throw Exception('لا يوجد مستخدم مسجل دخول');
//   //     }

//   //     // جلب بيانات المستخدم بناءً على الإيميل
//   //     final userData = await getUserByEmail(email);
//   //     if (userData == null) {
//   //       throw Exception('لم يتم العثور على مستخدم بهذا الإيميل');
//   //     }

//   //     final otherUserId = userData['uid'] as String;

//   //     // التحقق من وجود شات بين المستخدمين
//   //     final chatExists = await checkIfChatExists(currentUser.uid, otherUserId);
//   //     if (chatExists) {
//   //       print('المحادثة موجودة بالفعل، لن يتم إنشاؤها.');
//   //       throw Exception('توجد محادثة مع هذا المستخدم بالفعل.');
//   //     }

//   //     // إنشاء شات جديد
//   //     await createChat(
//   //       otherUserId,
//   //       name.isNotEmpty ? name : userData['name'] ?? '',
//   //       email,
//   //       avatar.isNotEmpty ? avatar : userData['image'] ?? '',
//   //     );

//   //     print('تم إضافة المحادثة بنجاح للإيميل $email');
//   //   } catch (e) {
//   //     print('خطأ أثناء إضافة المحادثة: $e');
//   //     rethrow;
//   //   }
//   // }

//   // Future<void> addChatWithUser(String email, String name, String image) async {
//   //   try {
//   //     final currentUser = FirebaseAuth.instance.currentUser;
//   //     if (currentUser == null) {
//   //       throw Exception('لا يوجد مستخدم مسجل دخول');
//   //     }

//   //     // جلب بيانات المستخدم الآخر بناءً على الإيميل
//   //     final userQuery = await FirebaseFirestore.instance
//   //         .collection('users')
//   //         .where('email', isEqualTo: email)
//   //         .get();

//   //     if (userQuery.docs.isEmpty) {
//   //       throw Exception('المستخدم غير موجود');
//   //     }

//   //     final otherUserId = userQuery.docs.first.id;
//   //     final chatExists = await checkIfChatExists(currentUser.uid, otherUserId);
//   //     if (chatExists) {
//   //       throw Exception('توجد محادثة مع هذا البريد الإلكتروني بالفعل');
//   //     }

//   //     // إنشاء شات جديد
//   //     final chatRef = FirebaseFirestore.instance.collection('chats').doc();
//   //     final chatData = {
//   //       'participants': [currentUser.uid, otherUserId],
//   //       'unreadCounts': {
//   //         currentUser.uid: 0,
//   //         otherUserId: 0,
//   //       },
//   //       'lastMessage': '',
//   //       'timestamp': FieldValue.serverTimestamp(),
//   //       'name': name.isEmpty ? userQuery.docs.first['name'] ?? email : name,
//   //       'avatar': image.isEmpty ? userQuery.docs.first['image'] ?? '' : image,
//   //       'messages': [],
//   //     };

//   //     await chatRef.set(chatData);
//   //   } catch (e) {
//   //     throw Exception('خطأ أثناء إضافة المحادثة: $e');
//   //   }
//   // }

//   Future<void> addChatWithUser(String email, String name, String image) async {
//     try {
//       final currentUser = FirebaseAuth.instance.currentUser;
//       if (currentUser == null) {
//         throw Exception('لا يوجد مستخدم مسجل دخول');
//       }

//       // جلب بيانات المستخدم الحالي
//       final currentUserDoc = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(currentUser.uid)
//           .get();
//       final currentUserName = currentUserDoc['name'] ?? currentUser.email;
//       final currentUserImage = currentUserDoc['image'] ?? '';

//       // جلب بيانات المستخدم الآخر بناءً على الإيميل
//       final userQuery = await FirebaseFirestore.instance
//           .collection('users')
//           .where('email', isEqualTo: email)
//           .get();

//       if (userQuery.docs.isEmpty) {
//         throw Exception('المستخدم غير موجود');
//       }

//       final otherUserId = userQuery.docs.first.id;
//       final otherUserName = userQuery.docs.first['name'] ?? email;
//       final otherUserImage = userQuery.docs.first['image'] ?? '';

//       final chatExists = await checkIfChatExists(currentUser.uid, otherUserId);
//       if (chatExists) {
//         throw Exception('توجد محادثة مع هذا البريد الإلكتروني بالفعل');
//       }

//       // إنشاء شات جديد
//       final chatRef = FirebaseFirestore.instance.collection('chats').doc();
//       final chatData = {
//         'participants': [currentUser.uid, otherUserId],
//         'unreadCounts': {
//           currentUser.uid: 0,
//           otherUserId: 0,
//         },
//         'lastMessage': '',
//         'timestamp': FieldValue.serverTimestamp(),
//         // تخزين الأسماء والصور لكل مستخدم في خريطة
//         'names': {
//           currentUser.uid: name.isEmpty ? currentUserName : name,
//           otherUserId: otherUserName,
//         },
//         'avatars': {
//           currentUser.uid: image.isEmpty ? currentUserImage : image,
//           otherUserId: otherUserImage,
//         },
//         'messages': [],
//       };

//       await chatRef.set(chatData);
//     } catch (e) {
//       throw Exception('خطأ أثناء إضافة المحادثة: $e');
//     }
//   }

//   /// جلب بيانات المستخدم بناءً على الإيميل
//   // Future<Map<String, dynamic>?> getUserByEmail(String email) async {
//   //   try {
//   //     print('جلب بيانات المستخدم بالإيميل: $email');
//   //     final querySnapshot = await _firestore
//   //         .collection('users')
//   //         .where('email', isEqualTo: email)
//   //         .limit(1)
//   //         .get();

//   //     if (querySnapshot.docs.isNotEmpty) {
//   //       final userData = querySnapshot.docs.first.data();
//   //       print('تم العثور على المستخدم: $userData');
//   //       return userData;
//   //     } else {
//   //       print('لم يتم العثور على مستخدم بالإيميل: $email');
//   //       return null;
//   //     }
//   //   } catch (e) {
//   //     print('خطأ أثناء جلب بيانات المستخدم بالإيميل: $e');
//   //     return null;
//   //   }
//   // }

//   Future<Map<String, dynamic>?> getUserByEmail(String email) async {
//     try {
//       final querySnapshot = await FirebaseFirestore.instance
//           .collection('users')
//           .where('email', isEqualTo: email)
//           .get();
//       if (querySnapshot.docs.isNotEmpty) {
//         return {
//           'uid': querySnapshot.docs.first.id,
//           'image': querySnapshot.docs.first['image'] ?? '',
//           'name': querySnapshot.docs.first['name'] ?? '',
//         };
//       }
//       return null;
//     } catch (e) {
//       throw Exception('خطأ في جلب المستخدم بالبريد: $e');
//     }
//   }
// }
// import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// class ChatViewModel extends ChangeNotifier {
//   final ChatRepository _chatRepository;
//   List<ChatModel> _chats = [];
//   List<Map<String, dynamic>> _localMessages = [];
//   String? _errorMessage;
//   String? _avatarUrl;
//   bool _isLoading = false;
//   final TextEditingController messageController = TextEditingController();
//   final ScrollController scrollController = ScrollController();
//   late Stream<List<ChatModel>> _chatStream;

//   ChatViewModel(this._chatRepository) {
//     _chatStream = _chatRepository.getChatsStream();
//     listenToChats();
//   }

//   List<ChatModel> get chats => _chats;
//   List<Map<String, dynamic>> get localMessages => _localMessages;
//   String? get errorMessage => _errorMessage;
//   String? get avatarUrl => _avatarUrl;
//   bool get isLoading => _isLoading;

//   // void _listenToChats() {
//   //   _chatStream.listen((chatList) {
//   //     _chats = chatList;
//   //     notifyListeners();
//   //   }, onError: (error) {
//   //     _errorMessage = 'Error fetching chats: $error';
//   //     notifyListeners();
//   //   });
//   // }

//   void listenToChats() {
//     _chatStream.listen((chatList) {
//       _chats = chatList;
//       _isLoading = false;
//       notifyListeners();
//     }, onError: (error) {
//       _errorMessage = 'Error fetching chats: $error';
//       _isLoading = false;
//       notifyListeners();
//     });
//   }

//   Future<void> fetchUserByEmail(String email) async {
//     try {
//       _isLoading = true;
//       notifyListeners();
//       final userData = await _chatRepository.getUserByEmail(email);
//       if (userData != null) {
//         _avatarUrl = userData['image'] as String?;
//         notifyListeners();
//       }
//     } catch (e) {
//       _errorMessage = e.toString();
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }

//   void resetAvatarUrl() {
//     _avatarUrl = null;
//     notifyListeners();
//   }

//   // void _listenToChats() {
//   //   _chatStream.listen((chatList) {
//   //     _chats = chatList;
//   //     _isLoading = false;
//   //     notifyListeners();
//   //   }, onError: (error) {
//   //     _errorMessage = 'Error fetching chats: $error';
//   //     _isLoading = false;
//   //     notifyListeners();
//   //   });
//   // }

//   Future<bool> checkIfChatExists(String email) async {
//     try {
//       final currentUser = FirebaseAuth.instance.currentUser;
//       if (currentUser == null) {
//         throw Exception('No user signed in');
//       }
//       final userData = await _chatRepository.getUserByEmail(email);
//       if (userData == null) {
//         throw Exception('User not found');
//       }
//       final otherUserId = userData['uid'] as String;
//       return await _chatRepository.checkIfChatExists(
//           currentUser.uid, otherUserId);
//     } catch (e) {
//       _errorMessage = e.toString();
//       notifyListeners();
//       return false;
//     }
//   }

//   Future<void> addChatWithUser(String email, String name, String image) async {
//     try {
//       _isLoading = true;
//       notifyListeners();
//       await _chatRepository.addChatWithUser(email, name, image);
//       _errorMessage = null;
//     } catch (e) {
//       _errorMessage = e.toString();
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }

//   Future<void> deleteChat(String chatId) async {
//     try {
//       await _chatRepository.deleteChat(chatId);
//       _chats.removeWhere((chat) => chat.id == chatId);
//       notifyListeners();
//     } catch (e) {
//       _errorMessage = 'Failed to delete chat: $e';
//       notifyListeners();
//     }
//   }

//   Future<void> updateChatName(String chatId, String newName) async {
//     try {
//       await _chatRepository.updateChatName(chatId, newName);
//       final chatIndex = _chats.indexWhere((chat) => chat.id == chatId);
//       if (chatIndex != -1) {
//         _chats[chatIndex] = ChatModel(
//           id: _chats[chatIndex].id,
//           participants: _chats[chatIndex].participants,
//           lastMessage: _chats[chatIndex].lastMessage,
//           name: newName,
//           email: _chats[chatIndex].email,
//           time: _chats[chatIndex].time,
//           timestamp: _chats[chatIndex].timestamp,
//           unreadCount: _chats[chatIndex].unreadCount,
//           avatar: _chats[chatIndex].avatar,
//           hasCheckmark: _chats[chatIndex].hasCheckmark,
//           messages: _chats[chatIndex].messages,
//         );
//         notifyListeners();
//       }
//     } catch (e) {
//       _errorMessage = 'Failed to update chat name: $e';
//       notifyListeners();
//     }
//   }

//   void initChatMessages(ChatModel chat) {
//     _localMessages = chat.messages.map((msg) {
//       final currentUser = FirebaseAuth.instance.currentUser;
//       return {
//         ...msg,
//         'isMe': msg['senderId'] == currentUser?.uid,
//       };
//     }).toList();
//     notifyListeners();
//     _scrollToBottom();
//   }

//   Future<void> sendMessage(String chatId, String message, bool isText) async {
//     try {
//       final currentUser = FirebaseAuth.instance.currentUser;
//       if (currentUser == null) {
//         throw Exception('No user signed in');
//       }

//       final chatIndex = _chats.indexWhere((chat) => chat.id == chatId);
//       if (chatIndex == -1) return;

//       final recipientId = _chats[chatIndex]
//           .participants
//           .firstWhere((id) => id != currentUser.uid);

//       final messageData = {
//         'messageId': DateTime.now().millisecondsSinceEpoch.toString(),
//         'senderId': currentUser.uid,
//         'text': message,
//         'isImage': !isText,
//         'time': DateTime.now().toIso8601String(),
//       };

//       await _chatRepository.updateMessages(chatId, messageData, recipientId);

//       _localMessages.add({
//         ...messageData,
//         'isMe': true,
//       });

//       messageController.clear();
//       notifyListeners();
//       _scrollToBottom();
//     } catch (e) {
//       _errorMessage = 'Failed to send message: $e';
//       notifyListeners();
//     }
//   }

//   Future<void> sendImage(
//       String chatId, File image, Function(bool) onUploadingImage) async {
//     try {
//       final currentUser = FirebaseAuth.instance.currentUser;
//       if (currentUser == null) {
//         throw Exception('No user signed in');
//       }

//       final chatIndex = _chats.indexWhere((chat) => chat.id == chatId);
//       if (chatIndex == -1) return;

//       final recipientId = _chats[chatIndex]
//           .participants
//           .firstWhere((id) => id != currentUser.uid);

//       onUploadingImage(true);
//       final storageRef = FirebaseStorage.instance
//           .ref()
//           .child('chat_images/${DateTime.now().millisecondsSinceEpoch}.jpg');
//       await storageRef.putFile(image);
//       final imageUrl = await storageRef.getDownloadURL();

//       final messageData = {
//         'messageId': DateTime.now().millisecondsSinceEpoch.toString(),
//         'senderId': currentUser.uid,
//         'text': imageUrl,
//         'isImage': true,
//         'time': DateTime.now().toIso8601String(),
//       };

//       await _chatRepository.updateMessages(chatId, messageData, recipientId);

//       _localMessages.add({
//         ...messageData,
//         'isMe': true,
//       });

//       notifyListeners();
//       _scrollToBottom();
//     } catch (e) {
//       _errorMessage = 'Failed to send image: $e';
//       notifyListeners();
//     } finally {
//       onUploadingImage(false);
//     }
//   }

//   Future<void> deleteMessage(String chatId, String messageId) async {
//     try {
//       await _chatRepository.deleteMessage(chatId, messageId);
//       _localMessages.removeWhere((msg) => msg['messageId'] == messageId);
//       notifyListeners();
//     } catch (e) {
//       _errorMessage = 'Failed to delete message: $e';
//       notifyListeners();
//     }
//   }

//   Future<void> resetUnreadCount(String chatId) async {
//     try {
//       final currentUser = FirebaseAuth.instance.currentUser;
//       if (currentUser == null) {
//         throw Exception('لا يوجد مستخدم مسجل دخول');
//       }

//       await FirebaseFirestore.instance.collection('chats').doc(chatId).update({
//         'unreadCounts.${currentUser.uid}': 0,
//       });

//       final chatIndex = _chats.indexWhere((chat) => chat.id == chatId);
//       if (chatIndex != -1) {
//         _chats[chatIndex] = ChatModel(
//           id: _chats[chatIndex].id,
//           participants: _chats[chatIndex].participants,
//           lastMessage: _chats[chatIndex].lastMessage,
//           name: _chats[chatIndex].name,
//           email: _chats[chatIndex].email,
//           time: _chats[chatIndex].time,
//           timestamp: _chats[chatIndex].timestamp,
//           unreadCount: 0,
//           avatar: _chats[chatIndex].avatar,
//           hasCheckmark: _chats[chatIndex].hasCheckmark,
//           messages: _chats[chatIndex].messages,
//         );
//         notifyListeners();
//       }
//     } catch (e) {
//       _errorMessage = 'فشل إعادة ضبط عدد الرسائل الغير مقروءة: $e';
//       notifyListeners();
//     }
//   }

//   void _scrollToBottom() {
//     if (scrollController.hasClients) {
//       scrollController.animateTo(
//         scrollController.position.maxScrollExtent,
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeOut,
//       );
//     }
//   }

//   void filterChats(String query) {
//     if (query.isEmpty) {
//       listenToChats();
//       return;
//     }
//     final filteredChats = _chats.where((chat) {
//       return chat.name.toLowerCase().contains(query.toLowerCase()) ||
//           chat.lastMessage.toLowerCase().contains(query.toLowerCase());
//     }).toList();
//     _chats = filteredChats;
//     notifyListeners();
//   }

//   @override
//   void dispose() {
//     messageController.dispose();
//     scrollController.dispose();
//     super.dispose();
//   }
// }
// import 'package:attendance_app/core/utils/app_colors.dart';
// import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';

// class ChatItem extends StatelessWidget {
//   final ChatModel chat;
//   final VoidCallback onTap;

//   const ChatItem({
//     super.key,
//     required this.chat,
//     required this.onTap,
//   });

//   // تنسيق الوقت بشكل مشابه للواتساب (مثلاً: 10:30 AM)
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
//       contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       leading: CircleAvatar(
//         radius: 25,
//         backgroundColor: AppColors.primaryColor,
//         child: chat.avatar.isNotEmpty && chat.avatar.startsWith('http')
//             ? ClipOval(
//                 child: CachedNetworkImage(
//                   imageUrl: chat.avatar,
//                   width: 50,
//                   height: 50,
//                   fit: BoxFit.cover,
//                   placeholder: (context, url) =>
//                       const CircularProgressIndicator(
//                     color: Colors.white,
//                   ),
//                   errorWidget: (context, url, error) {
//                     print('Error loading avatar in ChatItem: $error');
//                     return const Icon(
//                       Icons.person,
//                       color: Colors.white,
//                       size: 30,
//                     );
//                   },
//                 ),
//               )
//             : const Icon(
//                 Icons.person,
//                 color: Colors.white,
//                 size: 30,
//               ),
//       ),
//       title: Text(
//         chat.name,
//         overflow: TextOverflow.ellipsis,
//         maxLines: 1,
//         style: const TextStyle(
//           fontWeight: FontWeight.bold,
//           fontSize: 16,
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
//               style: TextStyle(color: Colors.grey, fontSize: 14),
//             ),
//           ] else ...[
//             Expanded(
//               child: Text(
//                 chat.lastMessage,
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 1,
//                 style: const TextStyle(color: Colors.grey, fontSize: 14),
//               ),
//             ),
//           ],
//         ],
//       ),
//       trailing: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           Text(
//             _formatTo12Hour(chat.timestamp),
//             style: const TextStyle(color: Colors.grey, fontSize: 12),
//           ),
//           if (chat.unreadCount > 0) const SizedBox(height: 4),
//           if (chat.unreadCount > 0)
//             Container(
//               padding: const EdgeInsets.all(6),
//               decoration: const BoxDecoration(
//                 color: AppColors.primaryColor, // غيرنا اللون ليتناسب مع التصميم
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
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
// import 'package:provider/provider.dart';
// import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';

// class ChatTextField extends StatefulWidget {
//   const ChatTextField({
//     super.key,
//     required this.messageController,
//     required this.chatId,
//     required this.onUploadingImage,
//   });

//   final TextEditingController messageController;
//   final String chatId;
//   final Function(bool) onUploadingImage;

//   @override
//   _ChatTextFieldState createState() => _ChatTextFieldState();
// }

// class _ChatTextFieldState extends State<ChatTextField> {
//   bool _isArabic(String text) {
//     if (text.isEmpty) return false;
//     return RegExp(r'[\u0600-\u06FF]').hasMatch(text);
//   }

//   // دالة لاختيار الصورة (من المعرض أو الكاميرا)
//   Future<void> _pickImage(ImageSource source) async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: source);
//     if (pickedFile != null && mounted) {
//       File imageFile = File(pickedFile.path);
//       try {
//         // تغيير حالة التحميل لـ true
//         widget.onUploadingImage(true);

//         // استخدام دالة sendImage من ChatViewModel
//         final viewModel = Provider.of<ChatViewModel>(context, listen: false);
//         await viewModel.sendImage(
//             widget.chatId, imageFile, widget.onUploadingImage);
//       } catch (e) {
//         if (mounted) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Failed to upload image: $e')),
//           );
//         }
//       }
//     }
//   }

//   void _showAttachmentSheet() {
//     if (!mounted) return;
//     showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (context) => Container(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Text(
//               'Choose an option',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             ListTile(
//               leading: const Icon(Icons.photo, color: AppColors.primaryColor),
//               title: const Text('Gallery'),
//               onTap: () {
//                 Navigator.pop(context);
//                 _pickImage(ImageSource.gallery);
//               },
//             ),
//             ListTile(
//               leading:
//                   const Icon(Icons.description, color: AppColors.primaryColor),
//               title: const Text('Document'),
//               onTap: () {
//                 Navigator.pop(context);
//                 if (mounted) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                         content: Text('Document selection coming soon!')),
//                   );
//                 }
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.insert_drive_file,
//                   color: AppColors.primaryColor),
//               title: const Text('File'),
//               onTap: () {
//                 Navigator.pop(context);
//                 if (mounted) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                         content: Text('File selection coming soon!')),
//                   );
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: widget.messageController,
//       builder: (context, TextEditingValue value, child) {
//         final isArabicText = _isArabic(value.text);
//         final textDirection =
//             isArabicText ? TextDirection.rtl : TextDirection.ltr;

//         return Container(
//           decoration: BoxDecoration(
//             color: Colors.grey[200],
//             borderRadius: BorderRadius.circular(30),
//           ),
//           child: TextField(
//             cursorColor: AppColors.primaryColor,
//             controller: widget.messageController,
//             style: const TextStyle(color: Colors.black),
//             textDirection: textDirection,
//             textAlign: isArabicText ? TextAlign.right : TextAlign.left,
//             decoration: InputDecoration(
//               hintText: 'Type a message',
//               hintStyle: const TextStyle(color: Colors.grey),
//               filled: true,
//               fillColor: Colors.grey[200],
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30),
//                 borderSide: BorderSide.none,
//               ),
//               suffixIcon: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   IconButton(
//                     icon: const Icon(
//                       Icons.attach_file,
//                       color: Colors.grey,
//                     ),
//                     onPressed: _showAttachmentSheet,
//                   ),
//                   IconButton(
//                     icon: const Icon(
//                       Icons.camera_alt,
//                       color: Colors.grey,
//                     ),
//                     onPressed: () {
//                       _pickImage(ImageSource.camera);
//                     },
//                   ),
//                 ],
//               ),
//               contentPadding:
//                   const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
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

//   // تنسيق الوقت بشكل مشابه للواتساب (مثلاً: 10:30 AM)
//   String _formatTime(String timeString) {
//     try {
//       final dateTime = DateTime.parse(timeString);
//       return '${dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12}:${dateTime.minute.toString().padLeft(2, '0')} ${dateTime.hour >= 12 ? 'PM' : 'AM'}';
//     } catch (e) {
//       return timeString; // في حالة فشل التنسيق، يُرجع الوقت الأصلي
//     }
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
//           // حذف الرسالة باستخدام messageId
//           await viewModel.deleteMessage(
//               widget.chatId, widget.message['messageId']);
//           if (mounted) {
//             setState(() {
//               _isHighlighted = false;
//             });
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('Message deleted')),
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
//                     : Colors.grey[200],
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
//                       _formatTime(widget.message['time']),
//                       style: const TextStyle(
//                         fontSize: 12,
//                         color: Colors.black54,
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
// import 'package:attendance_app/core/utils/app_colors.dart';
// import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// import 'package:attendance_app/features/chats/presentation/views/update_chat_view.dart';
// import 'package:attendance_app/features/chats/presentation/views/widgets/chat_text_field.dart';
// import 'package:attendance_app/features/chats/presentation/views/widgets/chats_bubble.dart';
// import 'package:attendance_app/features/chats/presentation/views/widgets/show_image.dart';
// import 'package:awesome_dialog/awesome_dialog.dart';
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
//       Provider.of<ChatViewModel>(context, listen: false)
//           .initChatMessages(widget.chat);
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

//   void _setUploadingImage(bool value) {
//     if (mounted) {
//       setState(() {
//         _isUploadingImage = value;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ChatViewModel>(
//       builder: (context, viewModel, child) {
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
//                   if (widget.chat.avatar.isNotEmpty &&
//                       widget.chat.avatar.startsWith('http')) {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ShowImage(
//                           imageUrl: widget.chat.avatar,
//                         ),
//                       ),
//                     );
//                   }
//                 },
//                 child: CircleAvatar(
//                   radius: 20,
//                   backgroundColor: AppColors.primaryColor,
//                   child: widget.chat.avatar.isNotEmpty &&
//                           widget.chat.avatar.startsWith('http')
//                       ? ClipOval(
//                           child: Image.network(
//                             widget.chat.avatar,
//                             width: 40,
//                             height: 40,
//                             fit: BoxFit.cover,
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
//                   widget.chat.name, // الاسم بتاع الطرف الآخر
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
//                         if (index == 0) {
//                           if (viewModel.localMessages.isNotEmpty) {
//                             final latestTime = DateTime.now();
//                             return Center(
//                               child: Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 10),
//                                 child: Container(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 12, vertical: 6),
//                                   decoration: BoxDecoration(
//                                     color: Colors.green.withOpacity(0.2),
//                                     borderRadius: BorderRadius.circular(16),
//                                   ),
//                                   child: Text(
//                                     '${latestTime.day}/${latestTime.month}/${latestTime.year}',
//                                     style: const TextStyle(
//                                       fontSize: 14,
//                                       color: Colors.black54,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           }
//                           return const SizedBox.shrink();
//                         }
//                         final messageIndex = index - 1;
//                         final message = viewModel.localMessages[messageIndex];
//                         final isMe = message['isMe'] as bool;
//                         return ChatsBubble(
//                           isMe: isMe,
//                           message: message,
//                           chatId: widget.chat.id,
//                         );
//                       },
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 40,
//                           height: 40,
//                           decoration: const BoxDecoration(
//                             color: AppColors.primaryColor,
//                             shape: BoxShape.circle,
//                           ),
//                           child: IconButton(
//                             icon: const Icon(
//                               Icons.mic,
//                               color: Colors.white,
//                               size: 24,
//                             ),
//                             onPressed: () {},
//                           ),
//                         ),
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
// import 'package:attendance_app/core/utils/app_colors.dart';
// import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
// import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// import 'package:attendance_app/features/chats/presentation/views/chat_view.dart';
// import 'package:attendance_app/features/chats/presentation/views/new_chat_view.dart';
// import 'package:attendance_app/features/chats/presentation/views/user_profile_view.dart';
// import 'package:attendance_app/features/chats/presentation/views/widgets/long_press_chat_item.dart';
// import 'package:attendance_app/features/chats/presentation/views/widgets/search_chats_text_field.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class HomeChatsView extends StatelessWidget {
//   const HomeChatsView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => ChatViewModel(ChatRepository()),
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: AppColors.primaryColor,
//           title: const Text(
//             'Chats',
//             style: TextStyle(
//               fontSize: 25,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           elevation: 0,
//           actions: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: CircleAvatar(
//                 backgroundColor: Colors.white,
//                 child: IconButton(
//                   icon: const Icon(
//                     Icons.person,
//                     color: AppColors.primaryColor,
//                   ),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const UserProfileView(),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//         body: SafeArea(
//           child: Consumer<ChatViewModel>(
//             builder: (context, viewModel, child) {
//               if (viewModel.isLoading) {
//                 return const Center(
//                   child: CircularProgressIndicator(
//                     color: AppColors.primaryColor,
//                   ),
//                 );
//               }
//               if (viewModel.errorMessage != null) {
//                 return Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         viewModel.errorMessage!,
//                         style: const TextStyle(color: Colors.red, fontSize: 16),
//                       ),
//                       const SizedBox(height: 16),
//                       ElevatedButton(
//                         onPressed: () {
//                           viewModel.listenToChats(); // إعادة تحميل الشاتات
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: AppColors.primaryColor,
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 24, vertical: 12),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                         ),
//                         child: const Text(
//                           'Retry',
//                           style: TextStyle(color: Colors.white, fontSize: 16),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               }
//               if (viewModel.chats.isEmpty) {
//                 return const Center(
//                   child: Text(
//                     'No chats available. Start a new chat!',
//                     style: TextStyle(fontSize: 16, color: Colors.grey),
//                   ),
//                 );
//               }
//               return Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 16.0, vertical: 8.0),
//                     child: SearchChatsTextField(
//                       hintText: 'Search or start a new chat',
//                       onChanged: (query) {
//                         viewModel.filterChats(query);
//                       },
//                     ),
//                   ),
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: viewModel.chats.length,
//                       itemBuilder: (context, index) {
//                         final chat = viewModel.chats[index];
//                         return LongPressChatItem(
//                           chat: chat,
//                           onTap: () async {
//                             await viewModel.resetUnreadCount(chat.id);
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => ChatView(chat: chat),
//                               ),
//                             );
//                           },
//                           onDelete: () async {
//                             await viewModel.deleteChat(chat.id);
//                             if (viewModel.errorMessage != null) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(
//                                     content: Text(viewModel.errorMessage!)),
//                               );
//                             }
//                           },
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           heroTag: "_home_chats_screen",
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const NewChatView(),
//               ),
//             );
//           },
//           backgroundColor: AppColors.primaryColor,
//           child: const Icon(
//             Icons.add_comment_rounded,
//             color: Colors.white,
//             size: 23,
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'dart:io';
// import 'package:attendance_app/core/utils/app_colors.dart';
// import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart'; // Import for SchedulerBinding
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// class NewChatView extends StatefulWidget {
//   const NewChatView({super.key});

//   @override
//   _NewChatViewState createState() => _NewChatViewState();
// }

// class _NewChatViewState extends State<NewChatView> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   File? _selectedImage;

//   Future<String> _uploadImageToStorage(File? image) async {
//     if (image == null) return '';
//     final storageRef = FirebaseStorage.instance
//         .ref()
//         .child('chat_avatars/${DateTime.now().millisecondsSinceEpoch}.jpg');
//     await storageRef.putFile(image);
//     return await storageRef.getDownloadURL();
//   }

//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _selectedImage = File(pickedFile.path);
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     // Call resetAvatarUrl after the build phase
//     SchedulerBinding.instance.addPostFrameCallback((_) {
//       Provider.of<ChatViewModel>(context, listen: false).resetAvatarUrl();
//     });
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final viewModel = Provider.of<ChatViewModel>(context);

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.primaryColor,
//         title: const Text(
//           'New Chat',
//           style: TextStyle(
//             fontSize: 25,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               GestureDetector(
//                 onTap: _pickImage,
//                 child: CircleAvatar(
//                   radius: 50,
//                   backgroundColor: AppColors.primaryColor,
//                   child: _selectedImage != null
//                       ? ClipOval(
//                           child: Image.file(
//                             _selectedImage!,
//                             width: 100,
//                             height: 100,
//                             fit: BoxFit.cover,
//                           ),
//                         )
//                       : viewModel.avatarUrl != null &&
//                               viewModel.avatarUrl!.isNotEmpty
//                           ? ClipOval(
//                               child: Image.network(
//                                 viewModel.avatarUrl!,
//                                 width: 100,
//                                 height: 100,
//                                 fit: BoxFit.cover,
//                                 errorBuilder: (context, error, stackTrace) {
//                                   return const Icon(Icons.person,
//                                       size: 50, color: Colors.white);
//                                 },
//                               ),
//                             )
//                           : const Icon(Icons.person,
//                               size: 50, color: Colors.white),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextFormField(
//                 cursorColor: AppColors.primaryColor,
//                 controller: _nameController,
//                 decoration: const InputDecoration(
//                   labelText: 'Name (Optional)',
//                   labelStyle: TextStyle(color: AppColors.primaryColor),
//                   border: OutlineInputBorder(),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide:
//                         BorderSide(color: AppColors.primaryColor, width: 2),
//                   ),
//                   prefixIcon: Icon(Icons.person, color: AppColors.primaryColor),
//                 ),
//                 validator: (value) {
//                   if (value != null && value.trim().isNotEmpty) {
//                     if (value.trim().length < 2) {
//                       return 'Name must be at least 2 characters';
//                     }
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               TextFormField(
//                 cursorColor: AppColors.primaryColor,
//                 controller: _emailController,
//                 decoration: const InputDecoration(
//                   labelText: 'Email',
//                   labelStyle: TextStyle(color: AppColors.primaryColor),
//                   border: OutlineInputBorder(),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide:
//                         BorderSide(color: AppColors.primaryColor, width: 2),
//                   ),
//                   prefixIcon: Icon(Icons.email, color: AppColors.primaryColor),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.trim().isEmpty) {
//                     return 'Please enter the email';
//                   }
//                   if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
//                       .hasMatch(value)) {
//                     return 'Please enter a valid email';
//                   }
//                   return null;
//                 },
//                 onChanged: (value) {
//                   viewModel.fetchUserByEmail(value.trim());
//                 },
//               ),
//               const SizedBox(height: 20),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: viewModel.isLoading
//                       ? null
//                       : () async {
//                           if (_formKey.currentState!.validate()) {
//                             final email = _emailController.text.trim();
//                             final name = _nameController.text.trim();
//                             try {
//                               final chatExists =
//                                   await viewModel.checkIfChatExists(email);
//                               if (chatExists) {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(
//                                       content: Text(
//                                           'Chat with this email already exists')),
//                                 );
//                                 return;
//                               }

//                               String avatarUrl =
//                                   await _uploadImageToStorage(_selectedImage);

//                               await viewModel.addChatWithUser(
//                                 email,
//                                 name,
//                                 avatarUrl.isEmpty
//                                     ? viewModel.avatarUrl ?? ''
//                                     : avatarUrl,
//                               );

//                               if (viewModel.errorMessage == null) {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(
//                                       content: Text('Chat added successfully')),
//                                 );
//                                 Navigator.pop(context);
//                               } else {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(
//                                       content: Text(viewModel.errorMessage!)),
//                                 );
//                               }
//                             } catch (e) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(
//                                     content: Text('Failed to add chat: $e')),
//                               );
//                             }
//                           }
//                         },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors.primaryColor,
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                   child: const Text(
//                     'Start Chat',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:attendance_app/core/utils/app_colors.dart';
// import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
// import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class UpdateChatView extends StatefulWidget {
//   final ChatModel chat;

//   const UpdateChatView({super.key, required this.chat});

//   @override
//   _UpdateChatViewState createState() => _UpdateChatViewState();
// }

// class _UpdateChatViewState extends State<UpdateChatView> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _nameController.text = widget.chat.name; // تعبئة الاسم الحالي
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => ChatViewModel(ChatRepository()),
//       child: Consumer<ChatViewModel>(
//         builder: (context, viewModel, child) {
//           return Scaffold(
//             appBar: AppBar(
//               backgroundColor: AppColors.primaryColor,
//               title: const Text(
//                 'Update Chat',
//                 style: TextStyle(
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               elevation: 0,
//               actions: [
//                 IconButton(
//                   icon: const Icon(Icons.check, color: Colors.white),
//                   onPressed: () async {
//                     if (_formKey.currentState!.validate()) {
//                       await viewModel.updateChatName(
//                         widget.chat.id,
//                         _nameController.text.trim(),
//                       );
//                       Navigator.pop(context);
//                       if (viewModel.errorMessage == null) {
//                         Navigator.pop(context);
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text(viewModel.errorMessage!)),
//                         );
//                       }
//                     }
//                   },
//                 ),
//               ],
//             ),
//             body: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     CircleAvatar(
//                       radius: 50,
//                       backgroundColor: AppColors.primaryColor,
//                       child: widget.chat.avatar.isNotEmpty &&
//                               widget.chat.avatar.startsWith('http')
//                           ? ClipOval(
//                               child: Image.network(
//                                 widget.chat.avatar,
//                                 width: 100,
//                                 height: 100,
//                                 fit: BoxFit.cover,
//                                 errorBuilder: (context, error, stackTrace) {
//                                   print(
//                                       'Error loading avatar in UpdateChatView: $error');
//                                   return const Icon(
//                                     Icons.person,
//                                     size: 50,
//                                     color: Colors.white,
//                                   );
//                                 },
//                               ),
//                             )
//                           : const Icon(
//                               Icons.person,
//                               size: 50,
//                               color: Colors.white,
//                             ),
//                     ),
//                     const SizedBox(height: 20),
//                     TextFormField(
//                       cursorColor: AppColors.primaryColor,
//                       controller: _nameController,
//                       decoration: const InputDecoration(
//                         labelText: 'Name',
//                         labelStyle: TextStyle(
//                           color: AppColors.primaryColor,
//                         ),
//                         border: OutlineInputBorder(),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: AppColors.primaryColor,
//                             width: 2,
//                           ),
//                         ),
//                         prefixIcon: Icon(Icons.person),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.trim().isEmpty) {
//                           return 'Please enter a name';
//                         }
//                         return null;
//                       },
//                     ),
//                     const SizedBox(height: 20),
//                     TextFormField(
//                       initialValue: widget.chat.email,
//                       decoration: const InputDecoration(
//                         labelText: 'Email',
//                         border: OutlineInputBorder(),
//                         prefixIcon: Icon(Icons.email),
//                       ),
//                       enabled: false, // تعطيل تعديل الإيميل
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
// import 'dart:io';
// import 'package:attendance_app/core/utils/app_colors.dart';
// import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class UserProfileView extends StatefulWidget {
//   const UserProfileView({super.key});

//   @override
//   _UserProfileViewState createState() => _UserProfileViewState();
// }

// class _UserProfileViewState extends State<UserProfileView> {
//   final TextEditingController _userNameController = TextEditingController();
//   final TextEditingController _userEmailController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   String? _avatarUrl;
//   bool _isLoading = false;
//   File? _selectedImage;

//   @override
//   void initState() {
//     super.initState();
//     _loadUserData();
//   }

//   Future<void> _loadUserData() async {
//     setState(() => _isLoading = true);
//     try {
//       final user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         final docSnapshot = await FirebaseFirestore.instance
//             .collection('users')
//             .doc(user.uid)
//             .get();

//         if (docSnapshot.exists) {
//           final userData = docSnapshot.data() as Map<String, dynamic>;
//           setState(() {
//             _userNameController.text =
//                 userData['name']?.toString() ?? user.displayName ?? '';
//             _userEmailController.text = user.email ?? '';
//             _avatarUrl =
//                 userData['image']?.toString().trim() ?? user.photoURL ?? '';
//           });
//           print('User data loaded successfully: $userData');
//         } else {
//           setState(() {
//             _userNameController.text = user.displayName ?? '';
//             _userEmailController.text = user.email ?? '';
//             _avatarUrl = user.photoURL ?? '';
//           });
//           print('No user document found in Firestore for UID: ${user.uid}');
//         }
//       } else {
//         print('No user currently logged in');
//       }
//     } catch (e) {
//       print('Error loading user data: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to load user data: $e')),
//       );
//     } finally {
//       setState(() => _isLoading = false);
//     }
//   }

//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       setState(() {
//         _selectedImage = File(pickedFile.path);
//       });

//       await _uploadImageToStorage();
//     }
//   }

//   Future<void> _uploadImageToStorage() async {
//     if (_selectedImage == null) return;

//     try {
//       final user = FirebaseAuth.instance.currentUser;
//       if (user == null) {
//         throw Exception('No user currently logged in');
//       }

//       final storageRef = FirebaseStorage.instance
//           .ref()
//           .child('user_images')
//           .child('${user.uid}.jpg');
//       await storageRef.putFile(_selectedImage!);
//       final downloadUrl = await storageRef.getDownloadURL();

//       await FirebaseFirestore.instance
//           .collection('users')
//           .doc(user.uid)
//           .update({'image': downloadUrl});

//       setState(() {
//         _avatarUrl = downloadUrl;
//         _selectedImage = null;
//       });

//       // ScaffoldMessenger.of(context).showSnackBar(
//       //   const SnackBar(
//       //     content: Text('Profile picture updated successfully'),
//       //     backgroundColor: Colors.green,
//       //   ),
//       // );

//       print('Profile picture updated successfully');
//     } catch (e) {
//       // ScaffoldMessenger.of(context).showSnackBar(
//       //   SnackBar(content: Text('Failed to update profile picture: $e')),
//       // );

//       print('Failed to update profile picture: $e');
//     }
//   }

//   // Future<void> _saveChanges() async {
//   //   if (_formKey.currentState!.validate()) {
//   //     setState(() => _isLoading = true);
//   //     try {
//   //       final user = FirebaseAuth.instance.currentUser;
//   //       if (user != null) {
//   //         final repo = ChatRepository();
//   //         await repo.updateUserName(_userNameController.text.trim());

//   //         await user.updateDisplayName(_userNameController.text.trim());

//   //         ScaffoldMessenger.of(context).showSnackBar(
//   //           const SnackBar(
//   //             content: Text('Name updated successfully'),
//   //             backgroundColor: Colors.green,
//   //           ),
//   //         );

//   //         Navigator.pop(context);
//   //       }
//   //     } catch (e) {
//   //       ScaffoldMessenger.of(context).showSnackBar(
//   //         SnackBar(content: Text('Failed to update name: $e')),
//   //       );
//   //     } finally {
//   //       setState(() => _isLoading = false);
//   //     }
//   //   }
//   // }

//   void _saveChanges() {
//     if (_formKey.currentState!.validate()) {
//       final user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         final repo = ChatRepository();
//         // Fire-and-forget: Update name in the background
//         repo.updateUserName(_userNameController.text.trim()).then((_) {
//           // ScaffoldMessenger.of(context).showSnackBar(
//           //   const SnackBar(
//           //     content: Text('Name updated successfully'),
//           //     backgroundColor: Colors.green,
//           //   ),
//           // );

//           print('Name updated successfully');
//         }).catchError((e) {
//           // ScaffoldMessenger.of(context).showSnackBar(
//           //   SnackBar(content: Text('Failed to update name: $e')),
//           // );

//           print('Failed to update name: $e');
//         });

//         user.updateDisplayName(_userNameController.text.trim()).then((_) {
//           print('Firebase display name updated');
//         }).catchError((e) {
//           print('Error updating Firebase display name: $e');
//         });

//         // Close the screen immediately
//         Navigator.pop(context);
//       }
//     }
//   }

//   Future<void> _addChatWithUser() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() => _isLoading = true);
//       try {
//         final repo = ChatRepository();
//         await repo.addChatWithUser(
//           _userEmailController.text.trim(),
//           _userNameController.text.trim(),
//           _avatarUrl ?? '',
//         );
//         Navigator.pop(context);
//       } catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('A chat is already exist')),
//         );
//       } finally {
//         setState(() => _isLoading = false);
//       }
//     }
//   }

//   @override
//   void dispose() {
//     _userNameController.dispose();
//     _userEmailController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Profile',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         backgroundColor: AppColors.primaryColor,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.check, color: Colors.white),
//             onPressed: _isLoading ? null : _saveChanges,
//           ),
//         ],
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           color: Colors.white,
//         ),
//         child: _isLoading
//             ? const Center(
//                 child: CircularProgressIndicator(
//                 color: AppColors.primaryColor,
//               ))
//             : Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Form(
//                   key: _formKey,
//                   child: ListView(
//                     children: [
//                       Center(
//                         child: Stack(
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.black.withOpacity(0.2),
//                                     blurRadius: 8,
//                                     offset: const Offset(0, 4),
//                                   ),
//                                 ],
//                               ),
//                               child: CircleAvatar(
//                                 radius: 60,
//                                 backgroundColor: AppColors.primaryColor,
//                                 child: _selectedImage != null
//                                     ? ClipOval(
//                                         child: Image.file(
//                                           _selectedImage!,
//                                           width: 120,
//                                           height: 120,
//                                           fit: BoxFit.cover,
//                                         ),
//                                       )
//                                     : _avatarUrl != null &&
//                                             _avatarUrl!.isNotEmpty
//                                         ? ClipOval(
//                                             child: CachedNetworkImage(
//                                               imageUrl: _avatarUrl!,
//                                               width: 120,
//                                               height: 120,
//                                               fit: BoxFit.cover,
//                                               placeholder: (context, url) =>
//                                                   const Center(
//                                                 child:
//                                                     CircularProgressIndicator(
//                                                   color: Colors.white,
//                                                 ),
//                                               ),
//                                               errorWidget:
//                                                   (context, url, error) {
//                                                 print(
//                                                     'Error loading image: $error, URL: $url');
//                                                 return const Icon(
//                                                   Icons.person,
//                                                   size: 60,
//                                                   color: Colors.white,
//                                                 );
//                                               },
//                                               fadeInDuration: const Duration(
//                                                   milliseconds: 500),
//                                               errorListener: (error) {
//                                                 print(
//                                                     'CachedNetworkImage error: $error');
//                                               },
//                                             ),
//                                           )
//                                         : const Icon(
//                                             Icons.person,
//                                             size: 60,
//                                             color: Colors.white,
//                                           ),
//                               ),
//                             ),
//                             Positioned(
//                               bottom: 0,
//                               right: 0,
//                               child: GestureDetector(
//                                 onTap: _pickImage,
//                                 child: Container(
//                                   padding: const EdgeInsets.all(8),
//                                   decoration: const BoxDecoration(
//                                     color: AppColors.primaryColor,
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: const Icon(
//                                     Icons.camera_alt,
//                                     color: Colors.white,
//                                     size: 24,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 24),
//                       TextFormField(
//                         cursorColor: AppColors.primaryColor,
//                         controller: _userNameController,
//                         decoration: const InputDecoration(
//                           labelText: 'Name',
//                           labelStyle: TextStyle(
//                             color: AppColors.primaryColor,
//                           ),
//                           prefixIcon: Icon(
//                             Icons.person,
//                             color: AppColors.primaryColor,
//                           ),
//                           border: OutlineInputBorder(),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                               color: AppColors.primaryColor,
//                               width: 2,
//                             ),
//                           ),
//                           filled: true,
//                           fillColor: Colors.white,
//                           contentPadding: EdgeInsets.symmetric(
//                               vertical: 16, horizontal: 12),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.trim().isEmpty) {
//                             return 'Please enter a name';
//                           }
//                           if (value.trim().length < 2) {
//                             return 'Name must be at least 2 characters long';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 16),
//                       TextFormField(
//                         enabled: false,
//                         controller: _userEmailController,
//                         decoration: InputDecoration(
//                           labelText: 'Email',
//                           prefixIcon: const Icon(Icons.email,
//                               color: AppColors.primaryColor),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           filled: true,
//                           fillColor: Colors.white,
//                           contentPadding: const EdgeInsets.symmetric(
//                               vertical: 16, horizontal: 12),
//                         ),
//                         keyboardType: TextInputType.emailAddress,
//                         validator: (value) {
//                           if (value == null || value.trim().isEmpty) {
//                             return 'Please enter an email';
//                           }
//                           if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
//                               .hasMatch(value)) {
//                             return 'Please enter a valid email';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 24),
//                       ElevatedButton(
//                         onPressed: _isLoading ? null : _addChatWithUser,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: AppColors.primaryColor,
//                           foregroundColor: Colors.white,
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 16, horizontal: 24),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           elevation: 4,
//                           shadowColor: Colors.black.withOpacity(0.3),
//                         ),
//                         child: _isLoading
//                             ? const SizedBox(
//                                 width: 24,
//                                 height: 24,
//                                 child: CircularProgressIndicator(
//                                   color: Colors.white,
//                                   strokeWidth: 2,
//                                 ),
//                               )
//                             : const Text(
//                                 'Add Chat with User',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//       ),
//     );
//   }
// }
// هو دلوقتي لما دخلت كأحمد الشقري وبعت رساله لأبانوب عماد ولما بدخل كأبانوب عماد بتظهر صورة ابانوب عماد واسمه والمفروض تظهر صورة جهه الاتصال التانيه وهو أحمد الشقري حل المشكله وضبط الدنيا بقاااا