import 'package:equatable/equatable.dart';

import '../../models/test_model_student.dart';
// import '../../../models/assignment_model_student.dart';

abstract class TestState extends Equatable {
  const TestState();

  @override
  List<Object> get props => [];
}

class TestInitial extends TestState {}

class TestLoading extends TestState {}

class TestLoaded extends TestState {
  final List<TestModel> tests;

  const TestLoaded({required this.tests});

  @override
  List<Object> get props => [tests];
}

class TestError extends TestState {
  final String message;

  const TestError({required this.message});

  @override
  List<Object> get props => [message];
}