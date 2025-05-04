import 'package:attendance_app/app_home.dart';
import 'package:attendance_app/core/provider/chat_provider.dart';
import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/auth/presentations/views/login_screen.dart';
import 'package:attendance_app/features/auth/presentations/views/add_user_screen.dart';
import 'package:attendance_app/features/chat_gpt/data/services/sound_services.dart';
import 'package:attendance_app/features/chat_gpt/presentation/manager/Providers/profile_provider.dart';
import 'package:attendance_app/features/chats/data/repositories/chat_repository.dart';
import 'package:attendance_app/features/chats/presentation/manager/chat_view_model_provider.dart';
import 'package:attendance_app/features/home/presentation/manager/provider/dark_mode_provider.dart';
import 'package:attendance_app/features/notifications/presentation/manager/messaging_config.dart';
import 'package:attendance_app/features/questionnaire/presentation/viewmodels/home_questionnaires_viewmodel.dart';
import 'package:attendance_app/features/splash/presentation/views/splash_view.dart';
import 'package:attendance_app/firebase_options.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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

  MessagingConfig.initFirebaseMessaging();
  FirebaseMessaging.onBackgroundMessage(MessagingConfig.messageHandler);

  // Initialize Hive storage
  await ChatProvider.initHive();

  // Run the app with MultiProvider
  runApp(
    MultiProvider(
      providers: [
        // Providers
        ChangeNotifierProvider(create: (context) => ChatProvider()),
        ChangeNotifierProvider(create: (_) => SoundService()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
        ChangeNotifierProvider(create: (_) => DarkModeProvider()),
        // ChangeNotifierProvider(create: (_) => QuestionnaireViewModel()),
        //ChangeNotifierProvider(create: (_) => HomeQuestionnairesViewModel()),
        ChangeNotifierProvider(create: (_) => ChatViewModel(ChatRepository())),
        // Cubits
        // BlocProvider(create: (_) => LectureCubit()),
        
      ],
      child: AttendanceApp(),
    ),
  );
}

class AttendanceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseMessaging.instance
        .getToken()
        .then((value) => print("Valueeeeeeeeee = $value"));

    return Consumer<DarkModeProvider>(
      builder: (context, darkModeProvider, child) {
        return MaterialApp(
          navigatorKey: MessagingConfig.navigatorKey,
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
          // theme: ThemeData(
          //   textSelectionTheme: const TextSelectionThemeData(
          //     selectionHandleColor: AppColors
          //         .primaryColor, // change hand cursor color in text field
          //   ),
          // ),

          theme: ThemeData(
            primaryColor: AppColors.primaryColor,
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
              elevation: 4,
            ),
            textSelectionTheme: const TextSelectionThemeData(
              selectionHandleColor: AppColors.primaryColor,
            ),
          ),
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
