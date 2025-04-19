// // // // // // // // // // // // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';

// // // // // // // // // // // // // // // // class ChatRepository {
// // // // // // // // // // // // // // // //   // In-memory list to store chats (for demo purposes)
// // // // // // // // // // // // // // // //   final List<ChatModel> _chatList = [
// // // // // // // // // // // // // // // //     ChatModel(
// // // // // // // // // // // // // // // //       name: 'Ahmed Elnemr',
// // // // // // // // // // // // // // // //       message: 'You: Hello, I am fine',
// // // // // // // // // // // // // // // //       time: '1:46 PM',
// // // // // // // // // // // // // // // //       unreadCount: 0,
// // // // // // // // // // // // // // // //       avatar:
// // // // // // // // // // // // // // // //           'https://t4.ftcdn.net/jpg/02/17/51/67/240_F_217516770_nHjCK3C82B2ZUC3JB3qQs8W2BGLHxZfa.jpg',
// // // // // // // // // // // // // // // //       hasCheckmark: true,
// // // // // // // // // // // // // // // //     ),
// // // // // // // // // // // // // // // //     ChatModel(
// // // // // // // // // // // // // // // //       name: 'Book Club',
// // // // // // // // // // // // // // // //       message: 'You: Sure, I can join at 9 PM...',
// // // // // // // // // // // // // // // //       time: '2:43 PM',
// // // // // // // // // // // // // // // //       unreadCount: 0,
// // // // // // // // // // // // // // // //       avatar:
// // // // // // // // // // // // // // // //           'https://t3.ftcdn.net/jpg/05/59/87/12/240_F_559871209_pbXlOVArUal3mk6Ce60JuP13kmuIRCth.jpg',
// // // // // // // // // // // // // // // //       hasCheckmark: true,
// // // // // // // // // // // // // // // //     ),
// // // // // // // // // // // // // // // //     ChatModel(
// // // // // // // // // // // // // // // //       name: 'Ahmed Beherry',
// // // // // // // // // // // // // // // //       message: 'You: I sent you the code',
// // // // // // // // // // // // // // // //       time: '12:01/2/14',
// // // // // // // // // // // // // // // //       unreadCount: 0,
// // // // // // // // // // // // // // // //       avatar:
// // // // // // // // // // // // // // // //           'https://t4.ftcdn.net/jpg/03/23/82/99/240_F_323829966_H32wLhoouiPinJ66KyggCvqQ2dFPuuQ1.jpg',
// // // // // // // // // // // // // // // //       hasCheckmark: true,
// // // // // // // // // // // // // // // //     ),
// // // // // // // // // // // // // // // //     ChatModel(
// // // // // // // // // // // // // // // //       name: 'Ahmed ElShokary',
// // // // // // // // // // // // // // // //       message: 'Image',
// // // // // // // // // // // // // // // //       time: '1:11 PM',
// // // // // // // // // // // // // // // //       unreadCount: 389,
// // // // // // // // // // // // // // // //       avatar:
// // // // // // // // // // // // // // // //           'https://t4.ftcdn.net/jpg/02/05/62/79/240_F_205627948_sZMAVsbgp8VtRmc53kSLwWCKTEFImxHV.jpg',
// // // // // // // // // // // // // // // //       hasCheckmark: false,
// // // // // // // // // // // // // // // //     ),
// // // // // // // // // // // // // // // //     ChatModel(
// // // // // // // // // // // // // // // //       name: 'Machine Learning (Project)',
// // // // // // // // // // // // // // // //       message: 'Abanoub Emad reacted 👍 to...',
// // // // // // // // // // // // // // // //       time: '1:11 PM',
// // // // // // // // // // // // // // // //       unreadCount: 0,
// // // // // // // // // // // // // // // //       avatar:
// // // // // // // // // // // // // // // //           'https://t4.ftcdn.net/jpg/05/67/46/61/240_F_567466191_M8cVuf9UM6tYmTdyeiGsieoGPnbKha3R.jpg',
// // // // // // // // // // // // // // // //       hasCheckmark: false,
// // // // // // // // // // // // // // // //     ),
// // // // // // // // // // // // // // // //     ChatModel(
// // // // // // // // // // // // // // // //       name: 'Flutter Developers community',
// // // // // // // // // // // // // // // //       message: '~Sabri: Hey, we have a new...',
// // // // // // // // // // // // // // // //       time: '9:46 PM',
// // // // // // // // // // // // // // // //       unreadCount: 656,
// // // // // // // // // // // // // // // //       avatar:
// // // // // // // // // // // // // // // //           'https://t4.ftcdn.net/jpg/02/17/51/67/240_F_217516770_nHjCK3C82B2ZUC3JB3qQs8W2BGLHxZfa.jpg',
// // // // // // // // // // // // // // // //       hasCheckmark: false,
// // // // // // // // // // // // // // // //     ),
// // // // // // // // // // // // // // // //     ChatModel(
// // // // // // // // // // // // // // // //       name: 'Abanoub Emad',
// // // // // // // // // // // // // // // //       message: 'Sticker',
// // // // // // // // // // // // // // // //       time: '9:41 PM',
// // // // // // // // // // // // // // // //       unreadCount: 59,
// // // // // // // // // // // // // // // //       avatar:
// // // // // // // // // // // // // // // //           'https://t4.ftcdn.net/jpg/03/23/82/99/240_F_323829966_H32wLhoouiPinJ66KyggCvqQ2dFPuuQ1.jpg',
// // // // // // // // // // // // // // // //       hasCheckmark: false,
// // // // // // // // // // // // // // // //     ),
// // // // // // // // // // // // // // // //     ChatModel(
// // // // // // // // // // // // // // // //       name: 'BFCAI Seniors 2025 - AI Chatting',
// // // // // // // // // // // // // // // //       message: 'A: https://docs.google.com/forms/d/...',
// // // // // // // // // // // // // // // //       time: '9:41 PM',
// // // // // // // // // // // // // // // //       unreadCount: 0,
// // // // // // // // // // // // // // // //       avatar:
// // // // // // // // // // // // // // // //           'https://t4.ftcdn.net/jpg/02/17/51/67/240_F_217516770_nHjCK3C82B2ZUC3JB3qQs8W2BGLHxZfa.jpg',
// // // // // // // // // // // // // // // //       hasCheckmark: false,
// // // // // // // // // // // // // // // //     ),
// // // // // // // // // // // // // // // //     ChatModel(
// // // // // // // // // // // // // // // //       name: 'Machine Learning (Project)',
// // // // // // // // // // // // // // // //       message: 'Abanoub Emad reacted 👍 to...',
// // // // // // // // // // // // // // // //       time: '1:11 PM',
// // // // // // // // // // // // // // // //       unreadCount: 0,
// // // // // // // // // // // // // // // //       avatar:
// // // // // // // // // // // // // // // //           'https://t4.ftcdn.net/jpg/05/67/46/61/240_F_567466191_M8cVuf9UM6tYmTdyeiGsieoGPnbKha3R.jpg',
// // // // // // // // // // // // // // // //       hasCheckmark: false,
// // // // // // // // // // // // // // // //     ),
// // // // // // // // // // // // // // // //     ChatModel(
// // // // // // // // // // // // // // // //       name: 'Flutter Developers community',
// // // // // // // // // // // // // // // //       message: '~Sabri: Hey, we have a new...',
// // // // // // // // // // // // // // // //       time: '9:46 PM',
// // // // // // // // // // // // // // // //       unreadCount: 656,
// // // // // // // // // // // // // // // //       avatar:
// // // // // // // // // // // // // // // //           'https://t4.ftcdn.net/jpg/02/17/51/67/240_F_217516770_nHjCK3C82B2ZUC3JB3qQs8W2BGLHxZfa.jpg',
// // // // // // // // // // // // // // // //       hasCheckmark: false,
// // // // // // // // // // // // // // // //     ),
// // // // // // // // // // // // // // // //     ChatModel(
// // // // // // // // // // // // // // // //       name: 'Abanoub Emad',
// // // // // // // // // // // // // // // //       message: 'Sticker',
// // // // // // // // // // // // // // // //       time: '9:41 PM',
// // // // // // // // // // // // // // // //       unreadCount: 59,
// // // // // // // // // // // // // // // //       avatar:
// // // // // // // // // // // // // // // //           'https://t4.ftcdn.net/jpg/03/23/82/99/240_F_323829966_H32wLhoouiPinJ66KyggCvqQ2dFPuuQ1.jpg',
// // // // // // // // // // // // // // // //       hasCheckmark: false,
// // // // // // // // // // // // // // // //     ),
// // // // // // // // // // // // // // // //     ChatModel(
// // // // // // // // // // // // // // // //       name: 'IS (2021-2025)',
// // // // // // // // // // // // // // // //       message: 'Abdelhakim: Hey, how are you?',
// // // // // // // // // // // // // // // //       time: '9:41 PM',
// // // // // // // // // // // // // // // //       unreadCount: 53,
// // // // // // // // // // // // // // // //       avatar:
// // // // // // // // // // // // // // // //           'https://t4.ftcdn.net/jpg/03/23/82/99/240_F_323829966_H32wLhoouiPinJ66KyggCvqQ2dFPuuQ1.jpg',
// // // // // // // // // // // // // // // //       hasCheckmark: false,
// // // // // // // // // // // // // // // //     ),
// // // // // // // // // // // // // // // //     ChatModel(
// // // // // // // // // // // // // // // //       name: 'Machine Learning (Project)',
// // // // // // // // // // // // // // // //       message: 'Abanoub Emad reacted 👍 to...',
// // // // // // // // // // // // // // // //       time: '1:11 PM',
// // // // // // // // // // // // // // // //       unreadCount: 0,
// // // // // // // // // // // // // // // //       avatar:
// // // // // // // // // // // // // // // //           'https://t4.ftcdn.net/jpg/05/67/46/61/240_F_567466191_M8cVuf9UM6tYmTdyeiGsieoGPnbKha3R.jpg',
// // // // // // // // // // // // // // // //       hasCheckmark: false,
// // // // // // // // // // // // // // // //     ),
// // // // // // // // // // // // // // // //     ChatModel(
// // // // // // // // // // // // // // // //       name: 'Flutter Developers community',
// // // // // // // // // // // // // // // //       message: '~Sabri: Hey, we have a new...',
// // // // // // // // // // // // // // // //       time: '9:46 PM',
// // // // // // // // // // // // // // // //       unreadCount: 656,
// // // // // // // // // // // // // // // //       avatar:
// // // // // // // // // // // // // // // //           'https://t4.ftcdn.net/jpg/02/17/51/67/240_F_217516770_nHjCK3C82B2ZUC3JB3qQs8W2BGLHxZfa.jpg',
// // // // // // // // // // // // // // // //       hasCheckmark: false,
// // // // // // // // // // // // // // // //     ),
// // // // // // // // // // // // // // // //     ChatModel(
// // // // // // // // // // // // // // // //       name: 'Abanoub Emad',
// // // // // // // // // // // // // // // //       message: 'Sticker',
// // // // // // // // // // // // // // // //       time: '9:41 PM',
// // // // // // // // // // // // // // // //       unreadCount: 59,
// // // // // // // // // // // // // // // //       avatar:
// // // // // // // // // // // // // // // //           'https://t4.ftcdn.net/jpg/03/23/82/99/240_F_323829966_H32wLhoouiPinJ66KyggCvqQ2dFPuuQ1.jpg',
// // // // // // // // // // // // // // // //       hasCheckmark: false,
// // // // // // // // // // // // // // // //     ),
// // // // // // // // // // // // // // // //   ];

