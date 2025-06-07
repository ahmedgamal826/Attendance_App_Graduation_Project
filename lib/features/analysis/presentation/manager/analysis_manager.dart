// // // // // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // // // // import 'package:attendance_app/features/analysis/models/performance_metric.dart';
// // // // // // // // import 'package:attendance_app/features/analysis/models/student_score_admin.dart';
// // // // // // // // import 'package:attendance_app/features/analysis/models/student_score_student.dart';
// // // // // // // // import 'package:flutter/material.dart';

// // // // // // // // class AnalysisManager extends ChangeNotifier {
// // // // // // // //   // Admin data
// // // // // // // //   List<StudentScoreAdmin> _topStudents = [];
// // // // // // // //   List<PerformanceMetric> _adminPerformanceMetrics = [];
// // // // // // // //   bool _isAdminLoading = true;
// // // // // // // //   String? _adminError;

// // // // // // // //   // Student data
// // // // // // // //   List<StudentScoreStudent> _studentScores = [];
// // // // // // // //   List<PerformanceMetric> _studentPerformanceMetrics = [];
// // // // // // // //   bool _isStudentLoading = true;
// // // // // // // //   String? _studentError;

// // // // // // // //   // Getters
// // // // // // // //   List<StudentScoreAdmin> get topStudents => _topStudents;
// // // // // // // //   List<PerformanceMetric> get adminPerformanceMetrics =>
// // // // // // // //       _adminPerformanceMetrics;
// // // // // // // //   bool get isAdminLoading => _isAdminLoading;
// // // // // // // //   String? get adminError => _adminError;

// // // // // // // //   List<StudentScoreStudent> get studentScores => _studentScores;
// // // // // // // //   List<PerformanceMetric> get studentPerformanceMetrics =>
// // // // // // // //       _studentPerformanceMetrics;
// // // // // // // //   bool get isStudentLoading => _isStudentLoading;
// // // // // // // //   String? get studentError => _studentError;

// // // // // // // //   AnalysisManager() {
// // // // // // // //     loadAdminAnalysisData();
// // // // // // // //     loadStudentAnalysisData();
// // // // // // // //   }

// // // // // // // //   Future<void> loadAdminAnalysisData() async {
// // // // // // // //     _isAdminLoading = true;
// // // // // // // //     notifyListeners();

// // // // // // // //     try {
// // // // // // // //       // Simulate network delay
// // // // // // // //       await Future.delayed(const Duration(milliseconds: 500));

// // // // // // // //       _topStudents = [
// // // // // // // //         StudentScoreAdmin('Student 1', 95),
// // // // // // // //         StudentScoreAdmin('Student 2', 82),
// // // // // // // //         StudentScoreAdmin('Student 3', 78),
// // // // // // // //         StudentScoreAdmin('Student 4', 65),
// // // // // // // //         StudentScoreAdmin('Student 5', 50),
// // // // // // // //       ];

// // // // // // // //       _adminPerformanceMetrics = [
// // // // // // // //         PerformanceMetric(
// // // // // // // //           label: 'Student\nPerformance',
// // // // // // // //           percentage: 50,
// // // // // // // //           color: Colors.blue.shade700,
// // // // // // // //         ),
// // // // // // // //         PerformanceMetric(
// // // // // // // //           label: 'Student\nAttendance',
// // // // // // // //           percentage: 70,
// // // // // // // //           color: Colors.blue.shade500,
// // // // // // // //         ),
// // // // // // // //       ];

// // // // // // // //       _isAdminLoading = false;
// // // // // // // //       _adminError = null;
// // // // // // // //     } catch (e) {
// // // // // // // //       _isAdminLoading = false;
// // // // // // // //       _adminError = e.toString();
// // // // // // // //     }
// // // // // // // //     notifyListeners();
// // // // // // // //   }

// // // // // // // //   Future<void> loadStudentAnalysisData() async {
// // // // // // // //     _isStudentLoading = true;
// // // // // // // //     notifyListeners();

// // // // // // // //     try {
// // // // // // // //       // Simulate network delay
// // // // // // // //       await Future.delayed(const Duration(milliseconds: 500));

// // // // // // // //       _studentPerformanceMetrics = [
// // // // // // // //         PerformanceMetric(
// // // // // // // //           label: 'Attendance',
// // // // // // // //           percentage: 50,
// // // // // // // //           color: AppColors.primaryColor,
// // // // // // // //         ),
// // // // // // // //         PerformanceMetric(
// // // // // // // //           label: 'Assignment',
// // // // // // // //           percentage: 70,
// // // // // // // //           color: AppColors.primaryColor,
// // // // // // // //         ),
// // // // // // // //         PerformanceMetric(
// // // // // // // //           label: 'All',
// // // // // // // //           percentage: 60,
// // // // // // // //           color: AppColors.primaryColor,
// // // // // // // //         ),
// // // // // // // //       ];

// // // // // // // //       _studentScores = [
// // // // // // // //         StudentScoreStudent('All\nStudent', 80, Colors.blue.shade600),
// // // // // // // //         StudentScoreStudent('All', 60, Colors.amber.shade600),
// // // // // // // //       ];

// // // // // // // //       _isStudentLoading = false;
// // // // // // // //       _studentError = null;
// // // // // // // //     } catch (e) {
// // // // // // // //       _isStudentLoading = false;
// // // // // // // //       _studentError = e.toString();
// // // // // // // //     }
// // // // // // // //     notifyListeners();
// // // // // // // //   }
// // // // // // // // }

// // // // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // // // import 'package:attendance_app/features/analysis/models/performance_metric.dart';
// // // // // // // import 'package:attendance_app/features/analysis/models/student_score_admin.dart';
// // // // // // // import 'package:attendance_app/features/analysis/models/student_score_student.dart';
// // // // // // // import 'package:attendance_app/features/attendance/data/repository/lecture_attendance_repository.dart';
// // // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // // import 'package:flutter/material.dart';

// // // // // // // class AnalysisManager extends ChangeNotifier {
// // // // // // //   final AttendanceRepository _repository = AttendanceRepository();
// // // // // // //   final String courseId = 'IOT'; // Replace with dynamic course ID if needed

// // // // // // //   // Admin data
// // // // // // //   List<StudentScoreAdmin> _topStudents = [];
// // // // // // //   List<PerformanceMetric> _adminPerformanceMetrics = [];
// // // // // // //   bool _isAdminLoading = true;
// // // // // // //   String? _adminError;

// // // // // // //   // Student data
// // // // // // //   List<StudentScoreStudent> _studentScores = [];
// // // // // // //   List<PerformanceMetric> _studentPerformanceMetrics = [];
// // // // // // //   bool _isStudentLoading = true;
// // // // // // //   String? _studentError;

// // // // // // //   // Getters
// // // // // // //   List<StudentScoreAdmin> get topStudents => _topStudents;
// // // // // // //   List<PerformanceMetric> get adminPerformanceMetrics =>
// // // // // // //       _adminPerformanceMetrics;
// // // // // // //   bool get isAdminLoading => _isAdminLoading;
// // // // // // //   String? get adminError => _adminError;

// // // // // // //   List<StudentScoreStudent> get studentScores => _studentScores;
// // // // // // //   List<PerformanceMetric> get studentPerformanceMetrics =>
// // // // // // //       _studentPerformanceMetrics;
// // // // // // //   bool get isStudentLoading => _isStudentLoading;
// // // // // // //   String? get studentError => _studentError;

// // // // // // //   AnalysisManager() {
// // // // // // //     _loadAdminAnalysisData();
// // // // // // //     _loadStudentAnalysisData();
// // // // // // //     _listenToAttendanceChanges();
// // // // // // //   }

// // // // // // //   Future<void> _loadAdminAnalysisData() async {
// // // // // // //     _isAdminLoading = true;
// // // // // // //     notifyListeners();

// // // // // // //     try {
// // // // // // //       await Future.delayed(const Duration(milliseconds: 500));

// // // // // // //       // Fetch all lectures
// // // // // // //       DocumentReference courseRef =
// // // // // // //           FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // // // // // //       QuerySnapshot lecturesSnapshot =
// // // // // // //           await courseRef.collection('lectures').get();
// // // // // // //       int totalLectures = lecturesSnapshot.docs.length;

// // // // // // //       // Map to store attendance count for each student
// // // // // // //       Map<String, int> attendanceCount = {};

// // // // // // //       // Collect attendance data for all students across all lectures
// // // // // // //       for (var lectureDoc in lecturesSnapshot.docs) {
// // // // // // //         var lectureRef = courseRef.collection('lectures').doc(lectureDoc.id);
// // // // // // //         var studentsSnapshot =
// // // // // // //             await _repository.getStudentsStream(lectureRef).first;
// // // // // // //         for (var studentDoc in studentsSnapshot.docs) {
// // // // // // //           var data = studentDoc.data() as Map<String, dynamic>;
// // // // // // //           String name = data['name'] ?? 'Unknown';
// // // // // // //           bool hasAttended = false;

// // // // // // //           // Check all possible dates for attendance
// // // // // // //           data.forEach((key, value) {
// // // // // // //             if (value is Map<String, dynamic> &&
// // // // // // //                 value['Check-out'] != null &&
// // // // // // //                 value['Check-out'] != '--') {
// // // // // // //               hasAttended = true;
// // // // // // //             }
// // // // // // //           });

// // // // // // //           if (hasAttended) {
// // // // // // //             attendanceCount[name] = (attendanceCount[name] ?? 0) + 1;
// // // // // // //           }
// // // // // // //         }
// // // // // // //       }

// // // // // // //       // Calculate top 5 students based on attendance percentage
// // // // // // //       _topStudents = attendanceCount.entries
// // // // // // //           .map((entry) => StudentScoreAdmin(entry.key,
// // // // // // //               (entry.value / totalLectures * 100).round().toDouble()))
// // // // // // //           .toList()
// // // // // // //           .where((student) => student.score > 0)
// // // // // // //           .toList()
// // // // // // //           .take(5)
// // // // // // //           .toList();

// // // // // // //       // Calculate overall attendance percentage for all students
// // // // // // //       double overallAttendance = attendanceCount.isNotEmpty
// // // // // // //           ? (attendanceCount.values.reduce((a, b) => a + b) /
// // // // // // //               (totalLectures * attendanceCount.length) *
// // // // // // //               100)
// // // // // // //           : 0;

// // // // // // //       _adminPerformanceMetrics = [
// // // // // // //         PerformanceMetric(
// // // // // // //           label: 'Student\nPerformance',
// // // // // // //           percentage:
// // // // // // //               50, // Placeholder, replace with actual performance metric if available
// // // // // // //           color: Colors.blue.shade700,
// // // // // // //         ),
// // // // // // //         PerformanceMetric(
// // // // // // //           label: 'Student\nAttendance',
// // // // // // //           percentage: overallAttendance,
// // // // // // //           color: Colors.blue.shade500,
// // // // // // //         ),
// // // // // // //       ];

// // // // // // //       _isAdminLoading = false;
// // // // // // //       _adminError = null;
// // // // // // //     } catch (e) {
// // // // // // //       _isAdminLoading = false;
// // // // // // //       _adminError = e.toString();
// // // // // // //     }
// // // // // // //     notifyListeners();
// // // // // // //   }

// // // // // // //   Future<void> _loadStudentAnalysisData() async {
// // // // // // //     _isStudentLoading = true;
// // // // // // //     notifyListeners();

// // // // // // //     try {
// // // // // // //       await Future.delayed(const Duration(milliseconds: 500));

// // // // // // //       _studentPerformanceMetrics = [
// // // // // // //         PerformanceMetric(
// // // // // // //           label: 'Attendance',
// // // // // // //           percentage: _adminPerformanceMetrics.isNotEmpty
// // // // // // //               ? _adminPerformanceMetrics[1].percentage
// // // // // // //               : 0,
// // // // // // //           color: AppColors.primaryColor,
// // // // // // //         ),
// // // // // // //         PerformanceMetric(
// // // // // // //           label: 'Assignment',
// // // // // // //           percentage: 70, // Placeholder, replace with actual data if available
// // // // // // //           color: AppColors.primaryColor,
// // // // // // //         ),
// // // // // // //         PerformanceMetric(
// // // // // // //           label: 'All',
// // // // // // //           percentage: 60, // Placeholder, replace with average if available
// // // // // // //           color: AppColors.primaryColor,
// // // // // // //         ),
// // // // // // //       ];

// // // // // // //       _studentScores = [
// // // // // // //         StudentScoreStudent(
// // // // // // //             'All\nStudent',
// // // // // // //             _adminPerformanceMetrics.isNotEmpty
// // // // // // //                 ? _adminPerformanceMetrics[1].percentage
// // // // // // //                 : 0,
// // // // // // //             Colors.blue.shade600),
// // // // // // //         StudentScoreStudent('All', 60, Colors.amber.shade600), // Placeholder
// // // // // // //       ];

// // // // // // //       _isStudentLoading = false;
// // // // // // //       _studentError = null;
// // // // // // //     } catch (e) {
// // // // // // //       _isStudentLoading = false;
// // // // // // //       _studentError = e.toString();
// // // // // // //     }
// // // // // // //     notifyListeners();
// // // // // // //   }

// // // // // // //   void _listenToAttendanceChanges() {
// // // // // // //     DocumentReference courseRef =
// // // // // // //         FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // // // // // //     courseRef.collection('lectures').snapshots().listen((snapshot) {
// // // // // // //       _loadAdminAnalysisData();
// // // // // // //     });
// // // // // // //   }
// // // // // // // }

// // // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // // import 'package:attendance_app/features/analysis/models/performance_metric.dart';
// // // // // // import 'package:attendance_app/features/analysis/models/student_score_admin.dart';
// // // // // // import 'package:attendance_app/features/analysis/models/student_score_student.dart';
// // // // // // import 'package:attendance_app/features/attendance/data/repository/lecture_attendance_repository.dart';
// // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // // import 'package:flutter/material.dart';

// // // // // // class AnalysisManager extends ChangeNotifier {
// // // // // //   final AttendanceRepository _repository = AttendanceRepository();
// // // // // //   final String courseId; // يصبح ديناميكيًا الآن

// // // // // //   // Admin data
// // // // // //   List<StudentScoreAdmin> _topStudents = [];
// // // // // //   List<PerformanceMetric> _adminPerformanceMetrics = [];
// // // // // //   bool _isAdminLoading = true;
// // // // // //   String? _adminError;

// // // // // //   // Student data
// // // // // //   List<StudentScoreStudent> _studentScores = [];
// // // // // //   List<PerformanceMetric> _studentPerformanceMetrics = [];
// // // // // //   bool _isStudentLoading = true;
// // // // // //   String? _studentError;

// // // // // //   // Getters
// // // // // //   List<StudentScoreAdmin> get topStudents => _topStudents;
// // // // // //   List<PerformanceMetric> get adminPerformanceMetrics =>
// // // // // //       _adminPerformanceMetrics;
// // // // // //   bool get isAdminLoading => _isAdminLoading;
// // // // // //   String? get adminError => _adminError;

// // // // // //   List<StudentScoreStudent> get studentScores => _studentScores;
// // // // // //   List<PerformanceMetric> get studentPerformanceMetrics =>
// // // // // //       _studentPerformanceMetrics;
// // // // // //   bool get isStudentLoading => _isStudentLoading;
// // // // // //   String? get studentError => _studentError;

// // // // // //   AnalysisManager(this.courseId) {
// // // // // //     _loadAdminAnalysisData();
// // // // // //     _loadStudentAnalysisData();
// // // // // //     _listenToAttendanceChanges();
// // // // // //     _listenToTestsAndAssignmentsChanges();
// // // // // //   }

// // // // // //   Future<void> _loadAdminAnalysisData() async {
// // // // // //     _isAdminLoading = true;
// // // // // //     notifyListeners();

// // // // // //     try {
// // // // // //       await Future.delayed(const Duration(milliseconds: 500));

// // // // // //       // Fetch all lectures for the specific course
// // // // // //       DocumentReference courseRef =
// // // // // //           FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // // // // //       QuerySnapshot lecturesSnapshot =
// // // // // //           await courseRef.collection('lectures').get();
// // // // // //       int totalLectures = lecturesSnapshot.docs.length;

// // // // // //       // Map to store scores for each student
// // // // // //       Map<String, Map<String, double>> studentScores = {};

// // // // // //       // Collect attendance data
// // // // // //       for (var lectureDoc in lecturesSnapshot.docs) {
// // // // // //         var lectureRef = courseRef.collection('lectures').doc(lectureDoc.id);
// // // // // //         var studentsSnapshot =
// // // // // //             await _repository.getStudentsStream(lectureRef).first;
// // // // // //         for (var studentDoc in studentsSnapshot.docs) {
// // // // // //           var data = studentDoc.data() as Map<String, dynamic>;
// // // // // //           String name = data['name'] ?? 'Unknown';
// // // // // //           bool hasAttended = false;
// // // // // //           data.forEach((key, value) {
// // // // // //             if (value is Map<String, dynamic> &&
// // // // // //                 value['Check-out'] != null &&
// // // // // //                 value['Check-out'] != '--') {
// // // // // //               hasAttended = true;
// // // // // //             }
// // // // // //           });
// // // // // //           if (hasAttended) {
// // // // // //             studentScores.putIfAbsent(
// // // // // //                     name,
// // // // // //                     () => {
// // // // // //                           'attendance': 0.0,
// // // // // //                           'test': 0.0,
// // // // // //                           'assignment': 0.0
// // // // // //                         })['attendance'] =
// // // // // //                 (studentScores[name]?['attendance'] ?? 0) + 1;
// // // // // //           }
// // // // // //         }
// // // // // //       }

// // // // // //       // Collect tests data
// // // // // //       QuerySnapshot testsSnapshot = await courseRef.collection('tests').get();
// // // // // //       for (var testDoc in testsSnapshot.docs) {
// // // // // //         var data = testDoc.data() as Map<String, dynamic>;
// // // // // //         for (var submitDoc in (data['studentSubmits'] ?? []) as List) {
// // // // // //           var submitData = submitDoc as Map<String, dynamic>;
// // // // // //           String name = submitData['studentName'] ?? 'Unknown';
// // // // // //           double testScore = (submitData['totalScore'] ?? 0).toDouble();
// // // // // //           studentScores.putIfAbsent(
// // // // // //               name,
// // // // // //               () => {
// // // // // //                     'attendance': 0.0,
// // // // // //                     'test': 0.0,
// // // // // //                     'assignment': 0.0
// // // // // //                   })['test'] = testScore;
// // // // // //         }
// // // // // //       }

