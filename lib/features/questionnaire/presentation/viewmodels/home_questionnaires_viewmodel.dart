import 'package:attendance_app/features/questionnaire/data/models/question_model.dart';
import 'package:attendance_app/features/questionnaire/data/models/questionnaire_model.dart';
import 'package:attendance_app/features/questionnaire/data/repositories/questionnaire_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeQuestionnairesViewModel extends ChangeNotifier {
  List<QuestionnaireModel> _questionnaires = [];
  int? _selectedIndex;
  bool _isLoading = true;
  final String courseId;
  final QuestionnaireRepository _repository = QuestionnaireRepository();

  List<QuestionnaireModel> get questionnaires => _questionnaires;
  int? get selectedIndex => _selectedIndex;
  bool get isLoading => _isLoading;

  HomeQuestionnairesViewModel({required this.courseId}) {
    _initializeQuestionnaires();
  }

  void _initializeQuestionnaires() async {
    try {
      _questionnaires = await _repository.getQuestionnaires(courseId);
    } catch (e) {
      print('Error fetching questionnaires: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void selectQuestionnaire(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void deleteQuestionnaire(int index) async {
    try {
      if (_questionnaires.isNotEmpty && index < _questionnaires.length) {
        await _repository.deleteQuestionnaire(
            courseId, _questionnaires[index].name);
        _questionnaires.removeAt(index);
        _selectedIndex = null;
        notifyListeners();
      }
    } catch (e) {
      print('Error deleting questionnaire: $e');
    }
  }

  void addQuestionnaire(List<QuestionModel> newQuestions) async {
    try {
      final newQuestionnaire =
          await _repository.addQuestionnaire(courseId, newQuestions);
      _questionnaires.add(newQuestionnaire);
      notifyListeners();
    } catch (e) {
      print('Error adding questionnaire: $e');
    }
  }

  void updateQuestionnaire(
      String questionnaireId, List<QuestionModel> updatedQuestions) async {
    try {
      await _repository.updateQuestionnaire(
          courseId, questionnaireId, updatedQuestions);
      final index =
          _questionnaires.indexWhere((q) => q.name == questionnaireId);
      if (index != -1) {
        _questionnaires[index] =
            _questionnaires[index].copyWith(questions: updatedQuestions);
      }
      notifyListeners();
    } catch (e) {
      print('Error updating questionnaire: $e');
    }
  }

  void markQuestionnaireAsCompleted(String questionnaireId) async {
    try {
      final index =
          _questionnaires.indexWhere((q) => q.name == questionnaireId);
      if (index != -1) {
        _questionnaires[index] =
            _questionnaires[index].copyWith(isCompleted: true);
        await FirebaseFirestore.instance
            .collection('Courses')
            .doc(courseId)
            .collection('questionnaires')
            .doc(questionnaireId)
            .update({'isCompleted': true});
        notifyListeners();
      }
    } catch (e) {
      print('Error marking questionnaire as completed: $e');
    }
  }
}

extension QuestionnaireModelExtension on QuestionnaireModel {
  QuestionnaireModel copyWith(
      {List<QuestionModel>? questions, bool? isCompleted}) {
    return QuestionnaireModel(
      name: this.name,
      date: this.date,
      doctor: this.doctor,
      questions: questions ?? this.questions,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
