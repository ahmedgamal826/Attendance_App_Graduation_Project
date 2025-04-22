// import 'dart:convert';
// import 'dart:developer';
// import 'package:attendance_app/features/notifications/presentation/manager/send_notifications_services.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class MessagingConfig {
//   static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   static final GlobalKey<NavigatorState> navigatorKey =
//       GlobalKey<NavigatorState>();

//   // static Future<void> createNotificationChannel() async {
//   //   const AndroidNotificationChannel channel = AndroidNotificationChannel(
//   //     'high_importance_channel',
//   //     'High Importance Notifications',
//   //     description: 'This channel is used for important notifications.',
//   //     sound: RawResourceAndroidNotificationSound('custom_sound'),
//   //     importance: Importance.max,
//   //   );

//   //   await flutterLocalNotificationsPlugin
//   //       .resolvePlatformSpecificImplementation<
//   //           AndroidFlutterLocalNotificationsPlugin>()
//   //       ?.createNotificationChannel(channel);
//   // }

//   // static Future<void> createNotificationChannel() async {
//   //   const AndroidNotificationChannel channel = AndroidNotificationChannel(
//   //     'high_importance_channel',
//   //     'High Importance Notifications',
//   //     description: 'This channel is used for important notifications.',
//   //     importance: Importance.max,
//   //     playSound: true, // Ensure sound is enabled
//   //     sound: RawResourceAndroidNotificationSound('custom_sound'),
//   //     enableVibration: true, // Optional: Add vibration for better feedback
//   //   );

//   //   final androidPlugin =
//   //       flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
//   //           AndroidFlutterLocalNotificationsPlugin>();
//   //   await androidPlugin?.createNotificationChannel(channel);
//   // }

//   static Future<void> createNotificationChannel() async {
//     const AndroidNotificationChannel channel = AndroidNotificationChannel(
//       'high_importance_channel',
//       'High Importance Notifications',
//       description: 'This channel is used for important notifications.',
//       importance: Importance.max,
//       playSound: true,
//       sound: RawResourceAndroidNotificationSound('custom_sound'),
//       enableVibration: true,
//     );

//     final androidPlugin =
//         flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>();
//     await androidPlugin?.createNotificationChannel(channel);
//   }

//   static Future<void> initFirebaseMessaging() async {
//     await createNotificationChannel();

//     FirebaseMessaging messaging = FirebaseMessaging.instance;

//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );

//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     const DarwinInitializationSettings initializationSettingsIOS =
//         DarwinInitializationSettings(
//       requestSoundPermission: false,
//       requestBadgePermission: false,
//       requestAlertPermission: false,
//     );

//     const InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//     );

//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: (NotificationResponse payload) {
//         log("payload1: ${payload.payload.toString()}");
//         return;
//       },
//     );