// // // // // //       // Collect assignments data
// // // // // //       QuerySnapshot assignmentsSnapshot =
// // // // // //           await courseRef.collection('assignments').get();
// // // // // //       for (var assignmentDoc in assignmentsSnapshot.docs) {
// // // // // //         var data = assignmentDoc.data() as Map<String, dynamic>;
// // // // // //         for (var submitDoc in (data['studentSubmits'] ?? []) as List) {
// // // // // //           var submitData = submitDoc as Map<String, dynamic>;
// // // // // //           String name = submitData['studentName'] ?? 'Unknown';
// // // // // //           double assignmentScore = (submitData['totalScore'] ?? 0).toDouble();
// // // // // //           studentScores.putIfAbsent(
// // // // // //               name,
// // // // // //               () => {
// // // // // //                     'attendance': 0.0,
// // // // // //                     'test': 0.0,
// // // // // //                     'assignment': 0.0
// // // // // //                   })['assignment'] = assignmentScore;
// // // // // //         }
// // // // // //       }

// // // // // //       // Calculate top 5 students based on average performance
// // // // // //       _topStudents = studentScores.entries
// // // // // //           .map((entry) {
// // // // // //             double attendanceScore =
// // // // // //                 (entry.value['attendance'] ?? 0) / totalLectures * 100;
// // // // // //             double testScore = entry.value['test'] ?? 0.0;
// // // // // //             double assignmentScore = entry.value['assignment'] ?? 0.0;
// // // // // //             int count = [attendanceScore, testScore, assignmentScore]
// // // // // //                 .where((score) => score > 0)
// // // // // //                 .length;
// // // // // //             double performanceScore = count > 0
// // // // // //                 ? (attendanceScore + testScore + assignmentScore) / count
// // // // // //                 : 0.0;
// // // // // //             return StudentScoreAdmin(entry.key, performanceScore);
// // // // // //           })
// // // // // //           .toList()
// // // // // //           .where((student) => student.score > 0)
// // // // // //           .toList()
// // // // // //           .take(5)
// // // // // //           .toList();

// // // // // //       // Calculate overall performance percentage for all students
// // // // // //       double totalAttendance = studentScores.values
// // // // // //           .map((s) => s['attendance'] ?? 0)
// // // // // //           .reduce((a, b) => a + b);
// // // // // //       double totalTests = studentScores.values
// // // // // //           .map((s) => s['test'] ?? 0)
// // // // // //           .reduce((a, b) => a + b);
// // // // // //       double totalAssignments = studentScores.values
// // // // // //           .map((s) => s['assignment'] ?? 0)
// // // // // //           .reduce((a, b) => a + b);
// // // // // //       int totalStudents = studentScores.length;
// // // // // //       double overallPerformance = totalStudents > 0
// // // // // //           ? (totalAttendance + totalTests + totalAssignments) /
// // // // // //               (totalStudents * 3) *
// // // // // //               100
// // // // // //           : 0;

// // // // // //       _adminPerformanceMetrics = [
// // // // // //         PerformanceMetric(
// // // // // //           label: 'Student\nPerformance',
// // // // // //           percentage: overallPerformance.round(),
// // // // // //           color: Colors.blue.shade700,
// // // // // //         ),
// // // // // //         PerformanceMetric(
// // // // // //           label: 'Student\nAttendance',
// // // // // //           percentage: totalStudents > 0
// // // // // //               ? (totalAttendance / (totalLectures * totalStudents) * 100)
// // // // // //                   .round()
// // // // // //               : 0,
// // // // // //           color: Colors.blue.shade500,
// // // // // //         ),
// // // // // //       ];

// // // // // //       _isAdminLoading = false;
// // // // // //       _adminError = null;
// // // // // //     } catch (e) {
// // // // // //       _isAdminLoading = false;
// // // // // //       _adminError = e.toString();
// // // // // //     }
// // // // // //     notifyListeners();
// // // // // //   }

// // // // // //   Future<void> _loadStudentAnalysisData() async {
// // // // // //     _isStudentLoading = true;
// // // // // //     notifyListeners();

// // // // // //     try {
// // // // // //       await Future.delayed(const Duration(milliseconds: 500));

// // // // // //       DocumentReference courseRef =
// // // // // //           FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // // // // //       QuerySnapshot lecturesSnapshot =
// // // // // //           await courseRef.collection('lectures').get();
// // // // // //       int totalLectures = lecturesSnapshot.docs.length;

// // // // // //       // Map to store student scores
// // // // // //       Map<String, Map<String, double>> studentScores = {};

// // // // // //       // Collect attendance data
// // // // // //       for (var lectureDoc in lecturesSnapshot.docs) {
// // // // // //         var lectureRef = courseRef.collection('lectures').doc(lectureDoc.id);
// // // // // //         var studentsSnapshot =
// // // // // //             await _repository.getStudentsStream(lectureRef).first;
// // // // // //         for (var studentDoc in studentsSnapshot.docs) {
// // // // // //           var data = studentDoc.data() as Map<String, dynamic>;
// // // // // //           String name = data['name'] ?? 'Unknown';
// // // // // //           bool hasAttended = false;
// // // // // //           data.forEach((key, value) {
// // // // // //             if (value is Map<String, dynamic> &&
// // // // // //                 value['Check-out'] != null &&
// // // // // //                 value['Check-out'] != '--') {
// // // // // //               hasAttended = true;
// // // // // //             }
// // // // // //           });
// // // // // //           if (hasAttended) {
// // // // // //             studentScores.putIfAbsent(
// // // // // //                     name,
// // // // // //                     () => {
// // // // // //                           'attendance': 0.0,
// // // // // //                           'test': 0.0,
// // // // // //                           'assignment': 0.0
// // // // // //                         })['attendance'] =
// // // // // //                 (studentScores[name]?['attendance'] ?? 0) + 1;
// // // // // //           }
// // // // // //         }
// // // // // //       }

// // // // // //       // Collect tests data
// // // // // //       QuerySnapshot testsSnapshot = await courseRef.collection('tests').get();
// // // // // //       for (var testDoc in testsSnapshot.docs) {
// // // // // //         var data = testDoc.data() as Map<String, dynamic>;
// // // // // //         for (var submitDoc in (data['studentSubmits'] ?? []) as List) {
// // // // // //           var submitData = submitDoc as Map<String, dynamic>;
// // // // // //           String name = submitData['studentName'] ?? 'Unknown';
// // // // // //           double testScore = (submitData['totalScore'] ?? 0).toDouble();
// // // // // //           studentScores.putIfAbsent(
// // // // // //               name,
// // // // // //               () => {
// // // // // //                     'attendance': 0.0,
// // // // // //                     'test': 0.0,
// // // // // //                     'assignment': 0.0
// // // // // //                   })['test'] = testScore;
// // // // // //         }
// // // // // //       }

// // // // // //       // Collect assignments data
// // // // // //       QuerySnapshot assignmentsSnapshot =
// // // // // //           await courseRef.collection('assignments').get();
// // // // // //       for (var assignmentDoc in assignmentsSnapshot.docs) {
// // // // // //         var data = assignmentDoc.data() as Map<String, dynamic>;
// // // // // //         for (var submitDoc in (data['studentSubmits'] ?? []) as List) {
// // // // // //           var submitData = submitDoc as Map<String, dynamic>;
// // // // // //           String name = submitData['studentName'] ?? 'Unknown';
// // // // // //           double assignmentScore = (submitData['totalScore'] ?? 0).toDouble();
// // // // // //           studentScores.putIfAbsent(
// // // // // //               name,
// // // // // //               () => {
// // // // // //                     'attendance': 0.0,
// // // // // //                     'test': 0.0,
// // // // // //                     'assignment': 0.0
// // // // // //                   })['assignment'] = assignmentScore;
// // // // // //         }
// // // // // //       }

// // // // // //       // Calculate student performance metrics
// // // // // //       _studentPerformanceMetrics = [
// // // // // //         PerformanceMetric(
// // // // // //           label: 'Attendance',
// // // // // //           percentage: studentScores.isNotEmpty
// // // // // //               ? (studentScores.values
// // // // // //                           .map((s) => s['attendance'] ?? 0)
// // // // // //                           .reduce((a, b) => a + b) /
// // // // // //                       (totalLectures * studentScores.length) *
// // // // // //                       100)
// // // // // //                   .round()
// // // // // //               : 0,
// // // // // //           color: AppColors.primaryColor,
// // // // // //         ),
// // // // // //         PerformanceMetric(
// // // // // //           label: 'Assignment',
// // // // // //           percentage: studentScores.isNotEmpty
// // // // // //               ? (studentScores.values
// // // // // //                           .map((s) => s['assignment'] ?? 0)
// // // // // //                           .reduce((a, b) => a + b) /
// // // // // //                       studentScores.length)
// // // // // //                   .round()
// // // // // //               : 0,
// // // // // //           color: AppColors.primaryColor,
// // // // // //         ),
// // // // // //         PerformanceMetric(
// // // // // //           label: 'All',
// // // // // //           percentage: studentScores.isNotEmpty
// // // // // //               ? (studentScores.values
// // // // // //                           .map((s) =>
// // // // // //                               (s['attendance'] ?? 0) +
// // // // // //                               (s['test'] ?? 0) +
// // // // // //                               (s['assignment'] ?? 0))
// // // // // //                           .reduce((a, b) => a + b) /
// // // // // //                       (studentScores.length * 3) *
// // // // // //                       100)
// // // // // //                   .round()
// // // // // //               : 0,
// // // // // //           color: AppColors.primaryColor,
// // // // // //         ),
// // // // // //       ];

// // // // // //       // Calculate student scores
// // // // // //       _studentScores = studentScores.entries.map((entry) {
// // // // // //         double attendanceScore =
// // // // // //             (entry.value['attendance'] ?? 0) / totalLectures * 100;
// // // // // //         double testScore = entry.value['test'] ?? 0.0;
// // // // // //         double assignmentScore = entry.value['assignment'] ?? 0.0;
// // // // // //         int count = [attendanceScore, testScore, assignmentScore]
// // // // // //             .where((score) => score > 0)
// // // // // //             .length;
// // // // // //         double performanceScore = count > 0
// // // // // //             ? (attendanceScore + testScore + assignmentScore) / count
// // // // // //             : 0.0;
// // // // // //         return StudentScoreStudent(
// // // // // //             entry.key, performanceScore, Colors.blue.shade600);
// // // // // //       }).toList();

// // // // // //       _isStudentLoading = false;
// // // // // //       _studentError = null;
// // // // // //     } catch (e) {
// // // // // //       _isStudentLoading = false;
// // // // // //       _studentError = e.toString();
// // // // // //     }
// // // // // //     notifyListeners();
// // // // // //   }

// // // // // //   void _listenToAttendanceChanges() {
// // // // // //     DocumentReference courseRef =
// // // // // //         FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // // // // //     courseRef.collection('lectures').snapshots().listen((snapshot) {
// // // // // //       _loadAdminAnalysisData();
// // // // // //       _loadStudentAnalysisData();
// // // // // //     });
// // // // // //   }

// // // // // //   void _listenToTestsAndAssignmentsChanges() {
// // // // // //     DocumentReference courseRef =
// // // // // //         FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // // // // //     courseRef.collection('tests').snapshots().listen((snapshot) {
// // // // // //       _loadAdminAnalysisData();
// // // // // //       _loadStudentAnalysisData();
// // // // // //     });
// // // // // //     courseRef.collection('assignments').snapshots().listen((snapshot) {
// // // // // //       _loadAdminAnalysisData();
// // // // // //       _loadStudentAnalysisData();
// // // // // //     });
// // // // // //   }
// // // // // // }

// // // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // // import 'package:attendance_app/features/analysis/models/performance_metric.dart';
// // // // // import 'package:attendance_app/features/analysis/models/student_score_admin.dart';
// // // // // import 'package:attendance_app/features/analysis/models/student_score_student.dart';
// // // // // import 'package:attendance_app/features/attendance/data/repository/lecture_attendance_repository.dart';
// // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // import 'package:flutter/material.dart';

// // // // // class AnalysisManager extends ChangeNotifier {
// // // // //   final AttendanceRepository _repository = AttendanceRepository();
// // // // //   final String courseId; // يدويًا الآن

// // // // //   // Admin data
// // // // //   List<StudentScoreAdmin> _topStudents = [];
// // // // //   List<PerformanceMetric> _adminPerformanceMetrics = [];
// // // // //   bool _isAdminLoading = true;
// // // // //   String? _adminError;

// // // // //   // Student data
// // // // //   List<StudentScoreStudent> _studentScores = [];
// // // // //   List<PerformanceMetric> _studentPerformanceMetrics = [];
// // // // //   bool _isStudentLoading = true;
// // // // //   String? _studentError;

// // // // //   // Getters
// // // // //   List<StudentScoreAdmin> get topStudents => _topStudents;
// // // // //   List<PerformanceMetric> get adminPerformanceMetrics =>
// // // // //       _adminPerformanceMetrics;
// // // // //   bool get isAdminLoading => _isAdminLoading;
// // // // //   String? get adminError => _adminError;

// // // // //   List<StudentScoreStudent> get studentScores => _studentScores;
// // // // //   List<PerformanceMetric> get studentPerformanceMetrics =>
// // // // //       _studentPerformanceMetrics;
// // // // //   bool get isStudentLoading => _isStudentLoading;
// // // // //   String? get studentError => _studentError;

// // // // //   AnalysisManager(this.courseId) {
// // // // //     _loadAdminAnalysisData();
// // // // //     _loadStudentAnalysisData();
// // // // //     _listenToAttendanceChanges();
// // // // //     _listenToTestsAndAssignmentsChanges();
// // // // //   }

// // // // //   Future<void> _loadAdminAnalysisData() async {
// // // // //     _isAdminLoading = true;
// // // // //     notifyListeners();

// // // // //     try {
// // // // //       await Future.delayed(const Duration(milliseconds: 500));

// // // // //       // Fetch all lectures for the specific course
// // // // //       DocumentReference courseRef =
// // // // //           FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // // // //       QuerySnapshot lecturesSnapshot =
// // // // //           await courseRef.collection('lectures').get();
// // // // //       int totalLectures =
// // // // //           lecturesSnapshot.docs.length.toDouble().toInt(); // تحويل إلى int

// // // // //       // Map to store scores for each student
// // // // //       Map<String, Map<String, double>> studentScores = {};

// // // // //       // Collect attendance data
// // // // //       for (var lectureDoc in lecturesSnapshot.docs) {
// // // // //         var lectureRef = courseRef.collection('lectures').doc(lectureDoc.id);
// // // // //         var studentsSnapshot =
// // // // //             await _repository.getStudentsStream(lectureRef).first;
// // // // //         for (var studentDoc in studentsSnapshot.docs) {
// // // // //           var data = studentDoc.data() as Map<String, dynamic>;
// // // // //           String name = data['name'] ?? 'Unknown';
// // // // //           bool hasAttended = false;
// // // // //           data.forEach((key, value) {
// // // // //             if (value is Map<String, dynamic> &&
// // // // //                 value['Check-out'] != null &&
// // // // //                 value['Check-out'] != '--') {
// // // // //               hasAttended = true;
// // // // //             }
// // // // //           });
// // // // //           if (hasAttended) {
// // // // //             studentScores.putIfAbsent(
// // // // //                     name,
// // // // //                     () => {
// // // // //                           'attendance': 0.0,
// // // // //                           'test': 0.0,
// // // // //                           'assignment': 0.0
// // // // //                         })['attendance'] =
// // // // //                 (studentScores[name]?['attendance'] ?? 0).toDouble() + 1.0;
// // // // //           }
// // // // //         }
// // // // //       }

// // // // //       // Collect tests data
// // // // //       QuerySnapshot testsSnapshot = await courseRef.collection('tests').get();
// // // // //       for (var testDoc in testsSnapshot.docs) {
// // // // //         var data = testDoc.data() as Map<String, dynamic>;
// // // // //         for (var submitDoc in (data['studentSubmits'] ?? []) as List) {
// // // // //           var submitData = submitDoc as Map<String, dynamic>;
// // // // //           String name = submitData['studentName'] ?? 'Unknown';
// // // // //           double testScore = (submitData['totalScore'] ?? 0).toDouble();
// // // // //           studentScores.putIfAbsent(
// // // // //               name,
// // // // //               () => {
// // // // //                     'attendance': 0.0,
// // // // //                     'test': 0.0,
// // // // //                     'assignment': 0.0
// // // // //                   })['test'] = testScore;
// // // // //         }
// // // // //       }

// // // // //       // Collect assignments data
// // // // //       QuerySnapshot assignmentsSnapshot =
// // // // //           await courseRef.collection('assignments').get();
// // // // //       for (var assignmentDoc in assignmentsSnapshot.docs) {
// // // // //         var data = assignmentDoc.data() as Map<String, dynamic>;
// // // // //         for (var submitDoc in (data['studentSubmits'] ?? []) as List) {
// // // // //           var submitData = submitDoc as Map<String, dynamic>;
// // // // //           String name = submitData['studentName'] ?? 'Unknown';
// // // // //           double assignmentScore = (submitData['totalScore'] ?? 0).toDouble();
// // // // //           studentScores.putIfAbsent(
// // // // //               name,
// // // // //               () => {
// // // // //                     'attendance': 0.0,
// // // // //                     'test': 0.0,
// // // // //                     'assignment': 0.0
// // // // //                   })['assignment'] = assignmentScore;
// // // // //         }
// // // // //       }

// // // // //       // Calculate top 5 students based on average performance
// // // // //       _topStudents = studentScores.entries
// // // // //           .map((entry) {
// // // // //             double attendanceScore =
// // // // //                 (entry.value['attendance'] ?? 0).toDouble() /
// // // // //                     totalLectures.toDouble() *
// // // // //                     100.0;
// // // // //             double testScore = (entry.value['test'] ?? 0).toDouble();
// // // // //             double assignmentScore =
// // // // //                 (entry.value['assignment'] ?? 0).toDouble();
// // // // //             int count = [attendanceScore, testScore, assignmentScore]
// // // // //                 .where((score) => score > 0)
// // // // //                 .length;
// // // // //             double performanceScore = count > 0
// // // // //                 ? (attendanceScore + testScore + assignmentScore) /
// // // // //                     count.toDouble()
// // // // //                 : 0.0;
// // // // //             return StudentScoreAdmin(entry.key, performanceScore);
// // // // //           })
// // // // //           .toList()
// // // // //           .where((student) => student.score > 0)
// // // // //           .toList()
// // // // //           .take(5)
// // // // //           .toList();

