import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updateExistingChats() async {
  final firestore = FirebaseFirestore.instance;
  final chatsSnapshot = await firestore.collection('chats').get();

  for (var doc in chatsSnapshot.docs) {
    final data = doc.data();
    final participants = List<String>.from(data['participants'] ?? []);

    // جلب بيانات المستخدمين
    final Map<String, String> names = {};
    final Map<String, String> avatars = {};

    for (var userId in participants) {
      final userDoc = await firestore.collection('users').doc(userId).get();
      names[userId] = userDoc['name'] ?? 'Unknown';
      avatars[userId] = userDoc['image'] ?? '';
    }

    // تحديث الوثيقة
    await doc.reference.update({
      'names': names,
      'avatars': avatars,
      'timestamp': data['timestamp'] ?? FieldValue.serverTimestamp(),
    });
    print('Updated chat ${doc.id}');
  }
}
