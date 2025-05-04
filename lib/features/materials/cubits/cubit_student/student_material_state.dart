import 'package:attendance_app/features/materials/models/material_model_student.dart';

abstract class StudentMaterialState {}

class MaterialInitial extends StudentMaterialState {}

class MaterialLoading extends StudentMaterialState {}

class MaterialError extends StudentMaterialState {
  final String message;
  MaterialError(this.message);
}

class MaterialSuccess extends StudentMaterialState {
  final String message;
  MaterialSuccess(this.message);
}

class MaterialLoaded extends StudentMaterialState {
  final List<MaterialModel> materials;
  MaterialLoaded(this.materials);
}