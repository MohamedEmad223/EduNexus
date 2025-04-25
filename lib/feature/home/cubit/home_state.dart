part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<AllCoursesModel> allCoursesList;
  HomeSuccess({required this.allCoursesList});
}

class HomeError extends HomeState {
  final String errorMessage;
  HomeError({required this.errorMessage});
}

class LessonLoading extends HomeState {}

class LessonSuccess extends HomeState {
  final List<LessonModel> allCoursesList;
  LessonSuccess({required this.allCoursesList});
}

class LessonError extends HomeState {
  final String errorMessage;
  LessonError({required this.errorMessage});
}