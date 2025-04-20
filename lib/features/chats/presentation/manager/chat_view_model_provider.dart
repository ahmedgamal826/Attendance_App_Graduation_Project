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
//   List<ChatModel> _allChats = [];
//   String _searchQuery = '';
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
//   String get searchQuery => _searchQuery;
//   List<Map<String, dynamic>> get localMessages => _localMessages;
//   String? get errorMessage => _errorMessage;
//   String? get avatarUrl => _avatarUrl;
//   bool get isLoading => _isLoading;

//   // void listenToChats() {
//   //   _isLoading = true;
//   //   notifyListeners();
//   //   _chatStream.listen((chatList) {
//   //     _allChats = chatList;
//   //     _chats = List.from(chatList);
//   //     _isLoading = false;
//   //     notifyListeners();
//   //   }, onError: (error) {
//   //     _errorMessage = 'Error fetching chats: $error';
//   //     _isLoading = false;
//   //     notifyListeners();
//   //   });
//   // }

//   void listenToChats() {
//     _isLoading = true;
//     notifyListeners();
//     _chatStreamSubscription = _chatStream.listen((chatList) {
//       _allChats = chatList;
//       _chats = List.from(chatList);
//       _isLoading = false;
//       if (!disposed) {
//         // التحقق من حالة التخلص
//         notifyListeners();
//       }
//     }, onError: (error) {
//       _errorMessage = 'Error fetching chats: $error';
//       _isLoading = false;
//       if (!disposed) {
//         // التحقق من حالة التخلص
//         notifyListeners();
//       }
//     });
//   }

//   void filterChats(String query) {
//     _searchQuery = query;
//     print('Search query: $query');
//     if (query.isEmpty) {
//       _chats = List.from(_allChats);
//       print('Query is empty, showing all chats: ${_chats.length}');
//     } else {
//       _chats = _allChats.where((chat) {
//         return chat.name.toLowerCase().contains(query.toLowerCase());
//       }).toList();
//       print('Filtered chats: ${_chats.length}');
//     }
//     notifyListeners();
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
//     final currentUser = FirebaseAuth.instance.currentUser;
//     if (currentUser == null) return;

//     _localMessages = chat.messages.map((msg) {
//       return {
//         ...msg,
//         'isMe': msg['senderId'] == currentUser.uid,
//       };
//     }).toList();

//     // تحديث حالة القراءة للرسائل
//     _chatRepository.markMessagesAsRead(chat.id, currentUser.uid);

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
//         'isRead': false, // إضافة isRead للرسالة
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
//         'isRead': false, // إضافة isRead للصورة
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
//       final currentUser = FirebaseAuth.instance.currentUser;
//       if (currentUser == null) {
//         throw Exception('No user signed in');
//       }

//       final message = _localMessages.firstWhere(
//         (msg) => msg['messageId'] == messageId,
//         orElse: () => {},
//       );

//       if (message.isEmpty || message['senderId'] != currentUser.uid) {
//         throw Exception('لا يمكنك حذف هذه الرسالة');
//       }

//       await _chatRepository.deleteMessage(chatId, messageId, currentUser.uid);

//       _localMessages.removeWhere((msg) => msg['messageId'] == messageId);
//       notifyListeners();
//     } catch (e) {
//       _errorMessage = 'Failed to delete message: $e';
//       notifyListeners();
//     }
//   }

