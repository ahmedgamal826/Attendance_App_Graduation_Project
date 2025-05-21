import 'package:flutter/material.dart';
import '../../data/models/tests_question_model_admin.dart';

class TestsViewModel extends ChangeNotifier {
  List<TestsQuestionModel> _questions = [];
  int _currentQuestionIndex = 0;

  List<TestsQuestionModel> get questions => _questions;
  int get currentQuestionIndex => _currentQuestionIndex;
  TestsQuestionModel? get currentQuestion =>
      _questions.isNotEmpty ? _questions[_currentQuestionIndex] : null;

  void initializeQuestions(List<Map<String, dynamic>> initialQuestions) {
    if (initialQuestions.isNotEmpty) {
      _questions =
          initialQuestions.map((q) => TestsQuestionModel.fromMap(q)).toList();
      notifyListeners();
    }
  }

  void selectQuestion(int index) {
    if (index >= 0 && index < _questions.length) {
      _currentQuestionIndex = index;
      notifyListeners();
    }
  }

  void addQuestion(TestsQuestionModel question) {
    _questions.add(question);
    _currentQuestionIndex = _questions.length - 1;
    notifyListeners();
  }

  void updateQuestion(int index, TestsQuestionModel updatedQuestion) {
    if (index >= 0 && index < _questions.length) {
      _questions[index] = updatedQuestion;
      notifyListeners();
    }
  }

  void deleteQuestion(int index) {
    if (index >= 0 && index < _questions.length) {
      _questions.removeAt(index);
      if (_questions.isEmpty) {
        _currentQuestionIndex = 0;
      } else if (_currentQuestionIndex >= _questions.length) {
        _currentQuestionIndex = _questions.length - 1;
      }
      notifyListeners();
    }
  }
}
