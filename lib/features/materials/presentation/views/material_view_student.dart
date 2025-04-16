import 'package:attendance_app/features/materials/presentation/views/widgets/material_view_student_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/cubit_student/material_cubit.dart';
// import '../cubits/material_cubit.dart';
// import 'views/materials_view_student.dart';

class MaterialsStudentScreen extends StatelessWidget {
  const MaterialsStudentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MaterialCubit(),
      child: const MaterialsStudentView(),
    );
  }
}