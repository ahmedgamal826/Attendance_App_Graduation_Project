// Path: lib/features/analysis/cubits/cubit_admin/analysis_state.dart

import 'package:flutter/material.dart';
import '../../models/student_score_admin.dart';

class AnalysisState {
  final List<StudentScoreAdmin> topStudents;
  final List<PerformanceMetric> performanceMetrics;
  final bool isLoading;
  final String? error;

  AnalysisState({
    required this.topStudents,
    required this.performanceMetrics,
    this.isLoading = false,
    this.error,
  });

  AnalysisState copyWith({
    List<StudentScoreAdmin>? topStudents,
    List<PerformanceMetric>? performanceMetrics,
    bool? isLoading,
    String? error,
  }) {
    return AnalysisState(
      topStudents: topStudents ?? this.topStudents,
      performanceMetrics: performanceMetrics ?? this.performanceMetrics,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}