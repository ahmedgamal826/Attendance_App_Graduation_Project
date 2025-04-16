import '../../models/material_model_admin.dart';

class MaterialState1 {
  final List<MaterialFile> files;

  MaterialState1({
    required this.files,
  });

  MaterialState1 copyWith({
    List<MaterialFile>? files,
  }) {
    return MaterialState1(
      files: files ?? this.files,
    );
  }

  bool get isEmpty => files.isEmpty;
}