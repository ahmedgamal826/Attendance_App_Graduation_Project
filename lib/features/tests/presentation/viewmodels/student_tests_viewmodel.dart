// import 'package:attendance_app/features/tests/data/models/tests_model_student.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class TestsStudentViewModel extends ChangeNotifier {
//   List<TestsModel> _assignments = [];
//   bool _isLoading = true;
//   String _errorMessage = '';
//   String _successMessage = '';

//   final String courseId;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   List<TestsModel> get assignments => _assignments;
//   bool get isLoading => _isLoading;
//   String get errorMessage => _errorMessage;
//   String get successMessage => _successMessage;

//   TestsStudentViewModel({required this.courseId}) {
//     _initializeAssignments();
//   }

//   void _initializeAssignments() async {
//     try {
//       _isLoading = true;
//       notifyListeners();

//       // Obtener ID del usuario actual
//       final currentUser = _auth.currentUser;

//       if (currentUser == null) {
//         _errorMessage = 'User not logged in';
//         _isLoading = false;
//         notifyListeners();
//         return;
//       }

//       // Obtener tests del curso
//       final snapshot = await _firestore
//           .collection('Courses')
//           .doc(courseId)
//           .collection('tests')
//           .get();

//       if (snapshot.docs.isEmpty) {
//         _assignments = [];
//         _isLoading = false;
//         notifyListeners();
//         return;
//       }

//       // Lista para almacenar las tests
//       List<TestsModel> assignments = [];

//       // Procesar cada test
//       for (var doc in snapshot.docs) {
//         final data = doc.data();
//         final String testId = doc.id;

//         // Verificar si el estudiante ha completado este test
//         bool isCompleted = false;
//         String score = 'No Degree';

//         // Check the student status for this test
//         final statusDoc = await _firestore
//             .collection('Courses')
//             .doc(courseId)
//             .collection('tests')
//             .doc(testId)
//             .collection('studentStatus')
//             .doc(currentUser.uid)
//             .get();

//         // If there's a status document, the student has submitted this test
//         if (statusDoc.exists) {
//           final statusData = statusDoc.data();
//           isCompleted = statusData?['isCompleted'] ?? false;
//           score = statusData?['score'] ?? 'No Degree';
//         }

//         // Create the test model
//         assignments.add(TestsModel(
//           title: data['name'] ?? '',
//           date: data['date'] ?? '',
//           score: score,
//           isCompleted: isCompleted,
//           deadline: data['deadline'],
//           doctor: data['doctor'] ?? 'Unknown',
//           version: data['version'] ?? 1,
//         ));
//       }

//       // Ordenar por fecha (más reciente primero)
//       assignments.sort((a, b) => b.date.compareTo(a.date));

//       _assignments = assignments;
//     } catch (e) {
//       _errorMessage = 'Error loading tests: $e';
//       print(_errorMessage);
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }

//   void clearMessages() {
//     _errorMessage = '';
//     _successMessage = '';
//     notifyListeners();
//   }

//   Future<void> submitAssignment(String testId) async {
//     // Implementación para enviar un test
//     // Esta es una función básica que se puede expandir según necesidades
//     try {
//       _successMessage = 'Test submitted successfully';
//       notifyListeners();

//       // Actualizar el estado isCompleted del test في القائمة المحلية
//       final index = _assignments.indexWhere((a) => a.title == testId);
//       if (index != -1) {
//         final current = _assignments[index];
//         _assignments[index] = TestsModel(
//           title: current.title,
//           date: current.date,
//           score: current.score,
//           isCompleted: true,
//           deadline: current.deadline,
//           doctor: current.doctor,
//           version: current.version,
//         );
//         notifyListeners();
//       }
//     } catch (e) {
//       _errorMessage = 'Error submitting test: $e';
//       notifyListeners();
//     }
//   }

//   Future<void> refreshAssignments() async {
//     // Set loading state
//     _isLoading = true;
//     notifyListeners();

//     try {
//       // Obtener ID del usuario actual
//       final currentUser = _auth.currentUser;

//       if (currentUser == null) {
//         _errorMessage = 'User not logged in';
//         _isLoading = false;
//         notifyListeners();
//         return;
//       }

//       // Obtener tests del curso
//       final snapshot = await _firestore
//           .collection('Courses')
//           .doc(courseId)
//           .collection('tests')
//           .get();

//       if (snapshot.docs.isEmpty) {
//         _assignments = [];
//         _isLoading = false;
//         notifyListeners();
//         return;
//       }

//       // Lista para almacenar las tests
//       List<TestsModel> assignments = [];

//       // Procesar cada test
//       for (var doc in snapshot.docs) {
//         final data = doc.data();
//         final String testId = doc.id;

//         // Verificar si el estudiante ha completado este test
//         bool isCompleted = false;
//         String score = 'No Degree';

//         // Check the student status for this test
//         final statusDoc = await _firestore
//             .collection('Courses')
//             .doc(courseId)
//             .collection('tests')
//             .doc(testId)
//             .collection('studentStatus')
//             .doc(currentUser.uid)
//             .get();

//         // If there's a status document, the student has submitted this test
//         if (statusDoc.exists) {
//           final statusData = statusDoc.data();
//           isCompleted = statusData?['isCompleted'] ?? false;
//           score = statusData?['score'] ?? 'No Degree';
//           print("Found completed test: $testId, Score: $score");
//         }

//         // Create the test model
//         assignments.add(TestsModel(
//           title: data['name'] ?? '',
//           date: data['date'] ?? '',
//           score: score,
//           isCompleted: isCompleted,
//           deadline: data['deadline'],
//           doctor: data['doctor'] ?? 'Unknown',
//           version: data['version'] ?? 1,
//         ));
//       }

