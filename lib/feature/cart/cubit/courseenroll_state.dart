part of 'courseenroll_cubit.dart';


sealed class CourseenrollState {}

final class CourseenrollInitial extends CourseenrollState {}

final class CourseenrollLoading extends CourseenrollState {}

final class CourseenrollSuccess extends CourseenrollState {
  final String message;

  CourseenrollSuccess({required this.message});
}

final class CourseenrollError extends CourseenrollState {
  final String message;

  CourseenrollError({required this.message});
}