// // // // //       // Calculate overall performance percentage for all students
// // // // //       double totalAttendance = studentScores.values
// // // // //           .map((s) => (s['attendance'] ?? 0).toDouble())
// // // // //           .reduce((a, b) => a + b);
// // // // //       double totalTests = studentScores.values
// // // // //           .map((s) => (s['test'] ?? 0).toDouble())
// // // // //           .reduce((a, b) => a + b);
// // // // //       double totalAssignments = studentScores.values
// // // // //           .map((s) => (s['assignment'] ?? 0).toDouble())
// // // // //           .reduce((a, b) => a + b);
// // // // //       int totalStudents = studentScores.length;
// // // // //       double overallPerformance = totalStudents > 0
// // // // //           ? (totalAttendance + totalTests + totalAssignments) /
// // // // //               (totalStudents.toDouble() * 3.0) *
// // // // //               100.0
// // // // //           : 0.0;

// // // // //       _adminPerformanceMetrics = [
// // // // //         PerformanceMetric(
// // // // //           label: 'Student\nPerformance',
// // // // //           percentage: overallPerformance.round().toDouble(),
// // // // //           color: Colors.blue.shade700,
// // // // //         ),
// // // // //         PerformanceMetric(
// // // // //           label: 'Student\nAttendance',
// // // // //           percentage: totalStudents > 0
// // // // //               ? (totalAttendance /
// // // // //                       (totalLectures.toDouble() * totalStudents.toDouble()) *
// // // // //                       100.0)
// // // // //                   .round()
// // // // //                   .toDouble()
// // // // //               : 0,
// // // // //           color: Colors.blue.shade500,
// // // // //         ),
// // // // //       ];

// // // // //       _isAdminLoading = false;
// // // // //       _adminError = null;
// // // // //     } catch (e) {
// // // // //       _isAdminLoading = false;
// // // // //       _adminError = e.toString();
// // // // //     }
// // // // //     notifyListeners();
// // // // //   }

// // // // //   Future<void> _loadStudentAnalysisData() async {
// // // // //     _isStudentLoading = true;
// // // // //     notifyListeners();

// // // // //     try {
// // // // //       await Future.delayed(const Duration(milliseconds: 500));

// // // // //       DocumentReference courseRef =
// // // // //           FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // // // //       QuerySnapshot lecturesSnapshot =
// // // // //           await courseRef.collection('lectures').get();
// // // // //       int totalLectures =
// // // // //           lecturesSnapshot.docs.length.toDouble().toInt(); // تحويل إلى int

// // // // //       // Map to store student scores
// // // // //       Map<String, Map<String, double>> studentScores = {};

// // // // //       // Collect attendance data
// // // // //       for (var lectureDoc in lecturesSnapshot.docs) {
// // // // //         var lectureRef = courseRef.collection('lectures').doc(lectureDoc.id);
// // // // //         var studentsSnapshot =
// // // // //             await _repository.getStudentsStream(lectureRef).first;
// // // // //         for (var studentDoc in studentsSnapshot.docs) {
// // // // //           var data = studentDoc.data() as Map<String, dynamic>;
// // // // //           String name = data['name'] ?? 'Unknown';
// // // // //           bool hasAttended = false;
// // // // //           data.forEach((key, value) {
// // // // //             if (value is Map<String, dynamic> &&
// // // // //                 value['Check-out'] != null &&
// // // // //                 value['Check-out'] != '--') {
// // // // //               hasAttended = true;
// // // // //             }
// // // // //           });
// // // // //           if (hasAttended) {
// // // // //             studentScores.putIfAbsent(
// // // // //                     name,
// // // // //                     () => {
// // // // //                           'attendance': 0.0,
// // // // //                           'test': 0.0,
// // // // //                           'assignment': 0.0
// // // // //                         })['attendance'] =
// // // // //                 (studentScores[name]?['attendance'] ?? 0).toDouble() + 1.0;
// // // // //           }
// // // // //         }
// // // // //       }

// // // // //       // Collect tests data
// // // // //       QuerySnapshot testsSnapshot = await courseRef.collection('tests').get();
// // // // //       for (var testDoc in testsSnapshot.docs) {
// // // // //         var data = testDoc.data() as Map<String, dynamic>;
// // // // //         for (var submitDoc in (data['studentSubmits'] ?? []) as List) {
// // // // //           var submitData = submitDoc as Map<String, dynamic>;
// // // // //           String name = submitData['studentName'] ?? 'Unknown';
// // // // //           double testScore = (submitData['totalScore'] ?? 0).toDouble();
// // // // //           studentScores.putIfAbsent(
// // // // //               name,
// // // // //               () => {
// // // // //                     'attendance': 0.0,
// // // // //                     'test': 0.0,
// // // // //                     'assignment': 0.0
// // // // //                   })['test'] = testScore;
// // // // //         }
// // // // //       }

// // // // //       // Collect assignments data
// // // // //       QuerySnapshot assignmentsSnapshot =
// // // // //           await courseRef.collection('assignments').get();
// // // // //       for (var assignmentDoc in assignmentsSnapshot.docs) {
// // // // //         var data = assignmentDoc.data() as Map<String, dynamic>;
// // // // //         for (var submitDoc in (data['studentSubmits'] ?? []) as List) {
// // // // //           var submitData = submitDoc as Map<String, dynamic>;
// // // // //           String name = submitData['studentName'] ?? 'Unknown';
// // // // //           double assignmentScore = (submitData['totalScore'] ?? 0).toDouble();
// // // // //           studentScores.putIfAbsent(
// // // // //               name,
// // // // //               () => {
// // // // //                     'attendance': 0.0,
// // // // //                     'test': 0.0,
// // // // //                     'assignment': 0.0
// // // // //                   })['assignment'] = assignmentScore;
// // // // //         }
// // // // //       }

// // // // //       // Calculate student performance metrics
// // // // //       _studentPerformanceMetrics = [
// // // // //         PerformanceMetric(
// // // // //           label: 'Attendance',
// // // // //           percentage: studentScores.isNotEmpty
// // // // //               ? (studentScores.values
// // // // //                           .map((s) => (s['attendance'] ?? 0).toDouble())
// // // // //                           .reduce((a, b) => a + b) /
// // // // //                       (totalLectures.toDouble() *
// // // // //                           studentScores.length.toDouble()) *
// // // // //                       100.0)
// // // // //                   .round().toDouble()
// // // // //               : 0,
// // // // //           color: AppColors.primaryColor,
// // // // //         ),
// // // // //         PerformanceMetric(
// // // // //           label: 'Assignment',
// // // // //           percentage: studentScores.isNotEmpty
// // // // //               ? (studentScores.values
// // // // //                           .map((s) => (s['assignment'] ?? 0).toDouble())
// // // // //                           .reduce((a, b) => a + b) /
// // // // //                       studentScores.length.toDouble())
// // // // //                   .round().toDouble()
// // // // //               : 0,
// // // // //           color: AppColors.primaryColor,
// // // // //         ),
// // // // //         PerformanceMetric(
// // // // //           label: 'All',
// // // // //           percentage: studentScores.isNotEmpty
// // // // //               ? (studentScores.values
// // // // //                           .map((s) =>
// // // // //                               (s['attendance'] ?? 0).toDouble() +
// // // // //                               (s['test'] ?? 0).toDouble() +
// // // // //                               (s['assignment'] ?? 0).toDouble())
// // // // //                           .reduce((a, b) => a + b) /
// // // // //                       (studentScores.length.toDouble() * 3.0) *
// // // // //                       100.0)
// // // // //                   .round().toDouble()
// // // // //               : 0,
// // // // //           color: AppColors.primaryColor,
// // // // //         ),
// // // // //       ];

// // // // //       // Calculate student scores
// // // // //       _studentScores = studentScores.entries.map((entry) {
// // // // //         double attendanceScore = (entry.value['attendance'] ?? 0).toDouble() /
// // // // //             totalLectures.toDouble() *
// // // // //             100.0;
// // // // //         double testScore = (entry.value['test'] ?? 0).toDouble();
// // // // //         double assignmentScore = (entry.value['assignment'] ?? 0).toDouble();
// // // // //         int count = [attendanceScore, testScore, assignmentScore]
// // // // //             .where((score) => score > 0)
// // // // //             .length;
// // // // //         double performanceScore = count > 0
// // // // //             ? (attendanceScore + testScore + assignmentScore) / count.toDouble()
// // // // //             : 0.0;
// // // // //         return StudentScoreStudent(
// // // // //             entry.key, performanceScore, Colors.blue.shade600);
// // // // //       }).toList();

// // // // //       _isStudentLoading = false;
// // // // //       _studentError = null;
// // // // //     } catch (e) {
// // // // //       _isStudentLoading = false;
// // // // //       _studentError = e.toString();
// // // // //     }
// // // // //     notifyListeners();
// // // // //   }

// // // // //   void _listenToAttendanceChanges() {
// // // // //     DocumentReference courseRef =
// // // // //         FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // // // //     courseRef.collection('lectures').snapshots().listen((snapshot) {
// // // // //       _loadAdminAnalysisData();
// // // // //       _loadStudentAnalysisData();
// // // // //     });
// // // // //   }

// // // // //   void _listenToTestsAndAssignmentsChanges() {
// // // // //     DocumentReference courseRef =
// // // // //         FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // // // //     courseRef.collection('tests').snapshots().listen((snapshot) {
// // // // //       _loadAdminAnalysisData();
// // // // //       _loadStudentAnalysisData();
// // // // //     });
// // // // //     courseRef.collection('assignments').snapshots().listen((snapshot) {
// // // // //       _loadAdminAnalysisData();
// // // // //       _loadStudentAnalysisData();
// // // // //     });
// // // // //   }
// // // // // }

// // // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // // import 'package:attendance_app/features/analysis/models/performance_metric.dart';
// // // // import 'package:attendance_app/features/analysis/models/student_score_admin.dart';
// // // // import 'package:attendance_app/features/analysis/models/student_score_student.dart';
// // // // import 'package:attendance_app/features/attendance/data/repository/lecture_attendance_repository.dart';
// // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // import 'package:flutter/material.dart';

// // // // class AnalysisManager extends ChangeNotifier {
// // // //   final AttendanceRepository _repository = AttendanceRepository();
// // // //   final String courseId;

// // // //   // Admin data
// // // //   List<StudentScoreAdmin> _topStudents = [];
// // // //   List<PerformanceMetric> _adminPerformanceMetrics = [];
// // // //   bool _isAdminLoading = true;
// // // //   String? _adminError;

// // // //   // Student data
// // // //   List<StudentScoreStudent> _studentScores = [];
// // // //   List<PerformanceMetric> _studentPerformanceMetrics = [];
// // // //   bool _isStudentLoading = true;
// // // //   String? _studentError;

// // // //   // Getters
// // // //   List<StudentScoreAdmin> get topStudents => _topStudents;
// // // //   List<PerformanceMetric> get adminPerformanceMetrics =>
// // // //       _adminPerformanceMetrics;
// // // //   bool get isAdminLoading => _isAdminLoading;
// // // //   String? get adminError => _adminError;

// // // //   List<StudentScoreStudent> get studentScores => _studentScores;
// // // //   List<PerformanceMetric> get studentPerformanceMetrics =>
// // // //       _studentPerformanceMetrics;
// // // //   bool get isStudentLoading => _isStudentLoading;
// // // //   String? get studentError => _studentError;

// // // //   AnalysisManager(this.courseId) {
// // // //     _loadAdminAnalysisData();
// // // //     _loadStudentAnalysisData();
// // // //     _listenToAttendanceChanges();
// // // //     _listenToTestsAndAssignmentsChanges();
// // // //   }

// // // //   Future<void> _loadAdminAnalysisData() async {
// // // //     _isAdminLoading = true;
// // // //     notifyListeners();

// // // //     try {
// // // //       await Future.delayed(const Duration(milliseconds: 500));

// // // //       // Fetch all lectures for the specific course
// // // //       DocumentReference courseRef =
// // // //           FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // // //       QuerySnapshot lecturesSnapshot =
// // // //           await courseRef.collection('lectures').get();
// // // //       int totalLectures = lecturesSnapshot.docs.length;

// // // //       // Map to store scores for each student
// // // //       Map<String, Map<String, double>> studentScores = {};

// // // //       // Collect attendance data
// // // //       for (var lectureDoc in lecturesSnapshot.docs) {
// // // //         var lectureRef = courseRef.collection('lectures').doc(lectureDoc.id);
// // // //         var studentsSnapshot =
// // // //             await _repository.getStudentsStream(lectureRef).first;
// // // //         for (var studentDoc in studentsSnapshot.docs) {
// // // //           var data = studentDoc.data() as Map<String, dynamic>;
// // // //           String name = data['name'] ?? 'Unknown';
// // // //           bool hasAttended = false;
// // // //           data.forEach((key, value) {
// // // //             if (value is Map<String, dynamic> &&
// // // //                 value['Check-out'] != null &&
// // // //                 value['Check-out'] != '--') {
// // // //               hasAttended = true;
// // // //             }
// // // //           });
// // // //           if (hasAttended) {
// // // //             studentScores.putIfAbsent(
// // // //                     name,
// // // //                     () => {
// // // //                           'attendance': 0.0,
// // // //                           'test': 0.0,
// // // //                           'assignment': 0.0
// // // //                         })['attendance'] =
// // // //                 (studentScores[name]?['attendance'] ?? 0.0) + 1.0;
// // // //           }
// // // //         }
// // // //       }

// // // //       // Collect tests data
// // // //       QuerySnapshot testsSnapshot = await courseRef.collection('tests').get();
// // // //       for (var testDoc in testsSnapshot.docs) {
// // // //         var data = testDoc.data() as Map<String, dynamic>;
// // // //         for (var submitDoc in (data['studentSubmits'] ?? []) as List) {
// // // //           var submitData = submitDoc as Map<String, dynamic>;
// // // //           String name = submitData['studentName'] ?? 'Unknown';
// // // //           double testScore = (submitData['totalScore'] ?? 0.0).toDouble();
// // // //           studentScores.putIfAbsent(
// // // //               name,
// // // //               () => {
// // // //                     'attendance': 0.0,
// // // //                     'test': 0.0,
// // // //                     'assignment': 0.0
// // // //                   })['test'] = testScore;
// // // //         }
// // // //       }

// // // //       // Collect assignments data
// // // //       QuerySnapshot assignmentsSnapshot =
// // // //           await courseRef.collection('assignments').get();
// // // //       for (var assignmentDoc in assignmentsSnapshot.docs) {
// // // //         var data = assignmentDoc.data() as Map<String, dynamic>;
// // // //         for (var submitDoc in (data['studentSubmits'] ?? []) as List) {
// // // //           var submitData = submitDoc as Map<String, dynamic>;
// // // //           String name = submitData['studentName'] ?? 'Unknown';
// // // //           double assignmentScore = (submitData['totalScore'] ?? 0.0).toDouble();
// // // //           studentScores.putIfAbsent(
// // // //               name,
// // // //               () => {
// // // //                     'attendance': 0.0,
// // // //                     'test': 0.0,
// // // //                     'assignment': 0.0
// // // //                   })['assignment'] = assignmentScore;
// // // //         }
// // // //       }

// // // //       // Calculate top 5 students based on average performance
// // // //       _topStudents = studentScores.entries
// // // //           .map((entry) {
// // // //             double attendanceScore =
// // // //                 (entry.value['attendance'] ?? 0.0) / totalLectures * 100.0;
// // // //             double testScore = entry.value['test'] ?? 0.0;
// // // //             double assignmentScore = entry.value['assignment'] ?? 0.0;
// // // //             int count = [attendanceScore, testScore, assignmentScore]
// // // //                 .where((score) => score > 0)
// // // //                 .length;
// // // //             double performanceScore = count > 0
// // // //                 ? (attendanceScore + testScore + assignmentScore) / count
// // // //                 : 0.0;
// // // //             return StudentScoreAdmin(entry.key, performanceScore);
// // // //           })
// // // //           .where((student) => student.score > 0)
// // // //           .take(5)
// // // //           .toList();

// // // //       // Calculate overall performance percentage for all students
// // // //       double totalAttendance = studentScores.values
// // // //           .map((s) => s['attendance'] ?? 0.0)
// // // //           .reduce((a, b) => a + b);
// // // //       double totalTests = studentScores.values
// // // //           .map((s) => s['test'] ?? 0.0)
// // // //           .reduce((a, b) => a + b);
// // // //       double totalAssignments = studentScores.values
// // // //           .map((s) => s['assignment'] ?? 0.0)
// // // //           .reduce((a, b) => a + b);
// // // //       int totalStudents = studentScores.length;
// // // //       double overallPerformance = totalStudents > 0
// // // //           ? (totalAttendance + totalTests + totalAssignments) /
// // // //               (totalStudents * 3.0) *
// // // //               100.0
// // // //           : 0.0;

// // // //       _adminPerformanceMetrics = [
// // // //         PerformanceMetric(
// // // //           label: 'Student\nPerformance',
// // // //           percentage: overallPerformance.round().toDouble(),
// // // //           color: Colors.blue.shade700,
// // // //         ),
// // // //         PerformanceMetric(
// // // //           label: 'Student\nAttendance',
// // // //           percentage: totalStudents > 0
// // // //               ? (totalAttendance / (totalLectures * totalStudents) * 100.0)
// // // //                   .round()
// // // //                   .toDouble()
// // // //               : 0.0,
// // // //           color: Colors.blue.shade500,
// // // //         ),
// // // //       ];

// // // //       _isAdminLoading = false;
// // // //       _adminError = null;
// // // //     } catch (e) {
// // // //       _isAdminLoading = false;
// // // //       _adminError = e.toString();
// // // //     }
// // // //     notifyListeners();
// // // //   }

// // // //   Future<void> _loadStudentAnalysisData() async {
// // // //     _isStudentLoading = true;
// // // //     notifyListeners();

// // // //     try {
// // // //       await Future.delayed(const Duration(milliseconds: 500));

// // // //       DocumentReference courseRef =
// // // //           FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // // //       QuerySnapshot lecturesSnapshot =
// // // //           await courseRef.collection('lectures').get();
// // // //       int totalLectures = lecturesSnapshot.docs.length;

// // // //       // Map to store student scores
// // // //       Map<String, Map<String, double>> studentScores = {};

