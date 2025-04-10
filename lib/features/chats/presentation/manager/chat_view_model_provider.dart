import 'dart:io';
import 'package:attendance_app/features/chats/data/models/chat_model.dart';
import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
import 'package:flutter/material.dart';

class ChatViewModel extends ChangeNotifier {
  final ChatRepository _chatRepository;
  List<ChatModel> _chats = [];
  List<ChatModel> _filteredChats = [];
  bool _isLoading = false;
  String? _errorMessage;

  // List<ChatModel> get chats => _chats;
  List<ChatModel> get chats => _filteredChats.isEmpty ? _chats : _filteredChats;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  ChatViewModel(this._chatRepository) {
    fetchChats();
  }

  Future<void> fetchChats() async {
    _isLoading = true;
    notifyListeners();

    try {
      _chats = await _chatRepository.getChats();
      _filteredChats = []; // reset filter
    } catch (e) {
      _errorMessage = 'Failed to fetch chats: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
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
    File? image, // Keeping this optional for potential image handling
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final newChat = ChatModel(
        name: name,
        message: message,
        time: time,
        unreadCount: unreadCount,
        avatar: avatar, // Could use image?.path if an image is provided
        hasCheckmark: hasCheckmark,
      );
      await _chatRepository.createChat(newChat);
      _chats.add(newChat);
    } catch (e) {
      _errorMessage = 'Failed to create chat: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteChat(int index) async {
    _isLoading = true;
    notifyListeners();

    try {
      final chatToDelete = _chats[index];
      await _chatRepository
          .deleteChat(chatToDelete); // استدعاء الـ repository لحذف الشات
      _chats.removeAt(index); // حذف الشات من القايمة المحلية
    } catch (e) {
      _errorMessage = 'Failed to delete chat: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
