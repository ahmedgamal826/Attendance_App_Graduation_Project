import 'package:attendance_app/features/materials/cubits/cubit_student/material_state1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../cubits/material_cubit.dart';
// import '../../cubits/material_state1.dart';
import '../../../cubits/cubit_student/material_cubit.dart';
import '../widgets/material_item_student.dart';

class MaterialsStudentView extends StatelessWidget {
  const MaterialsStudentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final materialCubit = context.read<MaterialCubit>();
    final materials = materialCubit.getMaterials();

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Student Materials',
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
        child: BlocConsumer<MaterialCubit, MaterialState1>(
          listener: (context, state) {
            if (state is MaterialError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (state is MaterialSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: const Color(0xFF1565C0),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is MaterialLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF1565C0),
                ),
              );
            } else {
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: materials.length,
                itemBuilder: (context, index) {
                  return MaterialItemStudent(material: materials[index]);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
