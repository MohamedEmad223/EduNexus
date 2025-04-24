part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final AllCoursesModel? allCoursesModel;

  HomeSuccess({ this.allCoursesModel});
}

final class HomeError extends HomeState {
  final String? errorMessage;

  HomeError({this.errorMessage});
}
