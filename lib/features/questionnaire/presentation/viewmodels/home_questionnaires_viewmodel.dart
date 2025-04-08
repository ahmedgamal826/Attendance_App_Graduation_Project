import 'package:attendance_app/features/questionnaire/data/models/question_model.dart';
import 'package:flutter/material.dart';
import '../../data/models/questionnaire_model.dart';

class HomeQuestionnairesViewModel extends ChangeNotifier {
  List<QuestionnaireModel> _questionnaires = [];
  int? _selectedIndex;

  List<QuestionnaireModel> get questionnaires => _questionnaires;
  int? get selectedIndex => _selectedIndex;

  HomeQuestionnairesViewModel() {
    _initializeQuestionnaires();
  }

  void _initializeQuestionnaires() {
    _questionnaires = [
      QuestionnaireModel(
        name: 'Questionnaire 1',
        date: '2025-04-07',
        doctor: 'Dr. Ahmed Elnemr',
        questions: [
          QuestionModel(
              type: 'TrueFalse',
              question: 'The course was good?',
              options: ['True', 'False'],
              correct: 'True'),
        ],
      ),
    ];
    notifyListeners();
  }

  void selectQuestionnaire(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void deleteQuestionnaire(int index) {
    _questionnaires.removeAt(index);
    _selectedIndex = null;
    notifyListeners();
  }

  void addQuestionnaire(List<QuestionModel> newQuestions) {
    _questionnaires.add(
      QuestionnaireModel(
        name: 'Questionnaire ${_questionnaires.length + 1}',
        date: '2025-04-07',
        doctor: 'Dr. Admin',
        questions: newQuestions,
      ),
    );
    notifyListeners();
  }
}
