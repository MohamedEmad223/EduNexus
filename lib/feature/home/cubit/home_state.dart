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