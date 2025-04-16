import 'package:attendance_app/features/assignments/models/assignment_model_admin.dart';
import 'package:equatable/equatable.dart';
// import '../models/assignment_model_admin.dart';

abstract class TestState extends Equatable {
  const TestState();

  @override
  List<Object> get props => [];
}

class TestInitial extends TestState {}

class TestLoading extends TestState {}

class TestLoaded extends TestState {
  final List<TestModel> tests;

  const TestLoaded(this.tests);

  @override
  List<Object> get props => [tests];
}

class TestError extends TestState {
  final String message;

  const TestError(this.message);

  @override
  List<Object> get props => [message];
}
