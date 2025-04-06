import 'package:attendance_app/features/chats/data/models/chat_model.dart';

class ChatRepository {
  // In-memory list to store chats (for demo purposes)
  final List<ChatModel> _chatList = [
    ChatModel(
      name: 'Ahmed Elnemr',
      message: 'You: Hello, I am fine',
      time: '1:46 PM',
      unreadCount: 0,
      avatar:
          'https://t4.ftcdn.net/jpg/02/17/51/67/240_F_217516770_nHjCK3C82B2ZUC3JB3qQs8W2BGLHxZfa.jpg',
      hasCheckmark: true,
    ),
    ChatModel(
      name: 'Book Club',
      message: 'You: Sure, I can join at 9 PM...',
      time: '2:43 PM',
      unreadCount: 0,
      avatar:
          'https://t3.ftcdn.net/jpg/05/59/87/12/240_F_559871209_pbXlOVArUal3mk6Ce60JuP13kmuIRCth.jpg',
      hasCheckmark: true,
    ),
    ChatModel(
      name: 'Ahmed Beherry',
      message: 'You: I sent you the code',
      time: '12:01/2/14',
      unreadCount: 0,
      avatar:
          'https://t4.ftcdn.net/jpg/03/23/82/99/240_F_323829966_H32wLhoouiPinJ66KyggCvqQ2dFPuuQ1.jpg',
      hasCheckmark: true,
    ),
    ChatModel(
      name: 'Ahmed ElShokary',
      message: 'Image',
      time: '1:11 PM',
      unreadCount: 389,
      avatar:
          'https://t4.ftcdn.net/jpg/02/05/62/79/240_F_205627948_sZMAVsbgp8VtRmc53kSLwWCKTEFImxHV.jpg',
      hasCheckmark: false,
    ),
    ChatModel(
      name: 'Machine Learning (Project)',
      message: 'Abanoub Emad reacted 👍 to...',
      time: '1:11 PM',
      unreadCount: 0,
      avatar:
          'https://t4.ftcdn.net/jpg/05/67/46/61/240_F_567466191_M8cVuf9UM6tYmTdyeiGsieoGPnbKha3R.jpg',
      hasCheckmark: false,
    ),
    ChatModel(
      name: 'Flutter Developers community',
      message: '~Sabri: Hey, we have a new...',
      time: '9:46 PM',
      unreadCount: 656,
      avatar:
          'https://t4.ftcdn.net/jpg/02/17/51/67/240_F_217516770_nHjCK3C82B2ZUC3JB3qQs8W2BGLHxZfa.jpg',
      hasCheckmark: false,
    ),
    ChatModel(
      name: 'Abanoub Emad',
      message: 'Sticker',
      time: '9:41 PM',
      unreadCount: 59,
      avatar:
          'https://t4.ftcdn.net/jpg/03/23/82/99/240_F_323829966_H32wLhoouiPinJ66KyggCvqQ2dFPuuQ1.jpg',
      hasCheckmark: false,
    ),
    ChatModel(
      name: 'BFCAI Seniors 2025 - AI Chatting',
      message: 'A: https://docs.google.com/forms/d/...',
      time: '9:41 PM',
      unreadCount: 0,
      avatar:
          'https://t4.ftcdn.net/jpg/02/17/51/67/240_F_217516770_nHjCK3C82B2ZUC3JB3qQs8W2BGLHxZfa.jpg',
      hasCheckmark: false,
    ),
    ChatModel(
      name: 'Machine Learning (Project)',
      message: 'Abanoub Emad reacted 👍 to...',
      time: '1:11 PM',
      unreadCount: 0,
      avatar:
          'https://t4.ftcdn.net/jpg/05/67/46/61/240_F_567466191_M8cVuf9UM6tYmTdyeiGsieoGPnbKha3R.jpg',
      hasCheckmark: false,
    ),
    ChatModel(
      name: 'Flutter Developers community',
      message: '~Sabri: Hey, we have a new...',
      time: '9:46 PM',
      unreadCount: 656,
      avatar:
          'https://t4.ftcdn.net/jpg/02/17/51/67/240_F_217516770_nHjCK3C82B2ZUC3JB3qQs8W2BGLHxZfa.jpg',
      hasCheckmark: false,
    ),
    ChatModel(
      name: 'Abanoub Emad',
      message: 'Sticker',
      time: '9:41 PM',
      unreadCount: 59,
      avatar:
          'https://t4.ftcdn.net/jpg/03/23/82/99/240_F_323829966_H32wLhoouiPinJ66KyggCvqQ2dFPuuQ1.jpg',
      hasCheckmark: false,
    ),
    ChatModel(
      name: 'IS (2021-2025)',
      message: 'Abdelhakim: Hey, how are you?',
      time: '9:41 PM',
      unreadCount: 53,
      avatar:
          'https://t4.ftcdn.net/jpg/03/23/82/99/240_F_323829966_H32wLhoouiPinJ66KyggCvqQ2dFPuuQ1.jpg',
      hasCheckmark: false,
    ),
    ChatModel(
      name: 'Machine Learning (Project)',
      message: 'Abanoub Emad reacted 👍 to...',
      time: '1:11 PM',
      unreadCount: 0,
      avatar:
          'https://t4.ftcdn.net/jpg/05/67/46/61/240_F_567466191_M8cVuf9UM6tYmTdyeiGsieoGPnbKha3R.jpg',
      hasCheckmark: false,
    ),
    ChatModel(
      name: 'Flutter Developers community',
      message: '~Sabri: Hey, we have a new...',
      time: '9:46 PM',
      unreadCount: 656,
      avatar:
          'https://t4.ftcdn.net/jpg/02/17/51/67/240_F_217516770_nHjCK3C82B2ZUC3JB3qQs8W2BGLHxZfa.jpg',
      hasCheckmark: false,
    ),
    ChatModel(
      name: 'Abanoub Emad',
      message: 'Sticker',
      time: '9:41 PM',
      unreadCount: 59,
      avatar:
          'https://t4.ftcdn.net/jpg/03/23/82/99/240_F_323829966_H32wLhoouiPinJ66KyggCvqQ2dFPuuQ1.jpg',
      hasCheckmark: false,
    ),
  ];

  Future<List<ChatModel>> getChats() async {
    // Simulate fetching from API/Database
    return List<ChatModel>.from(_chatList);
  }

  Future<void> createChat(ChatModel chat) async {
    // Simulate adding to API/Database by adding to the in-memory list
    _chatList.add(chat);
    // In a real app, you'd make an API call or database insert here
    await Future.delayed(Duration(milliseconds: 500)); // Simulate network delay
  }

  Future<void> deleteChat(ChatModel chat) async {
    _chatList.remove(chat);
    await Future.delayed(Duration(milliseconds: 300));
  }
}
