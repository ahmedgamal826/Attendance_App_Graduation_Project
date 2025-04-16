// // // // // // // // // // // import 'dart:io';
// // // // // // // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // // // // // // // import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
// // // // // // // // // // // import 'package:flutter/material.dart';

// // // // // // // // // // // class ChatViewModel extends ChangeNotifier {
// // // // // // // // // // //   final ChatRepository _chatRepository;
// // // // // // // // // // //   List<ChatModel> _chats = [];
// // // // // // // // // // //   List<ChatModel> _filteredChats = [];
// // // // // // // // // // //   bool _isLoading = false;
// // // // // // // // // // //   String? _errorMessage;

// // // // // // // // // // //   // List<ChatModel> get chats => _chats;
// // // // // // // // // // //   List<ChatModel> get chats => _filteredChats.isEmpty ? _chats : _filteredChats;

// // // // // // // // // // //   bool get isLoading => _isLoading;
// // // // // // // // // // //   String? get errorMessage => _errorMessage;

// // // // // // // // // // //   ChatViewModel(this._chatRepository) {
// // // // // // // // // // //     fetchChats();
// // // // // // // // // // //   }

// // // // // // // // // // //   Future<void> fetchChats() async {
// // // // // // // // // // //     _isLoading = true;
// // // // // // // // // // //     notifyListeners();

// // // // // // // // // // //     try {
// // // // // // // // // // //       _chats = await _chatRepository.getChats();
// // // // // // // // // // //       _filteredChats = []; // reset filter
// // // // // // // // // // //     } catch (e) {
// // // // // // // // // // //       _errorMessage = 'Failed to fetch chats: $e';
// // // // // // // // // // //     } finally {
// // // // // // // // // // //       _isLoading = false;
// // // // // // // // // // //       notifyListeners();
// // // // // // // // // // //     }
// // // // // // // // // // //   }

// // // // // // // // // // //   void filterChats(String query) {
// // // // // // // // // // //     if (query.isEmpty) {
// // // // // // // // // // //       _filteredChats = [];
// // // // // // // // // // //     } else {
// // // // // // // // // // //       _filteredChats = _chats
// // // // // // // // // // //           .where((chat) =>
// // // // // // // // // // //               chat.name.toLowerCase().contains(query.toLowerCase()) ||
// // // // // // // // // // //               chat.message.toLowerCase().contains(query.toLowerCase()))
// // // // // // // // // // //           .toList();
// // // // // // // // // // //     }
// // // // // // // // // // //     notifyListeners();
// // // // // // // // // // //   }

// // // // // // // // // // //   Future<void> createChat({
// // // // // // // // // // //     required String name,
// // // // // // // // // // //     required String message,
// // // // // // // // // // //     required String time,
// // // // // // // // // // //     required int unreadCount,
// // // // // // // // // // //     required String avatar,
// // // // // // // // // // //     required bool hasCheckmark,
// // // // // // // // // // //     File? image, // Keeping this optional for potential image handling
// // // // // // // // // // //   }) async {
// // // // // // // // // // //     _isLoading = true;
// // // // // // // // // // //     _errorMessage = null;
// // // // // // // // // // //     notifyListeners();

// // // // // // // // // // //     try {
// // // // // // // // // // //       final newChat = ChatModel(
// // // // // // // // // // //         name: name,
// // // // // // // // // // //         message: message,
// // // // // // // // // // //         time: time,
// // // // // // // // // // //         unreadCount: unreadCount,
// // // // // // // // // // //         avatar: avatar, // Could use image?.path if an image is provided
// // // // // // // // // // //         hasCheckmark: hasCheckmark,
// // // // // // // // // // //       );
// // // // // // // // // // //       await _chatRepository.createChat(newChat);
// // // // // // // // // // //       _chats.add(newChat);
// // // // // // // // // // //     } catch (e) {
// // // // // // // // // // //       _errorMessage = 'Failed to create chat: $e';
// // // // // // // // // // //     } finally {
// // // // // // // // // // //       _isLoading = false;
// // // // // // // // // // //       notifyListeners();
// // // // // // // // // // //     }
// // // // // // // // // // //   }

// // // // // // // // // // //   Future<void> deleteChat(int index) async {
// // // // // // // // // // //     _isLoading = true;
// // // // // // // // // // //     notifyListeners();

// // // // // // // // // // //     try {
// // // // // // // // // // //       final chatToDelete = _chats[index];
// // // // // // // // // // //       await _chatRepository
// // // // // // // // // // //           .deleteChat(chatToDelete); // استدعاء الـ repository لحذف الشات
// // // // // // // // // // //       _chats.removeAt(index); // حذف الشات من القايمة المحلية
// // // // // // // // // // //     } catch (e) {
// // // // // // // // // // //       _errorMessage = 'Failed to delete chat: $e';
// // // // // // // // // // //     } finally {
// // // // // // // // // // //       _isLoading = false;
// // // // // // // // // // //       notifyListeners();
// // // // // // // // // // //     }
// // // // // // // // // // //   }
// // // // // // // // // // // }

// // // // // // // // // // import 'dart:io';
// // // // // // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // // // // // // import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
// // // // // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // // // // // import 'package:flutter/material.dart';

// // // // // // // // // // class ChatViewModel extends ChangeNotifier {
// // // // // // // // // //   final ChatRepository _chatRepository;
// // // // // // // // // //   List<ChatModel> _chats = [];
// // // // // // // // // //   List<ChatModel> _filteredChats = [];
// // // // // // // // // //   bool _isLoading = false;
// // // // // // // // // //   String? _errorMessage;

// // // // // // // // // //   List<ChatModel> get chats => _filteredChats.isEmpty ? _chats : _filteredChats;
// // // // // // // // // //   bool get isLoading => _isLoading;
// // // // // // // // // //   String? get errorMessage => _errorMessage;

// // // // // // // // // //   ChatViewModel(this._chatRepository) {
// // // // // // // // // //     fetchChats();
// // // // // // // // // //   }

// // // // // // // // // //   Future<void> fetchChats() async {
// // // // // // // // // //     _isLoading = true;
// // // // // // // // // //     notifyListeners();

// // // // // // // // // //     try {
// // // // // // // // // //       _chats = await _chatRepository.getChats();
// // // // // // // // // //       _filteredChats = [];
// // // // // // // // // //     } catch (e) {
// // // // // // // // // //       _errorMessage = 'Failed to fetch chats: $e';
// // // // // // // // // //     } finally {
// // // // // // // // // //       _isLoading = false;
// // // // // // // // // //       notifyListeners();
// // // // // // // // // //     }
// // // // // // // // // //   }

// // // // // // // // // //   void filterChats(String query) {
// // // // // // // // // //     if (query.isEmpty) {
// // // // // // // // // //       _filteredChats = [];
// // // // // // // // // //     } else {
// // // // // // // // // //       _filteredChats = _chats
// // // // // // // // // //           .where((chat) =>
// // // // // // // // // //               chat.name.toLowerCase().contains(query.toLowerCase()) ||
// // // // // // // // // //               chat.message.toLowerCase().contains(query.toLowerCase()))
// // // // // // // // // //           .toList();
// // // // // // // // // //     }
// // // // // // // // // //     notifyListeners();
// // // // // // // // // //   }

// // // // // // // // // //   Future<void> createChat({
// // // // // // // // // //     required String name,
// // // // // // // // // //     required String message,
// // // // // // // // // //     required String time,
// // // // // // // // // //     required int unreadCount,
// // // // // // // // // //     required String avatar,
// // // // // // // // // //     required bool hasCheckmark,
// // // // // // // // // //     File? image,
// // // // // // // // // //     required String email, // إضافة المعلم email
// // // // // // // // // //   }) async {
// // // // // // // // // //     _isLoading = true;
// // // // // // // // // //     _errorMessage = null;
// // // // // // // // // //     notifyListeners();

// // // // // // // // // //     try {
// // // // // // // // // //       final newChat = ChatModel(
// // // // // // // // // //         id: '', // سيتم تعيينه تلقائيًا من Firestore
// // // // // // // // // //         name: name,
// // // // // // // // // //         message: message,
// // // // // // // // // //         time: time,
// // // // // // // // // //         unreadCount: unreadCount,
// // // // // // // // // //         avatar: avatar,
// // // // // // // // // //         hasCheckmark: hasCheckmark,
// // // // // // // // // //         email: email, // استخدام الإيميل المرسل
// // // // // // // // // //         messages: [],
// // // // // // // // // //       );
// // // // // // // // // //       await _chatRepository.createChat(newChat);
// // // // // // // // // //       _chats.add(newChat); // Update local list (optional, can fetch again)
// // // // // // // // // //     } catch (e) {
// // // // // // // // // //       _errorMessage = 'Failed to create chat: $e';
// // // // // // // // // //     } finally {
// // // // // // // // // //       _isLoading = false;
// // // // // // // // // //       notifyListeners();
// // // // // // // // // //     }
// // // // // // // // // //   }

// // // // // // // // // //   Future<void> deleteChat(String chatId) async {
// // // // // // // // // //     _isLoading = true;
// // // // // // // // // //     notifyListeners();

