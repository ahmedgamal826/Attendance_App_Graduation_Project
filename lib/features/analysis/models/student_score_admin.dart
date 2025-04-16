// Path: lib/features/analysis/models/student_score_admin.dart
import 'package:flutter/material.dart';

class StudentScoreAdmin {
  final String name;
  final double score;

  StudentScoreAdmin(this.name, this.score);
}

class PerformanceMetric {
  final String label;
  final double percentage;
  final Color color;

  PerformanceMetric({
    required this.label,
    required this.percentage,
    required this.color,
  });
}