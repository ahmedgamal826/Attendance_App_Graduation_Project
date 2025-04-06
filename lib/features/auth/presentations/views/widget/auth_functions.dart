import 'package:attendance_app/features/auth/presentations/views/add_user_screen.dart';
import 'package:attendance_app/features/auth/presentations/views/widget/show_snack_bar.dart';
import 'package:attendance_app/features/home/presentation/views/assistant_home_view.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // استيراد Firestore
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// void signUp({
//   required BuildContext context,
//   required TextEditingController nameController,
//   required TextEditingController emailController,
//   required TextEditingController passwordController,
//   required TextEditingController confirmPasswordController,
//   required String role,
//   required String imageUrl,
// }) async {
//   if (nameController.text.isEmpty ||
//       emailController.text.isEmpty ||
//       passwordController.text.isEmpty ||
//       confirmPasswordController.text.isEmpty) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text("All fields are required")),
//     );
//     return;
//   }

//   if (passwordController.text != confirmPasswordController.text) {
//     CustomSnackBar.showErrorSnackBar(context, 'Passwords do not match.');
//     return;
//   }

//   try {
//     // 1. **إنشاء الحساب في Firebase Authentication**
//     UserCredential userCredential =
//         await FirebaseAuth.instance.createUserWithEmailAndPassword(
//       email: emailController.text,
//       password: passwordController.text,
//     );

//     String uid = userCredential.user!.uid; // جلب الـ UID الخاص بالمستخدم

//     // 2. **إضافة بيانات المستخدم إلى Firestore ضمن مجموعة "users"**
//     await FirebaseFirestore.instance.collection("users").doc(uid).set({
//       'uid': uid, // حفظ الـ UID
//       'name': nameController.text,
//       'email': emailController.text,
//       'password': passwordController.text,
//       'role': role,
//       'image': imageUrl,
//       'createdAt': FieldValue.serverTimestamp(),
//     });

//     // 3. **إظهار رسالة نجاح**
//     AwesomeDialog(
//       context: context,
//       dialogType: DialogType.success,
//       animType: AnimType.scale,
//       title: 'User Added',
//       desc: 'The user has been added successfully.',
//       btnOkOnPress: () {
//         Navigator.pushReplacementNamed(context, "adminMonthsScreen");
//       },
//     ).show();
//   } on FirebaseAuthException catch (e) {
//     CustomSnackBar.showErrorSnackBar(context, 'Error: ${e.message}');
//   } catch (e) {
//     CustomSnackBar.showErrorSnackBar(
//         context, 'An error occurred. Please try again.');
//   }
// }

// void signUp({
//   required BuildContext context,
//   required TextEditingController nameController,
//   required TextEditingController emailController,
//   required TextEditingController passwordController,
//   required TextEditingController confirmPasswordController,
//   required String role,
//   required String imageUrl,
// }) async {
//   if (nameController.text.isEmpty ||
//       emailController.text.isEmpty ||
//       passwordController.text.isEmpty ||
//       confirmPasswordController.text.isEmpty) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text("All fields are required")),
//     );
//     return;
//   }

//   if (passwordController.text != confirmPasswordController.text) {
//     CustomSnackBar.showErrorSnackBar(context, 'Passwords do not match.');
//     return;
//   }

//   // 1️⃣ **احفظ المستخدم الحالي (الـ admin) قبل إنشاء الحساب الجديد**
//   User? adminUser = FirebaseAuth.instance.currentUser;
//   String? adminEmail = adminUser?.email; // حفظ بريد الـ admin
//   String? adminPassword =
//       "your_admin_password"; // يجب أن تعرف كلمة مرور الـ admin

//   try {
//     // 2️⃣ **إنشاء المستخدم الجديد**
//     UserCredential userCredential =
//         await FirebaseAuth.instance.createUserWithEmailAndPassword(
//       email: emailController.text,
//       password: passwordController.text,
//     );

//     String uid = userCredential.user!.uid;

//     // 3️⃣ **إضافة بيانات المستخدم إلى Firestore**
//     await FirebaseFirestore.instance.collection("users").doc(uid).set({
//       'uid': uid,
//       'name': nameController.text,
//       'email': emailController.text,
//       'password': passwordController.text, // غير آمن 🚨، الأفضل تشفيرها
//       'role': role,
//       'image': imageUrl,
//       'createdAt': FieldValue.serverTimestamp(),
//     });

//     // 4️⃣ **إعادة تسجيل دخول الـ admin بعد إنشاء الحساب الجديد**
//     if (adminEmail != null && adminPassword != null) {
//       await FirebaseAuth.instance.signOut(); // تسجيل خروج المستخدم الجديد
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: adminEmail,
//         password: adminPassword,
//       );
//     }

//     // 5️⃣ **إظهار رسالة نجاح**
//     AwesomeDialog(
//       context: context,
//       dialogType: DialogType.success,
//       animType: AnimType.scale,
//       title: 'User Added',
//       desc: 'The user has been added successfully.',
//       btnOkOnPress: () {
//         Navigator.pushReplacementNamed(context, "adminMonthsScreen");
//       },
//     ).show();
//   } on FirebaseAuthException catch (e) {
//     CustomSnackBar.showErrorSnackBar(context, 'Error: ${e.message}');
//   } catch (e) {
//     CustomSnackBar.showErrorSnackBar(
//         context, 'An error occurred. Please try again.');
//   }
// }