// // // // // // // // // //     try {
// // // // // // // // // //       await _chatRepository.deleteChat(chatId);
// // // // // // // // // //       _chats.removeWhere((chat) => chat.id == chatId);
// // // // // // // // // //     } catch (e) {
// // // // // // // // // //       _errorMessage = 'Failed to delete chat: $e';
// // // // // // // // // //     } finally {
// // // // // // // // // //       _isLoading = false;
// // // // // // // // // //       notifyListeners();
// // // // // // // // // //     }
// // // // // // // // // //   }

// // // // // // // // // //   Future<void> sendMessage(String chatId, String text, bool isMe) async {
// // // // // // // // // //     final message = {
// // // // // // // // // //       'text': text,
// // // // // // // // // //       'isMe': isMe,
// // // // // // // // // //       'time': FieldValue.serverTimestamp(),
// // // // // // // // // //     };
// // // // // // // // // //     await _chatRepository.updateMessages(chatId, message);
// // // // // // // // // //     fetchChats(); // Refresh chats to update the last message
// // // // // // // // // //   }
// // // // // // // // // // }

// // // // // // // // // import 'dart:async';
// // // // // // // // // import 'dart:io';
// // // // // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // // // // // import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
// // // // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // // // // import 'package:flutter/material.dart';

// // // // // // // // // class ChatViewModel extends ChangeNotifier {
// // // // // // // // //   final ChatRepository _chatRepository;
// // // // // // // // //   List<ChatModel> _chats = [];
// // // // // // // // //   List<ChatModel> _filteredChats = [];
// // // // // // // // //   bool _isLoading = false;
// // // // // // // // //   String? _errorMessage;
// // // // // // // // //   late StreamSubscription _chatSubscription;

// // // // // // // // //   List<ChatModel> get chats => _filteredChats.isEmpty ? _chats : _filteredChats;
// // // // // // // // //   bool get isLoading => _isLoading;
// // // // // // // // //   String? get errorMessage => _errorMessage;

// // // // // // // // //   ChatViewModel(this._chatRepository) {
// // // // // // // // //     _startListeningToChats();
// // // // // // // // //   }

// // // // // // // // //   void _startListeningToChats() {
// // // // // // // // //     _isLoading = true;
// // // // // // // // //     notifyListeners();

// // // // // // // // //     _chatSubscription = _chatRepository.getChatsStream().listen(
// // // // // // // // //       (chats) {
// // // // // // // // //         _chats = chats;
// // // // // // // // //         _filteredChats = [];
// // // // // // // // //         _isLoading = false;
// // // // // // // // //         _errorMessage = null;
// // // // // // // // //         notifyListeners();
// // // // // // // // //       },
// // // // // // // // //       onError: (e) {
// // // // // // // // //         _errorMessage = 'Failed to fetch chats: $e';
// // // // // // // // //         _isLoading = false;
// // // // // // // // //         notifyListeners();
// // // // // // // // //       },
// // // // // // // // //     );
// // // // // // // // //   }

// // // // // // // // //   void filterChats(String query) {
// // // // // // // // //     if (query.isEmpty) {
// // // // // // // // //       _filteredChats = [];
// // // // // // // // //     } else {
// // // // // // // // //       _filteredChats = _chats
// // // // // // // // //           .where((chat) =>
// // // // // // // // //               chat.name.toLowerCase().contains(query.toLowerCase()) ||
// // // // // // // // //               chat.message.toLowerCase().contains(query.toLowerCase()))
// // // // // // // // //           .toList();
// // // // // // // // //     }
// // // // // // // // //     notifyListeners();
// // // // // // // // //   }

// // // // // // // // //   Future<void> createChat({
// // // // // // // // //     required String name,
// // // // // // // // //     required String message,
// // // // // // // // //     required String time,
// // // // // // // // //     required int unreadCount,
// // // // // // // // //     required String avatar,
// // // // // // // // //     required bool hasCheckmark,
// // // // // // // // //     File? image,
// // // // // // // // //     required String email,
// // // // // // // // //   }) async {
// // // // // // // // //     _isLoading = true;
// // // // // // // // //     _errorMessage = null;
// // // // // // // // //     notifyListeners();

// // // // // // // // //     try {
// // // // // // // // //       final newChat = ChatModel(
// // // // // // // // //         id: '',
// // // // // // // // //         name: name,
// // // // // // // // //         message: message,
// // // // // // // // //         time: time,
// // // // // // // // //         unreadCount: unreadCount,
// // // // // // // // //         avatar: avatar,
// // // // // // // // //         hasCheckmark: hasCheckmark,
// // // // // // // // //         email: email,
// // // // // // // // //         messages: [],
// // // // // // // // //       );
// // // // // // // // //       await _chatRepository.createChat(newChat);
// // // // // // // // //     } catch (e) {
// // // // // // // // //       _errorMessage = 'Failed to create chat: $e';
// // // // // // // // //     } finally {
// // // // // // // // //       _isLoading = false;
// // // // // // // // //       notifyListeners();
// // // // // // // // //     }
// // // // // // // // //   }

// // // // // // // // //   Future<void> deleteChat(String chatId) async {
// // // // // // // // //     _isLoading = true;
// // // // // // // // //     notifyListeners();

// // // // // // // // //     try {
// // // // // // // // //       await _chatRepository.deleteChat(chatId);
// // // // // // // // //       _chats.removeWhere((chat) => chat.id == chatId);
// // // // // // // // //     } catch (e) {
// // // // // // // // //       _errorMessage = 'Failed to delete chat: $e';
// // // // // // // // //     } finally {
// // // // // // // // //       _isLoading = false;
// // // // // // // // //       notifyListeners();
// // // // // // // // //     }
// // // // // // // // //   }

// // // // // // // // //   Future<void> sendMessage(String chatId, String text, bool isMe) async {
// // // // // // // // //     final message = {
// // // // // // // // //       'text': text,
// // // // // // // // //       'isMe': isMe,
// // // // // // // // //       'time': FieldValue.serverTimestamp(),
// // // // // // // // //     };
// // // // // // // // //     await _chatRepository.updateMessages(chatId, message);
// // // // // // // // //     // No need to fetch again, Stream will handle it
// // // // // // // // //   }

// // // // // // // // //   @override
// // // // // // // // //   void dispose() {
// // // // // // // // //     _chatSubscription.cancel();
// // // // // // // // //     super.dispose();
// // // // // // // // //   }
// // // // // // // // // }

// // // // // // // // import 'dart:async';
// // // // // // // // import 'dart:io';
// // // // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // // // // import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
// // // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // // // import 'package:flutter/material.dart';

// // // // // // // // class ChatViewModel extends ChangeNotifier {
// // // // // // // //   final ChatRepository _chatRepository;
// // // // // // // //   List<ChatModel> _chats = [];
// // // // // // // //   List<ChatModel> _filteredChats = [];
// // // // // // // //   bool _isLoading = false;
// // // // // // // //   String? _errorMessage;
// // // // // // // //   late StreamSubscription _chatSubscription;

// // // // // // // //   List<ChatModel> get chats => _filteredChats.isEmpty ? _chats : _filteredChats;
// // // // // // // //   bool get isLoading => _isLoading;
// // // // // // // //   String? get errorMessage => _errorMessage;

// // // // // // // //   ChatViewModel(this._chatRepository) {
// // // // // // // //     _startListeningToChats();
// // // // // // // //   }

// // // // // // // //   void _startListeningToChats() {
// // // // // // // //     _isLoading = true;
// // // // // // // //     notifyListeners();

// // // // // // // //     _chatSubscription = _chatRepository.getChatsStream().listen(
// // // // // // // //       (chats) {
// // // // // // // //         _chats = chats;
// // // // // // // //         _filteredChats = [];
// // // // // // // //         _isLoading = false;
// // // // // // // //         _errorMessage = null;
// // // // // // // //         notifyListeners();
// // // // // // // //       },
// // // // // // // //       onError: (e) {
// // // // // // // //         _errorMessage = 'Failed to fetch chats: $e';
// // // // // // // //         _isLoading = false;
// // // // // // // //         notifyListeners();
// // // // // // // //       },
// // // // // // // //     );
// // // // // // // //   }

// // // // // // // //   void filterChats(String query) {
// // // // // // // //     if (query.isEmpty) {
// // // // // // // //       _filteredChats = [];
// // // // // // // //     } else {
// // // // // // // //       _filteredChats = _chats
// // // // // // // //           .where((chat) =>
// // // // // // // //               chat.name.toLowerCase().contains(query.toLowerCase()) ||
// // // // // // // //               chat.message.toLowerCase().contains(query.toLowerCase()))
// // // // // // // //           .toList();
// // // // // // // //     }
// // // // // // // //     notifyListeners();
// // // // // // // //   }

// // // // // // // //   Future<void> createChat({
// // // // // // // //     required String name,
// // // // // // // //     required String message,
// // // // // // // //     required String time,
// // // // // // // //     required int unreadCount,
// // // // // // // //     required String avatar,
// // // // // // // //     required bool hasCheckmark,
// // // // // // // //     File? image,
// // // // // // // //     required String email,
// // // // // // // //   }) async {
// // // // // // // //     _isLoading = true;
// // // // // // // //     _errorMessage = null;
// // // // // // // //     notifyListeners();

