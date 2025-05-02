part of 'progressofstudent_cubit.dart';


sealed class ProgressofstudentState {}

final class ProgressofstudentInitial extends ProgressofstudentState {}

final class ProgressofstudentLoading extends ProgressofstudentState {}

final class ProgressofstudentLoaded extends ProgressofstudentState {
  final GetProgressOfStudentModel getProgressOfStudentModel;

  ProgressofstudentLoaded({required this.getProgressOfStudentModel});
}

final class ProgressofstudentError extends ProgressofstudentState {
  final String message;

  ProgressofstudentError({required this.message});
}
