import 'package:flutter/material.dart';
import '../../data/models/question_model.dart';

class QuestionnaireViewModel extends ChangeNotifier {
  List<QuestionModel> _questions = [];
  int _currentQuestionIndex = 0;

  List<QuestionModel> get questions => _questions;
  int get currentQuestionIndex => _currentQuestionIndex;
  QuestionModel? get currentQuestion =>
      _questions.isNotEmpty ? _questions[_currentQuestionIndex] : null;

  void initializeQuestions(List<Map<String, dynamic>> initialQuestions) {
    _questions = initialQuestions.map((q) => QuestionModel.fromMap(q)).toList();
    if (_questions.isNotEmpty) _currentQuestionIndex = 0;
    notifyListeners();
  }

  void selectQuestion(int index) {
    _currentQuestionIndex = index;
    notifyListeners();
  }

  void addQuestion(QuestionModel newQuestion) {
    _questions.add(newQuestion);
    _currentQuestionIndex = _questions.length - 1;
    print(
        'Added Question: ${newQuestion.toMap()}, Total: ${_questions.length}');
    notifyListeners();
  }

  void updateQuestion(int index, QuestionModel updatedQuestion) {
    _questions[index] = updatedQuestion;
    print('Updated Question at $index: ${updatedQuestion.toMap()}');
    notifyListeners();
  }

  void deleteQuestion(int index) {
    _questions.removeAt(index);
    if (_questions.isEmpty) {
      _currentQuestionIndex = 0;
    } else if (_currentQuestionIndex >= _questions.length) {
      _currentQuestionIndex = _questions.length - 1;
    }
    notifyListeners();
  }
}
