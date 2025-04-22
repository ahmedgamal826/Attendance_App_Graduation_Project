import 'dart:async'; // Required for StreamSubscription
import 'dart:developer';
import 'package:attendance_app/features/chats/data/models/chat_model.dart';
import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
import 'package:attendance_app/features/notifications/presentation/manager/send_notifications_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:uuid/uuid.dart';

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
  StreamSubscription<List<ChatModel>>?
      _chatStreamSubscription; // Added subscription variable

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

      // ترتيب المحادثات بناءً على timestamp من الأحدث للأقدم
      _chats.sort((a, b) {
        final aTimestamp = a.timestamp ?? DateTime(1970);
        final bTimestamp = b.timestamp ?? DateTime(1970);
        return bTimestamp.compareTo(aTimestamp);
      });

      _isLoading = false;
      notifyListeners();
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
      // الـ Stream هيحدث القايمة تلقائيًا، لكن لو حبيت تتأكد:
      final chatIndex = _chats.indexWhere((chat) => chat.id == chatId);
      if (chatIndex != -1) {
        _chats[chatIndex] = ChatModel(
          id: _chats[chatIndex].id,
          participants: _chats[chatIndex].participants,
          lastMessage: _chats[chatIndex].lastMessage,
          name: newName, // تحديث الاسم محليًا
          email: _chats[chatIndex].email,
          time: _chats[chatIndex].time,
          timestamp: _chats[chatIndex].timestamp,
          unreadCount: _chats[chatIndex].unreadCount,
          avatar: _chats[chatIndex].avatar,
          hasCheckmark: _chats[chatIndex].hasCheckmark,
          messages: _chats[chatIndex].messages,
          names: _chats[chatIndex].names, // إضافة names
          avatars: _chats[chatIndex].avatars, // إضافة avatars
        );
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = 'Failed to update chat name: $e';
      notifyListeners();
    }
  }

  String? _currentChatId; // متغير لتتبع الشات الحالي
  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>?
      _messagesStreamSubscription; // اشتراك للرسايل

// تعديل دالة initChatMessages
  void initChatMessages(ChatModel chat) {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) return;

    _currentChatId = chat.id; // تحديث الشات الحالي
    _localMessages = chat.messages.map((msg) {
      return {
        ...msg,
        'isMe': msg['senderId'] == currentUser.uid,
      };
    }).toList();

    // إلغاء الاشتراك القديم لو موجود
    _messagesStreamSubscription?.cancel();

    // استماع مباشر للرسايل في الشات الحالي
    _messagesStreamSubscription = FirebaseFirestore.instance
        .collection('chats')
        .doc(chat.id)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        final messages =
            List<Map<String, dynamic>>.from(data['messages'] ?? []);
        // تحديث الرسايل المحلية فقط لو الشات الحالي هو نفسه
        if (_currentChatId == chat.id) {
          _localMessages = messages.map((msg) {
            return {
              ...msg,
              'isMe': msg['senderId'] == currentUser.uid,
            };
          }).toList();
          notifyListeners();
          scrollToBottom();
        }
      }
    }, onError: (error) {
      _errorMessage = 'Error listening to messages: $error';
      notifyListeners();
    });

    // تحديث حالة القراءة
    _chatRepository.markMessagesAsRead(chat.id, currentUser.uid);

    notifyListeners();
    scrollToBottom();
  }

