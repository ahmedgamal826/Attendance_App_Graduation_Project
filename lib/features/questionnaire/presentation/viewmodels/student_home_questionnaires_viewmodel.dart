import 'package:attendance_app/features/questionnaire/data/models/student_questionnaire_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StudentHomeQuestionnairesViewModel extends ChangeNotifier {
  final List<StudentQuestionnaireModel> _questionnaires = [];
  List<StudentQuestionnaireModel> get questionnaires => _questionnaires;
  bool _isLoading = true;
  bool get isLoading => _isLoading;
  final String courseId;

  StudentHomeQuestionnairesViewModel({required this.courseId}) {
    _initializeQuestionnaires();
  }

  Future<void> _initializeQuestionnaires() async {
    try {
      _isLoading = true;
      notifyListeners();

      final querySnapshot = await FirebaseFirestore.instance
          .collection('Courses')
          .doc(courseId)
          .collection('questionnaires')
          .get();

      _questionnaires.clear();
      for (var doc in querySnapshot.docs) {
        final data = doc.data();
        data['id'] = doc.id;
        final questionnaire =
            await StudentQuestionnaireModel.fromFirestore(data, courseId);
        _questionnaires.add(questionnaire);
      }
    } catch (e) {
      print('Error fetching questionnaires: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void markQuestionnaireAsCompleted(String id) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final index = _questionnaires.indexWhere((q) => q.id == id);
      if (index != -1) {
        await FirebaseFirestore.instance
            .collection('Courses')
            .doc(courseId)
            .collection('questionnaires')
            .doc(id)
            .collection('filledBy')
            .doc(user.uid)
            .set({
          'uid': user.uid,
          'timestamp': FieldValue.serverTimestamp(),
        });
        _questionnaires[index] = await StudentQuestionnaireModel.fromFirestore({
          'id': id,
          'name': _questionnaires[index].name,
          'date': _questionnaires[index].date,
          'doctor': _questionnaires[index].doctor
        }, courseId);
        notifyListeners();
      }
    }
  }
}
