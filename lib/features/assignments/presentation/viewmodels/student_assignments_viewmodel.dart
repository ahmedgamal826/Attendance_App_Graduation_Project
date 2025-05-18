import 'package:attendance_app/features/assignments/models/assignment_model_student.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StudentAssignmentsViewModel extends ChangeNotifier {
  List<TestModel> _assignments = [];
  bool _isLoading = true;
  String _errorMessage = '';
  String _successMessage = '';

  final String courseId;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<TestModel> get assignments => _assignments;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  String get successMessage => _successMessage;

  StudentAssignmentsViewModel({required this.courseId}) {
    _initializeAssignments();
  }

  void _initializeAssignments() async {
    try {
      _isLoading = true;
      notifyListeners();

      // Obtener ID del usuario actual
      final currentUser = _auth.currentUser;

      if (currentUser == null) {
        _errorMessage = 'User not logged in';
        _isLoading = false;
        notifyListeners();
        return;
      }

      // Obtener asignaciones del curso
      final snapshot = await _firestore
          .collection('Courses')
          .doc(courseId)
          .collection('assignments')
          .get();

      if (snapshot.docs.isEmpty) {
        _assignments = [];
        _isLoading = false;
        notifyListeners();
        return;
      }

      // Lista para almacenar las asignaciones
      List<TestModel> assignments = [];

      // Procesar cada asignación
      for (var doc in snapshot.docs) {
        final data = doc.data();
        final String assignmentId = doc.id;

        // Verificar si el estudiante ha completado esta asignación
        bool isCompleted = false;
        String score = 'No Degree';

        // Check the student status for this assignment
        final statusDoc = await _firestore
            .collection('Courses')
            .doc(courseId)
            .collection('assignments')
            .doc(assignmentId)
            .collection('studentStatus')
            .doc(currentUser.uid)
            .get();

        // If there's a status document, the student has submitted this assignment
        if (statusDoc.exists) {
          final statusData = statusDoc.data();
          isCompleted = statusData?['isCompleted'] ?? false;
          score = statusData?['score'] ?? 'No Degree';
        }

        // Create the assignment model
        assignments.add(TestModel(
          title: data['name'] ?? '',
          date: data['date'] ?? '',
          score: score,
          isCompleted: isCompleted,
          deadline: data['deadline'],
          doctor: data['doctor'] ?? 'Unknown',
          version: data['version'] ?? 1,
        ));
      }

      // Ordenar por fecha (más reciente primero)
      assignments.sort((a, b) => b.date.compareTo(a.date));

      _assignments = assignments;
    } catch (e) {
      _errorMessage = 'Error loading assignments: $e';
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

  Future<void> submitAssignment(String assignmentId) async {
    // Implementación para enviar una asignación
    // Esta es una función básica que se puede expandir según necesidades
    try {
      _successMessage = 'Assignment submitted successfully';
      notifyListeners();

      // Actualizar el estado isCompleted de la asignación en la lista local
      final index = _assignments.indexWhere((a) => a.title == assignmentId);
      if (index != -1) {
        final current = _assignments[index];
        _assignments[index] = TestModel(
          title: current.title,
          date: current.date,
          score: current.score,
          isCompleted: true,
          deadline: current.deadline,
          doctor: current.doctor,
          version: current.version,
        );
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = 'Error submitting assignment: $e';
      notifyListeners();
    }
  }

  Future<void> refreshAssignments() async {
    // Set loading state
    _isLoading = true;
    notifyListeners();

    try {
      // Obtener ID del usuario actual
      final currentUser = _auth.currentUser;

      if (currentUser == null) {
        _errorMessage = 'User not logged in';
        _isLoading = false;
        notifyListeners();
        return;
      }

      // Obtener asignaciones del curso
      final snapshot = await _firestore
          .collection('Courses')
          .doc(courseId)
          .collection('assignments')
          .get();

      if (snapshot.docs.isEmpty) {
        _assignments = [];
        _isLoading = false;
        notifyListeners();
        return;
      }

      // Lista para almacenar las asignaciones
      List<TestModel> assignments = [];

      // Procesar cada asignación
      for (var doc in snapshot.docs) {
        final data = doc.data();
        final String assignmentId = doc.id;

        // Verificar si el estudiante ha completado esta asignación
        bool isCompleted = false;
        String score = 'No Degree';

        // Check the student status for this assignment
        final statusDoc = await _firestore
            .collection('Courses')
            .doc(courseId)
            .collection('assignments')
            .doc(assignmentId)
            .collection('studentStatus')
            .doc(currentUser.uid)
            .get();

        // If there's a status document, the student has submitted this assignment
        if (statusDoc.exists) {
          final statusData = statusDoc.data();
          isCompleted = statusData?['isCompleted'] ?? false;
          score = statusData?['score'] ?? 'No Degree';
          print("Found completed assignment: $assignmentId, Score: $score");
        }

        // Create the assignment model
        assignments.add(TestModel(
          title: data['name'] ?? '',
          date: data['date'] ?? '',
          score: score,
          isCompleted: isCompleted,
          deadline: data['deadline'],
          doctor: data['doctor'] ?? 'Unknown',
          version: data['version'] ?? 1,
        ));
      }

      // Ordenar por fecha (más reciente primero)
      assignments.sort((a, b) => b.date.compareTo(a.date));

      _assignments = assignments;
      _successMessage = 'Assignments refreshed';
    } catch (e) {
      _errorMessage = 'Error refreshing assignments: $e';
      print(_errorMessage);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
