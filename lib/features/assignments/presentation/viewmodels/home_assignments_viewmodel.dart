import 'package:attendance_app/features/assignments/data/models/assignment_model_admin.dart';
import 'package:attendance_app/features/assignments/data/models/question_model_admin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeAssignmentsViewModel extends ChangeNotifier {
  List<AssignmentModel> _assignments = [];
  int? _selectedIndex;
  bool _isLoading = true;
  bool _isProcessing = false;
  String _errorMessage = '';
  String _successMessage = '';
  String? _courseName;

  final String courseId;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<AssignmentModel> get assignments => _assignments;
  int? get selectedIndex => _selectedIndex;
  bool get isLoading => _isLoading;
  bool get isProcessing => _isProcessing;
  String get errorMessage => _errorMessage;
  String get successMessage => _successMessage;
  String get courseName => _courseName ?? 'assignments';

  HomeAssignmentsViewModel({required this.courseId}) {
    _initializeAssignments();
    _fetchCourseName();
  }

  void _initializeAssignments() async {
    try {
      final snapshot = await _firestore
          .collection('Courses')
          .doc(courseId)
          .collection('assignments')
          .get();

      _assignments = snapshot.docs.map((doc) {
        final data = doc.data();
        return AssignmentModel.fromMap(data);
      }).toList();
    } catch (e) {
      print('Error fetching assignments: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void selectAssignment(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void clearMessages() {
    _errorMessage = '';
    _successMessage = '';
    notifyListeners();
  }

  void deleteAssignment(int index) async {
    try {
      if (_assignments.isNotEmpty && index < _assignments.length) {
        await _firestore
            .collection('Courses')
            .doc(courseId)
            .collection('assignments')
            .doc(_assignments[index].name)
            .delete();

        _assignments.removeAt(index);
        _selectedIndex = null;
        _successMessage = 'Assignment deleted successfully';
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = 'Error deleting assignment: $e';
      print(_errorMessage);
      notifyListeners();
    }
  }

  // Get current user's name from Firestore
  Future<String> _getCurrentUserName() async {
    try {
      // Get the current user
      User? user = _auth.currentUser;
      if (user != null) {
        // Get user document from Firestore
        DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(user.uid).get();

        if (userDoc.exists) {
          // Return the user's name from Firestore
          Map<String, dynamic> userData =
              userDoc.data() as Map<String, dynamic>;
          return userData['name'] ?? 'Unknown User';
        }
      }
      return 'Unknown User';
    } catch (e) {
      print('Error getting user name: $e');
      return 'Unknown User';
    }
  }

  Future<AssignmentModel> addAssignment(
      String name, List<QuestionModel> questions,
      {String? deadline}) async {
    _isProcessing = true;
    _errorMessage = '';
    _successMessage = '';
    notifyListeners();

    try {
      final now = DateTime.now();
      final formattedDate = DateFormat('dd-MM-yyyy HH:mm').format(now);

      // Get the current user's name
      String doctorName = await _getCurrentUserName();

      final newAssignment = AssignmentModel(
        name: name,
        questions: questions,
        date: formattedDate,
        doctor: doctorName,
        version: 1,
        deadline: deadline,
      );

      await _firestore
          .collection('Courses')
          .doc(courseId)
          .collection('assignments')
          .doc(name)
          .set(newAssignment.toMap());

      _assignments.add(newAssignment);
      _successMessage = 'Assignment added successfully';
      notifyListeners();

      return newAssignment;
    } catch (e) {
      _errorMessage = 'Error adding assignment: $e';
      print(_errorMessage);
      notifyListeners();
      throw e;
    } finally {
      _isProcessing = false;
      notifyListeners();
    }
  }

  Future<void> updateAssignment(
      String assignmentId, List<QuestionModel> updatedQuestions,
      {String? deadline}) async {
    _isProcessing = true;
    _errorMessage = '';
    _successMessage = '';
    notifyListeners();

    try {
      final index = _assignments.indexWhere((a) => a.name == assignmentId);
      if (index != -1) {
        final currentAssignment = _assignments[index];

        final updatedAssignment = AssignmentModel(
          name: currentAssignment.name,
          questions: updatedQuestions,
          date: currentAssignment.date,
          doctor: currentAssignment.doctor,
          version: currentAssignment.version + 1, // Increment version
          deadline: deadline ??
              currentAssignment
                  .deadline, // Keep existing deadline if not provided
        );

        await _firestore
            .collection('Courses')
            .doc(courseId)
            .collection('assignments')
            .doc(assignmentId)
            .update(updatedAssignment.toMap());

        _assignments[index] = updatedAssignment;
        _successMessage = 'Assignment updated successfully';
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = 'Error updating assignment: $e';
      print(_errorMessage);
      notifyListeners();
      throw e;
    } finally {
      _isProcessing = false;
      notifyListeners();
    }
  }

  Future<void> updateAssignmentDetails(String assignmentId,
      {required String newName, String? deadline}) async {
    _isProcessing = true;
    _errorMessage = '';
    _successMessage = '';
    notifyListeners();

    try {
      final index = _assignments.indexWhere((a) => a.name == assignmentId);
      if (index != -1) {
        final currentAssignment = _assignments[index];

        // Create updated assignment with new name and/or deadline
        final updatedAssignment = AssignmentModel(
          name: newName,
          questions: currentAssignment.questions,
          date: currentAssignment.date,
          doctor: currentAssignment.doctor,
          version: currentAssignment.version + 1, // Increment version
          deadline: deadline ??
              currentAssignment.deadline, // Update deadline if provided
        );

        // If the name has changed, we need to delete the old document and create a new one
        if (assignmentId != newName) {
          // Create a batch to perform multiple operations
          final batch = _firestore.batch();

          // Reference to the old document
          final oldDocRef = _firestore
              .collection('Courses')
              .doc(courseId)
              .collection('assignments')
              .doc(assignmentId);

          // Reference to the new document
          final newDocRef = _firestore
              .collection('Courses')
              .doc(courseId)
              .collection('assignments')
              .doc(newName);

          // Set the new document with updated data
          batch.set(newDocRef, updatedAssignment.toMap());

          // Delete the old document
          batch.delete(oldDocRef);

          // Commit the batch
          await batch.commit();
        } else {
          // Just update the existing document with new deadline
          await _firestore
              .collection('Courses')
              .doc(courseId)
              .collection('assignments')
              .doc(assignmentId)
              .update(updatedAssignment.toMap());
        }

        // Update the local list
        _assignments[index] = updatedAssignment;
        _successMessage = 'Assignment details updated successfully';
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = 'Error updating assignment details: $e';
      print(_errorMessage);
      notifyListeners();
      throw e;
    } finally {
      _isProcessing = false;
      notifyListeners();
    }
  }

  Future<void> _fetchCourseName() async {
    try {
      final courseDoc =
          await _firestore.collection('Courses').doc(courseId).get();

      if (courseDoc.exists) {
        final courseData = courseDoc.data();
        _courseName = courseData?['courseName'] as String?;
        notifyListeners();
      }
    } catch (e) {
      print('Error fetching course name: $e');
    }
  }
}
