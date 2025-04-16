// lib/features/materials/presentation/views/file_upload_screen_admin.dart
//////////////////////////////////////////////////////////////////////

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/cubit_admin/material_cubit.dart';
import '../../../models/material_model_admin.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class FileUploadScreenAdmin extends StatefulWidget {
  const FileUploadScreenAdmin({Key? key}) : super(key: key);

  @override
  State<FileUploadScreenAdmin> createState() => _FileUploadScreenAdminState();
}

class _FileUploadScreenAdminState extends State<FileUploadScreenAdmin> {
  File? selectedFile;
  String? fileName;
  bool isUploading = false;
  final _formKey = GlobalKey<FormState>();
  final _sizeController = TextEditingController();

  @override
  void dispose() {
    _sizeController.dispose();
    super.dispose();
  }

  // Проверка разрешений для доступа к файлам
  Future<void> _checkPermissions() async {
    // Проверка разрешений в зависимости от версии Android
    if (await Permission.storage.status.isDenied) {
      await Permission.storage.request();
    }

    // Для Android 13+, запрашиваем более конкретные разрешения
    if (await Permission.photos.status.isDenied) {
      await Permission.photos.request();
    }
    if (await Permission.videos.status.isDenied) {
      await Permission.videos.request();
    }
    if (await Permission.audio.status.isDenied) {
      await Permission.audio.request();
    }
  }

  // Выбор файла с устройства
  Future<void> _pickFile() async {
    try {
      // Сначала проверяем разрешения
      await _checkPermissions();

      // Очистить временные файлы
      await FilePicker.platform.clearTemporaryFiles();

      // Попытка выбрать файл
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );

      if (result != null && result.files.isNotEmpty) {
        setState(() {
          selectedFile = File(result.files.single.path!);
          fileName = result.files.single.name;

          // Вычисляем размер файла и форматируем его
          int fileSize = selectedFile!.lengthSync();
          String formattedSize;

          if (fileSize < 1024) {
            formattedSize = "$fileSize B";
          } else if (fileSize < 1024 * 1024) {
            formattedSize = "${(fileSize / 1024).toStringAsFixed(1)} KB";
          } else {
            formattedSize = "${(fileSize / (1024 * 1024)).toStringAsFixed(1)} MB";
          }

          _sizeController.text = formattedSize;
        });
      }
    } catch (e) {
      // Обработка ошибок
      print("Error picking file: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error picking file: $e'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }
  }

  // Загрузка файла
  Future<void> _uploadFile() async {
    if (selectedFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please select a file first'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
      return;
    }

    setState(() {
      isUploading = true;
    });

    // Симуляция процесса загрузки с задержкой
    await Future.delayed(const Duration(seconds: 2));

    // Добавление файла через кубит
    context.read<MaterialCubit>().addFile(
      MaterialFile(
        name: fileName!,
        size: _sizeController.text,
      ),
    );

    setState(() {
      isUploading = false;
    });

    // Показать сообщение об успехе
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$fileName uploaded successfully'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    // Вернуться на экран материалов
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Materials',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1565C0),
        elevation: 4,
      ),
      body: Container(
        color: const Color(0xFFE3F2FD),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Контейнер для загрузки файла с иконкой +
              GestureDetector(
                onTap: _pickFile,
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add,
                        size: 40,
                        color: Colors.black,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        fileName != null ? fileName! : 'Upload File',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      if (fileName != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            _sizeController.text,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Индикатор прогресса загрузки файла
              Container(
                height: 30,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                child: isUploading
                    ? const LinearProgressIndicator(
                  color: Color(0xFF1565C0),
                  backgroundColor: Colors.white,
                )
                    : Container(),
              ),
              const SizedBox(height: 5),
              // Текст для индикатора прогресса загрузки
              const Center(
                child: Text(
                  'File Upload Progress',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Кнопка загрузки
              Center(
                child: ElevatedButton(
                  onPressed: isUploading ? null : _uploadFile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    side: const BorderSide(color: Colors.black, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                  ),
                  child: Text(
                    isUploading ? 'Uploading...' : 'Upload',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