//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       log('User granted permission');
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.provisional) {
//       log('User granted provisional permission');
//     } else {
//       log('User declined or has not accepted permission');
//     }

//     // FirebaseMessaging.onMessage.listen((RemoteMessage event) async {
//     //   log("message received");
//     //   try {
//     //     RemoteNotification? notification = event.notification;
//     //     AndroidNotification? android = event.notification?.android;
//     //     log(notification!.body.toString());
//     //     log(notification.title.toString());

//     //     var body = notification.body;

//     //     await flutterLocalNotificationsPlugin.show(
//     //       notification.hashCode,
//     //       notification.title,
//     //       body,
//     //       const NotificationDetails(
//     //         android: AndroidNotificationDetails(
//     //           'high_importance_channel',
//     //           'High Importance Notifications',
//     //           channelDescription:
//     //               'This channel is used for important notifications.',
//     //           sound: RawResourceAndroidNotificationSound('custom_sound'),
//     //           icon: '@mipmap/ic_launcher',
//     //         ),
//     //         iOS: DarwinNotificationDetails(
//     //           presentAlert: true,
//     //           presentBadge: true,
//     //           presentSound: true,
//     //           sound: 'custom_sound.caf',
//     //         ),
//     //       ),
//     //     );

//     //     handleNotification(navigatorKey.currentContext!, event.data);
//     //   } catch (err) {
//     //     log(err.toString());
//     //   }
//     // });

//     // FirebaseMessaging.onMessage.listen((RemoteMessage event) async {
//     //   log("Message received");
//     //   try {
//     //     final notification = event.notification;
//     //     final android = event.notification?.android;

//     //     if (notification != null && android != null) {
//     //       await flutterLocalNotificationsPlugin.show(
//     //         notification.hashCode,
//     //         notification.title,
//     //         notification.body,
//     //         const NotificationDetails(
//     //           android: AndroidNotificationDetails(
//     //             'high_importance_channel',
//     //             'High Importance Notifications',
//     //             channelDescription:
//     //                 'This channel is used for important notifications.',
//     //             importance: Importance.max,
//     //             priority: Priority.high, // Ensure high priority
//     //             playSound: true, // Explicitly enable sound
//     //             sound: RawResourceAndroidNotificationSound('custom_sound'),
//     //             icon: '@mipmap/ic_launcher',
//     //             enableVibration: true,
//     //           ),
//     //           iOS: DarwinNotificationDetails(
//     //             presentAlert: true,
//     //             presentBadge: true,
//     //             presentSound: true,
//     //             sound: 'custom_sound.caf',
//     //           ),
//     //         ),
//     //         payload: event.data.isNotEmpty ? jsonEncode(event.data) : null,
//     //       );

//     //       final context = navigatorKey.currentContext;
//     //       if (context != null) {
//     //         handleNotification(context, event.data);
//     //       } else {
//     //         log('Navigator context is null');
//     //       }
//     //     }
//     //   } catch (err) {
//     //     log('Error displaying notification: $err');
//     //   }
//     // });

//     FirebaseMessaging.onMessage.listen((RemoteMessage event) async {
//       log("Message received");
//       try {
//         final notification = event.notification;
//         final android = event.notification?.android;

//         if (notification != null && android != null) {
//           await flutterLocalNotificationsPlugin.show(
//             notification.hashCode,
//             notification.title,
//             notification.body,
//             NotificationDetails(
//               android: AndroidNotificationDetails(
//                 'high_importance_channel',
//                 'High Importance Notifications',
//                 channelDescription:
//                     'This channel is used for important notifications.',
//                 importance: Importance.max,
//                 priority: Priority.high,
//                 playSound: true,
//                 sound: RawResourceAndroidNotificationSound('custom_sound'),
//                 icon: '@mipmap/ic_launcher',
//                 enableVibration: true,
//               ),
//               iOS: const DarwinNotificationDetails(
//                 presentAlert: true,
//                 presentBadge: true,
//                 presentSound: true,
//                 sound: 'custom_sound.caf',
//               ),
//             ),
//             payload: event.data.isNotEmpty ? jsonEncode(event.data) : null,
//           );

//           final context = navigatorKey.currentContext;
//           if (context != null) {
//             handleNotification(context, event.data);
//           } else {
//             log('Navigator context is null');
//           }
//         }
//       } catch (err) {
//         log('Error displaying notification: $err');
//       }
//     });

//     FirebaseMessaging.instance
//         .getInitialMessage()
//         .then((RemoteMessage? message) {
//       if (message != null) {
//         handleNotification(navigatorKey.currentContext!, message.data);
//       }
//     });

//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       handleNotification(navigatorKey.currentContext!, message.data);
//     });
//   }

//   // @pragma('vm:entry-point')
//   // static Future<void> messageHandler(RemoteMessage message) async {
//   //   log('background message ${message.notification!.body}');
//   // }

//   // @pragma('vm:entry-point')
//   // static Future<void> messageHandler(RemoteMessage message) async {
//   //   log('Background message: ${message.notification?.body}');

//   //   final notification = message.notification;
//   //   if (notification != null) {
//   //     try {
//   //       await flutterLocalNotificationsPlugin.show(
//   //         notification.hashCode,
//   //         notification.title,
//   //         notification.body,
//   //         const NotificationDetails(
//   //           android: AndroidNotificationDetails(
//   //             'high_importance_channel',
//   //             'High Importance Notifications',
//   //             channelDescription:
//   //                 'This channel is used for important notifications.',
//   //             importance: Importance.max,
//   //             priority: Priority.high,
//   //             playSound: true,
//   //             sound: RawResourceAndroidNotificationSound('custom_sound'),
//   //             icon: '@mipmap/ic_launcher',
//   //             enableVibration: true,
//   //           ),
//   //           iOS: const DarwinNotificationDetails(
//   //             presentAlert: true,
//   //             presentBadge: true,
//   //             presentSound: true,
//   //             sound: 'custom_sound.caf',
//   //           ),
//   //         ),
//   //         payload: message.data.isNotEmpty ? jsonEncode(message.data) : null,
//   //       );
//   //     } catch (e) {
//   //       log('Error displaying background notification: $e');
//   //     }
//   //   }
//   // }

//   @pragma('vm:entry-point')
//   static Future<void> messageHandler(RemoteMessage message) async {
//     log('Background message: ${message.notification?.body}');

//     final notification = message.notification;
//     if (notification != null) {
//       try {
//         await flutterLocalNotificationsPlugin.show(
//           notification.hashCode,
//           notification.title,
//           notification.body,
//           NotificationDetails(
//             android: AndroidNotificationDetails(
//               'high_importance_channel',
//               'High Importance Notifications',
//               channelDescription:
//                   'This channel is used for important notifications.',
//               importance: Importance.max,
//               priority: Priority.high,
//               playSound: true,
//               sound: RawResourceAndroidNotificationSound('custom_sound'),
//               icon: '@mipmap/ic_launcher',
//               enableVibration: true,
//             ),
//             iOS: const DarwinNotificationDetails(
//               presentAlert: true,
//               presentBadge: true,
//               presentSound: true,
//               sound: 'custom_sound.caf',
//             ),
//           ),
//           payload: message.data.isNotEmpty ? jsonEncode(message.data) : null,
//         );
//       } catch (e) {
//         log('Error displaying background notification: $e');
//       }
//     }
//   }
// }

import 'dart:convert';
import 'dart:developer';
import 'package:attendance_app/features/notifications/presentation/manager/send_notifications_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MessagingConfig {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<void> createNotificationChannel() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.max,
      playSound: true,
      sound: RawResourceAndroidNotificationSound('custom_sound'),
      enableVibration: true,
    );

    final androidPlugin =
        flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    await androidPlugin?.createNotificationChannel(channel);
  }

  static Future<void> initFirebaseMessaging() async {
    await createNotificationChannel();

    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    // الحصول على رمز FCM وتخزينه في Firestore
    String? fcmToken = await messaging.getToken();
    if (fcmToken != null && FirebaseAuth.instance.currentUser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(
        {'fcmToken': fcmToken},
        SetOptions(merge: true),
      );
      log('FCM Token stored for user: ${FirebaseAuth.instance.currentUser!.uid}');
    }

    // التعامل مع تحديث الرمز
    messaging.onTokenRefresh.listen((newToken) async {
      if (FirebaseAuth.instance.currentUser != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set(
          {'fcmToken': newToken},
          SetOptions(merge: true),
        );
        log('FCM Token refreshed: $newToken');
      }
    });

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        if (response.payload != null) {
          final data = jsonDecode(response.payload!);
          handleNotification(navigatorKey.currentContext!, data);
        }
      },
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      log('User granted provisional permission');
    } else {
      log('User declined or has not accepted permission');
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage event) async {
      log("Message received");
      try {
        final notification = event.notification;
        final android = event.notification?.android;

        if (notification != null && android != null) {
          await flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                'high_importance_channel',
                'High Importance Notifications',
                channelDescription:
                    'This channel is used for important notifications.',
                importance: Importance.max,
                priority: Priority.high,
                playSound: true,
                sound: RawResourceAndroidNotificationSound('custom_sound'),
                icon: '@mipmap/ic_launcher',
                enableVibration: true,
              ),
              iOS: const DarwinNotificationDetails(
                presentAlert: true,
                presentBadge: true,
                presentSound: true,
                sound: 'custom_sound.caf',
              ),
            ),
            payload: event.data.isNotEmpty ? jsonEncode(event.data) : null,
          );

          final context = navigatorKey.currentContext;
          if (context != null) {
            handleNotification(context, event.data);
          } else {
            log('Navigator context is null');
          }
        }
      } catch (err) {
        log('Error displaying notification: $err');
      }
    });

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null && navigatorKey.currentContext != null) {
        handleNotification(navigatorKey.currentContext!, message.data);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (navigatorKey.currentContext != null) {
        handleNotification(navigatorKey.currentContext!, message.data);
      }
    });
  }

  @pragma('vm:entry-point')
  static Future<void> messageHandler(RemoteMessage message) async {
    log('Background message: ${message.notification?.body}');

    final notification = message.notification;
    if (notification != null) {
      try {
        await flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              'high_importance_channel',
              'High Importance Notifications',
              channelDescription:
                  'This channel is used for important notifications.',
              importance: Importance.max,
              priority: Priority.high,
              playSound: true,
              sound: RawResourceAndroidNotificationSound('custom_sound'),
              icon: '@mipmap/ic_launcher',
              enableVibration: true,
            ),
            iOS: const DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true,
              sound: 'custom_sound.caf',
            ),
          ),
          payload: message.data.isNotEmpty ? jsonEncode(message.data) : null,
        );
      } catch (e) {
        log('Error displaying background notification: $e');
      }
    }
  }
}
