import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import '../../models/material_model_student.dart';
import 'material_state1.dart';

class MaterialCubit extends Cubit<MaterialState1> {
  MaterialCubit() : super(MaterialInitial());

  // Sample data - replace with your actual data source
  final List<MaterialModel> materials = [
    MaterialModel(
      name: 'Lecture 1',
      size: '2.5 MB',
      url: 'https://example.com/files/lecture1.pdf',
      type: 'pdf',
    ),
    MaterialModel(
      name: 'Assignment 1',
      size: '1.2 MB',
      url: 'https://example.com/files/assignment1.docx',
      type: 'doc',
    ),
    // Add more materials as needed
  ];

  Future<String?> shareFile(String url, String fileName) async {
    try {
      emit(MaterialLoading());
      // Create a temporary file
      final tempDir = await getTemporaryDirectory();
      final tempPath = '${tempDir.path}/$fileName';

      // Download the file to the temporary location
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final file = File(tempPath);
        await file.writeAsBytes(response.bodyBytes);

        emit(MaterialSuccess('File ready to share'));
        return tempPath;
      } else {
        emit(MaterialError('Failed to download file for sharing'));
        return null;
      }
    } catch (e) {
      emit(MaterialError('Error sharing file: $e'));
      return null;
    }
  }

  Future<void> downloadFile(String url, String fileName) async {
    emit(MaterialLoading());

    try {
      // Get download directory
      final directory = await getExternalStorageDirectory();
      final filePath = '${directory?.path}/$fileName';

      // Download the file
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);

        emit(MaterialSuccess('$fileName downloaded successfully'));
      } else {
        emit(MaterialError('Failed to download file'));
      }
    } catch (e) {
      emit(MaterialError('Error downloading file: $e'));
    }
  }

  Future<String?> prepareFileForOpen(String url, String fileName) async {
    emit(MaterialLoading());
    try {
      // Create a temporary file if it doesn't exist
      final tempDir = await getTemporaryDirectory();
      final filePath = '${tempDir.path}/$fileName';
      final file = File(filePath);

      if (!await file.exists()) {
        // Download the file
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          await file.writeAsBytes(response.bodyBytes);
        } else {
          emit(MaterialError('Failed to download file for viewing'));
          return null;
        }
      }

      emit(MaterialInitial());
      return filePath;
    } catch (e) {
      emit(MaterialError('Error preparing file: $e'));
      return null;
    }
  }

  List<MaterialModel> getMaterials() {
    return materials;
  }
}