// // // // // // // //     try {
// // // // // // // //       final newChat = ChatModel(
// // // // // // // //         id: '',
// // // // // // // //         name: name,
// // // // // // // //         message: message,
// // // // // // // //         time: time,
// // // // // // // //         unreadCount: unreadCount,
// // // // // // // //         avatar: avatar,
// // // // // // // //         hasCheckmark: hasCheckmark,
// // // // // // // //         email: email,
// // // // // // // //         messages: [],
// // // // // // // //       );
// // // // // // // //       final docRef = await _chatRepository.createChat(newChat);
// // // // // // // //       final updatedChat = ChatModel(
// // // // // // // //         id: docRef.id,
// // // // // // // //         name: name,
// // // // // // // //         message: message,
// // // // // // // //         time: time,
// // // // // // // //         unreadCount: unreadCount,
// // // // // // // //         avatar: avatar,
// // // // // // // //         hasCheckmark: hasCheckmark,
// // // // // // // //         email: email,
// // // // // // // //         messages: [],
// // // // // // // //       );
// // // // // // // //       _chats.add(updatedChat);
// // // // // // // //     } catch (e) {
// // // // // // // //       _errorMessage = 'Failed to create chat: $e';
// // // // // // // //     } finally {
// // // // // // // //       _isLoading = false;
// // // // // // // //       notifyListeners();
// // // // // // // //     }
// // // // // // // //   }

// // // // // // // //   Future<void> addChatWithUser(String email, String name, String avatar) async {
// // // // // // // //     _isLoading = true;
// // // // // // // //     _errorMessage = null;
// // // // // // // //     notifyListeners();

// // // // // // // //     try {
// // // // // // // //       await _chatRepository.addChatWithUser(email, name, avatar);
// // // // // // // //     } catch (e) {
// // // // // // // //       _errorMessage = 'Failed to add chat: $e';
// // // // // // // //     } finally {
// // // // // // // //       _isLoading = false;
// // // // // // // //       notifyListeners();
// // // // // // // //     }
// // // // // // // //   }

// // // // // // // //   Future<void> deleteChat(String chatId) async {
// // // // // // // //     _isLoading = true;
// // // // // // // //     notifyListeners();

// // // // // // // //     try {
// // // // // // // //       await _chatRepository.deleteChat(chatId);
// // // // // // // //       _chats.removeWhere((chat) => chat.id == chatId);
// // // // // // // //     } catch (e) {
// // // // // // // //       _errorMessage = 'Failed to delete chat: $e';
// // // // // // // //     } finally {
// // // // // // // //       _isLoading = false;
// // // // // // // //       notifyListeners();
// // // // // // // //     }
// // // // // // // //   }

// // // // // // // //   Future<void> sendMessage(String chatId, String text, bool isMe) async {
// // // // // // // //     final message = {
// // // // // // // //       'text': text,
// // // // // // // //       'isMe': isMe,
// // // // // // // //       'time': FieldValue.serverTimestamp(),
// // // // // // // //     };
// // // // // // // //     await _chatRepository.updateMessages(chatId, message);
// // // // // // // //   }

// // // // // // // //   @override
// // // // // // // //   void dispose() {
// // // // // // // //     _chatSubscription.cancel();
// // // // // // // //     super.dispose();
// // // // // // // //   }
// // // // // // // // }

// // // // // // // import 'dart:async';
// // // // // // // import 'dart:io';
// // // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // // // import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
// // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // // import 'package:flutter/material.dart';

// // // // // // // class ChatViewModel extends ChangeNotifier {
// // // // // // //   final ChatRepository _chatRepository;
// // // // // // //   List<ChatModel> _chats = [];
// // // // // // //   List<ChatModel> _filteredChats = [];
// // // // // // //   bool _isLoading = false;
// // // // // // //   String? _errorMessage;
// // // // // // //   late StreamSubscription _chatSubscription;

// // // // // // //   List<ChatModel> get chats => _filteredChats.isEmpty ? _chats : _filteredChats;
// // // // // // //   bool get isLoading => _isLoading;
// // // // // // //   String? get errorMessage => _errorMessage;

// // // // // // //   ChatViewModel(this._chatRepository) {
// // // // // // //     _startListeningToChats();
// // // // // // //   }

// // // // // // //   void _startListeningToChats() {
// // // // // // //     _isLoading = true;
// // // // // // //     notifyListeners();

// // // // // // //     _chatSubscription = _chatRepository.getChatsStream().listen(
// // // // // // //       (chats) {
// // // // // // //         _chats = chats;
// // // // // // //         _filteredChats = [];
// // // // // // //         _isLoading = false;
// // // // // // //         _errorMessage = null;
// // // // // // //         notifyListeners();
// // // // // // //       },
// // // // // // //       onError: (e) {
// // // // // // //         _errorMessage = 'Failed to fetch chats: $e';
// // // // // // //         _isLoading = false;
// // // // // // //         notifyListeners();
// // // // // // //       },
// // // // // // //     );
// // // // // // //   }

// // // // // // //   void filterChats(String query) {
// // // // // // //     if (query.isEmpty) {
// // // // // // //       _filteredChats = [];
// // // // // // //     } else {
// // // // // // //       _filteredChats = _chats
// // // // // // //           .where((chat) =>
// // // // // // //               chat.name.toLowerCase().contains(query.toLowerCase()) ||
// // // // // // //               chat.message.toLowerCase().contains(query.toLowerCase()))
// // // // // // //           .toList();
// // // // // // //     }
// // // // // // //     notifyListeners();
// // // // // // //   }

// // // // // // //   Future<void> createChat({
// // // // // // //     required String name,
// // // // // // //     required String message,
// // // // // // //     required String time,
// // // // // // //     required int unreadCount,
// // // // // // //     required String avatar,
// // // // // // //     required bool hasCheckmark,
// // // // // // //     File? image,
// // // // // // //     required String email,
// // // // // // //   }) async {
// // // // // // //     _isLoading = true;
// // // // // // //     _errorMessage = null;
// // // // // // //     notifyListeners();

// // // // // // //     try {
// // // // // // //       final newChat = ChatModel(
// // // // // // //         id: '',
// // // // // // //         name: name,
// // // // // // //         message: message,
// // // // // // //         time: time,
// // // // // // //         unreadCount: unreadCount,
// // // // // // //         avatar: avatar,
// // // // // // //         hasCheckmark: hasCheckmark,
// // // // // // //         email: email,
// // // // // // //         messages: [],
// // // // // // //       );
// // // // // // //       final docRef = await _chatRepository.createChat(newChat);
// // // // // // //       final updatedChat = ChatModel(
// // // // // // //         id: docRef.id,
// // // // // // //         name: name,
// // // // // // //         message: message,
// // // // // // //         time: time,
// // // // // // //         unreadCount: unreadCount,
// // // // // // //         avatar: avatar,
// // // // // // //         hasCheckmark: hasCheckmark,
// // // // // // //         email: email,
// // // // // // //         messages: [],
// // // // // // //       );
// // // // // // //       _chats.add(updatedChat);
// // // // // // //     } catch (e) {
// // // // // // //       _errorMessage = 'Failed to create chat: $e';
// // // // // // //     } finally {
// // // // // // //       _isLoading = false;
// // // // // // //       notifyListeners();
// // // // // // //     }
// // // // // // //   }

// // // // // // //   Future<void> addChatWithUser(String email, String name, String avatar) async {
// // // // // // //     _isLoading = true;
// // // // // // //     _errorMessage = null;
// // // // // // //     notifyListeners();

// // // // // // //     try {
// // // // // // //       await _chatRepository.addChatWithUser(email, name, avatar);
// // // // // // //     } catch (e) {
// // // // // // //       _errorMessage = 'Failed to add chat: $e';
// // // // // // //     } finally {
// // // // // // //       _isLoading = false;
// // // // // // //       notifyListeners();
// // // // // // //     }
// // // // // // //   }

// // // // // // //   Future<void> deleteChat(String chatId) async {
// // // // // // //     _isLoading = true;
// // // // // // //     notifyListeners();

// // // // // // //     try {
// // // // // // //       await _chatRepository.deleteChat(chatId);
// // // // // // //       _chats.removeWhere((chat) => chat.id == chatId);
// // // // // // //     } catch (e) {
// // // // // // //       _errorMessage = 'Failed to delete chat: $e';
// // // // // // //     } finally {
// // // // // // //       _isLoading = false;
// // // // // // //       notifyListeners();
// // // // // // //     }
// // // // // // //   }

// // // // // // //   Future<void> sendMessage(String chatId, String text, bool isMe) async {
// // // // // // //     _errorMessage = null;
// // // // // // //     notifyListeners();

