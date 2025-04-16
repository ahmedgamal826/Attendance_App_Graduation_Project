// Path: lib/features/analysis/presentation/widgets/bar_chart_student.dart

import 'package:flutter/material.dart';

import '../../../models/student_score_student.dart';

class BarChartStudent extends StatelessWidget {
  final List<StudentScoreStudent> studentScores;
  final double animationValue;
  final bool isSmallScreen;
  final bool isMediumScreen;
  final Color themeColor;

  const BarChartStudent({
    Key? key,
    required this.studentScores,
    required this.animationValue,
    this.isSmallScreen = false,
    this.isMediumScreen = false,
    required this.themeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Adjust padding and font size based on screen size
    final containerPadding = isSmallScreen ? 8.0 : 16.0;
    final axisFontSize = isSmallScreen ? 9.0 : 12.0;
    final labelFontSize = isSmallScreen ? 10.0 : 12.0;
    final barWidth = isSmallScreen ? 24.0 : (isMediumScreen ? 40.0 : 60.0);

    return Container(
      padding: EdgeInsets.all(containerPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: themeColor, width: 2),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: themeColor.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                top: containerPadding,
                right: containerPadding / 2,
                bottom: containerPadding / 2,
                left: containerPadding,
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Y-Axis
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('100', style: TextStyle(fontSize: axisFontSize, color: Colors.grey[700])),
                          Text('80', style: TextStyle(fontSize: axisFontSize, color: Colors.grey[700])),
                          Text('60', style: TextStyle(fontSize: axisFontSize, color: Colors.grey[700])),
                          Text('40', style: TextStyle(fontSize: axisFontSize, color: Colors.grey[700])),
                          Text('20', style: TextStyle(fontSize: axisFontSize, color: Colors.grey[700])),
                          Text('0', style: TextStyle(fontSize: axisFontSize, color: Colors.grey[700])),
                        ],
                      ),
                      const SizedBox(width: 10),
                      // Chart Area
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: studentScores.map((score) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 8.0 : 16.0),
                                    child: _buildBarWithLabel(
                                      score.score * animationValue,
                                      score.name,
                                      score.color,
                                      constraints.maxHeight - 20,
                                      barWidth,
                                      labelFontSize,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            const SizedBox(height: 5),
                            // X-Axis Line
                            Container(
                              height: 2,
                              color: Colors.grey[700],
                            ),
                            const SizedBox(height: 5),
                            // X-Axis Labels (empty space for alignment)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(
                                  studentScores.length,
                                      (index) => SizedBox(width: barWidth)
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBarWithLabel(
      double value,
      String label,
      Color color,
      double maxHeight,
      double barWidth,
      double labelFontSize,
      ) {
    final double barHeight = (value / 100) * maxHeight;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: barWidth,
          height: barHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                color,
                color.withOpacity(0.7),
              ],
            ),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Text(
              '${value.toInt()}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: labelFontSize,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: barWidth,
          child: Text(
            label,
            style: TextStyle(
                fontSize: labelFontSize,
                fontWeight: FontWeight.w500
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