//   Future<void> resetUnreadCount(String chatId) async {
//     try {
//       await _chatRepository.resetUnreadCount(chatId);
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
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (scrollController.hasClients) {
//         scrollController.animateTo(
//           scrollController.position.maxScrollExtent,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeOut,
//         );
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _chatStreamSubscription?.cancel();
//     messageController.dispose();
//     scrollController.dispose();
//     super.dispose();
//   }
// }



import 'dart:async'; // Required for StreamSubscription
import 'package:attendance_app/features/chats/data/models/chat_model.dart';
import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ChatViewModel extends ChangeNotifier {
  final ChatRepository _chatRepository;
  List<ChatModel> _chats = [];
  List<ChatModel> _allChats = [];
  String _searchQuery = '';
  List<Map<String, dynamic>> _localMessages = [];
  String? _errorMessage;
  String? _avatarUrl;
  bool _isLoading = false;
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  late Stream<List<ChatModel>> _chatStream;
  StreamSubscription<List<ChatModel>>? _chatStreamSubscription; // Added subscription variable

  ChatViewModel(this._chatRepository) {
    _chatStream = _chatRepository.getChatsStream();
    listenToChats();
  }

  List<ChatModel> get chats => _chats;
  String get searchQuery => _searchQuery;
  List<Map<String, dynamic>> get localMessages => _localMessages;
  String? get errorMessage => _errorMessage;
  String? get avatarUrl => _avatarUrl;
  bool get isLoading => _isLoading;

  void listenToChats() {
    _isLoading = true;
    notifyListeners();
    _chatStreamSubscription = _chatStream.listen((chatList) {
      _allChats = chatList;
      _chats = List.from(chatList);
      _isLoading = false;
      notifyListeners(); // No need for disposed check as subscription is canceled in dispose
    }, onError: (error) {
      _errorMessage = 'Error fetching chats: $error';
      _isLoading = false;
      notifyListeners();
    });
  }

  void filterChats(String query) {
    _searchQuery = query;
    print('Search query: $query');
    if (query.isEmpty) {
      _chats = List.from(_allChats);
      print('Query is empty, showing all chats: ${_chats.length}');
    } else {
      _chats = _allChats.where((chat) {
        return chat.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
      print('Filtered chats: ${_chats.length}');
    }
    notifyListeners();
  }

  Future<void> fetchUserByEmail(String email) async {
    try {
      _isLoading = true;
      notifyListeners();
      final userData = await _chatRepository.getUserByEmail(email);
      if (userData != null) {
        _avatarUrl = userData['image'] as String?;
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void resetAvatarUrl() {
    _avatarUrl = null;
    notifyListeners();
  }

  Future<bool> checkIfChatExists(String email) async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw Exception('No user signed in');
      }
      final userData = await _chatRepository.getUserByEmail(email);
      if (userData == null) {
        throw Exception('User not found');
      }
      final otherUserId = userData['uid'] as String;
      return await _chatRepository.checkIfChatExists(
          currentUser.uid, otherUserId);
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  Future<void> addChatWithUser(String email, String name, String image) async {
    try {
      _isLoading = true;
      notifyListeners();
      await _chatRepository.addChatWithUser(email, name, image);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteChat(String chatId) async {
    try {
      await _chatRepository.deleteChat(chatId);
      _chats.removeWhere((chat) => chat.id == chatId);
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Failed to delete chat: $e';
      notifyListeners();
    }
  }

  Future<void> updateChatName(String chatId, String newName) async {
    try {
      await _chatRepository.updateChatName(chatId, newName);
      final chatIndex = _chats.indexWhere((chat) => chat.id == chatId);
      if (chatIndex != -1) {
        _chats[chatIndex] = ChatModel(
          id: _chats[chatIndex].id,
          participants: _chats[chatIndex].participants,
          lastMessage: _chats[chatIndex].lastMessage,
          name: newName,
          email: _chats[chatIndex].email,
          time: _chats[chatIndex].time,
          timestamp: _chats[chatIndex].timestamp,
          unreadCount: _chats[chatIndex].unreadCount,
          avatar: _chats[chatIndex].avatar,
          hasCheckmark: _chats[chatIndex].hasCheckmark,
          messages: _chats[chatIndex].messages,
        );
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = 'Failed to update chat name: $e';
      notifyListeners();
    }
  }

  void initChatMessages(ChatModel chat) {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) return;

    _localMessages = chat.messages.map((msg) {
      return {
        ...msg,
        'isMe': msg['senderId'] == currentUser.uid,
      };
    }).toList();

    // تحديث حالة القراءة للرسائل
    _chatRepository.markMessagesAsRead(chat.id, currentUser.uid);

    notifyListeners();
    _scrollToBottom();
  }

  Future<void> sendMessage(String chatId, String message, bool isText) async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw Exception('No user signed in');
      }

      final chatIndex = _chats.indexWhere((chat) => chat.id == chatId);
      if (chatIndex == -1) return;

      final recipientId = _chats[chatIndex]
          .participants
          .firstWhere((id) => id != currentUser.uid);

      final messageData = {
        'messageId': DateTime.now().millisecondsSinceEpoch.toString(),
        'senderId': currentUser.uid,
        'text': message,
        'isImage': !isText,
        'time': DateTime.now().toIso8601String(),
        'isRead': false,
      };

      await _chatRepository.updateMessages(chatId, messageData, recipientId);

      _localMessages.add({
        ...messageData,
        'isMe': true,
      });

      messageController.clear();
      notifyListeners();
      _scrollToBottom();
    } catch (e) {
      _errorMessage = 'Failed to send message: $e';
      notifyListeners();
    }
  }

  Future<void> sendImage(
      String chatId, File image, Function(bool) onUploadingImage) async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw Exception('No user signed in');
      }

      final chatIndex = _chats.indexWhere((chat) => chat.id == chatId);
      if (chatIndex == -1) return;

      final recipientId = _chats[chatIndex]
          .participants
          .firstWhere((id) => id != currentUser.uid);

      onUploadingImage(true);
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('chat_images/${DateTime.now().millisecondsSinceEpoch}.jpg');
      await storageRef.putFile(image);
      final imageUrl = await storageRef.getDownloadURL();

      final messageData = {
        'messageId': DateTime.now().millisecondsSinceEpoch.toString(),
        'senderId': currentUser.uid,
        'text': imageUrl,
        'isImage': true,
        'time': DateTime.now().toIso8601String(),
        'isRead': false,
      };

      await _chatRepository.updateMessages(chatId, messageData, recipientId);

      _localMessages.add({
        ...messageData,
        'isMe': true,
      });

      notifyListeners();
      _scrollToBottom();
    } catch (e) {
      _errorMessage = 'Failed to send image: $e';
      notifyListeners();
    } finally {
      onUploadingImage(false);
    }
  }

  Future<void> deleteMessage(String chatId, String messageId) async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw Exception('No user signed in');
      }

      final message = _localMessages.firstWhere(
        (msg) => msg['messageId'] == messageId,
        orElse: () => {},
      );

      if (message.isEmpty || message['senderId'] != currentUser.uid) {
        throw Exception('لا يمكنك حذف هذه الرسالة');
      }

      await _chatRepository.deleteMessage(chatId, messageId, currentUser.uid);

      _localMessages.removeWhere((msg) => msg['messageId'] == messageId);
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Failed to delete message: $e';
      notifyListeners();
    }
  }

  Future<void> resetUnreadCount(String chatId) async {
    try {
      await _chatRepository.resetUnreadCount(chatId);
      final chatIndex = _chats.indexWhere((chat) => chat.id == chatId);
      if (chatIndex != -1) {
        _chats[chatIndex] = ChatModel(
          id: _chats[chatIndex].id,
          participants: _chats[chatIndex].participants,
          lastMessage: _chats[chatIndex].lastMessage,
          name: _chats[chatIndex].name,
          email: _chats[chatIndex].email,
          time: _chats[chatIndex].time,
          timestamp: _chats[chatIndex].timestamp,
          unreadCount: 0,
          avatar: _chats[chatIndex].avatar,
          hasCheckmark: _chats[chatIndex].hasCheckmark,
          messages: _chats[chatIndex].messages,
        );
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = 'فشل إعادة ضبط عدد الرسائل الغير مقروءة: $e';
      notifyListeners();
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _chatStreamSubscription?.cancel(); // Cancel the stream subscription
    messageController.dispose();
    scrollController.dispose();
    super.dispose();
  }
}