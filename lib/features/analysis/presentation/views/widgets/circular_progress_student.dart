// Path: lib/features/analysis/presentation/widgets/circular_progress_admin.dart

import 'package:flutter/material.dart';
import 'dart:math';

class CircularProgressStudent extends StatelessWidget {
  final String label;
  final double percentage;
  final Color color;
  final double animationValue;
  final double size;
  final bool isSmallScreen;
  final bool showFilledCircle;

  const CircularProgressStudent({
    Key? key,
    required this.label,
    required this.percentage,
    required this.color,
    required this.animationValue,
    required this.size,
    this.isSmallScreen = false,
    this.showFilledCircle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final strokeWidth = isSmallScreen ? 8.0 : 10.0;
    final fontSize = isSmallScreen ? 16.0 : 22.0;
    final labelFontSize = isSmallScreen ? 10.0 : 14.0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: CustomPaint(
            painter: CircularProgressPainter(
              percentage: percentage * animationValue / 100,
              color: color,
              strokeWidth: strokeWidth,
              showFilledCircle: showFilledCircle,
            ),
            child: Center(
              child: Text(
                '${(percentage * animationValue).toInt()} %',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Flexible(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black87,
              fontSize: labelFontSize,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class CircularProgressPainter extends CustomPainter {
  final double percentage;
  final Color color;
  final double strokeWidth;
  final bool showFilledCircle;

  CircularProgressPainter({
    required this.percentage,
    required this.color,
    required this.strokeWidth,
    this.showFilledCircle = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2 - strokeWidth / 2;

    // Draw background circle
    final backgroundPaint = Paint()
      ..color = color.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw progress arc
    final progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final progressAngle = 2 * pi * percentage;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2, // Start from top
      progressAngle,
      false,
      progressPaint,
    );

    // Fill the circle based on percentage if requested
    if (showFilledCircle) {
      final fillPaint = Paint()
        ..color = color.withOpacity(0.15)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(center, radius * percentage, fillPaint);
    }
  }

  @override
  bool shouldRepaint(CircularProgressPainter oldDelegate) {
    return oldDelegate.percentage != percentage ||
        oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.showFilledCircle != showFilledCircle;
  }
}