// // // // // // // // // // // // // // // //   Future<List<ChatModel>> getChats() async {
// // // // // // // // // // // // // // // //     // Simulate fetching from API/Database
// // // // // // // // // // // // // // // //     return List<ChatModel>.from(_chatList);
// // // // // // // // // // // // // // // //   }

// // // // // // // // // // // // // // // //   Future<void> createChat(ChatModel chat) async {
// // // // // // // // // // // // // // // //     // Simulate adding to API/Database by adding to the in-memory list
// // // // // // // // // // // // // // // //     _chatList.add(chat);
// // // // // // // // // // // // // // // //     // In a real app, you'd make an API call or database insert here
// // // // // // // // // // // // // // // //     await Future.delayed(Duration(milliseconds: 500)); // Simulate network delay
// // // // // // // // // // // // // // // //   }

// // // // // // // // // // // // // // // //   Future<void> deleteChat(ChatModel chat) async {
// // // // // // // // // // // // // // // //     _chatList.remove(chat);
// // // // // // // // // // // // // // // //     await Future.delayed(Duration(milliseconds: 300));
// // // // // // // // // // // // // // // //   }
// // // // // // // // // // // // // // // // }

// // // // // // // // // // // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // // // // // // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';

// // // // // // // // // // // // // // // class ChatRepository {
// // // // // // // // // // // // // // //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// // // // // // // // // // // // // // //   Future<List<ChatModel>> getChats() async {
// // // // // // // // // // // // // // //     try {
// // // // // // // // // // // // // // //       final snapshot = await _firestore.collection('users_chats').get();
// // // // // // // // // // // // // // //       return snapshot.docs.map((doc) => ChatModel.fromFirestore(doc)).toList();
// // // // // // // // // // // // // // //     } catch (e) {
// // // // // // // // // // // // // // //       print('Error fetching chats: $e');
// // // // // // // // // // // // // // //       return [];
// // // // // // // // // // // // // // //     }
// // // // // // // // // // // // // // //   }

// // // // // // // // // // // // // // //   Future<void> createChat(ChatModel chat) async {
// // // // // // // // // // // // // // //     try {
// // // // // // // // // // // // // // //       await _firestore.collection('users_chats').add(chat.toFirestore());
// // // // // // // // // // // // // // //     } catch (e) {
// // // // // // // // // // // // // // //       print('Error creating chat: $e');
// // // // // // // // // // // // // // //     }
// // // // // // // // // // // // // // //   }

// // // // // // // // // // // // // // //   Future<void> deleteChat(String chatId) async {
// // // // // // // // // // // // // // //     try {
// // // // // // // // // // // // // // //       await _firestore.collection('users_chats').doc(chatId).delete();
// // // // // // // // // // // // // // //     } catch (e) {
// // // // // // // // // // // // // // //       print('Error deleting chat: $e');
// // // // // // // // // // // // // // //     }
// // // // // // // // // // // // // // //   }

// // // // // // // // // // // // // // //   Future<String> addChatWithUser(
// // // // // // // // // // // // // // //       String userEmail, String userName, String avatar) async {
// // // // // // // // // // // // // // //     try {
// // // // // // // // // // // // // // //       final docRef = await _firestore.collection('users_chats').add({
// // // // // // // // // // // // // // //         'name': userName,
// // // // // // // // // // // // // // //         'email': userEmail,
// // // // // // // // // // // // // // //         'avatar': avatar,
// // // // // // // // // // // // // // //         'timestamp': FieldValue.serverTimestamp(),
// // // // // // // // // // // // // // //         'unreadCount': 0,
// // // // // // // // // // // // // // //         'hasCheckmark': false,
// // // // // // // // // // // // // // //         'messages': [],
// // // // // // // // // // // // // // //       });
// // // // // // // // // // // // // // //       return docRef.id;
// // // // // // // // // // // // // // //     } catch (e) {
// // // // // // // // // // // // // // //       print('Error adding chat with user: $e');
// // // // // // // // // // // // // // //       return '';
// // // // // // // // // // // // // // //     }
// // // // // // // // // // // // // // //   }

// // // // // // // // // // // // // // //   Future<void> updateMessages(
// // // // // // // // // // // // // // //       String chatId, Map<String, dynamic> message) async {
// // // // // // // // // // // // // // //     try {
// // // // // // // // // // // // // // //       await _firestore.collection('users_chats').doc(chatId).update({
// // // // // // // // // // // // // // //         'messages': FieldValue.arrayUnion([message]),
// // // // // // // // // // // // // // //       });
// // // // // // // // // // // // // // //     } catch (e) {
// // // // // // // // // // // // // // //       print('Error updating messages: $e');
// // // // // // // // // // // // // // //     }
// // // // // // // // // // // // // // //   }
// // // // // // // // // // // // // // // }

// // // // // // // // // // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // // // // // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';

// // // // // // // // // // // // // // class ChatRepository {
// // // // // // // // // // // // // //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// // // // // // // // // // // // // //   Stream<List<ChatModel>> getChatsStream() {
// // // // // // // // // // // // // //     return _firestore.collection('users_chats')
// // // // // // // // // // // // // //         .orderBy('timestamp', descending: true)
// // // // // // // // // // // // // //         .snapshots()
// // // // // // // // // // // // // //         .map((snapshot) => snapshot.docs.map((doc) => ChatModel.fromFirestore(doc)).toList());
// // // // // // // // // // // // // //   }

// // // // // // // // // // // // // //   Future<void> createChat(ChatModel chat) async {
// // // // // // // // // // // // // //     try {
// // // // // // // // // // // // // //       await _firestore.collection('users_chats').add(chat.toFirestore());
// // // // // // // // // // // // // //     } catch (e) {
// // // // // // // // // // // // // //       print('Error creating chat: $e');
// // // // // // // // // // // // // //     }
// // // // // // // // // // // // // //   }

// // // // // // // // // // // // // //   Future<void> deleteChat(String chatId) async {
// // // // // // // // // // // // // //     try {
// // // // // // // // // // // // // //       await _firestore.collection('users_chats').doc(chatId).delete();
// // // // // // // // // // // // // //     } catch (e) {
// // // // // // // // // // // // // //       print('Error deleting chat: $e');
// // // // // // // // // // // // // //     }
// // // // // // // // // // // // // //   }

// // // // // // // // // // // // // //   Future<void> updateMessages(String chatId, Map<String, dynamic> message) async {
// // // // // // // // // // // // // //     try {
// // // // // // // // // // // // // //       await _firestore.collection('users_chats').doc(chatId).update({
// // // // // // // // // // // // // //         'messages': FieldValue.arrayUnion([message]),
// // // // // // // // // // // // // //       });
// // // // // // // // // // // // // //     } catch (e) {
// // // // // // // // // // // // // //       print('Error updating messages: $e');
// // // // // // // // // // // // // //     }
// // // // // // // // // // // // // //   }

// // // // // // // // // // // // // //   // إضافة دالة addChatWithUser
// // // // // // // // // // // // // //   Future<void> addChatWithUser(String userEmail, String userName, String avatar) async {
// // // // // // // // // // // // // //     try {
// // // // // // // // // // // // // //       await _firestore.collection('users_chats').add({
// // // // // // // // // // // // // //         'name': userName,
// // // // // // // // // // // // // //         'email': userEmail,
// // // // // // // // // // // // // //         'avatar': avatar,
// // // // // // // // // // // // // //         'timestamp': FieldValue.serverTimestamp(),
// // // // // // // // // // // // // //         'unreadCount': 0,
// // // // // // // // // // // // // //         'hasCheckmark': false,
// // // // // // // // // // // // // //         'messages': [],
// // // // // // // // // // // // // //       });
// // // // // // // // // // // // // //     } catch (e) {
// // // // // // // // // // // // // //       print('Error adding chat with user: $e');
// // // // // // // // // // // // // //     }
// // // // // // // // // // // // // //   }
// // // // // // // // // // // // // // }

// // // // // // // // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // // // // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';

// // // // // // // // // // // // // class ChatRepository {
// // // // // // // // // // // // //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// // // // // // // // // // // // //   Stream<List<ChatModel>> getChatsStream() {
// // // // // // // // // // // // //     return _firestore
// // // // // // // // // // // // //         .collection('users_chats')
// // // // // // // // // // // // //         .orderBy('timestamp', descending: true)
// // // // // // // // // // // // //         .snapshots()
// // // // // // // // // // // // //         .map((snapshot) =>
// // // // // // // // // // // // //             snapshot.docs.map((doc) => ChatModel.fromFirestore(doc)).toList());
// // // // // // // // // // // // //   }

// // // // // // // // // // // // //   Future<DocumentReference> createChat(ChatModel chat) async {
// // // // // // // // // // // // //     try {
// // // // // // // // // // // // //       return await _firestore.collection('users_chats').add(chat.toFirestore());
// // // // // // // // // // // // //     } catch (e) {
// // // // // // // // // // // // //       print('Error creating chat: $e');
// // // // // // // // // // // // //       rethrow;
// // // // // // // // // // // // //     }
// // // // // // // // // // // // //   }

// // // // // // // // // // // // //   Future<void> deleteChat(String chatId) async {
// // // // // // // // // // // // //     try {
// // // // // // // // // // // // //       await _firestore.collection('users_chats').doc(chatId).delete();
// // // // // // // // // // // // //     } catch (e) {
// // // // // // // // // // // // //       print('Error deleting chat: $e');
// // // // // // // // // // // // //     }
// // // // // // // // // // // // //   }

