// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// void showDeleteConfirmationDialog(BuildContext context, String userId) {
//   AwesomeDialog(
//     context: context,
//     dialogType: DialogType.warning,
//     animType: AnimType.bottomSlide,
//     title: 'Confirm Delete',
//     desc: 'Are you sure you want to delete this account?',
//     btnCancelOnPress: () {},
//     btnOkOnPress: () {
//       FirebaseFirestore.instance.collection("users").doc(userId).delete();
//       Navigator.pop(context); // إغلاق الـ bottom sheet بعد الحذف
//     },
//     btnOkText: "Delete",
//     btnCancelText: "Cancel",
//     btnOkColor: Colors.green,
//   ).show();
// }

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void showDeleteConfirmationDialog(
    BuildContext context, String userId, VoidCallback onDeleteConfirmed) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.warning,
    animType: AnimType.bottomSlide,
    title: 'Confirm Delete',
    desc: 'Are you sure you want to delete this account?',
    btnCancelOnPress: () {},
    btnOkOnPress: () {
      // حذف الحساب من Firestore
      FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .delete()
          .then((_) {
        // بعد الحذف، استدعاء دالة تحديث الواجهة
        onDeleteConfirmed();
      });
      Navigator.pop(context); // إغلاق الـ dialog بعد الحذف
    },
    btnOkText: "Delete",
    btnCancelText: "Cancel",
    btnOkColor: Colors.green,
  ).show();
}
