// Path: lib/features/analysis/models/student_score_student.dart

import 'package:flutter/material.dart';

class StudentScoreStudent {
  final String name;
  final double score;
  final Color color;

  StudentScoreStudent(this.name, this.score, this.color);
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