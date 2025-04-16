import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/material_model_admin.dart';
import 'material_state1.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';

class MaterialCubit extends Cubit<MaterialState1> {
  MaterialCubit() : super(MaterialState1(files: getInitialFiles()));

  // Создание исходных файлов для демонстрации
  static List<MaterialFile> getInitialFiles() {
    return [
      MaterialFile(name: "File 1", size: "1.2 MB"),
      MaterialFile(name: "File 2", size: "3.4 MB"),
      MaterialFile(name: "File 3", size: "0.8 MB"),
      MaterialFile(name: "File 4", size: "2.5 MB"),
      MaterialFile(name: "File 5", size: "1.7 MB"),
    ];
  }

  // Удаление файла по индексу
  void deleteFile(int index) {
    final updatedFiles = List<MaterialFile>.from(state.files);
    updatedFiles.removeAt(index);
    emit(state.copyWith(files: updatedFiles));
  }

  // Добавление нового файла
  void addFile(MaterialFile file) {
    final updatedFiles = List<MaterialFile>.from(state.files)..add(file);
    emit(state.copyWith(files: updatedFiles));
  }

  // Функция для обмена файлом
  void shareFile(BuildContext context, String fileName) {
    // Использование пакета share_plus для обмена
    Share.share('Check out this file: $fileName', subject: 'Sharing $fileName');

    // Показать подтверждение
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Sharing $fileName'),
        backgroundColor: Color(0xFF1565C0),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  // Показать диалог подтверждения удаления
  void showDeleteConfirmation(BuildContext context, String fileName, int index) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            'Confirm Delete',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF0D47A1),
            ),
          ),
          content: Text(
            'Are you sure you want to delete "$fileName"?',
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Color(0xFF1976D2)),
              ),
            ),
            TextButton(
              onPressed: () {
                // Удалить файл через cubit
                deleteFile(index);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$fileName deleted'),
                    backgroundColor: Color(0xFF1565C0),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
                Navigator.of(dialogContext).pop();
              },
              child: Text(
                'Delete',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}