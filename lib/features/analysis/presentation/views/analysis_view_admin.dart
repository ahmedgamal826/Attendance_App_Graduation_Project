// Path: lib/features/analysis/presentation/views/attendance_view_admin.dart

import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/analysis/presentation/views/widgets/analysis_view_admin_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/cubit_admin/analysis_cubit.dart';

class AnalysisViewAdmin extends StatelessWidget {
  const AnalysisViewAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnalysisCubit(),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          title: const Text(
            'Admin Analysis',
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: const Color(0xFFE3F2FD), // Light blue background
        body: const AnalysisViewAdminBody(),
      ),
    );
  }
}