// // // // // // //     try {
// // // // // // //       final message = {
// // // // // // //         'text': text,
// // // // // // //         'isMe': isMe,
// // // // // // //         'time': DateTime.now().toIso8601String(),
// // // // // // //       };
// // // // // // //       await _chatRepository.updateMessages(chatId, message);
// // // // // // //       // تحديث محلي للدردشة
// // // // // // //       final chatIndex = _chats.indexWhere((chat) => chat.id == chatId);
// // // // // // //       if (chatIndex != -1) {
// // // // // // //         final updatedMessages =
// // // // // // //             List<Map<String, dynamic>>.from(_chats[chatIndex].messages)
// // // // // // //               ..add(message);
// // // // // // //         _chats[chatIndex] = ChatModel(
// // // // // // //           id: _chats[chatIndex].id,
// // // // // // //           name: _chats[chatIndex].name,
// // // // // // //           message: text,
// // // // // // //           time: DateTime.now().toString().substring(11, 16),
// // // // // // //           unreadCount: _chats[chatIndex].unreadCount,
// // // // // // //           avatar: _chats[chatIndex].avatar,
// // // // // // //           hasCheckmark: _chats[chatIndex].hasCheckmark,
// // // // // // //           email: _chats[chatIndex].email,
// // // // // // //           messages: updatedMessages,
// // // // // // //         );
// // // // // // //         notifyListeners();
// // // // // // //       }
// // // // // // //     } catch (e) {
// // // // // // //       _errorMessage = 'Failed to send message: $e';
// // // // // // //       notifyListeners();
// // // // // // //     }
// // // // // // //   }

// // // // // // //   @override
// // // // // // //   void dispose() {
// // // // // // //     _chatSubscription.cancel();
// // // // // // //     super.dispose();
// // // // // // //   }
// // // // // // // }

// // // // // // import 'dart:async';
// // // // // // import 'dart:io';
// // // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // // import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
// // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // import 'package:flutter/material.dart';

// // // // // // class ChatViewModel extends ChangeNotifier {
// // // // // //   final ChatRepository _chatRepository;
// // // // // //   List<ChatModel> _chats = [];
// // // // // //   List<ChatModel> _filteredChats = [];
// // // // // //   bool _isLoading = false;
// // // // // //   String? _errorMessage;
// // // // // //   late StreamSubscription _chatSubscription;

// // // // // //   List<ChatModel> get chats => _filteredChats.isEmpty ? _chats : _filteredChats;
// // // // // //   bool get isLoading => _isLoading;
// // // // // //   String? get errorMessage => _errorMessage;

// // // // // //   ChatViewModel(this._chatRepository) {
// // // // // //     _startListeningToChats();
// // // // // //   }

// // // // // //   void _startListeningToChats() {
// // // // // //     _isLoading = true;
// // // // // //     notifyListeners();

// // // // // //     _chatSubscription = _chatRepository.getChatsStream().listen(
// // // // // //       (chats) {
// // // // // //         _chats = chats;
// // // // // //         _filteredChats = [];
// // // // // //         _isLoading = false;
// // // // // //         _errorMessage = null;
// // // // // //         notifyListeners();
// // // // // //       },
// // // // // //       onError: (e) {
// // // // // //         _errorMessage = 'Failed to fetch chats: $e';
// // // // // //         _isLoading = false;
// // // // // //         notifyListeners();
// // // // // //       },
// // // // // //     );
// // // // // //   }

// // // // // //   void filterChats(String query) {
// // // // // //     if (query.isEmpty) {
// // // // // //       _filteredChats = [];
// // // // // //     } else {
// // // // // //       _filteredChats = _chats
// // // // // //           .where((chat) =>
// // // // // //               chat.name.toLowerCase().contains(query.toLowerCase()) ||
// // // // // //               chat.message.toLowerCase().contains(query.toLowerCase()))
// // // // // //           .toList();
// // // // // //     }
// // // // // //     notifyListeners();
// // // // // //   }

// // // // // //   Future<void> createChat({
// // // // // //     required String name,
// // // // // //     required String message,
// // // // // //     required String time,
// // // // // //     required int unreadCount,
// // // // // //     required String avatar,
// // // // // //     required bool hasCheckmark,
// // // // // //     File? image,
// // // // // //     required String email,
// // // // // //   }) async {
// // // // // //     _isLoading = true;
// // // // // //     _errorMessage = null;
// // // // // //     notifyListeners();

// // // // // //     try {
// // // // // //       final newChat = ChatModel(
// // // // // //         id: '',
// // // // // //         name: name,
// // // // // //         message: message,
// // // // // //         time: time,
// // // // // //         unreadCount: unreadCount,
// // // // // //         avatar: avatar,
// // // // // //         hasCheckmark: hasCheckmark,
// // // // // //         email: email,
// // // // // //         messages: [],
// // // // // //       );
// // // // // //       final docRef = await _chatRepository.createChat(newChat);
// // // // // //       final updatedChat = ChatModel(
// // // // // //         id: docRef.id,
// // // // // //         name: name,
// // // // // //         message: message,
// // // // // //         time: time,
// // // // // //         unreadCount: unreadCount,
// // // // // //         avatar: avatar,
// // // // // //         hasCheckmark: hasCheckmark,
// // // // // //         email: email,
// // // // // //         messages: [],
// // // // // //       );
// // // // // //       _chats.add(updatedChat);
// // // // // //     } catch (e) {
// // // // // //       _errorMessage = 'Failed to create chat: $e';
// // // // // //     } finally {
// // // // // //       _isLoading = false;
// // // // // //       notifyListeners();
// // // // // //     }
// // // // // //   }

// // // // // //   Future<void> addChatWithUser(String email, String name, String avatar) async {
// // // // // //     _isLoading = true;
// // // // // //     _errorMessage = null;
// // // // // //     notifyListeners();

// // // // // //     try {
// // // // // //       await _chatRepository.addChatWithUser(email, name, avatar);
// // // // // //     } catch (e) {
// // // // // //       _errorMessage = 'Failed to add chat: $e';
// // // // // //     } finally {
// // // // // //       _isLoading = false;
// // // // // //       notifyListeners();
// // // // // //     }
// // // // // //   }

// // // // // //   Future<void> deleteChat(String chatId) async {
// // // // // //     _isLoading = true;
// // // // // //     notifyListeners();

// // // // // //     try {
// // // // // //       await _chatRepository.deleteChat(chatId);
// // // // // //       _chats.removeWhere((chat) => chat.id == chatId);
// // // // // //     } catch (e) {
// // // // // //       _errorMessage = 'Failed to delete chat: $e';
// // // // // //     } finally {
// // // // // //       _isLoading = false;
// // // // // //       notifyListeners();
// // // // // //     }
// // // // // //   }

// // // // // //   Future<void> sendMessage(String chatId, String text, bool isMe) async {
// // // // // //     _errorMessage = null;
// // // // // //     notifyListeners();

// // // // // //     try {
// // // // // //       final message = {
// // // // // //         'text': text,
// // // // // //         'isMe': isMe,
// // // // // //         'time': DateTime.now().toIso8601String(),
// // // // // //       };
// // // // // //       await _chatRepository.updateMessages(chatId, message);
// // // // // //       // تحديث محلي للدردشة
// // // // // //       final chatIndex = _chats.indexWhere((chat) => chat.id == chatId);
// // // // // //       if (chatIndex != -1) {
// // // // // //         final updatedMessages = List<Map<String, dynamic>>.from(_chats[chatIndex].messages)..add(message);
// // // // // //         _chats[chatIndex] = ChatModel(
// // // // // //           id: _chats[chatIndex].id,
// // // // // //           name: _chats[chatIndex].name,
// // // // // //           message: text,
// // // // // //           time: DateTime.now().toString().substring(11, 16),
// // // // // //           unreadCount: _chats[chatIndex].unreadCount + 1, // زيادة عدد الرسائل غير المقروءة
// // // // // //           avatar: _chats[chatIndex].avatar,
// // // // // //           hasCheckmark: _chats[chatIndex].hasCheckmark,
// // // // // //           email: _chats[chatIndex].email,
// // // // // //           messages: updatedMessages,
// // // // // //         );
// // // // // //         notifyListeners();
// // // // // //       }
// // // // // //     } catch (e) {
// // // // // //       _errorMessage = 'Failed to send message: $e';
// // // // // //       notifyListeners();
// // // // // //     }
// // // // // //   }

// // // // // //   @override
// // // // // //   void dispose() {
// // // // // //     _chatSubscription.cancel();
// // // // // //     super.dispose();
// // // // // //   }
// // // // // // }

// // // // // import 'dart:async';
// // // // // import 'dart:io';
// // // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // // import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
// // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // import 'package:flutter/material.dart';

// // // // // class ChatViewModel extends ChangeNotifier {
// // // // //   final ChatRepository _chatRepository;
// // // // //   List<ChatModel> _chats = [];
// // // // //   List<ChatModel> _filteredChats = [];
// // // // //   bool _isLoading = false;
// // // // //   String? _errorMessage;
// // // // //   late StreamSubscription _chatSubscription;

// // // // //   List<ChatModel> get chats => _filteredChats.isEmpty ? _chats : _filteredChats;
// // // // //   bool get isLoading => _isLoading;
// // // // //   String? get errorMessage => _errorMessage;

// // // // //   ChatViewModel(this._chatRepository) {
// // // // //     _startListeningToChats();
// // // // //   }

// // // // //   void _startListeningToChats() {
// // // // //     _isLoading = true;
// // // // //     notifyListeners();