// // تعديل دالة sendMessage
  Future<void> sendMessage(String chatId, String message, bool isText) async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw Exception('No user signed in');
      }

      // التأكد إن الشات الحالي هو اللي بنبعت فيه
      if (_currentChatId != chatId) {
        _errorMessage = 'Current chat ID does not match the message chat ID';
        notifyListeners();
        return;
      }

      final chatIndex = _chats.indexWhere((chat) => chat.id == chatId);
      if (chatIndex == -1) {
        _errorMessage = 'Chat not found';
        notifyListeners();
        return;
      }

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

      print('بيتم إرسال رسالة للمحادثة $chatId، المستلم: $recipientId');
      await _chatRepository.updateMessages(chatId, messageData, recipientId);

      // تحديث الـ chats محليًا
      final updatedMessages = [..._chats[chatIndex].messages, messageData];
      _chats[chatIndex] = ChatModel(
        id: _chats[chatIndex].id,
        participants: _chats[chatIndex].participants,
        lastMessage: message,
        name: _chats[chatIndex].name,
        email: _chats[chatIndex].email,
        time: DateTime.now().toIso8601String(),
        timestamp: DateTime.now(),
        unreadCount: _chats[chatIndex].unreadCount,
        avatar: _chats[chatIndex].avatar,
        hasCheckmark: _chats[chatIndex].hasCheckmark,
        messages: updatedMessages,
        names: _chats[chatIndex].names,
        avatars: _chats[chatIndex].avatars,
      );

      // تحديث الرسايل المحلية مباشرة بدل الاعتماد على الـ Stream
      if (_currentChatId == chatId) {
        _localMessages.add({
          ...messageData,
          'isMe': true,
        });
      }

      messageController.clear();
      notifyListeners();
      scrollToBottom();
    } catch (e) {
      _errorMessage = 'Failed to send message: $e';
      notifyListeners();
    }
  }

//   Future<void> sendMessage(String chatId, String text, bool isText) async {
//   if (text.trim().isEmpty) return;

//   final messageData = {
//     'messageId': const Uuid().v4(),
//     'text': text,
//     'senderId': FirebaseAuth.instance.currentUser?.uid,
//     'time': DateTime.now().toIso8601String(),
//     'isRead': false,
//     'isImage': !isText,
//     'isDocument': false,
//     'fileName': null,
//   };

//   try {
//     final currentUserId = FirebaseAuth.instance.currentUser?.uid;
//     if (currentUserId == null) {
//       _errorMessage = 'لا يوجد مستخدم مسجل الدخول';
//       notifyListeners();
//       return;
//     }

//     // التحقق من وجود مستند الدردشة
//     final chatDocRef =
//         FirebaseFirestore.instance.collection('users_chats').doc(chatId);
//     final chatDoc = await chatDocRef.get();

//     String recipientId = '';
//     if (!chatDoc.exists) {
//       // جلب recipientId من ChatModel
//       final chatIndex = _chats.indexWhere((chat) => chat.id == chatId);
//       if (chatIndex == -1) {
//         throw Exception('الدردشة غير موجودة في القائمة المحلية');
//       }
//       final participants = _chats[chatIndex].participants;
//       recipientId = participants.firstWhere(
//         (id) => id != currentUserId,
//         orElse: () => '',
//       );
//       if (recipientId.isEmpty) {
//         throw Exception('لم يتم العثور على معرف المستلم');
//       }

//       // إنشاء مستند الدردشة إذا لم يكن موجودًا
//       final currentUserDoc = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(currentUserId)
//           .get();
//       final recipientDoc = await FirebaseFirestore.instance
//           .collection('users')
//           .doc(recipientId)
//           .get();

//       if (!currentUserDoc.exists || !recipientDoc.exists) {
//         throw Exception('بيانات المستخدم أو المستلم غير موجودة');
//       }

//       await chatDocRef.set({
//         'participants': [currentUserId, recipientId],
//         'names': {
//           currentUserId: currentUserDoc.data()?['name'] ?? 'Unknown',
//           recipientId: recipientDoc.data()?['name'] ?? 'Unknown',
//         },
//         'avatars': {
//           currentUserId: currentUserDoc.data()?['avatar'] ?? '',
//           recipientId: recipientDoc.data()?['avatar'] ?? '',
//         },
//         'lastMessage': '',
//         'timestamp': FieldValue.serverTimestamp(),
//         'messages': [],
//         'unreadCounts': {currentUserId: 0, recipientId: 0},
//         'hasCheckmark': false,
//       }, SetOptions(merge: true));
//     } else {
//       // إذا كان المستند موجودًا، جلب recipientId من المستند
//       final participants = chatDoc['participants'] as List<dynamic>? ?? [];
//       recipientId = participants.firstWhere(
//         (id) => id != currentUserId,
//         orElse: () => '',
//       );
//       if (recipientId.isEmpty) {
//         throw Exception('لم يتم العثور على معرف المستلم في مستند الدردشة');
//       }
//     }

