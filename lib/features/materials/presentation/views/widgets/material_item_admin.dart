// lib/features/materials/presentation/widgets/material_item_admin.dart
//////////////////////////////////////////////////////////////////////

import 'package:flutter/material.dart';

import '../../../models/material_model_admin.dart';

class MaterialItemAdmin extends StatelessWidget {
  final MaterialFile file;
  final int index;
  final VoidCallback onDelete;
  final VoidCallback onShare;

  const MaterialItemAdmin({
    Key? key,
    required this.file,
    required this.index,
    required this.onDelete,
    required this.onShare,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Виджет элемента файла с действиями
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF90CAF9), width: 1.5),
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Основное содержимое элемента
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Icon(
                    Icons.insert_drive_file,
                    size: 32,
                    color: Color(0xFF1976D2)
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        file.name,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0D47A1),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        file.size,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Кнопка удаления в правом верхнем углу
          Positioned(
            top: 2,
            right: 5,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red.withOpacity(0.1),
              ),
              child: InkWell(
                onTap: onDelete,
                borderRadius: BorderRadius.circular(20),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                    size: 18,
                  ),
                ),
              ),
            ),
          ),
          // Кнопка поделиться в правом нижнем углу
          Positioned(
            bottom: 2,
            right: 5,
            child: InkWell(
              onTap: onShare,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF1976D2).withOpacity(0.1),
                ),
                child: const Icon(
                  Icons.share,
                  color: Color(0xFF1976D2),
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