// // // // //     _chatSubscription = _chatRepository.getChatsStream().listen(
// // // // //       (chats) {
// // // // //         _chats = chats;
// // // // //         _filteredChats = [];
// // // // //         _isLoading = false;
// // // // //         _errorMessage = null;
// // // // //         notifyListeners();
// // // // //       },
// // // // //       onError: (e) {
// // // // //         _errorMessage = 'Failed to fetch chats: $e';
// // // // //         _isLoading = false;
// // // // //         notifyListeners();
// // // // //       },
// // // // //     );
// // // // //   }

// // // // //   void filterChats(String query) {
// // // // //     if (query.isEmpty) {
// // // // //       _filteredChats = [];
// // // // //     } else {
// // // // //       _filteredChats = _chats
// // // // //           .where((chat) =>
// // // // //               chat.name.toLowerCase().contains(query.toLowerCase()) ||
// // // // //               chat.message.toLowerCase().contains(query.toLowerCase()))
// // // // //           .toList();
// // // // //     }
// // // // //     notifyListeners();
// // // // //   }

// // // // //   Future<void> createChat({
// // // // //     required String name,
// // // // //     required String message,
// // // // //     required String time,
// // // // //     required int unreadCount,
// // // // //     required String avatar,
// // // // //     required bool hasCheckmark,
// // // // //     File? image,
// // // // //     required String email,
// // // // //   }) async {
// // // // //     _isLoading = true;
// // // // //     _errorMessage = null;
// // // // //     notifyListeners();

// // // // //     try {
// // // // //       final newChat = ChatModel(
// // // // //         id: '',
// // // // //         name: name,
// // // // //         message: message,
// // // // //         time: time,
// // // // //         unreadCount: unreadCount,
// // // // //         avatar: avatar,
// // // // //         hasCheckmark: hasCheckmark,
// // // // //         email: email,
// // // // //         messages: [],
// // // // //       );
// // // // //       final docRef = await _chatRepository.createChat(newChat);
// // // // //       final updatedChat = ChatModel(
// // // // //         id: docRef.id,
// // // // //         name: name,
// // // // //         message: message,
// // // // //         time: time,
// // // // //         unreadCount: unreadCount,
// // // // //         avatar: avatar,
// // // // //         hasCheckmark: hasCheckmark,
// // // // //         email: email,
// // // // //         messages: [],
// // // // //       );
// // // // //       _chats.add(updatedChat);
// // // // //     } catch (e) {
// // // // //       _errorMessage = 'Failed to create chat: $e';
// // // // //     } finally {
// // // // //       _isLoading = false;
// // // // //       notifyListeners();
// // // // //     }
// // // // //   }

// // // // //   Future<void> addChatWithUser(String email, String name, String avatar) async {
// // // // //     _isLoading = true;
// // // // //     _errorMessage = null;
// // // // //     notifyListeners();

// // // // //     try {
// // // // //       await _chatRepository.addChatWithUser(email, name, avatar);
// // // // //     } catch (e) {
// // // // //       _errorMessage = 'Failed to add chat: $e';
// // // // //     } finally {
// // // // //       _isLoading = false;
// // // // //       notifyListeners();
// // // // //     }
// // // // //   }

// // // // //   Future<void> deleteChat(String chatId) async {
// // // // //     _isLoading = true;
// // // // //     notifyListeners();

// // // // //     try {
// // // // //       await _chatRepository.deleteChat(chatId);
// // // // //       _chats.removeWhere((chat) => chat.id == chatId);
// // // // //     } catch (e) {
// // // // //       _errorMessage = 'Failed to delete chat: $e';
// // // // //     } finally {
// // // // //       _isLoading = false;
// // // // //       notifyListeners();
// // // // //     }
// // // // //   }

// // // // //   Future<void> sendMessage(String chatId, String text, bool isMe) async {
// // // // //     _errorMessage = null;
// // // // //     // notifyListeners(); // تم تعليقها عشان مينشأش إعادة بناء فورية

// // // // //     try {
// // // // //       final message = {
// // // // //         'text': text,
// // // // //         'isMe': isMe,
// // // // //         'time': DateTime.now().toIso8601String(), // Firestore بيستخدم التنسيق الكامل
// // // // //       };
// // // // //       await _chatRepository.updateMessages(chatId, message);
// // // // //       // تحديث محلي للدردشة
// // // // //       final chatIndex = _chats.indexWhere((chat) => chat.id == chatId);
// // // // //       if (chatIndex != -1) {
// // // // //         final updatedMessages = List<Map<String, dynamic>>.from(_chats[chatIndex].messages)..add(message);
// // // // //         final now = DateTime.now();
// // // // //         _chats[chatIndex] = ChatModel(
// // // // //           id: _chats[chatIndex].id,
// // // // //           name: _chats[chatIndex].name,
// // // // //           message: text,
// // // // //           time: '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}', // 05:25
// // // // //           unreadCount: _chats[chatIndex].unreadCount + 1,
// // // // //           avatar: _chats[chatIndex].avatar,
// // // // //           hasCheckmark: _chats[chatIndex].hasCheckmark,
// // // // //           email: _chats[chatIndex].email,
// // // // //           messages: updatedMessages,
// // // // //         );
// // // // //         // notifyListeners(); // تم تعليقها عشان مينشأش إعادة بناء
// // // // //       }
// // // // //     } catch (e) {
// // // // //       _errorMessage = 'Failed to send message: $e';
// // // // //       notifyListeners();
// // // // //     }
// // // // //   }

// // // // //   @override
// // // // //   void dispose() {
// // // // //     _chatSubscription.cancel();
// // // // //     super.dispose();
// // // // //   }
// // // // // }

// // // // import 'dart:async';
// // // // import 'dart:io';
// // // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // // import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
// // // // import 'package:flutter/material.dart';

// // // // class ChatViewModel extends ChangeNotifier {
// // // //   final ChatRepository _chatRepository;
// // // //   List<ChatModel> _chats = [];
// // // //   List<ChatModel> _filteredChats = [];
// // // //   bool _isLoading = false;
// // // //   String? _errorMessage;
// // // //   late StreamSubscription _chatSubscription;

// // // //   List<ChatModel> get chats => _filteredChats.isEmpty ? _chats : _filteredChats;
// // // //   bool get isLoading => _isLoading;
// // // //   String? get errorMessage => _errorMessage;

// // // //   ChatViewModel(this._chatRepository) {
// // // //     _startListeningToChats();
// // // //   }

// // // //   void _startListeningToChats() {
// // // //     _isLoading = true;
// // // //     notifyListeners();

// // // //     _chatSubscription = _chatRepository.getChatsStream().listen(
// // // //       (chats) {
// // // //         _chats = chats;
// // // //         _filteredChats = [];
// // // //         _isLoading = false;
// // // //         _errorMessage = null;
// // // //         notifyListeners();
// // // //       },
// // // //       onError: (e) {
// // // //         _errorMessage = 'Failed to fetch chats: $e';
// // // //         _isLoading = false;
// // // //         notifyListeners();
// // // //       },
// // // //     );
// // // //   }

// // // //   void filterChats(String query) {
// // // //     if (query.isEmpty) {
// // // //       _filteredChats = [];
// // // //     } else {
// // // //       _filteredChats = _chats
// // // //           .where((chat) =>
// // // //               chat.name.toLowerCase().contains(query.toLowerCase()) ||
// // // //               chat.message.toLowerCase().contains(query.toLowerCase()))
// // // //           .toList();
// // // //     }
// // // //     notifyListeners();
// // // //   }

// // // //   Future<void> createChat({
// // // //     required String name,
// // // //     required String message,
// // // //     required String time,
// // // //     required int unreadCount,
// // // //     required String avatar,
// // // //     required bool hasCheckmark,
// // // //     File? image,
// // // //     required String email,
// // // //   }) async {
// // // //     _isLoading = true;
// // // //     _errorMessage = null;
// // // //     notifyListeners();

// // // //     try {
// // // //       final newChat = ChatModel(
// // // //         id: '',
// // // //         name: name,
// // // //         message: message,
// // // //         time: time,
// // // //         unreadCount: unreadCount,
// // // //         avatar: avatar,
// // // //         hasCheckmark: hasCheckmark,
// // // //         email: email,
// // // //         messages: [],
// // // //       );
// // // //       final docRef = await _chatRepository.createChat(newChat);
// // // //       final updatedChat = ChatModel(
// // // //         id: docRef.id,
// // // //         name: name,
// // // //         message: message,
// // // //         time: time,
// // // //         unreadCount: unreadCount,
// // // //         avatar: avatar,
// // // //         hasCheckmark: hasCheckmark,
// // // //         email: email,
// // // //         messages: [],
// // // //       );
// // // //       _chats.add(updatedChat);
// // // //     } catch (e) {
// // // //       _errorMessage = 'Failed to create chat: $e';
// // // //     } finally {
// // // //       _isLoading = false;
// // // //       notifyListeners();
// // // //     }
// // // //   }

// // // //   Future<void> addChatWithUser(String email, String name, String avatar) async {
// // // //     _isLoading = true;
// // // //     _errorMessage = null;
// // // //     notifyListeners();

// // // //     try {
// // // //       await _chatRepository.addChatWithUser(email, name, avatar);
// // // //     } catch (e) {
// // // //       _errorMessage = 'Failed to add chat: $e';
// // // //     } finally {
// // // //       _isLoading = false;
// // // //       notifyListeners();
// // // //     }
// // // //   }