// // // // // // // // // // // // //   Future<void> updateMessages(
// // // // // // // // // // // // //       String chatId, Map<String, dynamic> message) async {
// // // // // // // // // // // // //     try {
// // // // // // // // // // // // //       await _firestore.collection('users_chats').doc(chatId).update({
// // // // // // // // // // // // //         'messages': FieldValue.arrayUnion([message]),
// // // // // // // // // // // // //         'message': message['text'],
// // // // // // // // // // // // //         'timestamp': FieldValue.serverTimestamp(),
// // // // // // // // // // // // //       });
// // // // // // // // // // // // //     } catch (e) {
// // // // // // // // // // // // //       print('Error updating messages: $e');
// // // // // // // // // // // // //     }
// // // // // // // // // // // // //   }

// // // // // // // // // // // // //   Future<void> addChatWithUser(
// // // // // // // // // // // // //       String userEmail, String userName, String avatar) async {
// // // // // // // // // // // // //     try {
// // // // // // // // // // // // //       await _firestore.collection('users_chats').add({
// // // // // // // // // // // // //         'name': userName,
// // // // // // // // // // // // //         'email': userEmail,
// // // // // // // // // // // // //         'avatar': avatar,
// // // // // // // // // // // // //         'timestamp': FieldValue.serverTimestamp(),
// // // // // // // // // // // // //         'unreadCount': 0,
// // // // // // // // // // // // //         'hasCheckmark': false,
// // // // // // // // // // // // //         'messages': [],
// // // // // // // // // // // // //         'message': '',
// // // // // // // // // // // // //       });
// // // // // // // // // // // // //     } catch (e) {
// // // // // // // // // // // // //       print('Error adding chat with user: $e');
// // // // // // // // // // // // //     }
// // // // // // // // // // // // //   }
// // // // // // // // // // // // // }

// // // // // // // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // // // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';

// // // // // // // // // // // // class ChatRepository {
// // // // // // // // // // // //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// // // // // // // // // // // //   Stream<List<ChatModel>> getChatsStream() {
// // // // // // // // // // // //     return _firestore
// // // // // // // // // // // //         .collection('users_chats')
// // // // // // // // // // // //         .orderBy('timestamp', descending: true)
// // // // // // // // // // // //         .snapshots()
// // // // // // // // // // // //         .map((snapshot) =>
// // // // // // // // // // // //             snapshot.docs.map((doc) => ChatModel.fromFirestore(doc)).toList());
// // // // // // // // // // // //   }

// // // // // // // // // // // //   Future<DocumentReference> createChat(ChatModel chat) async {
// // // // // // // // // // // //     try {
// // // // // // // // // // // //       return await _firestore.collection('users_chats').add(chat.toFirestore());
// // // // // // // // // // // //     } catch (e) {
// // // // // // // // // // // //       print('Error creating chat: $e');
// // // // // // // // // // // //       rethrow;
// // // // // // // // // // // //     }
// // // // // // // // // // // //   }

// // // // // // // // // // // //   Future<void> deleteChat(String chatId) async {
// // // // // // // // // // // //     try {
// // // // // // // // // // // //       await _firestore.collection('users_chats').doc(chatId).delete();
// // // // // // // // // // // //     } catch (e) {
// // // // // // // // // // // //       print('Error deleting chat: $e');
// // // // // // // // // // // //     }
// // // // // // // // // // // //   }

// // // // // // // // // // // //   Future<void> updateMessages(
// // // // // // // // // // // //       String chatId, Map<String, dynamic> message) async {
// // // // // // // // // // // //     try {
// // // // // // // // // // // //       // إضافة الرسالة مع طابع زمني محلي
// // // // // // // // // // // //       final messageWithLocalTime = {
// // // // // // // // // // // //         ...message,
// // // // // // // // // // // //         'time': DateTime.now().toIso8601String(),
// // // // // // // // // // // //       };
// // // // // // // // // // // //       await _firestore.collection('users_chats').doc(chatId).update({
// // // // // // // // // // // //         'messages': FieldValue.arrayUnion([messageWithLocalTime]),
// // // // // // // // // // // //         'message': message['text'],
// // // // // // // // // // // //         'timestamp': FieldValue.serverTimestamp(),
// // // // // // // // // // // //       });
// // // // // // // // // // // //     } catch (e) {
// // // // // // // // // // // //       print('Error updating messages: $e');
// // // // // // // // // // // //       rethrow;
// // // // // // // // // // // //     }
// // // // // // // // // // // //   }

// // // // // // // // // // // //   Future<void> addChatWithUser(
// // // // // // // // // // // //       String userEmail, String userName, String avatar) async {
// // // // // // // // // // // //     try {
// // // // // // // // // // // //       await _firestore.collection('users_chats').add({
// // // // // // // // // // // //         'name': userName,
// // // // // // // // // // // //         'email': userEmail,
// // // // // // // // // // // //         'avatar': avatar,
// // // // // // // // // // // //         'timestamp': FieldValue.serverTimestamp(),
// // // // // // // // // // // //         'unreadCount': 0,
// // // // // // // // // // // //         'hasCheckmark': false,
// // // // // // // // // // // //         'messages': [],
// // // // // // // // // // // //         'message': '',
// // // // // // // // // // // //       });
// // // // // // // // // // // //     } catch (e) {
// // // // // // // // // // // //       print('Error adding chat with user: $e');
// // // // // // // // // // // //     }
// // // // // // // // // // // //   }
// // // // // // // // // // // // }

// // // // // // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';

// // // // // // // // // // // class ChatRepository {
// // // // // // // // // // //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// // // // // // // // // // //   Stream<List<ChatModel>> getChatsStream() {
// // // // // // // // // // //     return _firestore
// // // // // // // // // // //         .collection('users_chats')
// // // // // // // // // // //         .orderBy('timestamp', descending: true)
// // // // // // // // // // //         .snapshots()
// // // // // // // // // // //         .map((snapshot) =>
// // // // // // // // // // //             snapshot.docs.map((doc) => ChatModel.fromFirestore(doc)).toList());
// // // // // // // // // // //   }

// // // // // // // // // // //   Future<DocumentReference> createChat(ChatModel chat) async {
// // // // // // // // // // //     try {
// // // // // // // // // // //       return await _firestore.collection('users_chats').add(chat.toFirestore());
// // // // // // // // // // //     } catch (e) {
// // // // // // // // // // //       print('Error creating chat: $e');
// // // // // // // // // // //       rethrow;
// // // // // // // // // // //     }
// // // // // // // // // // //   }

// // // // // // // // // // //   Future<void> deleteChat(String chatId) async {
// // // // // // // // // // //     try {
// // // // // // // // // // //       await _firestore.collection('users_chats').doc(chatId).delete();
// // // // // // // // // // //     } catch (e) {
// // // // // // // // // // //       print('Error deleting chat: $e');
// // // // // // // // // // //     }
// // // // // // // // // // //   }

// // // // // // // // // // //   Future<void> updateMessages(
// // // // // // // // // // //       String chatId, Map<String, dynamic> message) async {
// // // // // // // // // // //     try {
// // // // // // // // // // //       final messageWithLocalTime = {
// // // // // // // // // // //         ...message,
// // // // // // // // // // //         'time': DateTime.now().toIso8601String(),
// // // // // // // // // // //       };
// // // // // // // // // // //       await _firestore.collection('users_chats').doc(chatId).update({
// // // // // // // // // // //         'messages': FieldValue.arrayUnion([messageWithLocalTime]),
// // // // // // // // // // //         'message': message['text'],
// // // // // // // // // // //         'timestamp': FieldValue.serverTimestamp(),
// // // // // // // // // // //       });
// // // // // // // // // // //     } catch (e) {
// // // // // // // // // // //       print('Error updating messages: $e');
// // // // // // // // // // //       rethrow;
// // // // // // // // // // //     }
// // // // // // // // // // //   }

// // // // // // // // // // //   Future<void> deleteMessage(
// // // // // // // // // // //       String chatId, Map<String, dynamic> message) async {
// // // // // // // // // // //     try {
// // // // // // // // // // //       await _firestore.collection('users_chats').doc(chatId).update({
// // // // // // // // // // //         'messages': FieldValue.arrayRemove([message]),
// // // // // // // // // // //         'timestamp': FieldValue.serverTimestamp(),
// // // // // // // // // // //       });
// // // // // // // // // // //     } catch (e) {
// // // // // // // // // // //       print('Error deleting message: $e');
// // // // // // // // // // //       rethrow;
// // // // // // // // // // //     }
// // // // // // // // // // //   }

// // // // // // // // // // //   Future<void> addChatWithUser(
// // // // // // // // // // //       String userEmail, String userName, String avatar) async {
// // // // // // // // // // //     try {
// // // // // // // // // // //       await _firestore.collection('users_chats').add({
// // // // // // // // // // //         'name': userName,
// // // // // // // // // // //         'email': userEmail,
// // // // // // // // // // //         'avatar': avatar,
// // // // // // // // // // //         'timestamp': FieldValue.serverTimestamp(),
// // // // // // // // // // //         'unreadCount': 0,
// // // // // // // // // // //         'hasCheckmark': false,
// // // // // // // // // // //         'messages': [],
// // // // // // // // // // //         'message': '',
// // // // // // // // // // //       });
// // // // // // // // // // //     } catch (e) {
// // // // // // // // // // //       print('Error adding chat with user: $e');
// // // // // // // // // // //     }
// // // // // // // // // // //   }
// // // // // // // // // // // }

// // // // // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // // // // // // import 'package:uuid/uuid.dart';

// // // // // // // // // // class ChatRepository {
// // // // // // // // // //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// // // // // // // // // //   final Uuid _uuid = const Uuid();

// // // // // // // // // //   Stream<List<ChatModel>> getChatsStream() {
// // // // // // // // // //     return _firestore
// // // // // // // // // //         .collection('users_chats')
// // // // // // // // // //         .orderBy('timestamp', descending: true)
// // // // // // // // // //         .snapshots()
// // // // // // // // // //         .map((snapshot) =>
// // // // // // // // // //             snapshot.docs.map((doc) => ChatModel.fromFirestore(doc)).toList());
// // // // // // // // // //   }

// // // // // // // // // //   Future<DocumentReference> createChat(ChatModel chat) async {
// // // // // // // // // //     try {
// // // // // // // // // //       return await _firestore.collection('users_chats').add(chat.toFirestore());
// // // // // // // // // //     } catch (e) {
// // // // // // // // // //       print('Error creating chat: $e');
// // // // // // // // // //       rethrow;
// // // // // // // // // //     }
// // // // // // // // // //   }