//     // إضافة الرسالة محليًا
//     _localMessages.add({...messageData, 'isMe': true});
//     notifyListeners();

//     // إرسال الرسالة إلى Firestore
//     await _chatRepository.sendMessage(chatId, messageData);

//     // تحديث بيانات الدردشة
//     await chatDocRef.update({
//       'lastMessage': text,
//       'timestamp': FieldValue.serverTimestamp(),
//       'unreadCounts.$currentUserId': 0,
//       'unreadCounts.$recipientId': FieldValue.increment(1),
//     });

//     // استرجاع رمز FCM للمستلم وإرسال الإشعار
//     final recipientDoc = await FirebaseFirestore.instance
//         .collection('users')
//         .doc(recipientId)
//         .get();
//     if (!recipientDoc.exists || recipientDoc.data() == null) {
//       log('لم يتم العثور على مستند المستلم للمعرف: $recipientId, chatId: $chatId');
//       return;
//     }
//     final recipientFcmToken = recipientDoc.data()!['fcmToken'] as String?;

//     // استرجاع اسم المرسل
//     final senderDoc = await FirebaseFirestore.instance
//         .collection('users')
//         .doc(currentUserId)
//         .get();
//     if (!senderDoc.exists || senderDoc.data() == null) {
//       log('لم يتم العثور على مستند المرسل للمعرف: $currentUserId, chatId: $chatId');
//       return;
//     }
//     final senderName = senderDoc.data()!['name'] as String? ?? 'غير معروف';

//     if (recipientFcmToken != null && recipientFcmToken.isNotEmpty) {
//       // إرسال الإشعار
//       await sendNotification(
//         token: recipientFcmToken,
//         title: 'رسالة جديدة من $senderName',
//         body: text,
//         data: {
//           'route': '/chat',
//           'chatId': chatId,
//         },
//       );
//     } else {
//       log('لم يتم العثور على رمز FCM للمستلم: $recipientId, chatId: $chatId');
//     }