// // // //       // Collect attendance data
// // // //       for (var lectureDoc in lecturesSnapshot.docs) {
// // // //         var lectureRef = courseRef.collection('lectures').doc(lectureDoc.id);
// // // //         var studentsSnapshot =
// // // //             await _repository.getStudentsStream(lectureRef).first;
// // // //         for (var studentDoc in studentsSnapshot.docs) {
// // // //           var data = studentDoc.data() as Map<String, dynamic>;
// // // //           String name = data['name'] ?? 'Unknown';
// // // //           bool hasAttended = false;
// // // //           data.forEach((key, value) {
// // // //             if (value is Map<String, dynamic> &&
// // // //                 value['Check-out'] != null &&
// // // //                 value['Check-out'] != '--') {
// // // //               hasAttended = true;
// // // //             }
// // // //           });
// // // //           if (hasAttended) {
// // // //             studentScores.putIfAbsent(
// // // //                     name,
// // // //                     () => {
// // // //                           'attendance': 0.0,
// // // //                           'test': 0.0,
// // // //                           'assignment': 0.0
// // // //                         })['attendance'] =
// // // //                 (studentScores[name]?['attendance'] ?? 0.0) + 1.0;
// // // //           }
// // // //         }
// // // //       }

// // // //       // Collect tests data
// // // //       QuerySnapshot testsSnapshot = await courseRef.collection('tests').get();
// // // //       for (var testDoc in testsSnapshot.docs) {
// // // //         var data = testDoc.data() as Map<String, dynamic>;
// // // //         for (var submitDoc in (data['studentSubmits'] ?? []) as List) {
// // // //           var submitData = submitDoc as Map<String, dynamic>;
// // // //           String name = submitData['studentName'] ?? 'Unknown';
// // // //           double testScore = (submitData['totalScore'] ?? 0.0).toDouble();
// // // //           studentScores.putIfAbsent(
// // // //               name,
// // // //               () => {
// // // //                     'attendance': 0.0,
// // // //                     'test': 0.0,
// // // //                     'assignment': 0.0
// // // //                   })['test'] = testScore;
// // // //         }
// // // //       }

// // // //       // Collect assignments data
// // // //       QuerySnapshot assignmentsSnapshot =
// // // //           await courseRef.collection('assignments').get();
// // // //       for (var assignmentDoc in assignmentsSnapshot.docs) {
// // // //         var data = assignmentDoc.data() as Map<String, dynamic>;
// // // //         for (var submitDoc in (data['studentSubmits'] ?? []) as List) {
// // // //           var submitData = submitDoc as Map<String, dynamic>;
// // // //           String name = submitData['studentName'] ?? 'Unknown';
// // // //           double assignmentScore = (submitData['totalScore'] ?? 0.0).toDouble();
// // // //           studentScores.putIfAbsent(
// // // //               name,
// // // //               () => {
// // // //                     'attendance': 0.0,
// // // //                     'test': 0.0,
// // // //                     'assignment': 0.0
// // // //                   })['assignment'] = assignmentScore;
// // // //         }
// // // //       }

// // // //       // Calculate student performance metrics
// // // //       _studentPerformanceMetrics = [
// // // //         PerformanceMetric(
// // // //           label: 'Attendance',
// // // //           percentage: studentScores.isNotEmpty
// // // //               ? (studentScores.values
// // // //                           .map((s) => s['attendance'] ?? 0.0)
// // // //                           .reduce((a, b) => a + b) /
// // // //                       (totalLectures * studentScores.length) *
// // // //                       100.0)
// // // //                   .round()
// // // //                   .toDouble()
// // // //               : 0.0,
// // // //           color: AppColors.primaryColor,
// // // //         ),
// // // //         PerformanceMetric(
// // // //           label: 'Assignment',
// // // //           percentage: studentScores.isNotEmpty
// // // //               ? (studentScores.values
// // // //                           .map((s) => s['assignment'] ?? 0.0)
// // // //                           .reduce((a, b) => a + b) /
// // // //                       studentScores.length)
// // // //                   .round()
// // // //                   .toDouble()
// // // //               : 0.0,
// // // //           color: AppColors.primaryColor,
// // // //         ),
// // // //         PerformanceMetric(
// // // //           label: 'All',
// // // //           percentage: studentScores.isNotEmpty
// // // //               ? (studentScores.values
// // // //                           .map((s) =>
// // // //                               (s['attendance'] ?? 0.0) +
// // // //                               (s['test'] ?? 0.0) +
// // // //                               (s['assignment'] ?? 0.0))
// // // //                           .reduce((a, b) => a + b) /
// // // //                       (studentScores.length * 3.0) *
// // // //                       100.0)
// // // //                   .round()
// // // //                   .toDouble()
// // // //               : 0.0,
// // // //           color: AppColors.primaryColor,
// // // //         ),
// // // //       ];

// // // //       // Calculate student scores
// // // //       _studentScores = studentScores.entries.map((entry) {
// // // //         double attendanceScore =
// // // //             (entry.value['attendance'] ?? 0.0) / totalLectures * 100.0;
// // // //         double testScore = entry.value['test'] ?? 0.0;
// // // //         double assignmentScore = entry.value['assignment'] ?? 0.0;
// // // //         int count = [attendanceScore, testScore, assignmentScore]
// // // //             .where((score) => score > 0)
// // // //             .length;
// // // //         double performanceScore = count > 0
// // // //             ? (attendanceScore + testScore + assignmentScore) / count
// // // //             : 0.0;
// // // //         return StudentScoreStudent(
// // // //             entry.key, performanceScore, Colors.blue.shade600);
// // // //       }).toList();

// // // //       _isStudentLoading = false;
// // // //       _studentError = null;
// // // //     } catch (e) {
// // // //       _isStudentLoading = false;
// // // //       _studentError = e.toString();
// // // //     }
// // // //     notifyListeners();
// // // //   }

// // // //   void _listenToAttendanceChanges() {
// // // //     DocumentReference courseRef =
// // // //         FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // // //     courseRef.collection('lectures').snapshots().listen((snapshot) {
// // // //       _loadAdminAnalysisData();
// // // //       _loadStudentAnalysisData();
// // // //     });
// // // //   }

// // // //   void _listenToTestsAndAssignmentsChanges() {
// // // //     DocumentReference courseRef =
// // // //         FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // // //     courseRef.collection('tests').snapshots().listen((snapshot) {
// // // //       _loadAdminAnalysisData();
// // // //       _loadStudentAnalysisData();
// // // //     });
// // // //     courseRef.collection('assignments').snapshots().listen((snapshot) {
// // // //       _loadAdminAnalysisData();
// // // //       _loadStudentAnalysisData();
// // // //     });
// // // //   }
// // // // }

// // // import 'package:attendance_app/core/utils/app_colors.dart';
// // // import 'package:attendance_app/features/analysis/models/performance_metric.dart';
// // // import 'package:attendance_app/features/analysis/models/student_score_admin.dart';
// // // import 'package:attendance_app/features/analysis/models/student_score_student.dart';
// // // import 'package:attendance_app/features/attendance/data/repository/lecture_attendance_repository.dart';
// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:flutter/material.dart';

// // // class AnalysisManager extends ChangeNotifier {
// // //   final AttendanceRepository _repository = AttendanceRepository();
// // //   final String courseId;

// // //   // Admin data
// // //   List<StudentScoreAdmin> _topStudents = [];
// // //   List<PerformanceMetric> _adminPerformanceMetrics = [];
// // //   bool _isAdminLoading = true;
// // //   String? _adminError;

// // //   // Student data
// // //   List<StudentScoreStudent> _studentScores = [];
// // //   List<PerformanceMetric> _studentPerformanceMetrics = [];
// // //   bool _isStudentLoading = true;
// // //   String? _studentError;

// // //   // Getters
// // //   List<StudentScoreAdmin> get topStudents => _topStudents;
// // //   List<PerformanceMetric> get adminPerformanceMetrics =>
// // //       _adminPerformanceMetrics;
// // //   bool get isAdminLoading => _isAdminLoading;
// // //   String? get adminError => _adminError;

// // //   List<StudentScoreStudent> get studentScores => _studentScores;
// // //   List<PerformanceMetric> get studentPerformanceMetrics =>
// // //       _studentPerformanceMetrics;
// // //   bool get isStudentLoading => _isStudentLoading;
// // //   String? get studentError => _studentError;

// // //   AnalysisManager(this.courseId) {
// // //     _loadAdminAnalysisData();
// // //     _loadStudentAnalysisData();
// // //     _listenToAttendanceChanges();
// // //     _listenToTestsAndAssignmentsChanges();
// // //   }

// // //   Future<void> _loadAdminAnalysisData() async {
// // //     _isAdminLoading = true;
// // //     notifyListeners();

// // //     try {
// // //       await Future.delayed(const Duration(milliseconds: 500));

// // //       // Fetch all lectures for the specific course
// // //       DocumentReference courseRef =
// // //           FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // //       QuerySnapshot lecturesSnapshot =
// // //           await courseRef.collection('lectures').get();
// // //       int totalLectures = lecturesSnapshot.docs.length;

// // //       // Map to store scores for each student across all lectures
// // //       Map<String, Map<String, double>> studentScores = {};

// // //       // Collect attendance data from all lectures
// // //       if (lecturesSnapshot.docs.isNotEmpty) {
// // //         for (var lectureDoc in lecturesSnapshot.docs) {
// // //           var lectureRef = courseRef.collection('lectures').doc(lectureDoc.id);
// // //           try {
// // //             var studentsSnapshot =
// // //                 await _repository.getStudentsStream(lectureRef).first;
// // //             for (var studentDoc in studentsSnapshot.docs) {
// // //               var data = studentDoc.data() as Map<String, dynamic>;
// // //               String name = data['name'] ?? 'Unknown';
// // //               bool hasAttended = false;
// // //               data.forEach((key, value) {
// // //                 if (value is Map<String, dynamic> &&
// // //                     value['Check-out'] != null &&
// // //                     value['Check-out'] != '--') {
// // //                   hasAttended = true;
// // //                 }
// // //               });
// // //               if (hasAttended) {
// // //                 studentScores.putIfAbsent(
// // //                         name,
// // //                         () => {
// // //                               'attendance': 0.0,
// // //                               'test': 0.0,
// // //                               'assignment': 0.0
// // //                             })['attendance'] =
// // //                     (studentScores[name]?['attendance'] ?? 0.0) + 1.0;
// // //               }
// // //             }
// // //           } catch (e) {
// // //             // Skip empty streams or errors for individual lectures
// // //             continue;
// // //           }
// // //         }
// // //       } else {
// // //         // No lectures found, set default values
// // //         _adminPerformanceMetrics = [
// // //           PerformanceMetric(
// // //             label: 'Student\nPerformance',
// // //             percentage: 0.0,
// // //             color: Colors.blue.shade700,
// // //           ),
// // //           PerformanceMetric(
// // //             label: 'Student\nAttendance',
// // //             percentage: 0.0,
// // //             color: Colors.blue.shade500,
// // //           ),
// // //         ];
// // //         _topStudents = [];
// // //         _isAdminLoading = false;
// // //         _adminError = null;
// // //         notifyListeners();
// // //         return;
// // //       }

// // //       // Collect tests data
// // //       QuerySnapshot testsSnapshot = await courseRef.collection('tests').get();
// // //       if (testsSnapshot.docs.isNotEmpty) {
// // //         for (var testDoc in testsSnapshot.docs) {
// // //           var data = testDoc.data() as Map<String, dynamic>;
// // //           for (var submitDoc in (data['studentSubmits'] ?? []) as List) {
// // //             var submitData = submitDoc as Map<String, dynamic>;
// // //             String name = submitData['studentName'] ?? 'Unknown';
// // //             double testScore = (submitData['totalScore'] ?? 0.0).toDouble();
// // //             studentScores.putIfAbsent(
// // //                 name,
// // //                 () => {
// // //                       'attendance': 0.0,
// // //                       'test': 0.0,
// // //                       'assignment': 0.0
// // //                     })['test'] = testScore;
// // //           }
// // //         }
// // //       }

// // //       // Collect assignments data
// // //       QuerySnapshot assignmentsSnapshot =
// // //           await courseRef.collection('assignments').get();
// // //       if (assignmentsSnapshot.docs.isNotEmpty) {
// // //         for (var assignmentDoc in assignmentsSnapshot.docs) {
// // //           var data = assignmentDoc.data() as Map<String, dynamic>;
// // //           for (var submitDoc in (data['studentSubmits'] ?? []) as List) {
// // //             var submitData = submitDoc as Map<String, dynamic>;
// // //             String name = submitData['studentName'] ?? 'Unknown';
// // //             double assignmentScore =
// // //                 (submitData['totalScore'] ?? 0.0).toDouble();
// // //             studentScores.putIfAbsent(
// // //                 name,
// // //                 () => {
// // //                       'attendance': 0.0,
// // //                       'test': 0.0,
// // //                       'assignment': 0.0
// // //                     })['assignment'] = assignmentScore;
// // //           }
// // //         }
// // //       }

// // //       // Calculate top 5 students based on average performance
// // //       _topStudents = studentScores.entries
// // //           .map((entry) {
// // //             double attendanceScore =
// // //                 (entry.value['attendance'] ?? 0.0) / totalLectures * 100.0;
// // //             double testScore = entry.value['test'] ?? 0.0;
// // //             double assignmentScore = entry.value['assignment'] ?? 0.0;
// // //             int count = [attendanceScore, testScore, assignmentScore]
// // //                 .where((score) => score > 0)
// // //                 .length;
// // //             double performanceScore = count > 0
// // //                 ? (attendanceScore + testScore + assignmentScore) / count
// // //                 : 0.0;
// // //             return StudentScoreAdmin(entry.key, performanceScore);
// // //           })
// // //           .where((student) => student.score > 0)
// // //           .take(5)
// // //           .toList();

// // //       // Calculate overall performance percentage for all students
// // //       double totalAttendance = studentScores.values
// // //           .map((s) => s['attendance'] ?? 0.0)
// // //           .reduce((a, b) => a + b);
// // //       double totalTests = studentScores.values
// // //           .map((s) => s['test'] ?? 0.0)
// // //           .reduce((a, b) => a + b);
// // //       double totalAssignments = studentScores.values
// // //           .map((s) => s['assignment'] ?? 0.0)
// // //           .reduce((a, b) => a + b);
// // //       int totalStudents = studentScores.length;
// // //       double overallPerformance = totalStudents > 0
// // //           ? (totalAttendance + totalTests + totalAssignments) /
// // //               (totalStudents * 3.0) *
// // //               100.0
// // //           : 0.0;

// // //       _adminPerformanceMetrics = [
// // //         PerformanceMetric(
// // //           label: 'Student\nPerformance',
// // //           percentage: overallPerformance.round().toDouble(),
// // //           color: Colors.blue.shade700,
// // //         ),
// // //         PerformanceMetric(
// // //           label: 'Student\nAttendance',
// // //           percentage: totalLectures > 0 && totalStudents > 0
// // //               ? (totalAttendance / (totalLectures * totalStudents) * 100.0)
// // //                   .round()
// // //                   .toDouble()
// // //               : 0.0,
// // //           color: Colors.blue.shade500,
// // //         ),
// // //       ];

// // //       _isAdminLoading = false;
// // //       _adminError = null;
// // //     } catch (e) {
// // //       _isAdminLoading = false;
// // //       _adminError = e.toString();
// // //     }
// // //     notifyListeners();
// // //   }

// // //   Future<void> _loadStudentAnalysisData() async {
// // //     _isStudentLoading = true;
// // //     notifyListeners();

// // //     try {
// // //       await Future.delayed(const Duration(milliseconds: 500));

// // //       DocumentReference courseRef =
// // //           FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // //       QuerySnapshot lecturesSnapshot =
// // //           await courseRef.collection('lectures').get();
// // //       int totalLectures = lecturesSnapshot.docs.length;

// // //       // Map to store student scores across all lectures
// // //       Map<String, Map<String, double>> studentScores = {};

// // //       // Collect attendance data from all lectures
// // //       if (lecturesSnapshot.docs.isNotEmpty) {
// // //         for (var lectureDoc in lecturesSnapshot.docs) {
// // //           var lectureRef = courseRef.collection('lectures').doc(lectureDoc.id);
// // //           try {
// // //             var studentsSnapshot =
// // //                 await _repository.getStudentsStream(lectureRef).first;
// // //             for (var studentDoc in studentsSnapshot.docs) {
// // //               var data = studentDoc.data() as Map<String, dynamic>;
// // //               String name = data['name'] ?? 'Unknown';
// // //               bool hasAttended = false;
// // //               data.forEach((key, value) {
// // //                 if (value is Map<String, dynamic> &&
// // //                     value['Check-out'] != null &&
// // //                     value['Check-out'] != '--') {
// // //                   hasAttended = true;
// // //                 }
// // //               });
// // //               if (hasAttended) {
// // //                 studentScores.putIfAbsent(
// // //                         name,
// // //                         () => {
// // //                               'attendance': 0.0,
// // //                               'test': 0.0,
// // //                               'assignment': 0.0
// // //                             })['attendance'] =
// // //                     (studentScores[name]?['attendance'] ?? 0.0) + 1.0;
// // //               }
// // //             }
// // //           } catch (e) {
// // //             // Skip empty streams or errors for individual lectures
// // //             continue;
// // //           }
// // //         }
// // //       } else {
// // //         // No lectures found, set default values
// // //         _studentPerformanceMetrics = [
// // //           PerformanceMetric(
// // //               label: 'Attendance',
// // //               percentage: 0.0,
// // //               color: AppColors.primaryColor),
// // //           PerformanceMetric(
// // //               label: 'Assignment',
// // //               percentage: 0.0,
// // //               color: AppColors.primaryColor),
// // //           PerformanceMetric(
// // //               label: 'All', percentage: 0.0, color: AppColors.primaryColor),
// // //         ];
// // //         _studentScores = [];
// // //         _isStudentLoading = false;
// // //         _studentError = null;
// // //         notifyListeners();
// // //         return;
// // //       }

// // //       // Collect tests data
// // //       QuerySnapshot testsSnapshot = await courseRef.collection('tests').get();
// // //       if (testsSnapshot.docs.isNotEmpty) {
// // //         for (var testDoc in testsSnapshot.docs) {
// // //           var data = testDoc.data() as Map<String, dynamic>;
// // //           for (var submitDoc in (data['studentSubmits'] ?? []) as List) {
// // //             var submitData = submitDoc as Map<String, dynamic>;
// // //             String name = submitData['studentName'] ?? 'Unknown';
// // //             double testScore = (submitData['totalScore'] ?? 0.0).toDouble();
// // //             studentScores.putIfAbsent(
// // //                 name,
// // //                 () => {
// // //                       'attendance': 0.0,
// // //                       'test': 0.0,
// // //                       'assignment': 0.0
// // //                     })['test'] = testScore;
// // //           }
// // //         }
// // //       }