// // // // // // // // // //   Future<void> deleteChat(String chatId) async {
// // // // // // // // // //     try {
// // // // // // // // // //       await _firestore.collection('users_chats').doc(chatId).delete();
// // // // // // // // // //     } catch (e) {
// // // // // // // // // //       print('Error deleting chat: $e');
// // // // // // // // // //     }
// // // // // // // // // //   }

// // // // // // // // // //   Future<void> updateMessages(
// // // // // // // // // //       String chatId, Map<String, dynamic> message) async {
// // // // // // // // // //     try {
// // // // // // // // // //       final messageWithId = {
// // // // // // // // // //         ...message,
// // // // // // // // // //         'messageId': _uuid.v4(), // إضافة messageId فريد
// // // // // // // // // //         'time': DateTime.now().toIso8601String(),
// // // // // // // // // //       };
// // // // // // // // // //       await _firestore.collection('users_chats').doc(chatId).update({
// // // // // // // // // //         'messages': FieldValue.arrayUnion([messageWithId]),
// // // // // // // // // //         'message': message['text'],
// // // // // // // // // //         'timestamp': FieldValue.serverTimestamp(),
// // // // // // // // // //       });
// // // // // // // // // //     } catch (e) {
// // // // // // // // // //       print('Error updating messages: $e');
// // // // // // // // // //       rethrow;
// // // // // // // // // //     }
// // // // // // // // // //   }

// // // // // // // // // //   Future<void> deleteMessage(
// // // // // // // // // //       String chatId, Map<String, dynamic> message) async {
// // // // // // // // // //     try {
// // // // // // // // // //       await _firestore.collection('users_chats').doc(chatId).update({
// // // // // // // // // //         'messages': FieldValue.arrayRemove([message]),
// // // // // // // // // //         'timestamp': FieldValue.serverTimestamp(),
// // // // // // // // // //       });
// // // // // // // // // //     } catch (e) {
// // // // // // // // // //       print('Error deleting message: $e');
// // // // // // // // // //       rethrow;
// // // // // // // // // //     }
// // // // // // // // // //   }

// // // // // // // // // //   Future<void> addChatWithUser(
// // // // // // // // // //       String userEmail, String userName, String avatar) async {
// // // // // // // // // //     try {
// // // // // // // // // //       await _firestore.collection('users_chats').add({
// // // // // // // // // //         'name': userName,
// // // // // // // // // //         'email': userEmail,
// // // // // // // // // //         'avatar': avatar,
// // // // // // // // // //         'timestamp': FieldValue.serverTimestamp(),
// // // // // // // // // //         'unreadCount': 0,
// // // // // // // // // //         'hasCheckmark': false,
// // // // // // // // // //         'messages': [],
// // // // // // // // // //         'message': '',
// // // // // // // // // //       });
// // // // // // // // // //     } catch (e) {
// // // // // // // // // //       print('Error adding chat with user: $e');
// // // // // // // // // //     }
// // // // // // // // // //   }
// // // // // // // // // // }

// // // // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // // // // // import 'package:uuid/uuid.dart';

// // // // // // // // // class ChatRepository {
// // // // // // // // //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// // // // // // // // //   final Uuid _uuid = const Uuid();

// // // // // // // // //   Stream<List<ChatModel>> getChatsStream() {
// // // // // // // // //     return _firestore
// // // // // // // // //         .collection('users_chats')
// // // // // // // // //         .orderBy('timestamp', descending: true)
// // // // // // // // //         .snapshots()
// // // // // // // // //         .map((snapshot) =>
// // // // // // // // //             snapshot.docs.map((doc) => ChatModel.fromFirestore(doc)).toList());
// // // // // // // // //   }

// // // // // // // // //   Future<DocumentReference> createChat(ChatModel chat) async {
// // // // // // // // //     try {
// // // // // // // // //       return await _firestore.collection('users_chats').add(chat.toFirestore());
// // // // // // // // //     } catch (e) {
// // // // // // // // //       print('Error creating chat: $e');
// // // // // // // // //       rethrow;
// // // // // // // // //     }
// // // // // // // // //   }

// // // // // // // // //   Future<void> deleteChat(String chatId) async {
// // // // // // // // //     try {
// // // // // // // // //       await _firestore.collection('users_chats').doc(chatId).delete();
// // // // // // // // //     } catch (e) {
// // // // // // // // //       print('Error deleting chat: $e');
// // // // // // // // //     }
// // // // // // // // //   }

// // // // // // // // //   Future<void> updateMessages(
// // // // // // // // //       String chatId, Map<String, dynamic> message) async {
// // // // // // // // //     try {
// // // // // // // // //       final messageWithId = {
// // // // // // // // //         ...message,
// // // // // // // // //         'messageId': _uuid.v4(),
// // // // // // // // //         'time': DateTime.now().toIso8601String(),
// // // // // // // // //       };
// // // // // // // // //       await _firestore.collection('users_chats').doc(chatId).update({
// // // // // // // // //         'messages': FieldValue.arrayUnion([messageWithId]),
// // // // // // // // //         'message': message['text'],
// // // // // // // // //         'timestamp': FieldValue.serverTimestamp(),
// // // // // // // // //       });
// // // // // // // // //     } catch (e) {
// // // // // // // // //       print('Error updating messages: $e');
// // // // // // // // //       rethrow;
// // // // // // // // //     }
// // // // // // // // //   }

// // // // // // // // //   Future<void> deleteMessage(
// // // // // // // // //       String chatId, Map<String, dynamic> message) async {
// // // // // // // // //     try {
// // // // // // // // //       // إذا كان فيه messageId، بنستخدمه
// // // // // // // // //       if (message.containsKey('messageId')) {
// // // // // // // // //         await _firestore.collection('users_chats').doc(chatId).update({
// // // // // // // // //           'messages': FieldValue.arrayRemove([message]),
// // // // // // // // //           'timestamp': FieldValue.serverTimestamp(),
// // // // // // // // //         });
// // // // // // // // //       } else {
// // // // // // // // //         // التعامل مع الرسايل القديمة بدون messageId
// // // // // // // // //         await _firestore.collection('users_chats').doc(chatId).update({
// // // // // // // // //           'messages': FieldValue.arrayRemove([message]),
// // // // // // // // //           'timestamp': FieldValue.serverTimestamp(),
// // // // // // // // //         });
// // // // // // // // //       }
// // // // // // // // //     } catch (e) {
// // // // // // // // //       print('Error deleting message: $e');
// // // // // // // // //       rethrow;
// // // // // // // // //     }
// // // // // // // // //   }

// // // // // // // // //   Future<void> addChatWithUser(
// // // // // // // // //       String userEmail, String userName, String avatar) async {
// // // // // // // // //     try {
// // // // // // // // //       await _firestore.collection('users_chats').add({
// // // // // // // // //         'name': userName,
// // // // // // // // //         'email': userEmail,
// // // // // // // // //         'avatar': avatar,
// // // // // // // // //         'timestamp': FieldValue.serverTimestamp(),
// // // // // // // // //         'unreadCount': 0,
// // // // // // // // //         'hasCheckmark': false,
// // // // // // // // //         'messages': [],
// // // // // // // // //         'message': '',
// // // // // // // // //       });
// // // // // // // // //     } catch (e) {
// // // // // // // // //       print('Error adding chat with user: $e');
// // // // // // // // //     }
// // // // // // // // //   }
// // // // // // // // // }

// // // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // // // // import 'package:uuid/uuid.dart';

// // // // // // // // class ChatRepository {
// // // // // // // //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// // // // // // // //   final Uuid _uuid = const Uuid();

// // // // // // // //   Stream<List<ChatModel>> getChatsStream() {
// // // // // // // //     return _firestore
// // // // // // // //         .collection('users_chats')
// // // // // // // //         .orderBy('timestamp', descending: true)
// // // // // // // //         .snapshots()
// // // // // // // //         .map((snapshot) =>
// // // // // // // //             snapshot.docs.map((doc) => ChatModel.fromFirestore(doc)).toList());
// // // // // // // //   }

// // // // // // // //   Future<DocumentReference> createChat(ChatModel chat) async {
// // // // // // // //     try {
// // // // // // // //       return await _firestore.collection('users_chats').add(chat.toFirestore());
// // // // // // // //     } catch (e) {
// // // // // // // //       print('Error creating chat: $e');
// // // // // // // //       rethrow;
// // // // // // // //     }
// // // // // // // //   }

// // // // // // // //   Future<void> deleteChat(String chatId) async {
// // // // // // // //     try {
// // // // // // // //       await _firestore.collection('users_chats').doc(chatId).delete();
// // // // // // // //     } catch (e) {
// // // // // // // //       print('Error deleting chat: $e');
// // // // // // // //     }
// // // // // // // //   }

// // // // // // // //   Future<void> updateMessages(
// // // // // // // //       String chatId, Map<String, dynamic> message) async {
// // // // // // // //     try {
// // // // // // // //       final messageWithId = {
// // // // // // // //         ...message,
// // // // // // // //         'messageId': _uuid.v4(),
// // // // // // // //         'time': DateTime.now().toIso8601String(),
// // // // // // // //       };
// // // // // // // //       await _firestore.collection('users_chats').doc(chatId).update({
// // // // // // // //         'messages': FieldValue.arrayUnion([messageWithId]),
// // // // // // // //         'message': message['text'],
// // // // // // // //         'timestamp': FieldValue.serverTimestamp(),
// // // // // // // //       });
// // // // // // // //     } catch (e) {
// // // // // // // //       print('Error updating messages: $e');
// // // // // // // //       rethrow;
// // // // // // // //     }
// // // // // // // //   }

// // // // // // // //   Future<void> deleteMessage(
// // // // // // // //       String chatId, Map<String, dynamic> message) async {
// // // // // // // //     try {
// // // // // // // //       await _firestore.collection('users_chats').doc(chatId).update({
// // // // // // // //         'messages': FieldValue.arrayRemove([message]),
// // // // // // // //         'timestamp': FieldValue.serverTimestamp(),
// // // // // // // //       });
// // // // // // // //     } catch (e) {
// // // // // // // //       print('Error deleting message: $e');
// // // // // // // //       rethrow;
// // // // // // // //     }
// // // // // // // //   }

// // // // // // // //   Future<void> addChatWithUser(
// // // // // // // //       String userEmail, String userName, String avatar) async {
// // // // // // // //     try {
// // // // // // // //       await _firestore.collection('users_chats').add({
// // // // // // // //         'name': userName,
// // // // // // // //         'email': userEmail,
// // // // // // // //         'avatar': avatar,
// // // // // // // //         'timestamp': FieldValue.serverTimestamp(),
// // // // // // // //         'unreadCount': 0,
// // // // // // // //         'hasCheckmark': false,
// // // // // // // //         'messages': [],
// // // // // // // //         'message': '',
// // // // // // // //       });
// // // // // // // //     } catch (e) {
// // // // // // // //       print('Error adding chat with user: $e');
// // // // // // // //     }
// // // // // // // //   }
// // // // // // // // }

// // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // // // import 'package:uuid/uuid.dart';

// // // // // // // class ChatRepository {
// // // // // // //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// // // // // // //   final Uuid _uuid = const Uuid();

// // // // // // //   Stream<List<ChatModel>> getChatsStream() {
// // // // // // //     return _firestore
// // // // // // //         .collection('users_chats')
// // // // // // //         .orderBy('timestamp', descending: true)
// // // // // // //         .snapshots()
// // // // // // //         .map((snapshot) =>
// // // // // // //             snapshot.docs.map((doc) => ChatModel.fromFirestore(doc)).toList());
// // // // // // //   }

// // // // // // //   Future<DocumentReference> createChat(ChatModel chat) async {
// // // // // // //     try {
// // // // // // //       return await _firestore.collection('users_chats').add(chat.toFirestore());
// // // // // // //     } catch (e) {
// // // // // // //       print('Error creating chat: $e');
// // // // // // //       rethrow;
// // // // // // //     }
// // // // // // //   }

// // // // // // //   Future<void> deleteChat(String chatId) async {
// // // // // // //     try {
// // // // // // //       await _firestore.collection('users_chats').doc(chatId).delete();
// // // // // // //     } catch (e) {
// // // // // // //       print('Error deleting chat: $e');
// // // // // // //     }
// // // // // // //   }

// // // // // // //   Future<void> updateMessages(
// // // // // // //       String chatId, Map<String, dynamic> message) async {
// // // // // // //     try {
// // // // // // //       final messageWithId = {
// // // // // // //         ...message,
// // // // // // //         'messageId': _uuid.v4(),
// // // // // // //         'time': DateTime.now().toIso8601String(),
// // // // // // //       };
// // // // // // //       await _firestore.collection('users_chats').doc(chatId).update({
// // // // // // //         'messages': FieldValue.arrayUnion([messageWithId]),
// // // // // // //         'message': message['text'],
// // // // // // //         'timestamp': FieldValue.serverTimestamp(),
// // // // // // //       });
// // // // // // //     } catch (e) {
// // // // // // //       print('Error updating messages: $e');
// // // // // // //       rethrow;
// // // // // // //     }
// // // // // // //   }

// // // // // // //   Future<void> deleteMessage(
// // // // // // //       String chatId, Map<String, dynamic> message) async {
// // // // // // //     try {
// // // // // // //       await _firestore.collection('users_chats').doc(chatId).update({
// // // // // // //         'messages': FieldValue.arrayRemove([message]),
// // // // // // //         'timestamp': FieldValue.serverTimestamp(),
// // // // // // //       });
// // // // // // //     } catch (e) {
// // // // // // //       print('Error deleting message: $e');
// // // // // // //       rethrow;
// // // // // // //     }
// // // // // // //   }

// // // // // // //   Future<void> addChatWithUser(
// // // // // // //       String userEmail, String userName, String avatar) async {
// // // // // // //     try {
// // // // // // //       await _firestore.collection('users_chats').add({
// // // // // // //         'name': userName,
// // // // // // //         'email': userEmail,
// // // // // // //         'avatar': avatar,
// // // // // // //         'timestamp': FieldValue.serverTimestamp(),
// // // // // // //         'unreadCount': 0,
// // // // // // //         'hasCheckmark': false,
// // // // // // //         'messages': [],
// // // // // // //         'message': '',
// // // // // // //       });
// // // // // // //     } catch (e) {
// // // // // // //       print('Error adding chat with user: $e');
// // // // // // //     }
// // // // // // //   }
// // // // // // // }

// // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // // import 'package:uuid/uuid.dart';

// // // // // // class ChatRepository {
// // // // // //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// // // // // //   final Uuid _uuid = const Uuid();

// // // // // //   Stream<List<ChatModel>> getChatsStream() {
// // // // // //     return _firestore
// // // // // //         .collection('users_chats')
// // // // // //         .orderBy('timestamp', descending: true)
// // // // // //         .snapshots()
// // // // // //         .map((snapshot) =>
// // // // // //             snapshot.docs.map((doc) => ChatModel.fromFirestore(doc)).toList());
// // // // // //   }

// // // // // //   Future<DocumentReference> createChat(ChatModel chat) async {
// // // // // //     try {
// // // // // //       return await _firestore.collection('users_chats').add(chat.toFirestore());
// // // // // //     } catch (e) {
// // // // // //       print('Error creating chat: $e');
// // // // // //       rethrow;
// // // // // //     }
// // // // // //   }

// // // // // //   Future<void> deleteChat(String chatId) async {
// // // // // //     try {
// // // // // //       await _firestore.collection('users_chats').doc(chatId).delete();
// // // // // //     } catch (e) {
// // // // // //       print('Error deleting chat: $e');
// // // // // //       rethrow;
// // // // // //     }
// // // // // //   }

// // // // // //   Future<void> updateMessages(
// // // // // //       String chatId, Map<String, dynamic> message) async {
// // // // // //     try {
// // // // // //       final messageWithId = {
// // // // // //         ...message,
// // // // // //         'messageId': _uuid.v4(),
// // // // // //         'time': DateTime.now().toIso8601String(),
// // // // // //       };
// // // // // //       await _firestore.collection('users_chats').doc(chatId).update({
// // // // // //         'messages': FieldValue.arrayUnion([messageWithId]),
// // // // // //         'message': message['text'],
// // // // // //         'timestamp': FieldValue.serverTimestamp(),
// // // // // //       });
// // // // // //     } catch (e) {
// // // // // //       print('Error updating messages: $e');
// // // // // //       rethrow;
// // // // // //     }
// // // // // //   }

// // // // // //   Future<void> deleteMessage(String chatId, String messageId) async {
// // // // // //     try {
// // // // // //       // قراءة الـ document
// // // // // //       final docRef = _firestore.collection('users_chats').doc(chatId);
// // // // // //       final docSnapshot = await docRef.get();

// // // // // //       if (!docSnapshot.exists) {
// // // // // //         throw Exception('Chat document does not exist');
// // // // // //       }

// // // // // //       // جلب الـ messages array
// // // // // //       final data = docSnapshot.data() as Map<String, dynamic>;
// // // // // //       List<dynamic> messages = List.from(data['messages'] ?? []);

// // // // // //       // إيجاد الرسالة بناءً على messageId
// // // // // //       final updatedMessages =
// // // // // //           messages.where((msg) => msg['messageId'] != messageId).toList();

// // // // // //       // تحديث الـ document بالـ messages الجديدة
// // // // // //       await docRef.update({
// // // // // //         'messages': updatedMessages,
// // // // // //         'timestamp': FieldValue.serverTimestamp(),
// // // // // //       });

// // // // // //       print('Message with ID $messageId deleted successfully');
// // // // // //     } catch (e) {
// // // // // //       print('Error deleting message: $e');
// // // // // //       rethrow;
// // // // // //     }
// // // // // //   }

// // // // // //   Future<void> addChatWithUser(
// // // // // //       String userEmail, String userName, String avatar) async {
// // // // // //     try {
// // // // // //       await _firestore.collection('users_chats').add({
// // // // // //         'name': userName,
// // // // // //         'email': userEmail,
// // // // // //         'avatar': avatar,
// // // // // //         'timestamp': FieldValue.serverTimestamp(),
// // // // // //         'unreadCount': 0,
// // // // // //         'hasCheckmark': false,
// // // // // //         'messages': [],
// // // // // //         'message': '',
// // // // // //       });
// // // // // //     } catch (e) {
// // // // // //       print('Error adding chat with user: $e');
// // // // // //       rethrow;
// // // // // //     }
// // // // // //   }
// // // // // // }

// // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // import 'package:uuid/uuid.dart';

// // // // // class ChatRepository {
// // // // //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// // // // //   final Uuid _uuid = const Uuid();

// // // // //   Stream<List<ChatModel>> getChatsStream() {
// // // // //     return _firestore
// // // // //         .collection('users_chats')
// // // // //         .orderBy('timestamp', descending: true)
// // // // //         .snapshots()
// // // // //         .map((snapshot) =>
// // // // //             snapshot.docs.map((doc) => ChatModel.fromFirestore(doc)).toList());
// // // // //   }

// // // // //   Future<DocumentReference> createChat(ChatModel chat) async {
// // // // //     try {
// // // // //       return await _firestore.collection('users_chats').add(chat.toFirestore());
// // // // //     } catch (e) {
// // // // //       print('Error creating chat: $e');
// // // // //       rethrow;
// // // // //     }
// // // // //   }

// // // // //   Future<void> deleteChat(String chatId) async {
// // // // //     try {
// // // // //       await _firestore.collection('users_chats').doc(chatId).delete();
// // // // //     } catch (e) {
// // // // //       print('Error deleting chat: $e');
// // // // //       rethrow;
// // // // //     }
// // // // //   }

// // // // //   Future<void> updateMessages(
// // // // //       String chatId, Map<String, dynamic> message) async {
// // // // //     try {
// // // // //       final messageWithId = {
// // // // //         ...message,
// // // // //         'messageId': _uuid.v4(),
// // // // //         'time': DateTime.now().toIso8601String(),
// // // // //       };
// // // // //       await _firestore.collection('users_chats').doc(chatId).update({
// // // // //         'messages': FieldValue.arrayUnion([messageWithId]),
// // // // //         'message': message['text'],
// // // // //         'timestamp': FieldValue.serverTimestamp(),
// // // // //       });
// // // // //     } catch (e) {
// // // // //       print('Error updating messages: $e');
// // // // //       rethrow;
// // // // //     }
// // // // //   }

// // // // //   Future<void> deleteMessage(String chatId, String messageId) async {
// // // // //     try {
// // // // //       // قراءة الـ document
// // // // //       final docRef = _firestore.collection('users_chats').doc(chatId);
// // // // //       final docSnapshot = await docRef.get();

// // // // //       if (!docSnapshot.exists) {
// // // // //         throw Exception('Chat document does not exist');
// // // // //       }

// // // // //       // جلب الـ messages array
// // // // //       final data = docSnapshot.data() as Map<String, dynamic>;
// // // // //       List<dynamic> messages = List.from(data['messages'] ?? []);

// // // // //       // إيجاد الرسالة بناءً على messageId
// // // // //       final updatedMessages =
// // // // //           messages.where((msg) => msg['messageId'] != messageId).toList();

