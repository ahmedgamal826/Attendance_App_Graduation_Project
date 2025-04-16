// // Path: lib/features/analysis/presentation/widgets/attendance_view_admin_body.dart
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../cubits/cubit_admin/analysis_cubit.dart';
// import '../../../cubits/cubit_admin/analysis_state.dart';
// import 'circular_progress_admin.dart';
// import 'bar_chart_admin.dart';
//
// class AnalysisViewAdminBody extends StatefulWidget {
//   const AnalysisViewAdminBody({Key? key}) : super(key: key);
//
//   @override
//   State<AnalysisViewAdminBody> createState() => _AnalysisViewAdminBodyState();
// }
//
// class _AnalysisViewAdminBodyState extends State<AnalysisViewAdminBody> with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _animation;
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1500),
//     );
//     _animation = CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeInOut,
//     );
//     _animationController.forward();
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Get screen size for responsive sizing
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     final isSmallScreen = screenWidth < 400;
//     final isMediumScreen = screenWidth >= 400 && screenWidth < 600;
//
//     // Calculate circle size based on screen width
//     final circleSize = isSmallScreen ? 80.0 : (isMediumScreen ? 90.0 : 100.0);
//
//     return BlocBuilder<AnalysisCubit, AnalysisState>(
//       builder: (context, state) {
//         if (state.isLoading) {
//           return const Center(child: CircularProgressIndicator());
//         }
//
//         if (state.error != null) {
//           return Center(child: Text('Error: ${state.error}'));
//         }
//
//         return SafeArea(
//           child: Padding(
//             padding: EdgeInsets.all(isSmallScreen ? 8.0 : 16.0),
//             child: Column(
//               children: [
//                 // Circles Section with Animation - Always in Row
//                 Container(
//                   height: circleSize * 1.5, // Set fixed height for the circles section
//                   margin: EdgeInsets.symmetric(vertical: isSmallScreen ? 8.0 : 16.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: state.performanceMetrics.map((metric) {
//                       return Expanded(
//                         child: CircularProgressWidget(
//                           label: metric.label,
//                           percentage: metric.percentage,
//                           color: metric.color,
//                           animationValue: _animation.value,
//                           size: circleSize,
//                           isSmallScreen: isSmallScreen,
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//
//                 // Chart Section with Animation
//                 Expanded(
//                   child: AnimatedBuilder(
//                     animation: _animation,
//                     builder: (context, child) {
//                       return StudentBarChart(
//                         studentScores: state.topStudents,
//                         animationValue: _animation.value,
//                         isSmallScreen: isSmallScreen,
//                         isMediumScreen: isMediumScreen,
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/cubit_admin/analysis_cubit.dart';
import '../../../cubits/cubit_admin/analysis_state.dart';
import 'circular_progress_admin.dart';
import 'bar_chart_admin.dart';

class AnalysisViewAdminBody extends StatefulWidget {
  const AnalysisViewAdminBody({Key? key}) : super(key: key);

  @override
  State<AnalysisViewAdminBody> createState() => _AnalysisViewAdminBodyState();
}

class _AnalysisViewAdminBodyState extends State<AnalysisViewAdminBody> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isDataLoaded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    // Don't start animation immediately
    // We'll start it when data is loaded
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsive sizing
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 400;
    final isMediumScreen = screenWidth >= 400 && screenWidth < 600;

    // Calculate circle size based on screen width
    final circleSize = isSmallScreen ? 80.0 : (isMediumScreen ? 90.0 : 100.0);

    return BlocConsumer<AnalysisCubit, AnalysisState>(
      listener: (context, state) {
        // Start animation when data is loaded
        if (!state.isLoading && !_isDataLoaded && state.error == null) {
          _isDataLoaded = true;
          // Ensure widget is mounted before starting animation
          if (mounted) {
            _animationController.forward().orCancel;
          }
        }
      },
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.error != null) {
          return Center(child: Text('Error: ${state.error}'));
        }

        return SafeArea(
          child: Padding(
            padding: EdgeInsets.all(isSmallScreen ? 8.0 : 16.0),
            child: Column(
              children: [
                // Circles Section with Animation - Always in Row
                Container(
                  height: circleSize * 1.5, // Set fixed height for the circles section
                  margin: EdgeInsets.symmetric(vertical: isSmallScreen ? 8.0 : 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: state.performanceMetrics.map((metric) {
                      return Expanded(
                        child: AnimatedBuilder(
                          animation: _animation,
                          builder: (context, child) {
                            return CircularProgressAdmin(
                              label: metric.label,
                              percentage: metric.percentage,
                              color: metric.color,
                              animationValue: _animation.value,
                              size: circleSize,
                              isSmallScreen: isSmallScreen,
                            );
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),

                // Chart Section with Animation
                Expanded(
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return tBarChartAdmin(
                        studentScores: state.topStudents,
                        animationValue: _animation.value,
                        isSmallScreen: isSmallScreen,
                        isMediumScreen: isMediumScreen,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}