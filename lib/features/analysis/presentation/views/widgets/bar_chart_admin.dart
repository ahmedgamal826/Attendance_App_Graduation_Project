// Path: lib/features/analysis/presentation/widgets/bar_chart_admin.dart

import 'package:flutter/material.dart';

import '../../../models/student_score_admin.dart';

class tBarChartAdmin extends StatelessWidget {
  final List<StudentScoreAdmin> studentScores;
  final double animationValue;
  final bool isSmallScreen;
  final bool isMediumScreen;

  const tBarChartAdmin({
    Key? key,
    required this.studentScores,
    required this.animationValue,
    this.isSmallScreen = false,
    this.isMediumScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Adjust padding and font size based on screen size
    final containerPadding = isSmallScreen ? 8.0 : 16.0;
    final titleFontSize = isSmallScreen ? 14.0 : 18.0;
    final axisFontSize = isSmallScreen ? 12.0 : 15.0;
    final labelFontSize = isSmallScreen ? 10.0 : 12.0;
    final barWidth = isSmallScreen ? 16.0 : (isMediumScreen ? 20.0 : 28.0);

    return Container(
      padding: EdgeInsets.all(containerPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Best 5 Students\' Analysis',
            style: TextStyle(
              color: Colors.red,
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: isSmallScreen ? 10 : 20),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                top: containerPadding / 2,
                right: containerPadding / 2,
                bottom: containerPadding / 2,
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
                          Text('100',
                              style: TextStyle(
                                  fontSize: axisFontSize,
                                  color: Colors.grey[600])),
                          Text('80',
                              style: TextStyle(
                                  fontSize: axisFontSize,
                                  color: Colors.grey[600])),
                          Text('60',
                              style: TextStyle(
                                  fontSize: axisFontSize,
                                  color: Colors.grey[600])),
                          Text('40',
                              style: TextStyle(
                                  fontSize: axisFontSize,
                                  color: Colors.grey[600])),
                          Text('20',
                              style: TextStyle(
                                  fontSize: axisFontSize,
                                  color: Colors.grey[600])),
                          Text('0',
                              style: TextStyle(
                                  fontSize: axisFontSize,
                                  color: Colors.grey[600])),
                        ],
                      ),
                      const SizedBox(width: 5),
                      // Chart Area
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: studentScores.map((score) {
                                  return _buildBarWithLabel(
                                    score.score * animationValue,
                                    score.name,
                                    Colors.red,
                                    constraints.maxHeight - 20,
                                    barWidth,
                                    labelFontSize,
                                  );
                                }).toList(),
                              ),
                            ),
                            const SizedBox(height: 5),
                            // X-Axis Line
                            Container(
                              height: 2,
                              color: Colors.blue,
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
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        FittedBox(
          child: Text(
            label,
            style:
                TextStyle(fontSize: labelFontSize, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