// // //       // Collect assignments data
// // //       QuerySnapshot assignmentsSnapshot =
// // //           await courseRef.collection('assignments').get();
// // //       if (assignmentsSnapshot.docs.isNotEmpty) {
// // //         for (var assignmentDoc in assignmentsSnapshot.docs) {
// // //           var data = assignmentDoc.data() as Map<String, dynamic>;
// // //           for (var submitDoc in (data['studentSubmits'] ?? []) as List) {
// // //             var submitData = submitDoc as Map<String, dynamic>;
// // //             String name = submitData['studentName'] ?? 'Unknown';
// // //             double assignmentScore =
// // //                 (submitData['totalScore'] ?? 0.0).toDouble();
// // //             studentScores.putIfAbsent(
// // //                 name,
// // //                 () => {
// // //                       'attendance': 0.0,
// // //                       'test': 0.0,
// // //                       'assignment': 0.0
// // //                     })['assignment'] = assignmentScore;
// // //           }
// // //         }
// // //       }

// // //       // Calculate student performance metrics
// // //       _studentPerformanceMetrics = [
// // //         PerformanceMetric(
// // //           label: 'Attendance',
// // //           percentage: studentScores.isNotEmpty && totalLectures > 0
// // //               ? (studentScores.values
// // //                           .map((s) => s['attendance'] ?? 0.0)
// // //                           .reduce((a, b) => a + b) /
// // //                       (totalLectures * studentScores.length) *
// // //                       100.0)
// // //                   .round()
// // //                   .toDouble()
// // //               : 0.0,
// // //           color: AppColors.primaryColor,
// // //         ),
// // //         PerformanceMetric(
// // //           label: 'Assignment',
// // //           percentage: studentScores.isNotEmpty
// // //               ? (studentScores.values
// // //                           .map((s) => s['assignment'] ?? 0.0)
// // //                           .reduce((a, b) => a + b) /
// // //                       studentScores.length)
// // //                   .round()
// // //                   .toDouble()
// // //               : 0.0,
// // //           color: AppColors.primaryColor,
// // //         ),
// // //         PerformanceMetric(
// // //           label: 'All',
// // //           percentage: studentScores.isNotEmpty && totalLectures > 0
// // //               ? (studentScores.values
// // //                           .map((s) =>
// // //                               (s['attendance'] ?? 0.0) +
// // //                               (s['test'] ?? 0.0) +
// // //                               (s['assignment'] ?? 0.0))
// // //                           .reduce((a, b) => a + b) /
// // //                       (studentScores.length * 3.0) *
// // //                       100.0)
// // //                   .round()
// // //                   .toDouble()
// // //               : 0.0,
// // //           color: AppColors.primaryColor,
// // //         ),
// // //       ];

// // //       // Calculate student scores
// // //       _studentScores = studentScores.entries.map((entry) {
// // //         double attendanceScore =
// // //             (entry.value['attendance'] ?? 0.0) / totalLectures * 100.0;
// // //         double testScore = entry.value['test'] ?? 0.0;
// // //         double assignmentScore = entry.value['assignment'] ?? 0.0;
// // //         int count = [attendanceScore, testScore, assignmentScore]
// // //             .where((score) => score > 0)
// // //             .length;
// // //         double performanceScore = count > 0
// // //             ? (attendanceScore + testScore + assignmentScore) / count
// // //             : 0.0;
// // //         return StudentScoreStudent(
// // //             entry.key, performanceScore, Colors.blue.shade600);
// // //       }).toList();

// // //       _isStudentLoading = false;
// // //       _studentError = null;
// // //     } catch (e) {
// // //       _isStudentLoading = false;
// // //       _studentError = e.toString();
// // //     }
// // //     notifyListeners();
// // //   }

// // //   void _listenToAttendanceChanges() {
// // //     DocumentReference courseRef =
// // //         FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // //     courseRef.collection('lectures').snapshots().listen((snapshot) {
// // //       _loadAdminAnalysisData();
// // //       _loadStudentAnalysisData();
// // //     });
// // //   }

// // //   void _listenToTestsAndAssignmentsChanges() {
// // //     DocumentReference courseRef =
// // //         FirebaseFirestore.instance.collection('Courses').doc(courseId);
// // //     courseRef.collection('tests').snapshots().listen((snapshot) {
// // //       _loadAdminAnalysisData();
// // //       _loadStudentAnalysisData();
// // //     });
// // //     courseRef.collection('assignments').snapshots().listen((snapshot) {
// // //       _loadAdminAnalysisData();
// // //       _loadStudentAnalysisData();
// // //     });
// // //   }
// // // }

// // import 'package:attendance_app/core/utils/app_colors.dart';
// // import 'package:attendance_app/features/analysis/models/performance_metric.dart';
// // import 'package:attendance_app/features/analysis/models/student_score_admin.dart';
// // import 'package:attendance_app/features/analysis/models/student_score_student.dart';
// // import 'package:attendance_app/features/attendance/data/repository/lecture_attendance_repository.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';

// // class AnalysisManager extends ChangeNotifier {
// //   final AttendanceRepository _repository = AttendanceRepository();
// //   final String courseId;

// //   // Admin data
// //   List<StudentScoreAdmin> _topStudents = [];
// //   List<PerformanceMetric> _adminPerformanceMetrics = [];
// //   bool _isAdminLoading = true;
// //   String? _adminError;

// //   // Student data
// //   List<StudentScoreStudent> _studentScores = [];
// //   List<PerformanceMetric> _studentPerformanceMetrics = [];
// //   bool _isStudentLoading = true;
// //   String? _studentError;

// //   // Getters
// //   List<StudentScoreAdmin> get topStudents => _topStudents;
// //   List<PerformanceMetric> get adminPerformanceMetrics =>
// //       _adminPerformanceMetrics;
// //   bool get isAdminLoading => _isAdminLoading;
// //   String? get adminError => _adminError;

// //   List<StudentScoreStudent> get studentScores => _studentScores;
// //   List<PerformanceMetric> get studentPerformanceMetrics =>
// //       _studentPerformanceMetrics;
// //   bool get isStudentLoading => _isStudentLoading;
// //   String? get studentError => _studentError;

// //   AnalysisManager(this.courseId) {
// //     _loadAdminAnalysisData();
// //     _loadStudentAnalysisData();
// //     _listenToAttendanceChanges();
// //     _listenToTestsAndAssignmentsChanges();
// //   }

// //   Future<void> _loadAdminAnalysisData() async {
// //     _isAdminLoading = true;
// //     notifyListeners();

// //     try {
// //       await Future.delayed(const Duration(milliseconds: 500));

// //       // Fetch all lectures for the specific course
// //       DocumentReference courseRef =
// //           FirebaseFirestore.instance.collection('Courses').doc(courseId);
// //       QuerySnapshot lecturesSnapshot =
// //           await courseRef.collection('lectures').get();
// //       int totalLectures = lecturesSnapshot.docs.length;

// //       // Map to store scores for each student across all lectures
// //       Map<String, Map<String, double>> studentScores = {};

// //       // Collect attendance data from all lectures
// //       if (lecturesSnapshot.docs.isNotEmpty) {
// //         for (var lectureDoc in lecturesSnapshot.docs) {
// //           var lectureRef = courseRef.collection('lectures').doc(lectureDoc.id);
// //           try {
// //             var studentsSnapshot =
// //                 await _repository.getStudentsStream(lectureRef).first;
// //             if (studentsSnapshot.docs.isNotEmpty) {
// //               for (var studentDoc in studentsSnapshot.docs) {
// //                 var data = studentDoc.data() as Map<String, dynamic>;
// //                 String name = data['name'] ?? 'Unknown';
// //                 bool hasAttended = false;
// //                 data.forEach((key, value) {
// //                   if (value is Map<String, dynamic> &&
// //                       value['Check-out'] != null &&
// //                       value['Check-out'] != '--') {
// //                     hasAttended = true;
// //                   }
// //                 });
// //                 if (hasAttended) {
// //                   studentScores.putIfAbsent(
// //                           name,
// //                           () => {
// //                                 'attendance': 0.0,
// //                                 'test': 0.0,
// //                                 'assignment': 0.0
// //                               })['attendance'] =
// //                       (studentScores[name]?['attendance'] ?? 0.0) + 1.0;
// //                 }
// //               }
// //             }
// //           } catch (e) {
// //             // Handle empty stream or other errors gracefully
// //             continue; // Skip to the next lecture
// //           }
// //         }
// //       } else {
// //         // No lectures found, set default values
// //         _adminPerformanceMetrics = [
// //           PerformanceMetric(
// //             label: 'Student\nPerformance',
// //             percentage: 0.0,
// //             color: Colors.blue.shade700,
// //           ),
// //           PerformanceMetric(
// //             label: 'Student\nAttendance',
// //             percentage: 0.0,
// //             color: Colors.blue.shade500,
// //           ),
// //         ];
// //         _topStudents = [];
// //         _isAdminLoading = false;
// //         _adminError = null;
// //         notifyListeners();
// //         return;
// //       }

// //       // If no attendance data is collected, use default values
// //       if (studentScores.isEmpty) {
// //         _adminPerformanceMetrics = [
// //           PerformanceMetric(
// //             label: 'Student\nPerformance',
// //             percentage: 0.0,
// //             color: Colors.blue.shade700,
// //           ),
// //           PerformanceMetric(
// //             label: 'Student\nAttendance',
// //             percentage: 0.0,
// //             color: Colors.blue.shade500,
// //           ),
// //         ];
// //         _topStudents = [];
// //       } else {
// //         // Collect tests data
// //         QuerySnapshot testsSnapshot = await courseRef.collection('tests').get();
// //         if (testsSnapshot.docs.isNotEmpty) {
// //           for (var testDoc in testsSnapshot.docs) {
// //             var data = testDoc.data() as Map<String, dynamic>;
// //             for (var submitDoc in (data['studentSubmits'] ?? []) as List) {
// //               var submitData = submitDoc as Map<String, dynamic>;
// //               String name = submitData['studentName'] ?? 'Unknown';
// //               double testScore = (submitData['totalScore'] ?? 0.0).toDouble();
// //               studentScores.putIfAbsent(
// //                   name,
// //                   () => {
// //                         'attendance': 0.0,
// //                         'test': 0.0,
// //                         'assignment': 0.0
// //                       })['test'] = testScore;
// //             }
// //           }
// //         }

// //         // Collect assignments data
// //         QuerySnapshot assignmentsSnapshot =
// //             await courseRef.collection('assignments').get();
// //         if (assignmentsSnapshot.docs.isNotEmpty) {
// //           for (var assignmentDoc in assignmentsSnapshot.docs) {
// //             var data = assignmentDoc.data() as Map<String, dynamic>;
// //             for (var submitDoc in (data['studentSubmits'] ?? []) as List) {
// //               var submitData = submitDoc as Map<String, dynamic>;
// //               String name = submitData['studentName'] ?? 'Unknown';
// //               double assignmentScore =
// //                   (submitData['totalScore'] ?? 0.0).toDouble();
// //               studentScores.putIfAbsent(
// //                   name,
// //                   () => {
// //                         'attendance': 0.0,
// //                         'test': 0.0,
// //                         'assignment': 0.0
// //                       })['assignment'] = assignmentScore;
// //             }
// //           }
// //         }

// //         // Calculate top 5 students based on average performance
// //         _topStudents = studentScores.entries
// //             .map((entry) {
// //               double attendanceScore =
// //                   (entry.value['attendance'] ?? 0.0) / totalLectures * 100.0;
// //               double testScore = entry.value['test'] ?? 0.0;
// //               double assignmentScore = entry.value['assignment'] ?? 0.0;
// //               int count = [attendanceScore, testScore, assignmentScore]
// //                   .where((score) => score > 0)
// //                   .length;
// //               double performanceScore = count > 0
// //                   ? (attendanceScore + testScore + assignmentScore) / count
// //                   : 0.0;
// //               return StudentScoreAdmin(entry.key, performanceScore);
// //             })
// //             .where((student) => student.score > 0)
// //             .take(5)
// //             .toList();

// //         // Calculate overall performance percentage for all students
// //         double totalAttendance = studentScores.values
// //             .map((s) => s['attendance'] ?? 0.0)
// //             .reduce((a, b) => a + b);
// //         double totalTests = studentScores.values
// //             .map((s) => s['test'] ?? 0.0)
// //             .reduce((a, b) => a + b);
// //         double totalAssignments = studentScores.values
// //             .map((s) => s['assignment'] ?? 0.0)
// //             .reduce((a, b) => a + b);
// //         int totalStudents = studentScores.length;
// //         double overallPerformance = totalStudents > 0
// //             ? (totalAttendance + totalTests + totalAssignments) /
// //                 (totalStudents * 3.0) *
// //                 100.0
// //             : 0.0;

// //         _adminPerformanceMetrics = [
// //           PerformanceMetric(
// //             label: 'Student\nPerformance',
// //             percentage: overallPerformance.round().toDouble(),
// //             color: Colors.blue.shade700,
// //           ),
// //           PerformanceMetric(
// //             label: 'Student\nAttendance',
// //             percentage: totalLectures > 0 && totalStudents > 0
// //                 ? (totalAttendance / (totalLectures * totalStudents) * 100.0)
// //                     .round()
// //                     .toDouble()
// //                 : 0.0,
// //             color: Colors.blue.shade500,
// //           ),
// //         ];
// //       }

// //       _isAdminLoading = false;
// //       _adminError = null;
// //     } catch (e) {
// //       _isAdminLoading = false;
// //       _adminError = 'Error loading data: $e';
// //     }
// //     notifyListeners();
// //   }

// //   Future<void> _loadStudentAnalysisData() async {
// //     _isStudentLoading = true;
// //     notifyListeners();

// //     try {
// //       await Future.delayed(const Duration(milliseconds: 500));

// //       DocumentReference courseRef =
// //           FirebaseFirestore.instance.collection('Courses').doc(courseId);
// //       QuerySnapshot lecturesSnapshot =
// //           await courseRef.collection('lectures').get();
// //       int totalLectures = lecturesSnapshot.docs.length;

// //       // Map to store student scores across all lectures
// //       Map<String, Map<String, double>> studentScores = {};

// //       // Collect attendance data from all lectures
// //       if (lecturesSnapshot.docs.isNotEmpty) {
// //         for (var lectureDoc in lecturesSnapshot.docs) {
// //           var lectureRef = courseRef.collection('lectures').doc(lectureDoc.id);
// //           try {
// //             var studentsSnapshot =
// //                 await _repository.getStudentsStream(lectureRef).first;
// //             if (studentsSnapshot.docs.isNotEmpty) {
// //               for (var studentDoc in studentsSnapshot.docs) {
// //                 var data = studentDoc.data() as Map<String, dynamic>;
// //                 String name = data['name'] ?? 'Unknown';
// //                 bool hasAttended = false;
// //                 data.forEach((key, value) {
// //                   if (value is Map<String, dynamic> &&
// //                       value['Check-out'] != null &&
// //                       value['Check-out'] != '--') {
// //                     hasAttended = true;
// //                   }
// //                 });
// //                 if (hasAttended) {
// //                   studentScores.putIfAbsent(
// //                           name,
// //                           () => {
// //                                 'attendance': 0.0,
// //                                 'test': 0.0,
// //                                 'assignment': 0.0
// //                               })['attendance'] =
// //                       (studentScores[name]?['attendance'] ?? 0.0) + 1.0;
// //                 }
// //               }
// //             }
// //           } catch (e) {
// //             // Handle empty stream or other errors gracefully
// //             continue; // Skip to the next lecture
// //           }
// //         }
// //       } else {
// //         // No lectures found, set default values
// //         _studentPerformanceMetrics = [
// //           PerformanceMetric(
// //               label: 'Attendance',
// //               percentage: 0.0,
// //               color: AppColors.primaryColor),
// //           PerformanceMetric(
// //               label: 'Assignment',
// //               percentage: 0.0,
// //               color: AppColors.primaryColor),
// //           PerformanceMetric(
// //               label: 'All', percentage: 0.0, color: AppColors.primaryColor),
// //         ];
// //         _studentScores = [];
// //         _isStudentLoading = false;
// //         _studentError = null;
// //         notifyListeners();
// //         return;
// //       }

// //       // If no attendance data is collected, use default values
// //       if (studentScores.isEmpty) {
// //         _studentPerformanceMetrics = [
// //           PerformanceMetric(
// //               label: 'Attendance',
// //               percentage: 0.0,
// //               color: AppColors.primaryColor),
// //           PerformanceMetric(
// //               label: 'Assignment',
// //               percentage: 0.0,
// //               color: AppColors.primaryColor),
// //           PerformanceMetric(
// //               label: 'All', percentage: 0.0, color: AppColors.primaryColor),
// //         ];
// //         _studentScores = [];
// //       } else {
// //         // Collect tests data
// //         QuerySnapshot testsSnapshot = await courseRef.collection('tests').get();
// //         if (testsSnapshot.docs.isNotEmpty) {
// //           for (var testDoc in testsSnapshot.docs) {
// //             var data = testDoc.data() as Map<String, dynamic>;
// //             for (var submitDoc in (data['studentSubmits'] ?? []) as List) {
// //               var submitData = submitDoc as Map<String, dynamic>;
// //               String name = submitData['studentName'] ?? 'Unknown';
// //               double testScore = (submitData['totalScore'] ?? 0.0).toDouble();
// //               studentScores.putIfAbsent(
// //                   name,
// //                   () => {
// //                         'attendance': 0.0,
// //                         'test': 0.0,
// //                         'assignment': 0.0
// //                       })['test'] = testScore;
// //             }
// //           }
// //         }

// //         // Collect assignments data
// //         QuerySnapshot assignmentsSnapshot =
// //             await courseRef.collection('assignments').get();
// //         if (assignmentsSnapshot.docs.isNotEmpty) {
// //           for (var assignmentDoc in assignmentsSnapshot.docs) {
// //             var data = assignmentDoc.data() as Map<String, dynamic>;
// //             for (var submitDoc in (data['studentSubmits'] ?? []) as List) {
// //               var submitData = submitDoc as Map<String, dynamic>;
// //               String name = submitData['studentName'] ?? 'Unknown';
// //               double assignmentScore =
// //                   (submitData['totalScore'] ?? 0.0).toDouble();
// //               studentScores.putIfAbsent(
// //                   name,
// //                   () => {
// //                         'attendance': 0.0,
// //                         'test': 0.0,
// //                         'assignment': 0.0
// //                       })['assignment'] = assignmentScore;
// //             }
// //           }
// //         }