//       // Ordenar por fecha (más reciente primero)
//       assignments.sort((a, b) => b.date.compareTo(a.date));

//       _assignments = assignments;
//       _successMessage = 'Tests refreshed';
//     } catch (e) {
//       _errorMessage = 'Error refreshing tests: $e';
//       print(_errorMessage);
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
// }

import 'package:attendance_app/features/tests/data/models/tests_model_student.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TestsStudentViewModel extends ChangeNotifier {
  List<TestsTestsModel> _assignments = [];
  bool _isLoading = true;
  String _errorMessage = '';
  String _successMessage = '';

  final String courseId;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<TestsTestsModel> get assignments => _assignments;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  String get successMessage => _successMessage;

  TestsStudentViewModel({required this.courseId}) {
    _initializeAssignments();
  }

  void _initializeAssignments() async {
    try {
      _isLoading = true;
      notifyListeners();

      // Get current user ID
      final currentUser = _auth.currentUser;

      if (currentUser == null) {
        _errorMessage = 'User not logged in';
        _isLoading = false;
        notifyListeners();
        return;
      }

      // Get tests for the course
      final snapshot = await _firestore
          .collection('Courses')
          .doc(courseId)
          .collection('tests')
          .get();

      if (snapshot.docs.isEmpty) {
        _assignments = [];
        _isLoading = false;
        notifyListeners();
        return;
      }

      // List to store the tests
      List<TestsTestsModel> assignments = [];

      // Process each test
      for (var doc in snapshot.docs) {
        final data = doc.data();
        final String testId = doc.id;

        // Check if student has completed this test
        bool isCompleted = false;
        String score = 'No Degree';

        // Check the student status for this test
        final statusDoc = await _firestore
            .collection('Courses')
            .doc(courseId)
            .collection('tests')
            .doc(testId)
            .collection('studentStatus')
            .doc(currentUser.uid)
            .get();

        // If there's a status document, the student has submitted this test
        if (statusDoc.exists) {
          final statusData = statusDoc.data();
          isCompleted = statusData?['isCompleted'] ?? false;
          score = statusData?['score'] ?? 'No Degree';
        }

        // Create the test model
        assignments.add(TestsTestsModel(
          title: data['name'] ?? '',
          date: data['date'] ?? '',
          score: score,
          isCompleted: isCompleted,
          examDate: data['examDate'],
          startTime: data['startTime'],
          endTime: data['endTime'],
          doctor: data['doctor'] ?? 'Unknown',
          version: data['version'] ?? 1,
        ));
      }

      // Sort by date (most recent first)
      assignments.sort((a, b) => b.date.compareTo(a.date));

      _assignments = assignments;
    } catch (e) {
      _errorMessage = 'Error loading tests: $e';
      print(_errorMessage);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearMessages() {
    _errorMessage = '';
    _successMessage = '';
    notifyListeners();
  }

  Future<void> submitAssignment(String testId) async {
    // Implementation for submitting a test
    try {
      _successMessage = 'Test submitted successfully';
      notifyListeners();

      // Update the isCompleted status of the test in the local list
      final index = _assignments.indexWhere((a) => a.title == testId);
      if (index != -1) {
        final current = _assignments[index];
        _assignments[index] = TestsTestsModel(
          title: current.title,
          date: current.date,
          score: current.score,
          isCompleted: true,
          examDate: current.examDate,
          startTime: current.startTime,
          endTime: current.endTime,
          doctor: current.doctor,
          version: current.version,
        );
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = 'Error submitting test: $e';
      notifyListeners();
    }
  }

  Future<void> refreshAssignments() async {
    // Set loading state
    _isLoading = true;
    notifyListeners();

    try {
      // Get current user ID
      final currentUser = _auth.currentUser;

      if (currentUser == null) {
        _errorMessage = 'User not logged in';
        _isLoading = false;
        notifyListeners();
        return;
      }

      // Get tests for the course
      final snapshot = await _firestore
          .collection('Courses')
          .doc(courseId)
          .collection('tests')
          .get();

      if (snapshot.docs.isEmpty) {
        _assignments = [];
        _isLoading = false;
        notifyListeners();
        return;
      }

      // List to store the tests
      List<TestsTestsModel> assignments = [];

      // Process each test
      for (var doc in snapshot.docs) {
        final data = doc.data();
        final String testId = doc.id;

        // Check if student has completed this test
        bool isCompleted = false;
        String score = 'No Degree';

        // Check the student status for this test
        final statusDoc = await _firestore
            .collection('Courses')
            .doc(courseId)
            .collection('tests')
            .doc(testId)
            .collection('studentStatus')
            .doc(currentUser.uid)
            .get();

        // If there's a status document, the student has submitted this test
        if (statusDoc.exists) {
          final statusData = statusDoc.data();
          isCompleted = statusData?['isCompleted'] ?? false;
          score = statusData?['score'] ?? 'No Degree';
          print("Found completed test: $testId, Score: $score");
        }

        // Create the test model
        assignments.add(TestsTestsModel(
          title: data['name'] ?? '',
          date: data['date'] ?? '',
          score: score,
          isCompleted: isCompleted,
          examDate: data['examDate'],
          startTime: data['startTime'],
          endTime: data['endTime'],
          doctor: data['doctor'] ?? 'Unknown',
          version: data['version'] ?? 1,
        ));
      }

      // Sort by date (most recent first)
      assignments.sort((a, b) => b.date.compareTo(a.date));

      _assignments = assignments;
      _successMessage = 'Tests refreshed';
    } catch (e) {
      _errorMessage = 'Error refreshing tests: $e';
      print(_errorMessage);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
