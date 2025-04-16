import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:open_file/open_file.dart';

import '../../../cubits/cubit_student/material_cubit.dart';
import '../../../models/material_model_student.dart';
// import '../../cubits/material_cubit.dart';
// import '../../models/material_model.dart';

class MaterialItemStudent extends StatelessWidget {
  final MaterialModel material;

  const MaterialItemStudent({
    Key? key,
    required this.material,
  }) : super(key: key);

  IconData _getIconForType(String type) {
    switch (type.toLowerCase()) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'doc':
      case 'docx':
        return Icons.description;
      case 'jpg':
      case 'png':
      case 'jpeg':
        return Icons.image;
      case 'mp4':
      case 'avi':
        return Icons.video_file;
      default:
        return Icons.insert_drive_file;
    }
  }

  @override
  Widget build(BuildContext context) {
    final materialCubit = context.read<MaterialCubit>();

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: () async {
          final filePath = await materialCubit.prepareFileForOpen(
            material.url,
            material.name,
          );
          if (filePath != null) {
            final result = await OpenFile.open(filePath);
            if (result.type != ResultType.done) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Could not open file: ${result.message}'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.black, width: 1),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    _getIconForType(material.type),
                    size: 40,
                    color: const Color(0xFF1565C0),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          material.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          material.size,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Share Icon
                  IconButton(
                    icon: const Icon(
                      Icons.share,
                      color: Color(0xFF1565C0),
                    ),
                    onPressed: () async {
                      final filePath = await materialCubit.shareFile(
                        material.url,
                        material.name,
                      );
                      if (filePath != null) {
                        final xFile = XFile(filePath);
                        await Share.shareXFiles(
                          [xFile],
                          text: 'Sharing ${material.name}',
                        );
                      }
                    },
                  ),
                  // Download Icon
                  IconButton(
                    icon: const Icon(
                      Icons.download,
                      color: Color(0xFF1565C0),
                    ),
                    onPressed: () {
                      materialCubit.downloadFile(
                        material.url,
                        material.name,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}