// //         // Calculate student performance metrics
// //         _studentPerformanceMetrics = [
// //           PerformanceMetric(
// //             label: 'Attendance',
// //             percentage: studentScores.isNotEmpty && totalLectures > 0
// //                 ? (studentScores.values
// //                             .map((s) => s['attendance'] ?? 0.0)
// //                             .reduce((a, b) => a + b) /
// //                         (totalLectures * studentScores.length) *
// //                         100.0)
// //                     .round()
// //                     .toDouble()
// //                 : 0.0,
// //             color: AppColors.primaryColor,
// //           ),
// //           PerformanceMetric(
// //             label: 'Assignment',
// //             percentage: studentScores.isNotEmpty
// //                 ? (studentScores.values
// //                             .map((s) => s['assignment'] ?? 0.0)
// //                             .reduce((a, b) => a + b) /
// //                         studentScores.length)
// //                     .round()
// //                     .toDouble()
// //                 : 0.0,
// //             color: AppColors.primaryColor,
// //           ),
// //           PerformanceMetric(
// //             label: 'All',
// //             percentage: studentScores.isNotEmpty && totalLectures > 0
// //                 ? (studentScores.values
// //                             .map((s) =>
// //                                 (s['attendance'] ?? 0.0) +
// //                                 (s['test'] ?? 0.0) +
// //                                 (s['assignment'] ?? 0.0))
// //                             .reduce((a, b) => a + b) /
// //                         (studentScores.length * 3.0) *
// //                         100.0)
// //                     .round()
// //                     .toDouble()
// //                 : 0.0,
// //             color: AppColors.primaryColor,
// //           ),
// //         ];

// //         // Calculate student scores
// //         _studentScores = studentScores.entries.map((entry) {
// //           double attendanceScore =
// //               (entry.value['attendance'] ?? 0.0) / totalLectures * 100.0;
// //           double testScore = entry.value['test'] ?? 0.0;
// //           double assignmentScore = entry.value['assignment'] ?? 0.0;
// //           int count = [attendanceScore, testScore, assignmentScore]
// //               .where((score) => score > 0)
// //               .length;
// //           double performanceScore = count > 0
// //               ? (attendanceScore + testScore + assignmentScore) / count
// //               : 0.0;
// //           return StudentScoreStudent(
// //               entry.key, performanceScore, Colors.blue.shade600);
// //         }).toList();
// //       }

// //       _isStudentLoading = false;
// //       _studentError = null;
// //     } catch (e) {
// //       _isStudentLoading = false;
// //       _studentError = 'Error loading data: $e';
// //     }
// //     notifyListeners();
// //   }

// //   void _listenToAttendanceChanges() {
// //     DocumentReference courseRef =
// //         FirebaseFirestore.instance.collection('Courses').doc(courseId);
// //     courseRef.collection('lectures').snapshots().listen((snapshot) {
// //       _loadAdminAnalysisData();
// //       _loadStudentAnalysisData();
// //     });
// //   }

// //   void _listenToTestsAndAssignmentsChanges() {
// //     DocumentReference courseRef =
// //         FirebaseFirestore.instance.collection('Courses').doc(courseId);
// //     courseRef.collection('tests').snapshots().listen((snapshot) {
// //       _loadAdminAnalysisData();
// //       _loadStudentAnalysisData();
// //     });
// //     courseRef.collection('assignments').snapshots().listen((snapshot) {
// //       _loadAdminAnalysisData();
// //       _loadStudentAnalysisData();
// //     });
// //   }
// // }

// import 'package:attendance_app/core/utils/app_colors.dart';
// import 'package:attendance_app/features/analysis/models/performance_metric.dart';
// import 'package:attendance_app/features/analysis/models/student_score_admin.dart';
// import 'package:attendance_app/features/analysis/models/student_score_student.dart';
// import 'package:attendance_app/features/attendance/data/repository/lecture_attendance_repository.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class AnalysisManager extends ChangeNotifier {
//   final AttendanceRepository _repository = AttendanceRepository();
//   final String courseId;

//   // Admin data
//   List<StudentScoreAdmin> _topStudents = [];
//   List<PerformanceMetric> _adminPerformanceMetrics = [];
//   bool _isAdminLoading = true;
//   String? _adminError;

//   // Student data
//   List<StudentScoreStudent> _studentScores = [];
//   List<PerformanceMetric> _studentPerformanceMetrics = [];
//   bool _isStudentLoading = true;
//   String? _studentError;

//   // Getters
//   List<StudentScoreAdmin> get topStudents => _topStudents;
//   List<PerformanceMetric> get adminPerformanceMetrics =>
//       _adminPerformanceMetrics;
//   bool get isAdminLoading => _isAdminLoading;
//   String? get adminError => _adminError;

//   List<StudentScoreStudent> get studentScores => _studentScores;
//   List<PerformanceMetric> get studentPerformanceMetrics =>
//       _studentPerformanceMetrics;
//   bool get isStudentLoading => _isStudentLoading;
//   String? get studentError => _studentError;

//   AnalysisManager(this.courseId) {
//     _loadAdminAnalysisData();
//     _loadStudentAnalysisData();
//     _listenToAttendanceChanges();
//     _listenToTestsAndAssignmentsChanges();
//   }

//   Future<void> _loadAdminAnalysisData() async {
//     _isAdminLoading = true;
//     notifyListeners();

//     try {
//       await Future.delayed(const Duration(milliseconds: 500));

//       DocumentReference courseRef =
//           FirebaseFirestore.instance.collection('Courses').doc(courseId);
//       QuerySnapshot lecturesSnapshot =
//           await courseRef.collection('lectures').get();
//       int totalLectures = lecturesSnapshot.docs.length;

//       Map<String, Map<String, double>> studentScores = {};

//       if (lecturesSnapshot.docs.isNotEmpty) {
//         for (var lectureDoc in lecturesSnapshot.docs) {
//           var lectureRef = courseRef.collection('lectures').doc(lectureDoc.id);
//           try {
//             var studentsSnapshot =
//                 await _repository.getStudentsStream(lectureRef).first;
//             if (studentsSnapshot.docs.isNotEmpty) {
//               for (var studentDoc in studentsSnapshot.docs) {
//                 var data = studentDoc.data() as Map<String, dynamic>;
//                 String name = data['name'] ?? 'Unknown';
//                 bool hasAttended = false;
//                 data.forEach((key, value) {
//                   if (value is Map<String, dynamic> &&
//                       value['Check-out'] != null &&
//                       value['Check-out'] != '--') {
//                     hasAttended = true;
//                   }
//                 });
//                 if (hasAttended) {
//                   studentScores.putIfAbsent(
//                           name,
//                           () => {
//                                 'attendance': 0.0,
//                                 'test': 0.0,
//                                 'assignment': 0.0,
//                                 'assignmentCount': 0.0
//                               })['attendance'] =
//                       (studentScores[name]?['attendance'] ?? 0.0) + 1.0;
//                 }
//               }
//             }
//           } catch (e) {
//             continue;
//           }
//         }
//       } else {
//         _adminPerformanceMetrics = [
//           PerformanceMetric(
//               label: 'Student\nPerformance',
//               percentage: 0.0,
//               color: Colors.blue.shade700),
//           PerformanceMetric(
//               label: 'Student\nAttendance',
//               percentage: 0.0,
//               color: Colors.blue.shade500),
//         ];
//         _topStudents = [];
//         _isAdminLoading = false;
//         _adminError = null;
//         notifyListeners();
//         return;
//       }

//       if (studentScores.isEmpty) {
//         _adminPerformanceMetrics = [
//           PerformanceMetric(
//               label: 'Student\nPerformance',
//               percentage: 0.0,
//               color: Colors.blue.shade700),
//           PerformanceMetric(
//               label: 'Student\nAttendance',
//               percentage: 0.0,
//               color: Colors.blue.shade500),
//         ];
//         _topStudents = [];
//       } else {
//         QuerySnapshot testsSnapshot = await courseRef.collection('tests').get();
//         if (testsSnapshot.docs.isNotEmpty) {
//           for (var testDoc in testsSnapshot.docs) {
//             var data = testDoc.data() as Map<String, dynamic>;
//             for (var submitDoc in (data['studentSubmits'] ?? []) as List) {
//               var submitData = submitDoc as Map<String, dynamic>;
//               String name = submitData['studentName'] ?? 'Unknown';
//               double testScore = (submitData['totalScore'] ?? 0.0).toDouble();
//               studentScores.putIfAbsent(
//                   name,
//                   () => {
//                         'attendance': 0.0,
//                         'test': 0.0,
//                         'assignment': 0.0,
//                         'assignmentCount': 0.0
//                       })['test'] = testScore;
//             }
//           }
//         }

//         QuerySnapshot assignmentsSnapshot =
//             await courseRef.collection('assignments').get();
//         if (assignmentsSnapshot.docs.isNotEmpty) {
//           for (var assignmentDoc in assignmentsSnapshot.docs) {
//             var data = assignmentDoc.data() as Map<String, dynamic>;
//             for (var submitDoc in (data['studentSubmits'] ?? []) as List) {
//               var submitData = submitDoc as Map<String, dynamic>;
//               String name = submitData['studentName'] ?? 'Unknown';
//               double assignmentScore =
//                   (submitData['totalScore'] ?? 0.0).toDouble();
//               var scoreEntry = studentScores.putIfAbsent(
//                   name,
//                   () => {
//                         'attendance': 0.0,
//                         'test': 0.0,
//                         'assignment': 0.0,
//                         'assignmentCount': 0.0
//                       });
//               scoreEntry['assignment'] =
//                   (scoreEntry['assignment'] ?? 0.0) + assignmentScore;
//               scoreEntry['assignmentCount'] =
//                   (scoreEntry['assignmentCount'] ?? 0.0) + 1.0;
//             }
//           }
//         }

//         _topStudents = studentScores.entries
//             .map((entry) {
//               double attendanceScore =
//                   (entry.value['attendance'] ?? 0.0) / totalLectures * 100.0;
//               double testScore = entry.value['test'] ?? 0.0;
//               double assignmentScore =
//                   (entry.value['assignmentCount'] ?? 0.0) > 0
//                       ? (entry.value['assignment'] ?? 0.0) /
//                           (entry.value['assignmentCount'] ?? 1.0)
//                       : 0.0;
//               int count = [attendanceScore, testScore, assignmentScore]
//                   .where((score) => score > 0)
//                   .length;
//               double performanceScore = count > 0
//                   ? (attendanceScore + testScore + assignmentScore) / count
//                   : 0.0;
//               return StudentScoreAdmin(entry.key, performanceScore);
//             })
//             .where((student) => student.score > 0)
//             .take(5)
//             .toList();

//         double totalAttendance = studentScores.values
//             .map((s) => s['attendance'] ?? 0.0)
//             .reduce((a, b) => a + b);
//         double totalTests = studentScores.values
//             .map((s) => s['test'] ?? 0.0)
//             .reduce((a, b) => a + b);
//         double totalAssignments = studentScores.values
//             .map((s) => (s['assignmentCount'] ?? 0.0) > 0
//                 ? (s['assignment'] ?? 0.0) / (s['assignmentCount'] ?? 1.0)
//                 : 0.0)
//             .reduce((a, b) => a + b);
//         int totalStudents = studentScores.length;
//         double overallPerformance = totalStudents > 0
//             ? (totalAttendance + totalTests + totalAssignments) /
//                 (totalStudents * 3.0) *
//                 100.0
//             : 0.0;

//         _adminPerformanceMetrics = [
//           PerformanceMetric(
//             label: 'Student\nPerformance',
//             percentage: overallPerformance.round().toDouble(),
//             color: Colors.blue.shade700,
//           ),
//           PerformanceMetric(
//             label: 'Student\nAttendance',
//             percentage: totalLectures > 0 && totalStudents > 0
//                 ? (totalAttendance / (totalLectures * totalStudents) * 100.0)
//                     .round()
//                     .toDouble()
//                 : 0.0,
//             color: Colors.blue.shade500,
//           ),
//         ];
//       }

//       _isAdminLoading = false;
//       _adminError = null;
//     } catch (e) {
//       _isAdminLoading = false;
//       _adminError = 'Error loading data: $e';
//     }
//     notifyListeners();
//   }

//   Future<void> _loadStudentAnalysisData() async {
//     _isStudentLoading = true;
//     notifyListeners();

//     try {
//       await Future.delayed(const Duration(milliseconds: 500));

//       DocumentReference courseRef =
//           FirebaseFirestore.instance.collection('Courses').doc(courseId);
//       QuerySnapshot lecturesSnapshot =
//           await courseRef.collection('lectures').get();
//       int totalLectures = lecturesSnapshot.docs.length;

//       Map<String, Map<String, double>> studentScores = {};

//       if (lecturesSnapshot.docs.isNotEmpty) {
//         for (var lectureDoc in lecturesSnapshot.docs) {
//           var lectureRef = courseRef.collection('lectures').doc(lectureDoc.id);
//           try {
//             var studentsSnapshot =
//                 await _repository.getStudentsStream(lectureRef).first;
//             if (studentsSnapshot.docs.isNotEmpty) {
//               for (var studentDoc in studentsSnapshot.docs) {
//                 var data = studentDoc.data() as Map<String, dynamic>;
//                 String name = data['name'] ?? 'Unknown';
//                 bool hasAttended = false;
//                 data.forEach((key, value) {
//                   if (value is Map<String, dynamic> &&
//                       value['Check-out'] != null &&
//                       value['Check-out'] != '--') {
//                     hasAttended = true;
//                   }
//                 });
//                 if (hasAttended) {
//                   studentScores.putIfAbsent(
//                           name,
//                           () => {
//                                 'attendance': 0.0,
//                                 'test': 0.0,
//                                 'assignment': 0.0,
//                                 'assignmentCount': 0.0
//                               })['attendance'] =
//                       (studentScores[name]?['attendance'] ?? 0.0) + 1.0;
//                 }
//               }
//             }
//           } catch (e) {
//             continue;
//           }
//         }
//       } else {
//         _studentPerformanceMetrics = [
//           PerformanceMetric(
//               label: 'Attendance',
//               percentage: 0.0,
//               color: AppColors.primaryColor),
//           PerformanceMetric(
//               label: 'Assignment',
//               percentage: 0.0,
//               color: AppColors.primaryColor),
//           PerformanceMetric(
//               label: 'All', percentage: 0.0, color: AppColors.primaryColor),
//         ];
//         _studentScores = [];
//         _isStudentLoading = false;
//         _studentError = null;
//         notifyListeners();
//         return;
//       }

//       if (studentScores.isEmpty) {
//         _studentPerformanceMetrics = [
//           PerformanceMetric(
//               label: 'Attendance',
//               percentage: 0.0,
//               color: AppColors.primaryColor),
//           PerformanceMetric(
//               label: 'Assignment',
//               percentage: 0.0,
//               color: AppColors.primaryColor),
//           PerformanceMetric(
//               label: 'All', percentage: 0.0, color: AppColors.primaryColor),
//         ];
//         _studentScores = [];
//       } else {
//         QuerySnapshot testsSnapshot = await courseRef.collection('tests').get();
//         if (testsSnapshot.docs.isNotEmpty) {
//           for (var testDoc in testsSnapshot.docs) {
//             var data = testDoc.data() as Map<String, dynamic>;
//             for (var submitDoc in (data['studentSubmits'] ?? []) as List) {
//               var submitData = submitDoc as Map<String, dynamic>;
//               String name = submitData['studentName'] ?? 'Unknown';
//               double testScore = (submitData['totalScore'] ?? 0.0).toDouble();
//               studentScores.putIfAbsent(
//                   name,
//                   () => {
//                         'attendance': 0.0,
//                         'test': 0.0,
//                         'assignment': 0.0,
//                         'assignmentCount': 0.0
//                       })['test'] = testScore;
//             }
//           }
//         }

//         QuerySnapshot assignmentsSnapshot =
//             await courseRef.collection('assignments').get();
//         if (assignmentsSnapshot.docs.isNotEmpty) {
//           for (var assignmentDoc in assignmentsSnapshot.docs) {
//             var data = assignmentDoc.data() as Map<String, dynamic>;
//             for (var submitDoc in (data['studentSubmits'] ?? []) as List) {
//               var submitData = submitDoc as Map<String, dynamic>;
//               String name = submitData['studentName'] ?? 'Unknown';
//               double assignmentScore =
//                   (submitData['totalScore'] ?? 0.0).toDouble();
//               var scoreEntry = studentScores.putIfAbsent(
//                   name,
//                   () => {
//                         'attendance': 0.0,
//                         'test': 0.0,
//                         'assignment': 0.0,
//                         'assignmentCount': 0.0
//                       });
//               scoreEntry['assignment'] =
//                   (scoreEntry['assignment'] ?? 0.0) + assignmentScore;
//               scoreEntry['assignmentCount'] =
//                   (scoreEntry['assignmentCount'] ?? 0.0) + 1.0;
//             }
//           }
//         }

//         _studentPerformanceMetrics = [
//           PerformanceMetric(
//             label: 'Attendance',
//             percentage: studentScores.isNotEmpty && totalLectures > 0
//                 ? (studentScores.values
//                             .map((s) => s['attendance'] ?? 0.0)
//                             .reduce((a, b) => a + b) /
//                         (totalLectures * studentScores.length) *
//                         100.0)
//                     .round()
//                     .toDouble()
//                 : 0.0,
//             color: AppColors.primaryColor,
//           ),
//           PerformanceMetric(
//             label: 'Assignment',
//             percentage: studentScores.isNotEmpty
//                 ? (studentScores.values
//                             .map((s) => (s['assignmentCount'] ?? 0.0) > 0
//                                 ? (s['assignment'] ?? 0.0) /
//                                     (s['assignmentCount'] ?? 1.0)
//                                 : 0.0)
//                             .reduce((a, b) => a + b) /
//                         studentScores.length)
//                     .round()
//                     .toDouble()
//                 : 0.0,
//             color: AppColors.primaryColor,
//           ),
//           PerformanceMetric(
//             label: 'All',
//             percentage: studentScores.isNotEmpty && totalLectures > 0
//                 ? (studentScores.values
//                             .map((s) =>
//                                 (s['attendance'] ?? 0.0) +
//                                 (s['test'] ?? 0.0) +
//                                 ((s['assignmentCount'] ?? 0.0) > 0
//                                     ? (s['assignment'] ?? 0.0) /
//                                         (s['assignmentCount'] ?? 1.0)
//                                     : 0.0))
//                             .reduce((a, b) => a + b) /
//                         (studentScores.length * 3.0) *
//                         100.0)
//                     .round()
//                     .toDouble()
//                 : 0.0,
//             color: AppColors.primaryColor,
//           ),
//         ];