// // // // //       // تحديث حقل message بناءً على آخر رسالة
// // // // //       final lastMessage = updatedMessages.isNotEmpty
// // // // //           ? updatedMessages.last['text'] as String
// // // // //           : '';

// // // // //       // تحديث الـ document
// // // // //       await docRef.update({
// // // // //         'messages': updatedMessages,
// // // // //         'message': lastMessage,
// // // // //         'timestamp': FieldValue.serverTimestamp(),
// // // // //       });

// // // // //       print('Message with ID $messageId deleted successfully');
// // // // //     } catch (e) {
// // // // //       print('Error deleting message: $e');
// // // // //       rethrow;
// // // // //     }
// // // // //   }

// // // // //   Future<void> addChatWithUser(
// // // // //       String userEmail, String userName, String avatar) async {
// // // // //     try {
// // // // //       await _firestore.collection('users_chats').add({
// // // // //         'name': userName,
// // // // //         'email': userEmail,
// // // // //         'avatar': avatar,
// // // // //         'timestamp': FieldValue.serverTimestamp(),
// // // // //         'unreadCount': 0,
// // // // //         'hasCheckmark': false,
// // // // //         'messages': [],
// // // // //         'message': '',
// // // // //       });
// // // // //     } catch (e) {
// // // // //       print('Error adding chat with user: $e');
// // // // //       rethrow;
// // // // //     }
// // // // //   }
// // // // // }

// // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // import 'package:uuid/uuid.dart';

// // // // class ChatRepository {
// // // //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// // // //   final Uuid _uuid = const Uuid();

// // // //   Stream<List<ChatModel>> getChatsStream() {
// // // //     return _firestore
// // // //         .collection('users_chats')
// // // //         .orderBy('timestamp', descending: true)
// // // //         .snapshots()
// // // //         .map((snapshot) =>
// // // //             snapshot.docs.map((doc) => ChatModel.fromFirestore(doc)).toList());
// // // //   }

// // // //   Future<DocumentReference> createChat(ChatModel chat) async {
// // // //     try {
// // // //       return await _firestore.collection('users_chats').add(chat.toFirestore());
// // // //     } catch (e) {
// // // //       print('Error creating chat: $e');
// // // //       rethrow;
// // // //     }
// // // //   }

// // // //   Future<void> deleteChat(String chatId) async {
// // // //     try {
// // // //       await _firestore.collection('users_chats').doc(chatId).delete();
// // // //     } catch (e) {
// // // //       print('Error deleting chat: $e');
// // // //       rethrow;
// // // //     }
// // // //   }

// // // //   Future<void> updateMessages(
// // // //       String chatId, Map<String, dynamic> message) async {
// // // //     try {
// // // //       final messageWithId = {
// // // //         ...message,
// // // //         'messageId': _uuid.v4(),
// // // //         'time': DateTime.now().toIso8601String(),
// // // //       };
// // // //       await _firestore.collection('users_chats').doc(chatId).update({
// // // //         'messages': FieldValue.arrayUnion([messageWithId]),
// // // //         'message': message['text'],
// // // //         'timestamp': FieldValue.serverTimestamp(),
// // // //       });
// // // //     } catch (e) {
// // // //       print('Error updating messages: $e');
// // // //       rethrow;
// // // //     }
// // // //   }

// // // //   Future<void> deleteMessage(String chatId, String messageId) async {
// // // //     try {
// // // //       final docRef = _firestore.collection('users_chats').doc(chatId);
// // // //       final docSnapshot = await docRef.get();

// // // //       if (!docSnapshot.exists) {
// // // //         throw Exception('Chat document does not exist');
// // // //       }

// // // //       final data = docSnapshot.data() as Map<String, dynamic>;
// // // //       List<dynamic> messages = List.from(data['messages'] ?? []);

// // // //       final updatedMessages =
// // // //           messages.where((msg) => msg['messageId'] != messageId).toList();

// // // //       final lastMessage = updatedMessages.isNotEmpty
// // // //           ? updatedMessages.last['text'] as String
// // // //           : '';

// // // //       await docRef.update({
// // // //         'messages': updatedMessages,
// // // //         'message': lastMessage,
// // // //         'timestamp': FieldValue.serverTimestamp(),
// // // //       });

// // // //       print('Message with ID $messageId deleted successfully');
// // // //     } catch (e) {
// // // //       print('Error deleting message: $e');
// // // //       rethrow;
// // // //     }
// // // //   }

// // // //   Future<void> addChatWithUser(
// // // //       String userEmail, String userName, String avatar) async {
// // // //     try {
// // // //       await _firestore.collection('users_chats').add({
// // // //         'name': userName,
// // // //         'email': userEmail,
// // // //         'avatar': avatar,
// // // //         'timestamp': FieldValue.serverTimestamp(),
// // // //         'unreadCount': 0,
// // // //         'hasCheckmark': false,
// // // //         'messages': [],
// // // //         'message': '',
// // // //       });
// // // //     } catch (e) {
// // // //       print('Error adding chat with user: $e');
// // // //       rethrow;
// // // //     }
// // // //   }

// // // //   Future<Map<String, dynamic>?> getUserByEmail(String email) async {
// // // //     try {
// // // //       final querySnapshot = await _firestore
// // // //           .collection('users')
// // // //           .where('email', isEqualTo: email)
// // // //           .limit(1)
// // // //           .get();

// // // //       if (querySnapshot.docs.isNotEmpty) {
// // // //         return querySnapshot.docs.first.data();
// // // //       }
// // // //       return null;
// // // //     } catch (e) {
// // // //       print('Error fetching user by email: $e');
// // // //       return null;
// // // //     }
// // // //   }
// // // // }

// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // import 'package:uuid/uuid.dart';

// // // class ChatRepository {
// // //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// // //   final Uuid _uuid = const Uuid();

// // //   Stream<List<ChatModel>> getChatsStream() {
// // //     return _firestore
// // //         .collection('users_chats')
// // //         .orderBy('timestamp', descending: true)
// // //         .snapshots()
// // //         .map((snapshot) =>
// // //             snapshot.docs.map((doc) => ChatModel.fromFirestore(doc)).toList());
// // //   }

// // //   Future<DocumentReference> createChat(ChatModel chat) async {
// // //     try {
// // //       return await _firestore.collection('users_chats').add(chat.toFirestore());
// // //     } catch (e) {
// // //       print('Error creating chat: $e');
// // //       rethrow;
// // //     }
// // //   }

// // //   Future<void> deleteChat(String chatId) async {
// // //     try {
// // //       await _firestore.collection('users_chats').doc(chatId).delete();
// // //     } catch (e) {
// // //       print('Error deleting chat: $e');
// // //       rethrow;
// // //     }
// // //   }

// // //   Future<void> updateMessages(
// // //       String chatId, Map<String, dynamic> message) async {
// // //     try {
// // //       final messageWithId = {
// // //         ...message,
// // //         'messageId': _uuid.v4(),
// // //         'time': DateTime.now().toIso8601String(),
// // //       };
// // //       await _firestore.collection('users_chats').doc(chatId).update({
// // //         'messages': FieldValue.arrayUnion([messageWithId]),
// // //         'message': message['text'],
// // //         'timestamp': FieldValue.serverTimestamp(),
// // //       });
// // //     } catch (e) {
// // //       print('Error updating messages: $e');
// // //       rethrow;
// // //     }
// // //   }

// // //   Future<void> deleteMessage(String chatId, String messageId) async {
// // //     try {
// // //       final docRef = _firestore.collection('users_chats').doc(chatId);
// // //       final docSnapshot = await docRef.get();

// // //       if (!docSnapshot.exists) {
// // //         throw Exception('Chat document does not exist');
// // //       }

// // //       final data = docSnapshot.data() as Map<String, dynamic>;
// // //       List<dynamic> messages = List.from(data['messages'] ?? []);

// // //       final updatedMessages =
// // //           messages.where((msg) => msg['messageId'] != messageId).toList();

// // //       final lastMessage = updatedMessages.isNotEmpty
// // //           ? updatedMessages.last['text'] as String
// // //           : '';

// // //       await docRef.update({
// // //         'messages': updatedMessages,
// // //         'message': lastMessage,
// // //         'timestamp': FieldValue.serverTimestamp(),
// // //       });

// // //       print('Message with ID $messageId deleted successfully');
// // //     } catch (e) {
// // //       print('Error deleting message: $e');
// // //       rethrow;
// // //     }
// // //   }

// // //   Future<void> addChatWithUser(
// // //       String userEmail, String userName, String avatar) async {
// // //     try {
// // //       await _firestore.collection('users_chats').add({
// // //         'name': userName,
// // //         'email': userEmail,
// // //         'avatar': avatar,
// // //         'timestamp': FieldValue.serverTimestamp(),
// // //         'unreadCount': 0,
// // //         'hasCheckmark': false,
// // //         'messages': [],
// // //         'message': '',
// // //       });
// // //     } catch (e) {
// // //       print('Error adding chat with user: $e');
// // //       rethrow;
// // //     }
// // //   }

// // //   Future<Map<String, dynamic>?> getUserByEmail(String email) async {
// // //     try {
// // //       print('Fetching user with email: $email'); // تصحيح
// // //       final querySnapshot = await _firestore
// // //           .collection('users')
// // //           .where('email', isEqualTo: email)
// // //           .limit(1)
// // //           .get();

// // //       if (querySnapshot.docs.isNotEmpty) {
// // //         final userData = querySnapshot.docs.first.data();
// // //         print('User found: $userData'); // تصحيح
// // //         return userData;
// // //       } else {
// // //         print('No user found for email: $email'); // تصحيح
// // //         return null;
// // //       }
// // //     } catch (e) {
// // //       print('Error fetching user by email: $e');
// // //       return null;
// // //     }
// // //   }
// // // }

// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // import 'package:uuid/uuid.dart';

// // class ChatRepository {
// //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// //   final Uuid _uuid = const Uuid();

// //   Stream<List<ChatModel>> getChatsStream() {
// //     return _firestore
// //         .collection('users_chats')
// //         .orderBy('timestamp', descending: true)
// //         .snapshots()
// //         .map((snapshot) =>
// //             snapshot.docs.map((doc) => ChatModel.fromFirestore(doc)).toList());
// //   }

// //   Future<DocumentReference> createChat(ChatModel chat) async {
// //     try {
// //       return await _firestore.collection('users_chats').add(chat.toFirestore());
// //     } catch (e) {
// //       print('Error creating chat: $e');
// //       rethrow;
// //     }
// //   }

// //   Future<void> deleteChat(String chatId) async {
// //     try {
// //       await _firestore.collection('users_chats').doc(chatId).delete();
// //     } catch (e) {
// //       print('Error deleting chat: $e');
// //       rethrow;
// //     }
// //   }

