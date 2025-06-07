import 'package:flutter/material.dart';

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
