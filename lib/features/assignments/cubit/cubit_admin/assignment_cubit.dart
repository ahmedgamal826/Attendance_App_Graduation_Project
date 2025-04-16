import 'package:attendance_app/features/assignments/cubit/cubit_admin/assignment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/assignment_model_admin.dart';

class TestCubit extends Cubit<TestState> {
  TestCubit() : super(TestInitial()) {
    // Initialize with some default tests
    loadTests();
  }

  // List to hold test data
  List<TestModel> _tests = [];

  void loadTests() {
    emit(TestLoading());
    try {
      // Initialize with default test data
      _tests = [
        TestModel(name: 'Test 1', date: 'Date'),
        TestModel(name: 'Test 2', date: 'Date'),
      ];
      emit(TestLoaded(_tests));
    } catch (e) {
      emit(TestError('Failed to load tests: ${e.toString()}'));
    }
  }

  void addTest(String name) {
    if (state is TestLoaded) {
      try {
        final newTest = TestModel(name: name, date: 'Date');
        _tests.add(newTest);
        emit(TestLoaded(_tests));
      } catch (e) {
        emit(TestError('Failed to add test: ${e.toString()}'));
      }
    }
  }

  void deleteTest(int index) {
    if (state is TestLoaded && index >= 0 && index < _tests.length) {
      try {
        _tests.removeAt(index);
        emit(TestLoaded(_tests));
      } catch (e) {
        emit(TestError('Failed to delete test: ${e.toString()}'));
      }
    }
  }

  // Get current tests
  List<TestModel> get tests => _tests;
}
