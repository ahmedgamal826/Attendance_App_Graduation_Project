// Path: lib/features/analysis/cubits/cubit_student/student_analysis_state.dart

import '../../models/student_score_student.dart';

class StudentAnalysisState {
  final List<StudentScoreStudent> studentScores;
  final List<PerformanceMetric> performanceMetrics;
  final bool isLoading;
  final String? error;

  StudentAnalysisState({
    required this.studentScores,
    required this.performanceMetrics,
    this.isLoading = false,
    this.error,
  });

  StudentAnalysisState copyWith({
    List<StudentScoreStudent>? studentScores,
    List<PerformanceMetric>? performanceMetrics,
    bool? isLoading,
    String? error,
  }) {
    return StudentAnalysisState(
      studentScores: studentScores ?? this.studentScores,
      performanceMetrics: performanceMetrics ?? this.performanceMetrics,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}