//         _studentScores = studentScores.entries.map((entry) {
//           double attendanceScore =
//               (entry.value['attendance'] ?? 0.0) / totalLectures * 100.0;
//           double testScore = entry.value['test'] ?? 0.0;
//           double assignmentScore = (entry.value['assignmentCount'] ?? 0.0) > 0
//               ? (entry.value['assignment'] ?? 0.0) /
//                   (entry.value['assignmentCount'] ?? 1.0)
//               : 0.0;
//           int count = [attendanceScore, testScore, assignmentScore]
//               .where((score) => score > 0)
//               .length;
//           double performanceScore = count > 0
//               ? (attendanceScore + testScore + assignmentScore) / count
//               : 0.0;
//           return StudentScoreStudent(
//               entry.key, performanceScore, Colors.blue.shade600);
//         }).toList();
//       }

//       _isStudentLoading = false;
//       _studentError = null;
//     } catch (e) {
//       _isStudentLoading = false;
//       _studentError = 'Error loading data: $e';
//     }
//     notifyListeners();
//   }

//   void _listenToAttendanceChanges() {
//     DocumentReference courseRef =
//         FirebaseFirestore.instance.collection('Courses').doc(courseId);
//     courseRef.collection('lectures').snapshots().listen((snapshot) {
//       _loadAdminAnalysisData();
//       _loadStudentAnalysisData();
//     });
//   }

//   void _listenToTestsAndAssignmentsChanges() {
//     DocumentReference courseRef =
//         FirebaseFirestore.instance.collection('Courses').doc(courseId);
//     courseRef.collection('tests').snapshots().listen((snapshot) {
//       _loadAdminAnalysisData();
//       _loadStudentAnalysisData();
//     });
//     courseRef.collection('assignments').snapshots().listen((snapshot) {
//       _loadAdminAnalysisData();
//       _loadStudentAnalysisData();
//     });
//   }
// }

// import 'package:attendance_app/core/utils/app_colors.dart';
// import 'package:attendance_app/features/analysis/models/performance_metric.dart';
// import 'package:attendance_app/features/analysis/models/student_score_admin.dart';
// import 'package:attendance_app/features/analysis/models/student_score_student.dart';
// import 'package:attendance_app/features/attendance/data/repository/lecture_attendance_repository.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class AnalysisManager extends ChangeNotifier {
//   final AttendanceRepository _repository = AttendanceRepository();
//   final String courseId;

//   // Admin data
//   List<StudentScoreAdmin> _topStudents = [];
//   List<PerformanceMetric> _adminPerformanceMetrics = [];
//   bool _isAdminLoading = true;
//   String? _adminError;

//   // Student data
//   List<StudentScoreStudent> _studentScores = [];
//   List<PerformanceMetric> _studentPerformanceMetrics = [];
//   bool _isStudentLoading = true;
//   String? _studentError;

//   // Getters
//   List<StudentScoreAdmin> get topStudents => _topStudents;
//   List<PerformanceMetric> get adminPerformanceMetrics =>
//       _adminPerformanceMetrics;
//   bool get isAdminLoading => _isAdminLoading;
//   String? get adminError => _adminError;

//   List<StudentScoreStudent> get studentScores => _studentScores;
//   List<PerformanceMetric> get studentPerformanceMetrics =>
//       _studentPerformanceMetrics;
//   bool get isStudentLoading => _isStudentLoading;
//   String? get studentError => _studentError;

//   AnalysisManager(this.courseId) {
//     _loadAdminAnalysisData();
//     _loadStudentAnalysisData();
//     _listenToAttendanceChanges();
//     _listenToTestsAndAssignmentsChanges();
//   }

//   Future<void> _loadAdminAnalysisData() async {
//     _isAdminLoading = true;
//     notifyListeners();

//     try {
//       await Future.delayed(const Duration(milliseconds: 500));

//       DocumentReference courseRef =
//           FirebaseFirestore.instance.collection('Courses').doc(courseId);
//       QuerySnapshot lecturesSnapshot =
//           await courseRef.collection('lectures').get();
//       int totalLectures = lecturesSnapshot.docs.length;

//       Map<String, Map<String, double>> studentScores = {};

//       if (lecturesSnapshot.docs.isNotEmpty) {
//         for (var lectureDoc in lecturesSnapshot.docs) {
//           var lectureRef = courseRef.collection('lectures').doc(lectureDoc.id);
//           try {
//             var studentsSnapshot =
//                 await _repository.getStudentsStream(lectureRef).first;
//             if (studentsSnapshot.docs.isNotEmpty) {
//               for (var studentDoc in studentsSnapshot.docs) {
//                 var data = studentDoc.data() as Map<String, dynamic>;
//                 String name = data['name'] ?? 'Unknown';
//                 bool hasAttended = false;
//                 data.forEach((key, value) {
//                   if (value is Map<String, dynamic> &&
//                       value['Check-out'] != null &&
//                       value['Check-out'] != '--') {
//                     hasAttended = true;
//                   }
//                 });
//                 if (hasAttended) {
//                   studentScores.putIfAbsent(
//                           name,
//                           () => {
//                                 'attendance': 0.0,
//                                 'test': 0.0,
//                                 'assignment': 0.0,
//                                 'assignmentCount': 0.0
//                               })['attendance'] =
//                       (studentScores[name]?['attendance'] ?? 0.0) + 1.0;
//                 }
//               }
//             }
//           } catch (e) {
//             continue;
//           }
//         }
//       } else {
//         _adminPerformanceMetrics = [
//           PerformanceMetric(
//               label: 'Student\nPerformance',
//               percentage: 0.0,
//               color: Colors.blue.shade700),
//           PerformanceMetric(
//               label: 'Student\nAttendance',
//               percentage: 0.0,
//               color: Colors.blue.shade500),
//         ];
//         _topStudents = [];
//         _isAdminLoading = false;
//         _adminError = null;
//         notifyListeners();
//         return;
//       }

//       if (studentScores.isEmpty) {
//         _adminPerformanceMetrics = [
//           PerformanceMetric(
//               label: 'Student\nPerformance',
//               percentage: 0.0,
//               color: Colors.blue.shade700),
//           PerformanceMetric(
//               label: 'Student\nAttendance',
//               percentage: 0.0,
//               color: Colors.blue.shade500),
//         ];
//         _topStudents = [];
//       } else {
//         QuerySnapshot testsSnapshot = await courseRef.collection('tests').get();
//         if (testsSnapshot.docs.isNotEmpty) {
//           for (var testDoc in testsSnapshot.docs) {
//             var data = testDoc.data() as Map<String, dynamic>;
//             for (var submitDoc in (data['studentSubmits'] ?? []) as List) {
//               var submitData = submitDoc as Map<String, dynamic>;
//               String name = submitData['studentName'] ?? 'Unknown';
//               double testScore = (submitData['totalScore'] ?? 0.0).toDouble();
//               studentScores.putIfAbsent(
//                   name,
//                   () => {
//                         'attendance': 0.0,
//                         'test': 0.0,
//                         'assignment': 0.0,
//                         'assignmentCount': 0.0
//                       })['test'] = testScore;
//             }
//           }
//         }

//         QuerySnapshot assignmentsSnapshot =
//             await courseRef.collection('assignments').get();
//         if (assignmentsSnapshot.docs.isNotEmpty) {
//           for (var assignmentDoc in assignmentsSnapshot.docs) {
//             var assignmentRef =
//                 courseRef.collection('assignments').doc(assignmentDoc.id);
//             QuerySnapshot studentStatusSnapshot =
//                 await assignmentRef.collection('studentStatus').get();
//             if (studentStatusSnapshot.docs.isNotEmpty) {
//               for (var statusDoc in studentStatusSnapshot.docs) {
//                 var statusData = statusDoc.data() as Map<String, dynamic>;
//                 String name = statusData['name'] ?? 'Unknown';
//                 String scoreStr = statusData['score'] ?? '0%';
//                 double assignmentScore =
//                     double.tryParse(scoreStr.replaceAll('%', '')) ?? 0.0;
//                 var scoreEntry = studentScores.putIfAbsent(
//                     name,
//                     () => {
//                           'attendance': 0.0,
//                           'test': 0.0,
//                           'assignment': 0.0,
//                           'assignmentCount': 0.0
//                         });
//                 scoreEntry['assignment'] =
//                     (scoreEntry['assignment'] ?? 0.0) + assignmentScore;
//                 scoreEntry['assignmentCount'] =
//                     (scoreEntry['assignmentCount'] ?? 0.0) + 1.0;
//               }
//             }
//           }
//         }

//         _topStudents = studentScores.entries
//             .map((entry) {
//               double attendanceScore =
//                   (entry.value['attendance'] ?? 0.0) / totalLectures * 100.0;
//               double testScore = (entry.value['test'] ?? 0.0) /
//                   100.0 *
//                   100.0; // Normalize to 0-100
//               double assignmentScore =
//                   (entry.value['assignmentCount'] ?? 0.0) > 0
//                       ? (entry.value['assignment'] ?? 0.0) /
//                           (entry.value['assignmentCount'] ?? 1.0)
//                       : 0.0;
//               int count = [attendanceScore, testScore, assignmentScore]
//                   .where((score) => score > 0)
//                   .length;
//               double performanceScore = count > 0
//                   ? (attendanceScore + testScore + assignmentScore) / count
//                   : 0.0;
//               return StudentScoreAdmin(entry.key, performanceScore);
//             })
//             .where((student) =>
//                 student.score > 0 &&
//                 student.name != 'Unknown') // Exclude Unknown
//             .take(5)
//             .toList();

//         double totalAttendance = studentScores.values
//             .map((s) => s['attendance'] ?? 0.0)
//             .reduce((a, b) => a + b);
//         double totalTests = studentScores.values
//             .map((s) => s['test'] ?? 0.0)
//             .reduce((a, b) => a + b);
//         double totalAssignments = studentScores.values
//             .map((s) => (s['assignmentCount'] ?? 0.0) > 0
//                 ? (s['assignment'] ?? 0.0) / (s['assignmentCount'] ?? 1.0)
//                 : 0.0)
//             .reduce((a, b) => a + b);
//         int totalStudents = studentScores.length;
//         double overallPerformance = totalStudents > 0
//             ? (totalAttendance / totalLectures +
//                     totalTests / 100.0 +
//                     totalAssignments) /
//                 3.0 *
//                 100.0
//             : 0.0;

//         _adminPerformanceMetrics = [
//           PerformanceMetric(
//             label: 'Student\nPerformance',
//             percentage: overallPerformance.clamp(
//                 0.0, 100.0), // Ensure value is between 0-100
//             color: Colors.blue.shade700,
//           ),
//           PerformanceMetric(
//             label: 'Student\nAttendance',
//             percentage: totalLectures > 0 && totalStudents > 0
//                 ? (totalAttendance / (totalLectures * totalStudents) * 100.0)
//                     .clamp(0.0, 100.0)
//                 : 0.0,
//             color: Colors.blue.shade500,
//           ),
//         ];
//       }

//       _isAdminLoading = false;
//       _adminError = null;
//     } catch (e) {
//       _isAdminLoading = false;
//       _adminError = 'Error loading data: $e';
//     }
//     notifyListeners();
//   }

//   Future<void> _loadStudentAnalysisData() async {
//     _isStudentLoading = true;
//     notifyListeners();

//     try {
//       await Future.delayed(const Duration(milliseconds: 500));

//       DocumentReference courseRef =
//           FirebaseFirestore.instance.collection('Courses').doc(courseId);
//       QuerySnapshot lecturesSnapshot =
//           await courseRef.collection('lectures').get();
//       int totalLectures = lecturesSnapshot.docs.length;

//       Map<String, Map<String, double>> studentScores = {};

//       if (lecturesSnapshot.docs.isNotEmpty) {
//         for (var lectureDoc in lecturesSnapshot.docs) {
//           var lectureRef = courseRef.collection('lectures').doc(lectureDoc.id);
//           try {
//             var studentsSnapshot =
//                 await _repository.getStudentsStream(lectureRef).first;
//             if (studentsSnapshot.docs.isNotEmpty) {
//               for (var studentDoc in studentsSnapshot.docs) {
//                 var data = studentDoc.data() as Map<String, dynamic>;
//                 String name = data['name'] ?? 'Unknown';
//                 bool hasAttended = false;
//                 data.forEach((key, value) {
//                   if (value is Map<String, dynamic> &&
//                       value['Check-out'] != null &&
//                       value['Check-out'] != '--') {
//                     hasAttended = true;
//                   }
//                 });
//                 if (hasAttended) {
//                   studentScores.putIfAbsent(
//                           name,
//                           () => {
//                                 'attendance': 0.0,
//                                 'test': 0.0,
//                                 'assignment': 0.0,
//                                 'assignmentCount': 0.0
//                               })['attendance'] =
//                       (studentScores[name]?['attendance'] ?? 0.0) + 1.0;
//                 }
//               }
//             }
//           } catch (e) {
//             continue;
//           }
//         }
//       } else {
//         _studentPerformanceMetrics = [
//           PerformanceMetric(
//               label: 'Attendance',
//               percentage: 0.0,
//               color: AppColors.primaryColor),
//           PerformanceMetric(
//               label: 'Assignment',
//               percentage: 0.0,
//               color: AppColors.primaryColor),
//           PerformanceMetric(
//               label: 'All', percentage: 0.0, color: AppColors.primaryColor),
//         ];
//         _studentScores = [];
//         _isStudentLoading = false;
//         _studentError = null;
//         notifyListeners();
//         return;
//       }

//       if (studentScores.isEmpty) {
//         _studentPerformanceMetrics = [
//           PerformanceMetric(
//               label: 'Attendance',
//               percentage: 0.0,
//               color: AppColors.primaryColor),
//           PerformanceMetric(
//               label: 'Assignment',
//               percentage: 0.0,
//               color: AppColors.primaryColor),
//           PerformanceMetric(
//               label: 'All', percentage: 0.0, color: AppColors.primaryColor),
//         ];
//         _studentScores = [];
//       } else {
//         QuerySnapshot testsSnapshot = await courseRef.collection('tests').get();
//         if (testsSnapshot.docs.isNotEmpty) {
//           for (var testDoc in testsSnapshot.docs) {
//             var data = testDoc.data() as Map<String, dynamic>;
//             for (var submitDoc in (data['studentSubmits'] ?? []) as List) {
//               var submitData = submitDoc as Map<String, dynamic>;
//               String name = submitData['studentName'] ?? 'Unknown';
//               double testScore = (submitData['totalScore'] ?? 0.0).toDouble();
//               studentScores.putIfAbsent(
//                   name,
//                   () => {
//                         'attendance': 0.0,
//                         'test': 0.0,
//                         'assignment': 0.0,
//                         'assignmentCount': 0.0
//                       })['test'] = testScore;
//             }
//           }
//         }

//         QuerySnapshot assignmentsSnapshot =
//             await courseRef.collection('assignments').get();
//         if (assignmentsSnapshot.docs.isNotEmpty) {
//           for (var assignmentDoc in assignmentsSnapshot.docs) {
//             var assignmentRef =
//                 courseRef.collection('assignments').doc(assignmentDoc.id);
//             QuerySnapshot studentStatusSnapshot =
//                 await assignmentRef.collection('studentStatus').get();
//             if (studentStatusSnapshot.docs.isNotEmpty) {
//               for (var statusDoc in studentStatusSnapshot.docs) {
//                 var statusData = statusDoc.data() as Map<String, dynamic>;
//                 String name = statusData['name'] ?? 'Unknown';
//                 String scoreStr = statusData['score'] ?? '0%';
//                 double assignmentScore =
//                     double.tryParse(scoreStr.replaceAll('%', '')) ?? 0.0;
//                 var scoreEntry = studentScores.putIfAbsent(
//                     name,
//                     () => {
//                           'attendance': 0.0,
//                           'test': 0.0,
//                           'assignment': 0.0,
//                           'assignmentCount': 0.0
//                         });
//                 scoreEntry['assignment'] =
//                     (scoreEntry['assignment'] ?? 0.0) + assignmentScore;
//                 scoreEntry['assignmentCount'] =
//                     (scoreEntry['assignmentCount'] ?? 0.0) + 1.0;
//               }
//             }
//           }
//         }

//         _studentPerformanceMetrics = [
//           PerformanceMetric(
//             label: 'Attendance',
//             percentage: studentScores.isNotEmpty && totalLectures > 0
//                 ? (studentScores.values
//                             .map((s) => s['attendance'] ?? 0.0)
//                             .reduce((a, b) => a + b) /
//                         (totalLectures * studentScores.length) *
//                         100.0)
//                     .clamp(0.0, 100.0)
//                 : 0.0,
//             color: AppColors.primaryColor,
//           ),
//           PerformanceMetric(
//             label: 'Assignment',
//             percentage: studentScores.isNotEmpty
//                 ? (studentScores.values
//                             .map((s) => (s['assignmentCount'] ?? 0.0) > 0
//                                 ? (s['assignment'] ?? 0.0) /
//                                     (s['assignmentCount'] ?? 1.0)
//                                 : 0.0)
//                             .reduce((a, b) => a + b) /
//                         studentScores.length)
//                     .clamp(0.0, 100.0)
//                 : 0.0,
//             color: AppColors.primaryColor,
//           ),
//           PerformanceMetric(
//             label: 'All',
//             percentage: studentScores.isNotEmpty && totalLectures > 0
//                 ? (studentScores.values
//                             .map((s) =>
//                                 (s['attendance'] ?? 0.0) +
//                                 (s['test'] ?? 0.0) +
//                                 ((s['assignmentCount'] ?? 0.0) > 0
//                                     ? (s['assignment'] ?? 0.0) /
//                                         (s['assignmentCount'] ?? 1.0)
//                                     : 0.0))
//                             .reduce((a, b) => a + b) /
//                         (studentScores.length * 3.0) *
//                         100.0)
//                     .clamp(0.0, 100.0)
//                 : 0.0,
//             color: AppColors.primaryColor,
//           ),
//         ];

//         _studentScores = studentScores.entries.map((entry) {
//           double attendanceScore =
//               (entry.value['attendance'] ?? 0.0) / totalLectures * 100.0;
//           double testScore = (entry.value['test'] ?? 0.0) /
//               100.0 *
//               100.0; // Normalize to 0-100
//           double assignmentScore = (entry.value['assignmentCount'] ?? 0.0) > 0
//               ? (entry.value['assignment'] ?? 0.0) /
//                   (entry.value['assignmentCount'] ?? 1.0)
//               : 0.0;
//           int count = [attendanceScore, testScore, assignmentScore]
//               .where((score) => score > 0)
//               .length;
//           double performanceScore = count > 0
//               ? (attendanceScore + testScore + assignmentScore) / count
//               : 0.0;
//           return StudentScoreStudent(entry.key,
//               performanceScore.clamp(0.0, 100.0), Colors.blue.shade600);
//         }).toList();
//       }

