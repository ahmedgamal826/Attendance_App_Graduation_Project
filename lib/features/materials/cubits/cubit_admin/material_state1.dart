import '../../models/material_model_admin.dart';

class MaterialState1 {
  final List<MaterialFile> files;
  final bool isLoading;

  MaterialState1({
    required this.files,
    this.isLoading = false,
  });

  MaterialState1 copyWith({
    List<MaterialFile>? files,
    bool? isLoading,
  }) {
    return MaterialState1(
      files: files ?? this.files,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  bool get isEmpty => files.isEmpty;
}
