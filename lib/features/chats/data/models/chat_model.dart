class ChatModel {
  final String name;
  final String message;
  final String time;
  final int unreadCount;
  final String avatar;
  final bool hasCheckmark;

  ChatModel({
    required this.name,
    required this.message,
    required this.time,
    required this.unreadCount,
    required this.avatar,
    required this.hasCheckmark,
  });
}
