import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  final Map<String, dynamic> names;
  final Map<String, dynamic> avatars;

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
    required this.names,
    required this.avatars,
  });

  factory ChatModel.fromFirestore(DocumentSnapshot doc, String currentUserId) {
    final data = doc.data() as Map<String, dynamic>;
    final messages = List<Map<String, dynamic>>.from(data['messages'] ?? []);
    final unreadCounts = data['unreadCounts'] as Map<String, dynamic>? ?? {};
    final timestamp = data['timestamp'] as Timestamp?;
    final names = data['names'] as Map<String, dynamic>? ?? {};
    final avatars = data['avatars'] as Map<String, dynamic>? ?? {};
    final participants = List<String>.from(data['participants'] ?? []);

    // التأكد من currentUserId
    final authCurrentUserId = FirebaseAuth.instance.currentUser?.uid ?? '';
    if (currentUserId.isEmpty || currentUserId != authCurrentUserId) {
      print('تحذير: currentUserId غير متطابق مع المستخدم الحالي');
      print('currentUserId الممرر: $currentUserId');
      print('currentUserId من FirebaseAuth: $authCurrentUserId');
      currentUserId = authCurrentUserId; // استخدام المعرف من FirebaseAuth
    }

    if (currentUserId.isEmpty) {
      throw Exception('لا يوجد مستخدم مسجل دخول');
    }

    print('Participants: $participants');
    print('Current User ID: $currentUserId');

    // التحقق من participants
    if (participants.length != 2) {
      print('خطأ: عدد المشاركين في المحادثة غير صحيح');
      print('Participants: $participants');
      throw Exception('عدد المشاركين في المحادثة غير صحيح');
    }

    if (!participants.contains(currentUserId)) {
      print('خطأ: معرف المستخدم الحالي غير موجود في قايمة المشاركين');
      print('Participants: $participants');
      print('Current User ID: $currentUserId');
      throw Exception('معرف المستخدم الحالي غير موجود في المحادثة');
    }

    final otherUserId =
        participants.firstWhere((id) => id != currentUserId, orElse: () => '');

    print('Other User ID: $otherUserId');

    if (otherUserId.isEmpty) {
      print('خطأ: لم يتم العثور على مستخدم آخر في المحادثة');
      throw Exception('لم يتم العثور على مستخدم آخر في المحادثة');
    }

    final otherUserName = names[otherUserId] ?? 'Unknown';
    final otherUserAvatar = avatars[otherUserId] ?? '';

    print('Other User Name: $otherUserName');
    print('Other User Avatar: $otherUserAvatar');

    // التحقق من أن otherUserName مش بيرجع اسم المستخدم الحالي
    final currentUserName = names[currentUserId] ?? '';
    if (otherUserName == currentUserName) {
      print('خطأ: otherUserName يطابق اسم المستخدم الحالي');
      print('otherUserName: $otherUserName');
      print('currentUserName: $currentUserName');
      throw Exception('اسم المستخدم الآخر يطابق اسم المستخدم الحالي');
    }

    // التحقق من أن otherUserAvatar مش بيرجع نفس الصورة بتاعة المستخدم الحالي
    final currentUserAvatar = avatars[currentUserId] ?? '';
    if (otherUserAvatar == currentUserAvatar && otherUserAvatar.isNotEmpty) {
      print('خطأ: otherUserAvatar يطابق صورة المستخدم الحالي');
      print('otherUserAvatar: $otherUserAvatar');
      print('currentUserAvatar: $currentUserAvatar');
      throw Exception('صورة المستخدم الآخر تطابق صورة المستخدم الحالي');
    }

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
      names: names,
      avatars: avatars,
    );
  }
}
