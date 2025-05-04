import 'package:attendance_app/features/materials/cubits/cubit_student/student_material_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../models/material_model_student.dart';

class StudentMaterialCubit extends Cubit<StudentMaterialState> {
  final String courseId;
  final int lectureNumber;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  StudentMaterialCubit({required this.courseId, required this.lectureNumber})
      : super(MaterialInitial()) {
    loadMaterials();
    _initializeNotifications();
  }

  Future<void> _initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> _showProgressNotification(int progress) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'download_channel',
      'Downloads',
      channelDescription: 'Shows download progress',
      importance: Importance.low,
      priority: Priority.low,
      showProgress: true,
      maxProgress: 100,
      progress: 0,
      onlyAlertOnce: true,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      'Downloading File',
      'Progress: $progress%',
      platformChannelSpecifics,
      payload: 'download',
    );
  }

  Future<void> _showDownloadCompleteNotification(String filePath) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'download_channel',
      'Downloads',
      channelDescription: 'Shows download progress',
      importance: Importance.high,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    // Show a simplified message without the full path
    await flutterLocalNotificationsPlugin.show(
      0,
      'Download Complete',
      'File saved to Downloads folder',
      platformChannelSpecifics,
      payload: 'download_complete',
    );
  }

  Future<void> loadMaterials() async {
    emit(MaterialLoading());

    try {
      DocumentReference courseRef =
          FirebaseFirestore.instance.collection('Courses').doc(courseId);
      QuerySnapshot lectureSnapshot = await courseRef
          .collection('lectures')
          .where('lectureNumber', isEqualTo: lectureNumber)
          .get();

      if (lectureSnapshot.docs.isEmpty) {
        emit(MaterialError('Lecture not found'));
        return;
      }

      QuerySnapshot materialsSnapshot = await lectureSnapshot
          .docs.first.reference
          .collection('materials')
          .orderBy('created_at', descending: true)
          .get();

      List<MaterialModel> materials = [];
      for (var doc in materialsSnapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        String fileName = data['name'] ?? 'Unknown';
        String fileExtension = fileName.split('.').last.toLowerCase();
        materials.add(MaterialModel(
          name: fileName,
          size: data['size'] ?? 'Unknown',
          url: data['url'] ?? '',
          type: fileExtension,
        ));
      }

      emit(MaterialLoaded(materials));
    } catch (e) {
      emit(MaterialError('Error loading materials: $e'));
    }
  }

  Future<String?> shareFile(String url, String fileName) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final tempPath = '${tempDir.path}/$fileName';
      final file = File(tempPath);

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        await file.writeAsBytes(response.bodyBytes);
      } else {
        emit(MaterialError('Failed to download file for sharing'));
        return null;
      }

      if (await file.exists()) {
        return tempPath;
      } else {
        emit(MaterialError('Failed to save file for sharing'));
        return null;
      }
    } catch (e) {
      emit(MaterialError('Error sharing file: $e'));
      return null;
    }
  }

  Future<void> downloadFile(String url, String fileName) async {
    try {
      // Request notification permission for download progress (Android 13+)
      if (Platform.isAndroid) {
        var notificationStatus = await Permission.notification.status;
        if (notificationStatus.isDenied) {
          notificationStatus = await Permission.notification.request();
          if (notificationStatus.isDenied) {
            print('Notification permission denied');
            return;
          }
        }
      }

      // Use the direct path to the Downloads directory
      const String downloadPath = '/storage/emulated/0/Download';
      Directory downloadsDirectory = Directory(downloadPath);

      // Check if the Downloads directory exists, create it if it doesn't
      if (!await downloadsDirectory.exists()) {
        await downloadsDirectory.create(recursive: true);
        print('Created Downloads directory at: $downloadPath');
      }

      // Log the Downloads directory path to confirm it's correct
      print('Downloads directory path: ${downloadsDirectory.path}');

      // Construct the file path in the Downloads directory
      final filePath = '$downloadPath/$fileName';
      final file = File(filePath);

      // Log the full file path
      print('Saving file to: $filePath');

      // Check if the file already exists
      if (await file.exists()) {
        await _showDownloadCompleteNotification(filePath);
        return;
      }

      // Download the file
      final request = http.Request('GET', Uri.parse(url));
      final response = await http.Client().send(request);

      if (response.statusCode != 200) {
        print('Failed to download file: HTTP ${response.statusCode}');
        return;
      }

      final totalBytes = response.contentLength ?? 0;
      int downloadedBytes = 0;
      final bytes = <int>[];

      response.stream.listen(
        (List<int> chunk) {
          bytes.addAll(chunk);
          downloadedBytes += chunk.length;
          final progress =
              totalBytes > 0 ? (downloadedBytes / totalBytes * 100).toInt() : 0;
          _showProgressNotification(progress);
        },
        onDone: () async {
          // Write the file to the Downloads directory
          await file.writeAsBytes(bytes);

          // Log to confirm the file was written
          print('File exists after writing: ${await file.exists()}');
          print('File path after writing: $filePath');

          // No media scan, relying on the system to index the file automatically
          await _showDownloadCompleteNotification(filePath);
        },
        onError: (e) {
          print('Error downloading file: $e');
        },
        cancelOnError: true,
      );
    } catch (e) {
      print('Error downloading file: $e');
    }
  }

  Future<String?> prepareFileForOpen(String url, String fileName) async {
    emit(MaterialLoading());
    try {
      final tempDir = await getTemporaryDirectory();
      final filePath = '${tempDir.path}/$fileName';
      final file = File(filePath);

      if (!await file.exists()) {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          await file.writeAsBytes(response.bodyBytes);
        } else {
          emit(MaterialError('Failed to download file for viewing'));
          return null;
        }
      }

      emit(MaterialSuccess('File ready to open'));
      return filePath;
    } catch (e) {
      emit(MaterialError('Error preparing file: $e'));
      return null;
    }
  }
}
