part of 'my_course_cubit.dart';

sealed class MyCourseState {}

final class MyCourseInitial extends MyCourseState {}

final class MyCourseLoading extends MyCourseState {}

final class MyCourseSuccess extends MyCourseState {
  final List<AllCoursesModel>? myCoursesList;

  MyCourseSuccess({this.myCoursesList});
}

final class MyCourseError extends MyCourseState {
  final String? errorMessage;

  MyCourseError({this.errorMessage});
}