// // // //   Future<void> deleteChat(String chatId) async {
// // // //     _isLoading = true;
// // // //     notifyListeners();

// // // //     try {
// // // //       await _chatRepository.deleteChat(chatId);
// // // //       _chats.removeWhere((chat) => chat.id == chatId);
// // // //     } catch (e) {
// // // //       _errorMessage = 'Failed to delete chat: $e';
// // // //     } finally {
// // // //       _isLoading = false;
// // // //       notifyListeners();
// // // //     }
// // // //   }

// // // //   Future<void> sendMessage(String chatId, String text, bool isMe) async {
// // // //     _errorMessage = null;
// // // //     // notifyListeners(); // تم تعليقها عشان مينشأش إعادة بناء فورية

// // // //     try {
// // // //       final message = {
// // // //         'text': text,
// // // //         'isMe': isMe,
// // // //         'time': DateTime.now().toIso8601String(), // Firestore بيستخدم التنسيق الكامل
// // // //       };
// // // //       await _chatRepository.updateMessages(chatId, message);
// // // //       // تحديث محلي للدردشة
// // // //       final chatIndex = _chats.indexWhere((chat) => chat.id == chatId);
// // // //       if (chatIndex != -1) {
// // // //         final updatedMessages = List<Map<String, dynamic>>.from(_chats[chatIndex].messages)..add(message);
// // // //         final now = DateTime.now();
// // // //         _chats[chatIndex] = ChatModel(
// // // //           id: _chats[chatIndex].id,
// // // //           name: _chats[chatIndex].name,
// // // //           message: text,
// // // //           time: '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}', // 05:25 (24 ساعة)
// // // //           unreadCount: _chats[chatIndex].unreadCount + 1,
// // // //           avatar: _chats[chatIndex].avatar,
// // // //           hasCheckmark: _chats[chatIndex].hasCheckmark,
// // // //           email: _chats[chatIndex].email,
// // // //           messages: updatedMessages,
// // // //         );
// // // //         // notifyListeners(); // تم تعليقها عشان مينشأش إعادة بناء
// // // //       }
// // // //     } catch (e) {
// // // //       _errorMessage = 'Failed to send message: $e';
// // // //       notifyListeners();
// // // //     }
// // // //   }

// // // //   @override
// // // //   void dispose() {
// // // //     _chatSubscription.cancel();
// // // //     super.dispose();
// // // //   }
// // // // }

// // // import 'dart:async';
// // // import 'dart:io';
// // // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // // import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
// // // import 'package:flutter/material.dart';

// // // class ChatViewModel extends ChangeNotifier {
// // //   final ChatRepository _chatRepository;
// // //   List<ChatModel> _chats = [];
// // //   List<ChatModel> _filteredChats = [];
// // //   bool _isLoading = false;
// // //   String? _errorMessage;
// // //   late StreamSubscription _chatSubscription;

// // //   List<ChatModel> get chats => _filteredChats.isEmpty ? _chats : _filteredChats;
// // //   bool get isLoading => _isLoading;
// // //   String? get errorMessage => _errorMessage;

// // //   ChatViewModel(this._chatRepository) {
// // //     _startListeningToChats();
// // //   }

// // //   void _startListeningToChats() {
// // //     _isLoading = true;
// // //     notifyListeners();

// // //     _chatSubscription = _chatRepository.getChatsStream().listen(
// // //       (chats) {
// // //         _chats = chats;
// // //         _filteredChats = [];
// // //         _isLoading = false;
// // //         _errorMessage = null;
// // //         notifyListeners();
// // //       },
// // //       onError: (e) {
// // //         _errorMessage = 'Failed to fetch chats: $e';
// // //         _isLoading = false;
// // //         notifyListeners();
// // //       },
// // //     );
// // //   }

// // //   // إضافة دالة getChatsStream
// // //   Stream<List<ChatModel>> getChatsStream() {
// // //     return _chatRepository.getChatsStream();
// // //   }

// // //   void filterChats(String query) {
// // //     if (query.isEmpty) {
// // //       _filteredChats = [];
// // //     } else {
// // //       _filteredChats = _chats
// // //           .where((chat) =>
// // //               chat.name.toLowerCase().contains(query.toLowerCase()) ||
// // //               chat.message.toLowerCase().contains(query.toLowerCase()))
// // //           .toList();
// // //     }
// // //     notifyListeners();
// // //   }

// // //   Future<void> createChat({
// // //     required String name,
// // //     required String message,
// // //     required String time,
// // //     required int unreadCount,
// // //     required String avatar,
// // //     required bool hasCheckmark,
// // //     File? image,
// // //     required String email,
// // //   }) async {
// // //     _isLoading = true;
// // //     _errorMessage = null;
// // //     notifyListeners();

// // //     try {
// // //       final newChat = ChatModel(
// // //         id: '',
// // //         name: name,
// // //         message: message,
// // //         time: time,
// // //         unreadCount: unreadCount,
// // //         avatar: avatar,
// // //         hasCheckmark: hasCheckmark,
// // //         email: email,
// // //         messages: [],
// // //       );
// // //       final docRef = await _chatRepository.createChat(newChat);
// // //       final updatedChat = ChatModel(
// // //         id: docRef.id,
// // //         name: name,
// // //         message: message,
// // //         time: time,
// // //         unreadCount: unreadCount,
// // //         avatar: avatar,
// // //         hasCheckmark: hasCheckmark,
// // //         email: email,
// // //         messages: [],
// // //       );
// // //       _chats.add(updatedChat);
// // //     } catch (e) {
// // //       _errorMessage = 'Failed to create chat: $e';
// // //     } finally {
// // //       _isLoading = false;
// // //       notifyListeners();
// // //     }
// // //   }

// // //   Future<void> addChatWithUser(String email, String name, String avatar) async {
// // //     _isLoading = true;
// // //     _errorMessage = null;
// // //     notifyListeners();

// // //     try {
// // //       await _chatRepository.addChatWithUser(email, name, avatar);
// // //     } catch (e) {
// // //       _errorMessage = 'Failed to add chat: $e';
// // //     } finally {
// // //       _isLoading = false;
// // //       notifyListeners();
// // //     }
// // //   }

// // //   Future<void> deleteChat(String chatId) async {
// // //     _isLoading = true;
// // //     notifyListeners();

// // //     try {
// // //       await _chatRepository.deleteChat(chatId);
// // //       _chats.removeWhere((chat) => chat.id == chatId);
// // //     } catch (e) {
// // //       _errorMessage = 'Failed to delete chat: $e';
// // //     } finally {
// // //       _isLoading = false;
// // //       notifyListeners();
// // //     }
// // //   }

// // //   Future<void> sendMessage(String chatId, String text, bool isMe) async {
// // //     _errorMessage = null;

// // //     try {
// // //       final message = {
// // //         'text': text,
// // //         'isMe': isMe,
// // //         'time': DateTime.now().toIso8601String(),
// // //       };
// // //       await _chatRepository.updateMessages(chatId, message);
// // //       final chatIndex = _chats.indexWhere((chat) => chat.id == chatId);
// // //       if (chatIndex != -1) {
// // //         final updatedMessages = List<Map<String, dynamic>>.from(_chats[chatIndex].messages)..add(message);
// // //         final now = DateTime.now();
// // //         _chats[chatIndex] = ChatModel(
// // //           id: _chats[chatIndex].id,
// // //           name: _chats[chatIndex].name,
// // //           message: text,
// // //           time: '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}',
// // //           unreadCount: _chats[chatIndex].unreadCount + 1,
// // //           avatar: _chats[chatIndex].avatar,
// // //           hasCheckmark: _chats[chatIndex].hasCheckmark,
// // //           email: _chats[chatIndex].email,
// // //           messages: updatedMessages,
// // //         );
// // //       }
// // //     } catch (e) {
// // //       _errorMessage = 'Failed to send message: $e';
// // //       notifyListeners();
// // //     }
// // //   }

// // //   Future<void> deleteMessage(String chatId, Map<String, dynamic> message) async {
// // //     _errorMessage = null;

// // //     try {
// // //       await _chatRepository.deleteMessage(chatId, message);
// // //       final chatIndex = _chats.indexWhere((chat) => chat.id == chatId);
// // //       if (chatIndex != -1) {
// // //         final updatedMessages = List<Map<String, dynamic>>.from(_chats[chatIndex].messages)
// // //           ..removeWhere((msg) =>
// // //               msg['text'] == message['text'] &&
// // //               msg['time'] == message['time'] &&
// // //               msg['isMe'] == message['isMe']);
// // //         final lastMessage = updatedMessages.isNotEmpty ? updatedMessages.last['text'] : '';
// // //         _chats[chatIndex] = ChatModel(
// // //           id: _chats[chatIndex].id,
// // //           name: _chats[chatIndex].name,
// // //           message: lastMessage,
// // //           time: _chats[chatIndex].time,
// // //           unreadCount: _chats[chatIndex].unreadCount,
// // //           avatar: _chats[chatIndex].avatar,
// // //           hasCheckmark: _chats[chatIndex].hasCheckmark,
// // //           email: _chats[chatIndex].email,
// // //           messages: updatedMessages,
// // //         );
// // //         notifyListeners();
// // //       }
// // //     } catch (e) {
// // //       _errorMessage = 'Failed to delete message: $e';
// // //       notifyListeners();
// // //     }
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _chatSubscription.cancel();
// // //     super.dispose();
// // //   }
// // // }

