import 'package:attendance_app/features/materials/presentation/views/widgets/file_upload_screen_admin.dart';
import 'package:attendance_app/features/materials/presentation/views/widgets/materials_view_admin_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/cubit_admin/material_cubit.dart';

class MaterialsAdminScreen extends StatelessWidget {
  const MaterialsAdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Предоставление кубита для всего дерева виджетов
    return BlocProvider(
      create: (_) => MaterialCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Admin Materials',
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
          child: const MaterialsAdminBodyView(),
        ),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            onPressed: () {
              // Добавить новый материал
              _addNewFile(context);
            },
            backgroundColor: const Color(0xFF1565C0),
            child: const Icon(Icons.add, color: Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(color: Colors.white, width: 1),
            ),
          );
        }),
      ),
    );
  }

  // Переход на экран загрузки файла
  void _addNewFile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FileUploadScreenAdmin()),
    );
  }
}