void signUp({
  required BuildContext context,
  required TextEditingController nameController,
  required TextEditingController emailController,
  required TextEditingController passwordController,
  // required TextEditingController confirmPasswordController,
  required String role,
  required String imageUrl,
}) async {
  if (nameController.text.isEmpty ||
      emailController.text.isEmpty ||
      passwordController.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("All fields are required")),
    );
    return;
  }

  // if (passwordController.text != confirmPasswordController.text) {
  //   CustomSnackBar.showErrorSnackBar(context, 'Passwords do not match.');
  //   return;
  // }

  // 1️⃣ **احفظ المستخدم الحالي (الـ admin) قبل إنشاء الحساب الجديد**
  User? adminUser = FirebaseAuth.instance.currentUser;
  String? adminEmail = adminUser?.email;

  if (adminEmail == null) {
    CustomSnackBar.showErrorSnackBar(context, 'Admin user not found!');
    return;
  }

  try {
    // 2️⃣ **جلب كلمة مرور الـ admin من Firestore**
    DocumentSnapshot adminDoc = await FirebaseFirestore.instance
        .collection("users")
        .doc(adminUser!.uid) // البحث بالـ UID الخاص بالـ admin
        .get();

    if (!adminDoc.exists) {
      CustomSnackBar.showErrorSnackBar(context, 'Admin data not found!');
      return;
    }

    String? adminPassword = adminDoc.get("password"); // جلب كلمة المرور

    if (adminPassword == null) {
      CustomSnackBar.showErrorSnackBar(context, 'Admin password not found!');
      return;
    }

    // 3️⃣ **إنشاء المستخدم الجديد**
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );

    String uid = userCredential.user!.uid;

    // 4️⃣ **إضافة بيانات المستخدم الجديد إلى Firestore**
    await FirebaseFirestore.instance.collection("users").doc(uid).set({
      'uid': uid,
      'name': nameController.text,
      'email': emailController.text,
      'password': passwordController.text, // 🚨 غير آمن، يفضل التشفير
      'role': role,
      'image': imageUrl,
      'createdAt': FieldValue.serverTimestamp(),
    });

    // 5️⃣ **إعادة تسجيل دخول الـ admin بعد إنشاء الحساب الجديد**
    await FirebaseAuth.instance.signOut(); // تسجيل خروج المستخدم الجديد
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: adminEmail,
      password: adminPassword,
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const AssistantHomeView(),
      ),
    );

    // // 6️⃣ **إظهار رسالة نجاح**
    // AwesomeDialog(
    //   context: context,
    //   dialogType: DialogType.success,
    //   animType: AnimType.scale,
    //   title: 'User Added',
    //   desc: 'The user has been added successfully.',
    //   btnOkOnPress: () {
    //     Navigator.pushReplacementNamed(context, "adminMonthsScreen");
    //   },
    // ).show();
  } on FirebaseAuthException catch (e) {
    CustomSnackBar.showErrorSnackBar(context, 'Error: ${e.message}');
  } catch (e) {
    CustomSnackBar.showErrorSnackBar(
        context, 'An error occurred. Please try again.');
  }
}

/// Sign In Function  ===> Login
void signIn({
  required BuildContext context,
  required TextEditingController emailController,
  required TextEditingController passwordController,
  // required bool isAdmin,
}) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    final user = credential.user;

    if (user != null) {
      // ✅ جلب بيانات المستخدم من Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection("users") // تأكد أن اسم المجموعة صحيح
          .doc(user.uid)
          .get();

      if (userDoc.exists) {
        String role =
            userDoc.get("role"); // تأكد أن لديك حقل 'role' في Firestore

        if (role == "admin") {
          Navigator.of(context).pushReplacementNamed("appHome");
        } else if (role == 'assistant') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AssistantHomeView(),
            ),
          );
        } else {
          Navigator.of(context).pushReplacementNamed("appHome");
        }
      } else {
        CustomSnackBar.showErrorSnackBar(
            context, "User data not found in Firestore.");
      }
    }

    // توجيه المستخدم بناءً على ما إذا كان admin أم لا
    // if (isAdmin) {
    //   Navigator.of(context).pushReplacementNamed("monthsSelectionView");
    // } else {
    //   Navigator.of(context).pushReplacementNamed("monthsSelectionView");
    // }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      CustomSnackBar.showErrorSnackBar(
          context, 'No user found for that email.');
    } else if (e.code == 'wrong-password') {
      CustomSnackBar.showErrorSnackBar(context, 'Wrong password');
    } else if (e.code == 'user-disabled') {
      CustomSnackBar.showErrorSnackBar(context, 'This user has been disabled.');
    } else if (e.code == 'too-many-requests') {
      CustomSnackBar.showErrorSnackBar(
          context, 'Too many requests. Try again later.');
    } else if (e.code == 'operation-not-allowed') {
      CustomSnackBar.showErrorSnackBar(
          context, 'Signing in with email and password is not enabled.');
    } else if (e.code == 'invalid-email') {
      CustomSnackBar.showErrorSnackBar(
          context, 'The email address is invalid.');
    } else {
      CustomSnackBar.showErrorSnackBar(
          context, 'No user found for that email.');
    }
  } catch (e) {
    CustomSnackBar.showErrorSnackBar(
        context, 'An error occurred. Please try again.');
  }
}