// //   Future<void> updateMessages(
// //       String chatId, Map<String, dynamic> message) async {
// //     try {
// //       final messageWithId = {
// //         ...message,
// //         'messageId': _uuid.v4(),
// //         'time': DateTime.now().toIso8601String(),
// //       };
// //       await _firestore.collection('users_chats').doc(chatId).update({
// //         'messages': FieldValue.arrayUnion([messageWithId]),
// //         'message': message['text'],
// //         'timestamp': FieldValue.serverTimestamp(),
// //       });
// //     } catch (e) {
// //       print('Error updating messages: $e');
// //       rethrow;
// //     }
// //   }

// //   Future<void> deleteMessage(String chatId, String messageId) async {
// //     try {
// //       final docRef = _firestore.collection('users_chats').doc(chatId);
// //       final docSnapshot = await docRef.get();

// //       if (!docSnapshot.exists) {
// //         throw Exception('Chat document does not exist');
// //       }

// //       final data = docSnapshot.data() as Map<String, dynamic>;
// //       List<dynamic> messages = List.from(data['messages'] ?? []);

// //       final updatedMessages =
// //           messages.where((msg) => msg['messageId'] != messageId).toList();

// //       final lastMessage = updatedMessages.isNotEmpty
// //           ? updatedMessages.last['text'] as String
// //           : '';

// //       await docRef.update({
// //         'messages': updatedMessages,
// //         'message': lastMessage,
// //         'timestamp': FieldValue.serverTimestamp(),
// //       });

// //       print('Message with ID $messageId deleted successfully');
// //     } catch (e) {
// //       print('Error deleting message: $e');
// //       rethrow;
// //     }
// //   }

// //   // Future<void> addChatWithUser(
// //   //     String userEmail, String userName, String image) async {
// //   //   try {
// //   //     await _firestore.collection('users_chats').add({
// //   //       'name': userName,
// //   //       'email': userEmail,
// //   //       'avatar': image,
// //   //       'timestamp': FieldValue.serverTimestamp(),
// //   //       'unreadCount': 0,
// //   //       'hasCheckmark': false,
// //   //       'messages': [],
// //   //       'message': '',
// //   //     });
// //   //   } catch (e) {
// //   //     print('Error adding chat with user: $e');
// //   //     rethrow;
// //   //   }
// //   // }

// //   Future<void> addChatWithUser(
// //       String userEmail, String userName, String image) async {
// //     try {
// //       // Fetch user data from the 'users' collection
// //       final userData = await getUserByEmail(userEmail);
// //       String avatarUrl = image; // Default to provided image if any
// //       if (userData != null &&
// //           userData['image'] != null &&
// //           userData['image'].isNotEmpty) {
// //         avatarUrl =
// //             userData['image'] as String; // Use image from users collection
// //       }

// //       // Add chat to 'users_chats' collection with the fetched avatar
// //       await _firestore.collection('users_chats').add({
// //         'name': userName,
// //         'email': userEmail,
// //         'avatar': avatarUrl, // Store the fetched or provided image
// //         'timestamp': FieldValue.serverTimestamp(),
// //         'unreadCount': 0,
// //         'hasCheckmark': false,
// //         'messages': [],
// //         'message': '',
// //       });
// //     } catch (e) {
// //       print('Error adding chat with user: $e');
// //       rethrow;
// //     }
// //   }

// //   Future<Map<String, dynamic>?> getUserByEmail(String email) async {
// //     try {
// //       print('Fetching user with email: $email');
// //       final querySnapshot = await _firestore
// //           .collection('users')
// //           .where('email', isEqualTo: email)
// //           .limit(1)
// //           .get();

// //       if (querySnapshot.docs.isNotEmpty) {
// //         final userData = querySnapshot.docs.first.data();
// //         print('User found: $userData');
// //         return userData;
// //       } else {
// //         print('No user found for email: $email');
// //         return null;
// //       }
// //     } catch (e) {
// //       print('Error fetching user by email: $e');
// //       return null;
// //     }
// //   }
// // }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:uuid/uuid.dart';

// class ChatRepository {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final Uuid _uuid = const Uuid();

//   // Stream<List<ChatModel>> getChatsStream() {
//   //   return _firestore
//   //       .collection('users_chats')
//   //       .orderBy('timestamp', descending: true)
//   //       .snapshots()
//   //       .map((snapshot) =>
//   //           snapshot.docs.map((doc) => ChatModel.fromFirestore(doc)).toList());
//   // }

//   // Stream<List<ChatModel>> getChatsStream() {
//   //   final user = FirebaseAuth.instance.currentUser;
//   //   if (user == null) {
//   //     return Stream.value([]); // لو مفيش مستخدم، رجع قايمة فاضية
//   //   }
//   //   return _firestore
//   //       .collection('users_chats')
//   //       .where('userId', isEqualTo: user.uid) // فلترة حسب userId
//   //       .orderBy('timestamp', descending: true)
//   //       .snapshots()
//   //       .map((snapshot) =>
//   //           snapshot.docs.map((doc) => ChatModel.fromFirestore(doc)).toList());
//   // }

//   Stream<List<ChatModel>> getChatsStream() {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user == null) {
//       return Stream.value([]);
//     }
//     return _firestore
//         .collection('users_chats')
//         .where('userId', isEqualTo: user.uid) // شرط where على userId
//         .snapshots()
//         .map((snapshot) {
//       // تحويل الوثائق إلى قائمة من ChatModel
//       List<ChatModel> chats =
//           snapshot.docs.map((doc) => ChatModel.fromFirestore(doc)).toList();
//       // ترتيب الشاتات حسب timestamp في الكود
//       chats.sort((a, b) {
//         // تحويل الوقت إلى DateTime للمقارنة
//         DateTime timeA =
//             a.time.isNotEmpty ? DateTime.parse(a.time) : DateTime(0);
//         DateTime timeB =
//             b.time.isNotEmpty ? DateTime.parse(b.time) : DateTime(0);
//         return timeB.compareTo(timeA); // ترتيب تنازلي
//       });
//       return chats;
//     });
//   }

//   Future<DocumentReference> createChat(ChatModel chat) async {
//     try {
//       return await _firestore.collection('users_chats').add(chat.toFirestore());
//     } catch (e) {
//       print('Error creating chat: $e');
//       rethrow;
//     }
//   }

//   Future<void> deleteChat(String chatId) async {
//     try {
//       await _firestore.collection('users_chats').doc(chatId).delete();
//     } catch (e) {
//       print('Error deleting chat: $e');
//       rethrow;
//     }
//   }

//   Future<void> updateChatName(String chatId, String newName) async {
//     try {
//       await _firestore.collection('users_chats').doc(chatId).update({
//         'name': newName,
//         'timestamp': FieldValue.serverTimestamp(),
//       });
//     } catch (e) {
//       print('Error updating chat name: $e');
//       rethrow;
//     }
//   }

//   Future<void> updateUserName(String name) async {
//     try {
//       final user = FirebaseAuth.instance.currentUser;
//       if (user == null) {
//         throw Exception('No user is currently signed in');
//       }

//       final docRef =
//           FirebaseFirestore.instance.collection('users').doc(user.uid);
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
//     } catch (e) {
//       print('Error updating user name: $e');
//       rethrow;
//     }
//   }

//   Future<void> updateMessages(
//       String chatId, Map<String, dynamic> message) async {
//     try {
//       await FirebaseFirestore.instance
//           .collection('users_chats')
//           .doc(chatId)
//           .update({
//         'messages': FieldValue.arrayUnion([message]),
//         'message': message['isImage'] == true ? 'Photo' : message['text'],
//         'timestamp': FieldValue.serverTimestamp(),
//       });
//     } catch (e) {
//       print('Error updating messages: $e');
//       rethrow;
//     }
//   }

//   Future<void> deleteMessage(String chatId, String messageId) async {
//     try {
//       final docRef = _firestore.collection('users_chats').doc(chatId);
//       final docSnapshot = await docRef.get();

//       if (!docSnapshot.exists) {
//         throw Exception('Chat document does not exist');
//       }

//       final data = docSnapshot.data() as Map<String, dynamic>;
//       List<dynamic> messages = List.from(data['messages'] ?? []);

//       final updatedMessages =
//           messages.where((msg) => msg['messageId'] != messageId).toList();

//       final lastMessage = updatedMessages.isNotEmpty
//           ? updatedMessages.last['text'] as String
//           : '';

//       await docRef.update({
//         'messages': updatedMessages,
//         'message': lastMessage,
//         'timestamp': FieldValue.serverTimestamp(),
//       });

//       print('Message with ID $messageId deleted successfully');
//     } catch (e) {
//       print('Error deleting message: $e');
//       rethrow;
//     }
//   }

//   Future<bool> checkIfChatExists(String currentUserId, String email) async {
//     try {
//       print('Checking chat existence for user $currentUserId and email $email');
//       final userSnapshot = await FirebaseFirestore.instance
//           .collection('users')
//           .where('email', isEqualTo: email)
//           .limit(1)
//           .get();
//       if (userSnapshot.docs.isEmpty) {
//         print('No user found with email: $email');
//         return false;
//       }

//       final userId = userSnapshot.docs.first.id;
//       print('Found user with ID: $userId for email: $email');
//       // التحقق من وجود محادثة بالإيميل في users_chats (بغض النظر عن userId)
//       final chatSnapshot = await FirebaseFirestore.instance
//           .collection('users_chats')
//           .where('email', isEqualTo: email)
//           .get();
//       if (chatSnapshot.docs.isNotEmpty) {
//         print(
//             'Chat found for email $email: ${chatSnapshot.docs.map((doc) => doc.data())}');
//         return true;
//       }
//       print('No chat found for email $email');
//       return false;
//     } catch (e) {
//       print('Error checking chat existence: $e');
//       return false;
//     }
//   }

//   Future<void> addChatWithUser(String email, String name, String avatar) async {
//     try {
//       final currentUser = FirebaseAuth.instance.currentUser;
//       if (currentUser == null) {
//         throw Exception('No user logged in');
//       }

//       final chatExists = await checkIfChatExists(currentUser.uid, email);
//       if (chatExists) {
//         print('Chat already exists in addChatWithUser, aborting creation.');
//         throw Exception('توجد محادثة مع هذا البريد الإلكتروني بالفعل.');
//       }

//       // جلب بيانات المستخدم المرتبط بالإيميل
//       final userSnapshot = await FirebaseFirestore.instance
//           .collection('users')
//           .where('email', isEqualTo: email)
//           .limit(1)
//           .get();

