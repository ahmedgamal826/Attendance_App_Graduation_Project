import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../models/assignment_model_student.dart';
import '../../models/assignment_model_student.dart';
import 'assignment_state.dart';

class TestCubit extends Cubit<TestState> {
  TestCubit() : super(TestInitial());

  void loadTests() async {
    try {
      emit(TestLoading());

      // In a real app, you would fetch this data from an API or database
      // For now, we'll use mock data that matches the original UI
      final tests = [
        TestModel(
          title: "Assignment 1",
          date: "Date",
          score: "50/50",
          isCompleted: true,
        ),
        TestModel(
          title: "Assignment 2",
          date: "Date",
          score: "No Degree",
          isCompleted: false,
        ),
      ];

      emit(TestLoaded(tests: tests));
    } catch (e) {
      emit(TestError(message: e.toString()));
    }
  }
}
