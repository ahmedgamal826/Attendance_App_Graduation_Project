import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/cubit_admin/material_cubit.dart';
import '../../../cubits/cubit_admin/material_state1.dart';
import '../widgets/material_item_admin.dart';

class MaterialsAdminBodyView extends StatelessWidget {
  const MaterialsAdminBodyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Использование BlocBuilder для перерисовки при изменении состояния
    return BlocBuilder<MaterialCubit, MaterialState1>(
      builder: (context, state) {
        // Показать сообщение, если нет файлов
        return state.isEmpty
            ? Center(
          child: Text(
            'No files available',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
        )
            : ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: state.files.length,
          itemBuilder: (context, index) {
            final file = state.files[index];
            // Использование выделенного виджета для элемента списка
            return MaterialItemAdmin(
              file: file,
              index: index,
              onDelete: () => context.read<MaterialCubit>()
                  .showDeleteConfirmation(context, file.name, index),
              onShare: () => context.read<MaterialCubit>()
                  .shareFile(context, file.name),
            );
          },
        );
      },
    );
  }
}