//       if (userSnapshot.docs.isEmpty) {
//         throw Exception('User not found');
//       }

//       final userId = userSnapshot.docs.first.id;
//       final userData = userSnapshot.docs.first.data();

//       // إضافة المحادثة في users_chats
//       await FirebaseFirestore.instance.collection('users_chats').add({
//         'userId': currentUser.uid,
//         'name': name.isNotEmpty ? name : userData['name'] ?? '',
//         'email': email,
//         'message': '',
//         'avatar': avatar.isNotEmpty ? avatar : userData['image'] ?? '',
//         'timestamp': FieldValue.serverTimestamp(),
//         'unreadCount': 0,
//         'hasCheckmark': userData['hasCheckmark'] ?? false,
//         'messages': [],
//       });
//     } catch (e) {
//       print('Error adding chat: $e');
//       rethrow;
//     }
//   }

//   Future<Map<String, dynamic>?> getUserByEmail(String email) async {
//     try {
//       print('Fetching user with email: $email');
//       final querySnapshot = await _firestore
//           .collection('users')
//           .where('email', isEqualTo: email)
//           .limit(1)
//           .get();

//       if (querySnapshot.docs.isNotEmpty) {
//         final userData = querySnapshot.docs.first.data();
//         print('User found: $userData');
//         return userData;
//       } else {
//         print('No user found for email: $email');
//         return null;
//       }
//     } catch (e) {
//       print('Error fetching user by email: $e');
//       return null;
//     }
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:attendance_app/features/chats/data/models/chat_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class ChatRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Uuid _uuid = const Uuid();

  // Stream<List<ChatModel>> getChatsStream() {
  //   final user = FirebaseAuth.instance.currentUser;
  //   if (user == null) {
  //     return Stream.value([]);
  //   }
  //   return _firestore
  //       .collection('users_chats')
  //       .where('userId', isEqualTo: user.uid) // شرط where على userId
  //       .snapshots()
  //       .map((snapshot) {
  //     // تحويل الوثائق إلى قائمة من ChatModel
  //     List<ChatModel> chats =
  //         snapshot.docs.map((doc) => ChatModel.fromFirestore(doc)).toList();
  //     // ترتيب الشاتات حسب timestamp في الكود
  //     chats.sort((a, b) {
  //       // تحويل الوقت إلى DateTime للمقارنة
  //       DateTime timeA =
  //           a.time.isNotEmpty ? DateTime.parse(a.time) : DateTime(0);
  //       DateTime timeB =
  //           b.time.isNotEmpty ? DateTime.parse(b.time) : DateTime(0);
  //       return timeB.compareTo(timeA); // ترتيب تنازلي
  //     });
  //     return chats;
  //   });
  // }
///////////////////////////////////////////////////
  // Stream<List<ChatModel>> getChatsStream() {
  //   final user = FirebaseAuth.instance.currentUser;
  //   if (user == null) {
  //     return Stream.value([]);
  //   }
  //   return _firestore
  //       .collection('users_chats')
  //       .where('userId', isEqualTo: user.uid)
  //       .snapshots()
  //       .map((snapshot) {
  //     List<ChatModel> chats =
  //         snapshot.docs.map((doc) => ChatModel.fromFirestore(doc)).toList();
  //     chats.sort((a, b) {
  //       // تحويل الـ time (String) إلى DateTime بأمان
  //       DateTime timeA = DateTime(0);
  //       DateTime timeB = DateTime(0);

  //       if (a.time.isNotEmpty) {
  //         try {
  //           timeA = DateTime.parse(a.time);
  //         } catch (e) {
  //           print('Error parsing time for chat ${a.id}: ${a.time}, error: $e');
  //         }
  //       }

  //       if (b.time.isNotEmpty) {
  //         try {
  //           timeB = DateTime.parse(b.time);
  //         } catch (e) {
  //           print('Error parsing time for chat ${b.id}: ${b.time}, error: $e');
  //         }
  //       }

  //       return timeB.compareTo(timeA); // ترتيب تنازلي
  //     });
  //     return chats;
  //   });
  // }

  Stream<List<ChatModel>> getChatsStream() {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return Stream.value([]);
    }
    return _firestore
        .collection('users_chats')
        .where('userId', isEqualTo: user.uid)
        .snapshots()
        .map((snapshot) {
      List<ChatModel> chats =
          snapshot.docs.map((doc) => ChatModel.fromFirestore(doc)).toList();
      chats.sort((a, b) {
        // استخدام الـ timestamp للترتيب
        DateTime timeA = a.timestamp ?? DateTime(0);
        DateTime timeB = b.timestamp ?? DateTime(0);
        return timeB.compareTo(timeA); // ترتيب تنازلي
      });
      return chats;
    });
  }

  Future<DocumentReference> createChat(ChatModel chat) async {
    try {
      return await _firestore.collection('users_chats').add(chat.toFirestore());
    } catch (e) {
      print('خطأ في إنشاء المحادثة: $e');
      rethrow;
    }
  }

  Future<void> deleteChat(String chatId) async {
    try {
      await _firestore.collection('users_chats').doc(chatId).delete();
    } catch (e) {
      print('خطأ في حذف المحادثة: $e');
      rethrow;
    }
  }

  Future<void> updateChatName(String chatId, String newName) async {
    try {
      await _firestore.collection('users_chats').doc(chatId).update({
        'name': newName,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('خطأ في تحديث اسم المحادثة: $e');
      rethrow;
    }
  }

  Future<void> updateUserName(String name) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception('لا يوجد مستخدم مسجل حاليًا');
      }

      final docRef =
          FirebaseFirestore.instance.collection('users').doc(user.uid);
      final docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        await docRef.update({
          'name': name,
        });
      } else {
        await docRef.set({
          'uid': user.uid,
          'email': user.email ?? '',
          'name': name,
          'image': user.photoURL ?? '',
        });
      }
    } catch (e) {
      print('خطأ في تحديث اسم المستخدم: $e');
      rethrow;
    }
  }

  // Future<void> updateMessages(
  //     String chatId, Map<String, dynamic> message) async {
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection('users_chats')
  //         .doc(chatId)
  //         .update({
  //       'messages': FieldValue.arrayUnion([message]),
  //       'message': message['isImage'] == true ? 'صورة' : message['text'],
  //       'timestamp': FieldValue.serverTimestamp(),
  //     });
  //   } catch (e) {
  //     print('خطأ في تحديث الرسائل: $e');
  //     rethrow;
  //   }
  // }

  Future<void> updateMessages(
      String chatId, Map<String, dynamic> message) async {
    try {
      await FirebaseFirestore.instance
          .collection('users_chats')
          .doc(chatId)
          .update({
        'messages': FieldValue.arrayUnion([
          {
            ...message,
            'originalTime':
                DateTime.now().toIso8601String(), // إضافة originalTime
          }
        ]),
        'message': message['isImage'] == true ? 'Photo' : message['text'],
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error updating messages: $e');
      rethrow;
    }
  }

  Future<void> deleteMessage(String chatId, String messageId) async {
    try {
      final docRef = _firestore.collection('users_chats').doc(chatId);
      final docSnapshot = await docRef.get();

      if (!docSnapshot.exists) {
        throw Exception('وثيقة المحادثة غير موجودة');
      }

      final data = docSnapshot.data() as Map<String, dynamic>;
      List<dynamic> messages = List.from(data['messages'] ?? []);

      final updatedMessages =
          messages.where((msg) => msg['messageId'] != messageId).toList();

      final lastMessage = updatedMessages.isNotEmpty
          ? updatedMessages.last['text'] as String
          : '';

      await docRef.update({
        'messages': updatedMessages,
        'message': lastMessage,
        'timestamp': FieldValue.serverTimestamp(),
      });

      print('تم حذف الرسالة بمعرف $messageId بنجاح');
    } catch (e) {
      print('خطأ في حذف الرسالة: $e');
      rethrow;
    }
  }

  Future<bool> checkIfChatExists(String currentUserId, String email) async {
    try {
      print('التحقق من وجود محادثة للمستخدم $currentUserId بالإيميل $email');
      // التحقق من وجود محادثة للمستخدم الحالي مع الإيميل ده
      final chatSnapshot = await FirebaseFirestore.instance
          .collection('users_chats')
          .where('userId', isEqualTo: currentUserId)
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      if (chatSnapshot.docs.isNotEmpty) {
        print('تم العثور على محادثة للمستخدم $currentUserId بالإيميل $email');
        return true;
      }

      print('لم يتم العثور على محادثة للمستخدم $currentUserId بالإيميل $email');
      return false;
    } catch (e) {
      print('خطأ أثناء التحقق من وجود المحادثة: $e');
      return false;
    }
  }

  Future<void> addChatWithUser(String email, String name, String avatar) async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw Exception('لا يوجد مستخدم مسجل دخول');
      }

      // التحقق من وجود المحادثة للمستخدم الحالي فقط
      final chatExists = await checkIfChatExists(currentUser.uid, email);
      if (chatExists) {
        print('المحادثة موجودة بالفعل في addChatWithUser، لن يتم إنشاؤها.');
        throw Exception(
            'توجد محادثة مع هذا البريد الإلكتروني بالفعل للمستخدم الحالي.');
      }

      // جلب بيانات المستخدم المرتبط بالإيميل (اختياري)
      final userData = await getUserByEmail(email);

      // إضافة المحادثة حتى لو الإيميل مش موجود في users
      await FirebaseFirestore.instance.collection('users_chats').add({
        'userId': currentUser.uid,
        'name': name.isNotEmpty
            ? name
            : (userData != null ? userData['name'] ?? '' : ''), // اسم افتراضي
        'email': email,
        'message': '',
        'avatar': avatar.isNotEmpty
            ? avatar
            : (userData != null
                ? userData['image'] ?? ''
                : ''), // صورة افتراضية
        'timestamp': FieldValue.serverTimestamp(),
        'unreadCount': 0,
        'hasCheckmark':
            userData != null ? userData['hasCheckmark'] ?? false : false,
        'messages': [],
      });

      print('تم إضافة المحادثة بنجاح للإيميل $email');
    } catch (e) {
      print('خطأ أثناء إضافة المحادثة: $e');
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    try {
      print('جلب بيانات المستخدم بالإيميل: $email');
      final querySnapshot = await _firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final userData = querySnapshot.docs.first.data();
        print('تم العثور على المستخدم: $userData');
        return userData;
      } else {
        print('لم يتم العثور على مستخدم بالإيميل: $email');
        return null;
      }
    } catch (e) {
      print('خطأ أثناء جلب بيانات المستخدم بالإيميل: $e');
      return null;
    }
  }
}
