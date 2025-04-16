// Path: lib/features/analysis/cubits/cubit_admin/analysis_cubit.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/student_score_admin.dart';
import 'analysis_state.dart';

class AnalysisCubit extends Cubit<AnalysisState> {
  AnalysisCubit()
      : super(AnalysisState(
          topStudents: [],
          performanceMetrics: [],
          isLoading: true,
        )) {
    loadAnalysisData();
  }

  Future<void> loadAnalysisData() async {
    emit(state.copyWith(isLoading: true));

    try {
      // In a real app, this would come from an API or database
      // For now, we're using mock data
      await Future.delayed(
          const Duration(milliseconds: 500)); // Simulate network delay

      final topStudents = [
        StudentScoreAdmin('Student 1', 95),
        StudentScoreAdmin('Student 2', 82),
        StudentScoreAdmin('Student 3', 78),
        StudentScoreAdmin('Student 4', 65),
        StudentScoreAdmin('Student 5', 50),
      ];

      final performanceMetrics = [
        PerformanceMetric(
          label: 'Student\nPerformance',
          percentage: 50,
          color: Colors.blue.shade700,
        ),
        PerformanceMetric(
          label: 'Student\nAttendance',
          percentage: 70,
          color: Colors.blue.shade500,
        ),
      ];

      emit(state.copyWith(
        topStudents: topStudents,
        performanceMetrics: performanceMetrics,
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
