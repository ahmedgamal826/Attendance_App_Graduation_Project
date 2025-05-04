import 'package:attendance_app/app_home.dart';
import 'package:attendance_app/features/home/presentation/views/assistant_home_view.dart';
import 'package:attendance_app/features/on%20boarding/presentation/views/onboarding_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashLogic {
  static Future<void> NavigateToChatHomeView(BuildContext context) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        // إذا لم يكن هناك مستخدم مسجل، انتقل إلى شاشة Onboarding
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const OnboardScreen()),
          (route) => false,
        );
        return;
      }

      // ✅ جلب بيانات المستخدم من Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .get();

      if (userDoc.exists) {
        String role = userDoc.get("role"); // استخراج دور المستخدم

        Widget nextScreen;

        if (role == "assistant") {
          nextScreen =
              const AssistantHomeView(); // إذا كان Assistant انتقل إلى AddUserScreen
        } else {
          nextScreen = const AppHome(); // الباقي يذهب إلى AppHome
        }

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => nextScreen),
          (route) => false,
        );
      } else {
        // في حالة لم يتم العثور على بيانات المستخدم
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const OnboardScreen()),
          (route) => false,
        );
      }
    } catch (e) {
      debugPrint("Error navigating: $e");
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const OnboardScreen()),
        (route) => false,
      );
    }
  }
}