// // import 'dart:async';
// // import 'dart:io';
// // import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// // import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
// // import 'package:flutter/material.dart';
// // import 'package:uuid/uuid.dart';

// // class ChatViewModel extends ChangeNotifier {
// //   final ChatRepository _chatRepository;
// //   List<ChatModel> _chats = [];
// //   List<ChatModel> _filteredChats = [];
// //   bool _isLoading = false;
// //   String? _errorMessage;
// //   late StreamSubscription _chatSubscription;
// //   final Uuid _uuid = const Uuid();

// //   List<ChatModel> get chats => _filteredChats.isEmpty ? _chats : _filteredChats;
// //   bool get isLoading => _isLoading;
// //   String? get errorMessage => _errorMessage;

// //   ChatViewModel(this._chatRepository) {
// //     _startListeningToChats();
// //   }

// //   void _startListeningToChats() {
// //     _isLoading = true;
// //     notifyListeners();

// //     _chatSubscription = _chatRepository.getChatsStream().listen(
// //       (chats) {
// //         _chats = chats;
// //         _filteredChats = [];
// //         _isLoading = false;
// //         _errorMessage = null;
// //         notifyListeners();
// //       },
// //       onError: (e) {
// //         _errorMessage = 'Failed to fetch chats: $e';
// //         _isLoading = false;
// //         notifyListeners();
// //       },
// //     );
// //   }

// //   Stream<List<ChatModel>> getChatsStream() {
// //     return _chatRepository.getChatsStream();
// //   }

// //   void filterChats(String query) {
// //     if (query.isEmpty) {
// //       _filteredChats = [];
// //     } else {
// //       _filteredChats = _chats
// //           .where((chat) =>
// //               chat.name.toLowerCase().contains(query.toLowerCase()) ||
// //               chat.message.toLowerCase().contains(query.toLowerCase()))
// //           .toList();
// //     }
// //     notifyListeners();
// //   }

// //   Future<void> createChat({
// //     required String name,
// //     required String message,
// //     required String time,
// //     required int unreadCount,
// //     required String avatar,
// //     required bool hasCheckmark,
// //     File? image,
// //     required String email,
// //   }) async {
// //     _isLoading = true;
// //     _errorMessage = null;
// //     notifyListeners();

// //     try {
// //       final newChat = ChatModel(
// //         id: '',
// //         name: name,
// //         message: message,
// //         time: time,
// //         unreadCount: unreadCount,
// //         avatar: avatar,
// //         hasCheckmark: hasCheckmark,
// //         email: email,
// //         messages: [],
// //       );
// //       final docRef = await _chatRepository.createChat(newChat);
// //       final updatedChat = ChatModel(
// //         id: docRef.id,
// //         name: name,
// //         message: message,
// //         time: time,
// //         unreadCount: unreadCount,
// //         avatar: avatar,
// //         hasCheckmark: hasCheckmark,
// //         email: email,
// //         messages: [],
// //       );
// //       _chats.add(updatedChat);
// //     } catch (e) {
// //       _errorMessage = 'Failed to create chat: $e';
// //     } finally {
// //       _isLoading = false;
// //       notifyListeners();
// //     }
// //   }

// //   Future<void> addChatWithUser(String email, String name, String avatar) async {
// //     _isLoading = true;
// //     _errorMessage = null;
// //     notifyListeners();

// //     try {
// //       await _chatRepository.addChatWithUser(email, name, avatar);
// //     } catch (e) {
// //       _errorMessage = 'Failed to add chat: $e';
// //     } finally {
// //       _isLoading = false;
// //       notifyListeners();
// //     }
// //   }

// //   Future<void> deleteChat(String chatId) async {
// //     _isLoading = true;
// //     notifyListeners();

// //     try {
// //       await _chatRepository.deleteChat(chatId);
// //       _chats.removeWhere((chat) => chat.id == chatId);
// //     } catch (e) {
// //       _errorMessage = 'Failed to delete chat: $e';
// //     } finally {
// //       _isLoading = false;
// //       notifyListeners();
// //     }
// //   }

// //   Future<void> sendMessage(String chatId, String text, bool isMe) async {
// //     _errorMessage = null;

// //     try {
// //       final message = {
// //         'text': text,
// //         'isMe': isMe,
// //         'messageId': _uuid.v4(), // إضافة messageId فريد
// //         'time': DateTime.now().toIso8601String(),
// //       };
// //       await _chatRepository.updateMessages(chatId, message);
// //       final chatIndex = _chats.indexWhere((chat) => chat.id == chatId);
// //       if (chatIndex != -1) {
// //         final updatedMessages =
// //             List<Map<String, dynamic>>.from(_chats[chatIndex].messages)
// //               ..add(message);
// //         final now = DateTime.now();
// //         _chats[chatIndex] = ChatModel(
// //           id: _chats[chatIndex].id,
// //           name: _chats[chatIndex].name,
// //           message: text,
// //           time:
// //               '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}',
// //           unreadCount: _chats[chatIndex].unreadCount + 1,
// //           avatar: _chats[chatIndex].avatar,
// //           hasCheckmark: _chats[chatIndex].hasCheckmark,
// //           email: _chats[chatIndex].email,
// //           messages: updatedMessages,
// //         );
// //       }
// //     } catch (e) {
// //       _errorMessage = 'Failed to send message: $e';
// //       notifyListeners();
// //     }
// //   }

// //   Future<void> deleteMessage(
// //       String chatId, Map<String, dynamic> message) async {
// //     _errorMessage = null;

// //     try {
// //       await _chatRepository.deleteMessage(chatId, message);
// //       final chatIndex = _chats.indexWhere((chat) => chat.id == chatId);
// //       if (chatIndex != -1) {
// //         final updatedMessages =
// //             List<Map<String, dynamic>>.from(_chats[chatIndex].messages)
// //               ..removeWhere((msg) => msg['messageId'] == message['messageId']);
// //         final lastMessage =
// //             updatedMessages.isNotEmpty ? updatedMessages.last['text'] : '';
// //         _chats[chatIndex] = ChatModel(
// //           id: _chats[chatIndex].id,
// //           name: _chats[chatIndex].name,
// //           message: lastMessage,
// //           time: _chats[chatIndex].time,
// //           unreadCount: _chats[chatIndex].unreadCount,
// //           avatar: _chats[chatIndex].avatar,
// //           hasCheckmark: _chats[chatIndex].hasCheckmark,
// //           email: _chats[chatIndex].email,
// //           messages: updatedMessages,
// //         );
// //         notifyListeners();
// //       }
// //     } catch (e) {
// //       _errorMessage = 'Failed to delete message: $e';
// //       notifyListeners();
// //     }
// //   }

// //   @override
// //   void dispose() {
// //     _chatSubscription.cancel();
// //     super.dispose();
// //   }
// // }

// import 'dart:async';
// import 'dart:io';
// import 'package:attendance_app/features/chats/data/models/chat_model.dart';
// import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
// import 'package:flutter/material.dart';
// import 'package:uuid/uuid.dart';

// class ChatViewModel extends ChangeNotifier {
//   final ChatRepository _chatRepository;
//   List<ChatModel> _chats = [];
//   List<ChatModel> _filteredChats = [];
//   bool _isLoading = false;
//   String? _errorMessage;
//   late StreamSubscription _chatSubscription;
//   final Uuid _uuid = const Uuid();

//   List<ChatModel> get chats => _filteredChats.isEmpty ? _chats : _filteredChats;
//   bool get isLoading => _isLoading;
//   String? get errorMessage => _errorMessage;

//   ChatViewModel(this._chatRepository) {
//     _startListeningToChats();
//   }

//   void _startListeningToChats() {
//     _isLoading = true;
//     notifyListeners();

//     _chatSubscription = _chatRepository.getChatsStream().listen(
//       (chats) {
//         _chats = chats;
//         _filteredChats = [];
//         _isLoading = false;
//         _errorMessage = null;
//         notifyListeners();
//       },
//       onError: (e) {
//         _errorMessage = 'Failed to fetch chats: $e';
//         _isLoading = false;
//         notifyListeners();
//       },
//     );
//   }

//   Stream<List<ChatModel>> getChatsStream() {
//     return _chatRepository.getChatsStream();
//   }

//   void filterChats(String query) {
//     if (query.isEmpty) {
//       _filteredChats = [];
//     } else {
//       _filteredChats = _chats
//           .where((chat) =>
//               chat.name.toLowerCase().contains(query.toLowerCase()) ||
//               chat.message.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     }
//     notifyListeners();
//   }

//   Future<void> createChat({
//     required String name,
//     required String message,
//     required String time,
//     required int unreadCount,
//     required String avatar,
//     required bool hasCheckmark,
//     File? image,
//     required String email,
//   }) async {
//     _isLoading = true;
//     _errorMessage = null;
//     notifyListeners();

