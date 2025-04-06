// import 'package:attendance_app/features/auth/features/views/login_screen.dart';
// import 'package:attendance_app/features/auth/features/views/register_screen.dart';
// import 'package:attendance_app/features/home/presentation/views/home_view.dart';
// import 'package:attendance_app/features/splash/presentation/views/splash_view.dart';
// import 'package:attendance_app/firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(AttendanceApp());
// }

// class AttendanceApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Attendance App',
//       routes: {
//         '/': (context) => const SplashView(),
//         'registerScreen': (context) => const RegisterScreen(),
//         'loginScreen': (context) => const LoginScreen(
//               isAdmin: true,
//             ),
//         'homeScreen': (context) => const HomeView(),
//       },
//     );
//   }
// }

import 'package:attendance_app/app_home.dart';
import 'package:attendance_app/core/provider/chat_provider.dart';
import 'package:attendance_app/features/auth/presentations/views/login_screen.dart';
import 'package:attendance_app/features/auth/presentations/views/add_user_screen.dart';
import 'package:attendance_app/features/chat_gpt/data/services/sound_services.dart';
import 'package:attendance_app/features/chat_gpt/presentation/manager/Providers/profile_provider.dart';
import 'package:attendance_app/features/home/presentation/manager/provider/dark_mode_provider.dart';
import 'package:attendance_app/features/splash/presentation/views/splash_view.dart';
import 'package:attendance_app/firebase_options.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Activate Firebase App Check
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
  );

  // Initialize Hive storage
  await ChatProvider.initHive();

  // Run the app with MultiProvider
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChatProvider()),
        ChangeNotifierProvider(create: (_) => SoundService()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => DarkModeProvider()),
      ],
      child: AttendanceApp(),
    ),
  );
}

class AttendanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DarkModeProvider>(
      builder: (context, darkModeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Attendance App',
          // theme: ThemeData.light(), // السمة الفاتحة
          // darkTheme: ThemeData.dark(), // السمة الداكنة
          // themeMode: darkModeProvider.isDarkMode
          //     ? ThemeMode.dark
          //     : ThemeMode.light, // تحديث السمة
          routes: {
            '/': (context) => _getInitialScreen(),
            'addUser': (context) => const AddUserScreen(),
            'loginScreen': (context) => const LoginScreen(),
            // 'monthsSelectionView': (context) => MonthSelectionScreen(),
            'appHome': (context) => const AppHome(),

            // 'adminOrStudent': (context) => const AdminOrStudent(),
          },
        );
      },
    );
  }

  // Check if the user is already logged in
  Widget _getInitialScreen() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // User is logged in, navigate to HomeView
      return const SplashView();
    } else {
      // User is not logged in, navigate to LoginScreen
      return const SplashView();
    }
  }
}