//     messageController.clear();
//     scrollToBottom();
//   } catch (e) {
//     _localMessages
//         .removeWhere((msg) => msg['messageId'] == messageData['messageId']);
//     _errorMessage = 'فشل إرسال الرسالة: $e';
//     notifyListeners();
//   }
// }

  // void clearErrorMessage() {
  //   _errorMessage = null;
  //   notifyListeners();
  // }

  // تحديث دالة sendImage (اختياري لو عايز تعمم)
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
        'isDocument': false, // إضافة الحقل للتوافق
        'time': DateTime.now().toIso8601String(),
        'isRead': false,
      };

      await _chatRepository.updateMessages(chatId, messageData, recipientId);

      _localMessages.add({
        ...messageData,
        'isMe': true,
      });

      notifyListeners();
      scrollToBottom();
    } catch (e) {
      _errorMessage = 'Failed to send image: $e';
      notifyListeners();
    } finally {
      onUploadingImage(false);
    }
  }

  Future<void> sendDocument(
      String chatId, File document, Function(bool) onUploadingDocument) async {
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

      onUploadingDocument(true);
      final fileName = document.path.split('/').last; // استخراج اسم الملف
      final storageRef = FirebaseStorage.instance.ref().child(
          'chat_documents/${DateTime.now().millisecondsSinceEpoch}_$fileName');
      await storageRef.putFile(document);
      final documentUrl = await storageRef.getDownloadURL();

      final messageData = {
        'messageId': DateTime.now().millisecondsSinceEpoch.toString(),
        'senderId': currentUser.uid,
        'text': documentUrl,
        'fileName': fileName, // إضافة اسم الملف
        'isImage': false,
        'isDocument': true,
        'time': DateTime.now().toIso8601String(),
        'isRead': false,
      };

      await _chatRepository.updateMessages(chatId, messageData, recipientId);

      _localMessages.add({
        ...messageData,
        'isMe': true,
      });

      notifyListeners();
      scrollToBottom();
    } catch (e) {
      _errorMessage = 'Failed to send document: $e';
      notifyListeners();
    } finally {
      onUploadingDocument(false);
    }
  }

  // Future<void> sendDocument(
  //     String chatId, File documentFile, Function(bool) onUploadingImage) async {
  //   try {
  //     final currentUserId = FirebaseAuth.instance.currentUser?.uid;
  //     if (currentUserId == null) {
  //       _errorMessage = 'No user logged in';
  //       notifyListeners();
  //       return;
  //     }

  //     final fileName = documentFile.path.split('/').last;
  //     final storageRef = FirebaseStorage.instance
  //         .ref()
  //         .child('chat_documents')
  //         .child('$chatId/$fileName');
  //     await storageRef.putFile(documentFile);
  //     final downloadUrl = await storageRef.getDownloadURL();

  //     final messageId = const Uuid().v4();
  //     final messageData = {
  //       'messageId': messageId,
  //       'text': downloadUrl,
  //       'senderId': currentUserId,
  //       'time': DateTime.now().toIso8601String(),
  //       'isRead': false,
  //       'isImage': false,
  //       'isDocument': true,
  //       'fileName': fileName,
  //     };

  //     _localMessages.add(messageData);
  //     notifyListeners();

  //     await _chatRepository.sendMessage(chatId, messageData);

  //     await FirebaseFirestore.instance
  //         .collection('users_chats')
  //         .doc(chatId)
  //         .update({
  //       'lastMessage': fileName,
  //       'timestamp': FieldValue.serverTimestamp(),
  //     });

  //     // إرسال إشعار للمستلم
  //     final chatDoc = await FirebaseFirestore.instance
  //         .collection('users_chats')
  //         .doc(chatId)
  //         .get();
  //     final participants = chatDoc['participants'] as List<dynamic>;
  //     final recipientId = participants.firstWhere((id) => id != currentUserId,
  //         orElse: () => '');

  //     if (recipientId.isNotEmpty) {
  //       final recipientDoc = await FirebaseFirestore.instance
  //           .collection('users')
  //           .doc(recipientId)
  //           .get();
  //       final recipientFcmToken = recipientDoc.data()?['fcmToken'] as String?;
  //       final senderDoc = await FirebaseFirestore.instance
  //           .collection('users')
  //           .doc(currentUserId)
  //           .get();
  //       final senderName = senderDoc.data()?['name'] ?? 'Unknown';

  //       if (recipientFcmToken != null) {
  //         await sendNotification(
  //           token: recipientFcmToken,
  //           title: 'New Document from $senderName',
  //           body: 'You received a document: $fileName',
  //           data: {
  //             'route': '/chat',
  //             'chatId': chatId,
  //           },
  //         );
  //       } else {
  //         log('No FCM token found for recipient: $recipientId');
  //       }
  //     }
  //   } catch (e) {
  //     _errorMessage = 'Failed to send document: $e';
  //     notifyListeners();
  //   } finally {
  //     onUploadingImage(false);
  //   }
  // }

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
          names: _chats[chatIndex].names, // إضافة names
          avatars: _chats[chatIndex].avatars, // إضافة avatars
        );
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = 'فشل إعادة ضبط عدد الرسائل الغير مقروءة: $e';
      notifyListeners();
    }
  }

  void scrollToBottom() {
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
    _messagesStreamSubscription?.cancel(); // إلغاء اشتراك الرسايل
    messageController.dispose();
    scrollController.dispose();
    super.dispose();
  }
}
