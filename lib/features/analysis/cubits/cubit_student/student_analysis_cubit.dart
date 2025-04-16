// Path: lib/features/analysis/cubits/cubit_student/student_analysis_cubit.dart

import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/student_score_student.dart';
import 'student_analysis_state.dart';

class StudentAnalysisCubit extends Cubit<StudentAnalysisState> {
  StudentAnalysisCubit()
      : super(StudentAnalysisState(
          studentScores: [],
          performanceMetrics: [],
          isLoading: true,
        )) {
    loadStudentAnalysisData();
  }

  Future<void> loadStudentAnalysisData() async {
    emit(state.copyWith(isLoading: true));

    try {
      // Simulate network delay
      await Future.delayed(const Duration(milliseconds: 500));

      final performanceMetrics = [
        PerformanceMetric(
          // color: Colors.green.shade600,
          label: 'Attendance', percentage: 50, color: AppColors.primaryColor,
        ),
        PerformanceMetric(
          label: 'Assignment',
          percentage: 70,
          color: AppColors.primaryColor,
        ),
        PerformanceMetric(
          label: 'All',
          percentage: 60,
         color: AppColors.primaryColor,
        ),
      ];

      final studentScores = [
        StudentScoreStudent('All\nStudent', 80, Colors.blue.shade600),
        StudentScoreStudent('All', 60, Colors.amber.shade600),
      ];

      emit(state.copyWith(
        performanceMetrics: performanceMetrics,
        studentScores: studentScores,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        error: e.toString(),
        isLoading: false,
      ));
    }
  }
}