//       _isStudentLoading = false;
//       _studentError = null;
//     } catch (e) {
//       _isStudentLoading = false;
//       _studentError = 'Error loading data: $e';
//     }
//     notifyListeners();
//   }

//   void _listenToAttendanceChanges() {
//     DocumentReference courseRef =
//         FirebaseFirestore.instance.collection('Courses').doc(courseId);
//     courseRef.collection('lectures').snapshots().listen((snapshot) {
//       _loadAdminAnalysisData();
//       _loadStudentAnalysisData();
//     });
//   }

//   void _listenToTestsAndAssignmentsChanges() {
//     DocumentReference courseRef =
//         FirebaseFirestore.instance.collection('Courses').doc(courseId);
//     courseRef.collection('tests').snapshots().listen((snapshot) {
//       _loadAdminAnalysisData();
//       _loadStudentAnalysisData();
//     });
//     courseRef.collection('assignments').snapshots().listen((snapshot) {
//       _loadAdminAnalysisData();
//       _loadStudentAnalysisData();
//     });
//   }
// }



import 'package:attendance_app/core/utils/app_colors.dart';
import 'package:attendance_app/features/analysis/models/performance_metric.dart';
import 'package:attendance_app/features/analysis/models/student_score_admin.dart';
import 'package:attendance_app/features/analysis/models/student_score_student.dart';
import 'package:attendance_app/features/attendance/data/repository/lecture_attendance_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AnalysisManager extends ChangeNotifier {
  final AttendanceRepository _repository = AttendanceRepository();
  final String courseId;

  // Admin data
  List<StudentScoreAdmin> _topStudents = [];
  List<PerformanceMetric> _adminPerformanceMetrics = [];
  bool _isAdminLoading = true;
  String? _adminError;

  // Student data
  List<StudentScoreStudent> _studentScores = [];
  List<PerformanceMetric> _studentPerformanceMetrics = [];
  bool _isStudentLoading = true;
  String? _studentError;

  // Getters
  List<StudentScoreAdmin> get topStudents => _topStudents;
  List<PerformanceMetric> get adminPerformanceMetrics =>
      _adminPerformanceMetrics;
  bool get isAdminLoading => _isAdminLoading;
  String? get adminError => _adminError;

  List<StudentScoreStudent> get studentScores => _studentScores;
  List<PerformanceMetric> get studentPerformanceMetrics =>
      _studentPerformanceMetrics;
  bool get isStudentLoading => _isStudentLoading;
  String? get studentError => _studentError;

  AnalysisManager(this.courseId) {
    _loadAdminAnalysisData();
    _loadStudentAnalysisData();
    _listenToAttendanceChanges();
    _listenToTestsAndAssignmentsChanges();
  }

  Future<void> _loadAdminAnalysisData() async {
    _isAdminLoading = true;
    notifyListeners();

    try {
      await Future.delayed(const Duration(milliseconds: 500));

      DocumentReference courseRef =
          FirebaseFirestore.instance.collection('Courses').doc(courseId);
      QuerySnapshot lecturesSnapshot =
          await courseRef.collection('lectures').get();
      int totalLectures = lecturesSnapshot.docs.length;

      Map<String, Map<String, double>> studentScores = {};

      if (lecturesSnapshot.docs.isNotEmpty) {
        for (var lectureDoc in lecturesSnapshot.docs) {
          var lectureRef = courseRef.collection('lectures').doc(lectureDoc.id);
          try {
            var studentsSnapshot =
                await _repository.getStudentsStream(lectureRef).first;
            if (studentsSnapshot.docs.isNotEmpty) {
              for (var studentDoc in studentsSnapshot.docs) {
                var data = studentDoc.data() as Map<String, dynamic>;
                String name = data['name'] ?? 'Unknown';
                bool hasAttended = false;
                data.forEach((key, value) {
                  if (value is Map<String, dynamic> &&
                      value['Check-out'] != null &&
                      value['Check-out'] != '--') {
                    hasAttended = true;
                  }
                });
                if (hasAttended) {
                  studentScores.putIfAbsent(
                          name,
                          () => {
                                'attendance': 0.0,
                                'test': 0.0,
                                'assignment': 0.0,
                                'assignmentCount': 0.0
                              })['attendance'] =
                      (studentScores[name]?['attendance'] ?? 0.0) + 1.0;
                }
              }
            }
          } catch (e) {
            continue;
          }
        }
      } else {
        _adminPerformanceMetrics = [
          PerformanceMetric(
              label: 'Student\nPerformance',
              percentage: 0.0,
              color: Colors.blue.shade700),
          PerformanceMetric(
              label: 'Student\nAttendance',
              percentage: 0.0,
              color: Colors.blue.shade500),
        ];
        _topStudents = [];
        _isAdminLoading = false;
        _adminError = null;
        notifyListeners();
        return;
      }

      if (studentScores.isEmpty) {
        _adminPerformanceMetrics = [
          PerformanceMetric(
              label: 'Student\nPerformance',
              percentage: 0.0,
              color: Colors.blue.shade700),
          PerformanceMetric(
              label: 'Student\nAttendance',
              percentage: 0.0,
              color: Colors.blue.shade500),
        ];
        _topStudents = [];
      } else {
        QuerySnapshot testsSnapshot = await courseRef.collection('tests').get();
        if (testsSnapshot.docs.isNotEmpty) {
          for (var testDoc in testsSnapshot.docs) {
            var data = testDoc.data() as Map<String, dynamic>;
            for (var submitDoc in (data['studentSubmits'] ?? []) as List) {
              var submitData = submitDoc as Map<String, dynamic>;
              String name = submitData['studentName'] ?? 'Unknown';
              double testScore = (submitData['totalScore'] ?? 0.0).toDouble();
              studentScores.putIfAbsent(
                  name,
                  () => {
                        'attendance': 0.0,
                        'test': 0.0,
                        'assignment': 0.0,
                        'assignmentCount': 0.0
                      })['test'] = testScore;
            }
          }
        }

        QuerySnapshot assignmentsSnapshot =
            await courseRef.collection('assignments').get();
        if (assignmentsSnapshot.docs.isNotEmpty) {
          for (var assignmentDoc in assignmentsSnapshot.docs) {
            var assignmentRef =
                courseRef.collection('assignments').doc(assignmentDoc.id);
            QuerySnapshot studentStatusSnapshot =
                await assignmentRef.collection('studentStatus').get();
            if (studentStatusSnapshot.docs.isNotEmpty) {
              for (var statusDoc in studentStatusSnapshot.docs) {
                var statusData = statusDoc.data() as Map<String, dynamic>;
                String name = statusData['name'] ?? 'Unknown';
                String scoreStr = statusData['score'] ?? '0%';
                double assignmentScore =
                    double.tryParse(scoreStr.replaceAll('%', '')) ?? 0.0;
                var scoreEntry = studentScores.putIfAbsent(
                    name,
                    () => {
                          'attendance': 0.0,
                          'test': 0.0,
                          'assignment': 0.0,
                          'assignmentCount': 0.0
                        });
                scoreEntry['assignment'] =
                    (scoreEntry['assignment'] ?? 0.0) + assignmentScore;
                scoreEntry['assignmentCount'] =
                    (scoreEntry['assignmentCount'] ?? 0.0) + 1.0;
              }
            }
          }
        }

        _topStudents = studentScores.entries
            .map((entry) {
              double attendanceScore =
                  (entry.value['attendance'] ?? 0.0) / totalLectures * 100.0;
              double testScore = (entry.value['test'] ?? 0.0) /
                  100.0 *
                  100.0; // Normalize to 0-100
              double assignmentScore =
                  (entry.value['assignmentCount'] ?? 0.0) > 0
                      ? (entry.value['assignment'] ?? 0.0) /
                          (entry.value['assignmentCount'] ?? 1.0)
                      : 0.0;
              int count = [attendanceScore, testScore, assignmentScore]
                  .where((score) => score > 0)
                  .length;
              double performanceScore = count > 0
                  ? (attendanceScore + testScore + assignmentScore) / count
                  : 0.0;
              return StudentScoreAdmin(entry.key, performanceScore);
            })
            .where((student) =>
                student.score > 0 &&
                student.name != 'Unknown') // Exclude Unknown
            .take(5)
            .toList();

        // Calculate average assignment and test scores
        double totalAssignmentScores = studentScores.values
            .map((s) => (s['assignmentCount'] ?? 0.0) > 0
                ? (s['assignment'] ?? 0.0) / (s['assignmentCount'] ?? 1.0)
                : 0.0)
            .reduce((a, b) => a + b);
        double averageAssignmentPercentage = studentScores.isNotEmpty
            ? totalAssignmentScores / studentScores.length
            : 0.0;

        double totalTestScores = studentScores.values
            .map((s) => s['test'] ?? 0.0)
            .reduce((a, b) => a + b);
        double averageTestPercentage =
            studentScores.isNotEmpty ? totalTestScores / studentScores.length : 0.0;

        // Print to console
        print('Average Assignment Percentage: $averageAssignmentPercentage%');
        print('Average Test Percentage: $averageTestPercentage%');

        double totalAttendance = studentScores.values
            .map((s) => s['attendance'] ?? 0.0)
            .reduce((a, b) => a + b);
        double totalTests = studentScores.values
            .map((s) => s['test'] ?? 0.0)
            .reduce((a, b) => a + b);
        double totalAssignments = studentScores.values
            .map((s) => (s['assignmentCount'] ?? 0.0) > 0
                ? (s['assignment'] ?? 0.0) / (s['assignmentCount'] ?? 1.0)
                : 0.0)
            .reduce((a, b) => a + b);
        int totalStudents = studentScores.length;
        double overallPerformance = totalStudents > 0
            ? (totalAttendance / totalLectures +
                    totalTests / 100.0 +
                    totalAssignments) /
                3.0 *
                100.0
            : 0.0;

        _adminPerformanceMetrics = [
          PerformanceMetric(
            label: 'Student\nPerformance',
            percentage: overallPerformance.clamp(
                0.0, 100.0), // Ensure value is between 0-100
            color: Colors.blue.shade700,
          ),
          PerformanceMetric(
            label: 'Student\nAttendance',
            percentage: totalLectures > 0 && totalStudents > 0
                ? (totalAttendance / (totalLectures * totalStudents) * 100.0)
                    .clamp(0.0, 100.0)
                : 0.0,
            color: Colors.blue.shade500,
          ),
        ];
      }

      _isAdminLoading = false;
      _adminError = null;
    } catch (e) {
      _isAdminLoading = false;
      _adminError = 'Error loading data: $e';
    }
    notifyListeners();
  }

  Future<void> _loadStudentAnalysisData() async {
    _isStudentLoading = true;
    notifyListeners();

    try {
      await Future.delayed(const Duration(milliseconds: 500));

      DocumentReference courseRef =
          FirebaseFirestore.instance.collection('Courses').doc(courseId);
      QuerySnapshot lecturesSnapshot =
          await courseRef.collection('lectures').get();
      int totalLectures = lecturesSnapshot.docs.length;

      Map<String, Map<String, double>> studentScores = {};

      if (lecturesSnapshot.docs.isNotEmpty) {
        for (var lectureDoc in lecturesSnapshot.docs) {
          var lectureRef = courseRef.collection('lectures').doc(lectureDoc.id);
          try {
            var studentsSnapshot =
                await _repository.getStudentsStream(lectureRef).first;
            if (studentsSnapshot.docs.isNotEmpty) {
              for (var studentDoc in studentsSnapshot.docs) {
                var data = studentDoc.data() as Map<String, dynamic>;
                String name = data['name'] ?? 'Unknown';
                bool hasAttended = false;
                data.forEach((key, value) {
                  if (value is Map<String, dynamic> &&
                      value['Check-out'] != null &&
                      value['Check-out'] != '--') {
                    hasAttended = true;
                  }
                });
                if (hasAttended) {
                  studentScores.putIfAbsent(
                          name,
                          () => {
                                'attendance': 0.0,
                                'test': 0.0,
                                'assignment': 0.0,
                                'assignmentCount': 0.0
                              })['attendance'] =
                      (studentScores[name]?['attendance'] ?? 0.0) + 1.0;
                }
              }
            }
          } catch (e) {
            continue;
          }
        }
      } else {
        _studentPerformanceMetrics = [
          PerformanceMetric(
              label: 'Attendance',
              percentage: 0.0,
              color: AppColors.primaryColor),
          PerformanceMetric(
              label: 'Assignment',
              percentage: 0.0,
              color: AppColors.primaryColor),
          PerformanceMetric(
              label: 'All', percentage: 0.0, color: AppColors.primaryColor),
        ];
        _studentScores = [];
        _isStudentLoading = false;
        _studentError = null;
        notifyListeners();
        return;
      }

      if (studentScores.isEmpty) {
        _studentPerformanceMetrics = [
          PerformanceMetric(
              label: 'Attendance',
              percentage: 0.0,
              color: AppColors.primaryColor),
          PerformanceMetric(
              label: 'Assignment',
              percentage: 0.0,
              color: AppColors.primaryColor),
          PerformanceMetric(
              label: 'All', percentage: 0.0, color: AppColors.primaryColor),
        ];
        _studentScores = [];
      } else {
        QuerySnapshot testsSnapshot = await courseRef.collection('tests').get();
        if (testsSnapshot.docs.isNotEmpty) {
          for (var testDoc in testsSnapshot.docs) {
            var data = testDoc.data() as Map<String, dynamic>;
            for (var submitDoc in (data['studentSubmits'] ?? []) as List) {
              var submitData = submitDoc as Map<String, dynamic>;
              String name = submitData['studentName'] ?? 'Unknown';
              double testScore = (submitData['totalScore'] ?? 0.0).toDouble();
              studentScores.putIfAbsent(
                  name,
                  () => {
                        'attendance': 0.0,
                        'test': 0.0,
                        'assignment': 0.0,
                        'assignmentCount': 0.0
                      })['test'] = testScore;
            }
          }
        }

        QuerySnapshot assignmentsSnapshot =
            await courseRef.collection('assignments').get();
        if (assignmentsSnapshot.docs.isNotEmpty) {
          for (var assignmentDoc in assignmentsSnapshot.docs) {
            var assignmentRef =
                courseRef.collection('assignments').doc(assignmentDoc.id);
            QuerySnapshot studentStatusSnapshot =
                await assignmentRef.collection('studentStatus').get();
            if (studentStatusSnapshot.docs.isNotEmpty) {
              for (var statusDoc in studentStatusSnapshot.docs) {
                var statusData = statusDoc.data() as Map<String, dynamic>;
                String name = statusData['name'] ?? 'Unknown';
                String scoreStr = statusData['score'] ?? '0%';
                double assignmentScore =
                    double.tryParse(scoreStr.replaceAll('%', '')) ?? 0.0;
                var scoreEntry = studentScores.putIfAbsent(
                    name,
                    () => {
                          'attendance': 0.0,
                          'test': 0.0,
                          'assignment': 0.0,
                          'assignmentCount': 0.0
                        });
                scoreEntry['assignment'] =
                    (scoreEntry['assignment'] ?? 0.0) + assignmentScore;
                scoreEntry['assignmentCount'] =
                    (scoreEntry['assignmentCount'] ?? 0.0) + 1.0;
              }
            }
          }
        }

        _studentPerformanceMetrics = [
          PerformanceMetric(
            label: 'Attendance',
            percentage: studentScores.isNotEmpty && totalLectures > 0
                ? (studentScores.values
                            .map((s) => s['attendance'] ?? 0.0)
                            .reduce((a, b) => a + b) /
                        (totalLectures * studentScores.length) *
                        100.0)
                    .clamp(0.0, 100.0)
                : 0.0,
            color: AppColors.primaryColor,
          ),
          PerformanceMetric(
            label: 'Assignment',
            percentage: studentScores.isNotEmpty
                ? (studentScores.values
                            .map((s) => (s['assignmentCount'] ?? 0.0) > 0
                                ? (s['assignment'] ?? 0.0) /
                                    (s['assignmentCount'] ?? 1.0)
                                : 0.0)
                            .reduce((a, b) => a + b) /
                        studentScores.length)
                    .clamp(0.0, 100.0)
                : 0.0,
            color: AppColors.primaryColor,
          ),
          PerformanceMetric(
            label: 'All',
            percentage: studentScores.isNotEmpty && totalLectures > 0
                ? (studentScores.values
                            .map((s) =>
                                (s['attendance'] ?? 0.0) +
                                (s['test'] ?? 0.0) +
                                ((s['assignmentCount'] ?? 0.0) > 0
                                    ? (s['assignment'] ?? 0.0) /
                                        (s['assignmentCount'] ?? 1.0)
                                    : 0.0))
                            .reduce((a, b) => a + b) /
                        (studentScores.length * 3.0) *
                        100.0)
                    .clamp(0.0, 100.0)
                : 0.0,
            color: AppColors.primaryColor,
          ),
        ];

        _studentScores = studentScores.entries.map((entry) {
          double attendanceScore =
              (entry.value['attendance'] ?? 0.0) / totalLectures * 100.0;
          double testScore = (entry.value['test'] ?? 0.0) /
              100.0 *
              100.0; // Normalize to 0-100
          double assignmentScore = (entry.value['assignmentCount'] ?? 0.0) > 0
              ? (entry.value['assignment'] ?? 0.0) /
                  (entry.value['assignmentCount'] ?? 1.0)
              : 0.0;
          int count = [attendanceScore, testScore, assignmentScore]
              .where((score) => score > 0)
              .length;
          double performanceScore = count > 0
              ? (attendanceScore + testScore + assignmentScore) / count
              : 0.0;
          return StudentScoreStudent(entry.key,
              performanceScore.clamp(0.0, 100.0), Colors.blue.shade600);
        }).toList();
      }

      _isStudentLoading = false;
      _studentError = null;
    } catch (e) {
      _isStudentLoading = false;
      _studentError = 'Error loading data: $e';
    }
    notifyListeners();
  }

  void _listenToAttendanceChanges() {
    DocumentReference courseRef =
        FirebaseFirestore.instance.collection('Courses').doc(courseId);
    courseRef.collection('lectures').snapshots().listen((snapshot) {
      _loadAdminAnalysisData();
      _loadStudentAnalysisData();
    });
  }

  void _listenToTestsAndAssignmentsChanges() {
    DocumentReference courseRef =
        FirebaseFirestore.instance.collection('Courses').doc(courseId);
    courseRef.collection('tests').snapshots().listen((snapshot) {
      _loadAdminAnalysisData();
      _loadStudentAnalysisData();
    });
    courseRef.collection('assignments').snapshots().listen((snapshot) {
      _loadAdminAnalysisData();
      _loadStudentAnalysisData();
    });
  }
}