import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class AttendanceRepository {
  Stream<QuerySnapshot> getAttendanceStream(
      String courseId, int lectureNumber) {
    return FirebaseFirestore.instance
        .collection('Courses')
        .doc(courseId)
        .collection('lectures')
        .where('lectureNumber', isEqualTo: lectureNumber)
        .snapshots();
  }

  Stream<QuerySnapshot> getStudentsStream(DocumentReference lectureRef) {
    return lectureRef.collection('attendance').snapshots();
  }

  // Future<void> addStudent(
  //   String courseId,
  //   int lectureNumber,
  //   String studentId,
  //   String name,
  //   String imageUrl,
  // ) async {
  //   try {
  //     DocumentReference courseRef =
  //         FirebaseFirestore.instance.collection('Courses').doc(courseId);
  //     QuerySnapshot lectureSnapshot = await courseRef
  //         .collection('lectures')
  //         .where('lectureNumber', isEqualTo: lectureNumber)
  //         .get();

  //     if (lectureSnapshot.docs.isNotEmpty) {
  //       var lectureDoc = lectureSnapshot.docs.first;
  //       String currentDate = DateTime.now().toString().split(' ')[0];
  //       String currentTime = DateTime.now()
  //           .toString()
  //           .split(' ')[1]
  //           .substring(0, 8); // الوقت الحالي (HH:MM:SS)

  //       await lectureDoc.reference.collection('attendance').doc(studentId).set({
  //         'name': name,
  //         'imageUrl': imageUrl,
  //         currentDate: {
  //           'Check-in': currentTime,
  //           'Check-out': currentTime,
  //           'imageUrl': imageUrl,
  //         },
  //         'isStarred': false,
  //       });
  //     }
  //   } catch (e) {
  //     throw Exception('Error adding student: $e');
  //   }
  // }

  Future<void> addStudent(
    String courseId,
    int lectureNumber,
    String studentId,
    String name,
    String imageUrl,
  ) async {
    try {
      DocumentReference courseRef =
          FirebaseFirestore.instance.collection('Courses').doc(courseId);
      QuerySnapshot lectureSnapshot = await courseRef
          .collection('lectures')
          .where('lectureNumber', isEqualTo: lectureNumber)
          .get();

      if (lectureSnapshot.docs.isNotEmpty) {
        var lectureDoc = lectureSnapshot.docs.first;
        String currentDate = DateTime.now().toString().split(' ')[0];
        String currentTime =
            DateTime.now().toString().split(' ')[1].substring(0, 8);

        await lectureDoc.reference.collection('attendance').doc(studentId).set({
          'name': name,
          'imageUrl': imageUrl,
          currentDate: {
            'Check-in': currentTime,
            'Check-out': currentTime,
            'imageUrl': imageUrl,
          },
          'isStarred': false,
          'bonusCount': 0, // إضافة حقل bonusCount بقيمة افتراضية 0
        });
      }
    } catch (e) {
      throw Exception('Error adding student: $e');
    }
  }

  // تحديث بيانات طالب
  Future<void> updateStudent(
    String courseId,
    int lectureNumber,
    String studentId,
    String name,
    String? imageUrl,
  ) async {
    try {
      DocumentReference courseRef =
          FirebaseFirestore.instance.collection('Courses').doc(courseId);
      QuerySnapshot lectureSnapshot = await courseRef
          .collection('lectures')
          .where('lectureNumber', isEqualTo: lectureNumber)
          .get();

      if (lectureSnapshot.docs.isNotEmpty) {
        var lectureDoc = lectureSnapshot.docs.first;
        await lectureDoc.reference
            .collection('attendance')
            .doc(studentId)
            .update({
          'name': name,
          'imageUrl': imageUrl,
        });
      }
    } catch (e) {
      throw Exception('Error updating student: $e');
    }
  }

  // حذف طالب
  Future<void> deleteStudent(
      String courseId, int lectureNumber, String studentId) async {
    try {
      DocumentReference courseRef =
          FirebaseFirestore.instance.collection('Courses').doc(courseId);
      QuerySnapshot lectureSnapshot = await courseRef
          .collection('lectures')
          .where('lectureNumber', isEqualTo: lectureNumber)
          .get();

      if (lectureSnapshot.docs.isNotEmpty) {
        var lectureDoc = lectureSnapshot.docs.first;
        await lectureDoc.reference
            .collection('attendance')
            .doc(studentId)
            .delete();
      }
    } catch (e) {
      throw Exception('Error deleting student: $e');
    }
  }

  // رفع الصورة إلى Firebase Storage
  Future<String> uploadImageToStorage(
      String filePath, String studentName) async {
    try {
      File file = File(filePath);
      String encodedStudentName = Uri.encodeComponent(studentName);
      String fileName =
          'faces/$encodedStudentName-${DateTime.now().millisecondsSinceEpoch}.jpg';
      Reference storageRef = FirebaseStorage.instance.ref().child(fileName);
      UploadTask uploadTask = storageRef.putFile(file);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw Exception('Error uploading image to Firebase Storage: $e');
    }
  }

  // // تحديث حالة الـ Star للطالب
  // Future<void> toggleStarStatus(String courseId, int lectureNumber,
  //     String studentId, bool isStarred) async {
  //   try {
  //     DocumentReference courseRef =
  //         FirebaseFirestore.instance.collection('Courses').doc(courseId);
  //     QuerySnapshot lectureSnapshot = await courseRef
  //         .collection('lectures')
  //         .where('lectureNumber', isEqualTo: lectureNumber)
  //         .get();

  //     if (lectureSnapshot.docs.isNotEmpty) {
  //       var lectureDoc = lectureSnapshot.docs.first;
  //       await lectureDoc.reference
  //           .collection('attendance')
  //           .doc(studentId)
  //           .update({
  //         'isStarred': !isStarred,
  //       });
  //     }
  //   } catch (e) {
  //     throw Exception('Error updating star status: $e');
  //   }
  // }

  // Future<void> toggleStarStatus(String courseId, int lectureNumber,
  //     String studentId, bool isStarred) async {
  //   try {
  //     DocumentReference courseRef =
  //         FirebaseFirestore.instance.collection('Courses').doc(courseId);
  //     QuerySnapshot lectureSnapshot = await courseRef
  //         .collection('lectures')
  //         .where('lectureNumber', isEqualTo: lectureNumber)
  //         .get();

  //     if (lectureSnapshot.docs.isNotEmpty) {
  //       var lectureDoc = lectureSnapshot.docs.first;
  //       DocumentReference studentRef =
  //           lectureDoc.reference.collection('attendance').doc(studentId);

  //       // جلب بيانات الطالب الحالية
  //       DocumentSnapshot studentDoc = await studentRef.get();
  //       if (studentDoc.exists) {
  //         var studentData = studentDoc.data() as Map<String, dynamic>;
  //         int currentBonusCount = studentData['bonusCount'] ?? 0;

  //         // تحديث isStarred و bonusCount
  //         await studentRef.update({
  //           'isStarred': !isStarred,
  //           'bonusCount':
  //               !isStarred ? currentBonusCount + 1 : currentBonusCount,
  //         });
  //       }
  //     }
  //   } catch (e) {
  //     throw Exception('Error updating star status: $e');
  //   }
  // }

  Future<void> toggleStarStatus(String courseId, int lectureNumber,
      String studentId, bool isStarred) async {
    try {
      DocumentReference courseRef =
          FirebaseFirestore.instance.collection('Courses').doc(courseId);
      QuerySnapshot lectureSnapshot = await courseRef
          .collection('lectures')
          .where('lectureNumber', isEqualTo: lectureNumber)
          .get();

      if (lectureSnapshot.docs.isNotEmpty) {
        var lectureDoc = lectureSnapshot.docs.first;
        DocumentReference studentRef =
            lectureDoc.reference.collection('attendance').doc(studentId);

        DocumentSnapshot studentDoc = await studentRef.get();
        if (studentDoc.exists) {
          var studentData = studentDoc.data() as Map<String, dynamic>;
          int currentBonusCount = studentData['bonusCount'] ?? 0;

          int newBonusCount;
          if (!isStarred) {
            // إذا كانت النجمة غير مفعلة وتم تفعيلها، نزيد البونص
            newBonusCount = currentBonusCount + 1;
          } else {
            // إذا كانت النجمة مفعلة وتم إلغاؤها، ننقص البونص (لكن لا يقل عن 0)
            newBonusCount = currentBonusCount - 1;
            if (newBonusCount < 0) newBonusCount = 0;
          }

          await studentRef.update({
            'isStarred': !isStarred,
            'bonusCount': newBonusCount,
          });
        }
      }
    } catch (e) {
      throw Exception('Error updating star status: $e');
    }
  }
}