//     try {
//       final newChat = ChatModel(
//         id: '',
//         name: name,
//         message: message,
//         time: time,
//         unreadCount: unreadCount,
//         avatar: avatar,
//         hasCheckmark: hasCheckmark,
//         email: email,
//         messages: [],
//       );
//       final docRef = await _chatRepository.createChat(newChat);
//       final updatedChat = ChatModel(
//         id: docRef.id,
//         name: name,
//         message: message,
//         time: time,
//         unreadCount: unreadCount,
//         avatar: avatar,
//         hasCheckmark: hasCheckmark,
//         email: email,
//         messages: [],
//       );
//       _chats.add(updatedChat);
//     } catch (e) {
//       _errorMessage = 'Failed to create chat: $e';
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }

//   Future<void> addChatWithUser(String email, String name, String avatar) async {
//     _isLoading = true;
//     _errorMessage = null;
//     notifyListeners();

//     try {
//       await _chatRepository.addChatWithUser(email, name, avatar);
//     } catch (e) {
//       _errorMessage = 'Failed to add chat: $e';
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }

//   Future<void> deleteChat(String chatId) async {
//     _isLoading = true;
//     notifyListeners();

//     try {
//       await _chatRepository.deleteChat(chatId);
//       _chats.removeWhere((chat) => chat.id == chatId);
//     } catch (e) {
//       _errorMessage = 'Failed to delete chat: $e';
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }

//   Future<void> sendMessage(String chatId, String text, bool isMe) async {
//     _errorMessage = null;

//     try {
//       final message = {
//         'text': text,
//         'isMe': isMe,
//         'messageId': _uuid.v4(),
//         'time': DateTime.now().toIso8601String(),
//       };
//       await _chatRepository.updateMessages(chatId, message);
//       final chatIndex = _chats.indexWhere((chat) => chat.id == chatId);
//       if (chatIndex != -1) {
//         final updatedMessages =
//             List<Map<String, dynamic>>.from(_chats[chatIndex].messages)
//               ..add(message);
//         final now = DateTime.now();
//         _chats[chatIndex] = ChatModel(
//           id: _chats[chatIndex].id,
//           name: _chats[chatIndex].name,
//           message: text,
//           time:
//               '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}',
//           unreadCount: _chats[chatIndex].unreadCount + 1,
//           avatar: _chats[chatIndex].avatar,
//           hasCheckmark: _chats[chatIndex].hasCheckmark,
//           email: _chats[chatIndex].email,
//           messages: updatedMessages,
//         );
//       }
//     } catch (e) {
//       _errorMessage = 'Failed to send message: $e';
//       notifyListeners();
//     }
//   }

//   Future<void> deleteMessage(
//       String chatId, Map<String, dynamic> message) async {
//     _errorMessage = null;

//     try {
//       await _chatRepository.deleteMessage(chatId, message);
//       final chatIndex = _chats.indexWhere((chat) => chat.id == chatId);
//       if (chatIndex != -1) {
//         final updatedMessages =
//             List<Map<String, dynamic>>.from(_chats[chatIndex].messages)
//               ..removeWhere((msg) {
//                 if (message.containsKey('messageId') &&
//                     msg.containsKey('messageId')) {
//                   return msg['messageId'] == message['messageId'];
//                 }
//                 // التعامل مع الرسايل القديمة بدون messageId
//                 return msg['text'] == message['text'] &&
//                     msg['time'] == message['time'] &&
//                     msg['isMe'] == message['isMe'];
//               });
//         final lastMessage =
//             updatedMessages.isNotEmpty ? updatedMessages.last['text'] : '';
//         _chats[chatIndex] = ChatModel(
//           id: _chats[chatIndex].id,
//           name: _chats[chatIndex].name,
//           message: lastMessage,
//           time: _chats[chatIndex].time,
//           unreadCount: _chats[chatIndex].unreadCount,
//           avatar: _chats[chatIndex].avatar,
//           hasCheckmark: _chats[chatIndex].hasCheckmark,
//           email: _chats[chatIndex].email,
//           messages: updatedMessages,
//         );
//         notifyListeners();
//       }
//     } catch (e) {
//       _errorMessage = 'Failed to delete message: $e';
//       notifyListeners();
//     }
//   }

//   @override
//   void dispose() {
//     _chatSubscription.cancel();
//     super.dispose();
//   }
// }



import 'dart:async';
import 'dart:io';
import 'package:attendance_app/features/chats/data/models/chat_model.dart';
import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ChatViewModel extends ChangeNotifier {
  final ChatRepository _chatRepository;
  List<ChatModel> _chats = [];
  List<ChatModel> _filteredChats = [];
  bool _isLoading = false;
  String? _errorMessage;
  late StreamSubscription _chatSubscription;
  final Uuid _uuid = const Uuid();

  List<ChatModel> get chats => _filteredChats.isEmpty ? _chats : _filteredChats;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  ChatViewModel(this._chatRepository) {
    _startListeningToChats();
  }

  void _startListeningToChats() {
    _isLoading = true;
    notifyListeners();

    _chatSubscription = _chatRepository.getChatsStream().listen(
      (chats) {
        _chats = chats;
        _filteredChats = [];
        _isLoading = false;
        _errorMessage = null;
        notifyListeners();
      },
      onError: (e) {
        _errorMessage = 'Failed to fetch chats: $e';
        _isLoading = false;
        notifyListeners();
      },
    );
  }

  Stream<List<ChatModel>> getChatsStream() {
    return _chatRepository.getChatsStream();
  }

  void filterChats(String query) {
    if (query.isEmpty) {
      _filteredChats = [];
    } else {
      _filteredChats = _chats
          .where((chat) =>
              chat.name.toLowerCase().contains(query.toLowerCase()) ||
              chat.message.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  Future<void> createChat({
    required String name,
    required String message,
    required String time,
    required int unreadCount,
    required String avatar,
    required bool hasCheckmark,
    File? image,
    required String email,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final newChat = ChatModel(
        id: '',
        name: name,
        message: message,
        time: time,
        unreadCount: unreadCount,
        avatar: avatar,
        hasCheckmark: hasCheckmark,
        email: email,
        messages: [],
      );
      final docRef = await _chatRepository.createChat(newChat);
      final updatedChat = ChatModel(
        id: docRef.id,
        name: name,
        message: message,
        time: time,
        unreadCount: unreadCount,
        avatar: avatar,
        hasCheckmark: hasCheckmark,
        email: email,
        messages: [],
      );
      _chats.add(updatedChat);
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Failed to create chat: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addChatWithUser(String email, String name, String avatar) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _chatRepository.addChatWithUser(email, name, avatar);
    } catch (e) {
      _errorMessage = 'Failed to add chat: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteChat(String chatId) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _chatRepository.deleteChat(chatId);
      _chats.removeWhere((chat) => chat.id == chatId);
    } catch (e) {
      _errorMessage = 'Failed to delete chat: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> sendMessage(String chatId, String text, bool isMe) async {
    _errorMessage = null;

    try {
      final message = {
        'text': text,
        'isMe': isMe,
        'messageId': _uuid.v4(),
        'time': DateTime.now().toIso8601String(),
      };
      await _chatRepository.updateMessages(chatId, message);
      final chatIndex = _chats.indexWhere((chat) => chat.id == chatId);
      if (chatIndex != -1) {
        final updatedMessages = List<Map<String, dynamic>>.from(_chats[chatIndex].messages)..add(message);
        final now = DateTime.now();
        _chats[chatIndex] = ChatModel(
          id: _chats[chatIndex].id,
          name: _chats[chatIndex].name,
          message: text,
          time: '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}',
          unreadCount: _chats[chatIndex].unreadCount + 1,
          avatar: _chats[chatIndex].avatar,
          hasCheckmark: _chats[chatIndex].hasCheckmark,
          email: _chats[chatIndex].email,
          messages: updatedMessages,
        );
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = 'Failed to send message: $e';
      notifyListeners();
    }
  }

  Future<void> deleteMessage(String chatId, Map<String, dynamic> message) async {
    _errorMessage = null;

    try {
      await _chatRepository.deleteMessage(chatId, message);
      final chatIndex = _chats.indexWhere((chat) => chat.id == chatId);
      if (chatIndex != -1) {
        final updatedMessages = List<Map<String, dynamic>>.from(_chats[chatIndex].messages)
          ..removeWhere((msg) {
            if (message.containsKey('messageId') && msg.containsKey('messageId')) {
              return msg['messageId'] == message['messageId'];
            }
            return msg['text'] == message['text'] &&
                msg['time'] == message['time'] &&
                msg['isMe'] == message['isMe'];
          });
        final lastMessage = updatedMessages.isNotEmpty ? updatedMessages.last['text'] : '';
        _chats[chatIndex] = ChatModel(
          id: _chats[chatIndex].id,
          name: _chats[chatIndex].name,
          message: lastMessage,
          time: _chats[chatIndex].time,
          unreadCount: _chats[chatIndex].unreadCount,
          avatar: _chats[chatIndex].avatar,
          hasCheckmark: _chats[chatIndex].hasCheckmark,
          email: _chats[chatIndex].email,
          messages: updatedMessages,
        );
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = 'Failed to delete message: $e';
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _chatSubscription.cancel();
    super.dispose();
  }
}