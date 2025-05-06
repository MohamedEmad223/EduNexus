part of 'home_cubit.dart';

sealed class HomeState {}

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

class HomeSearchResults extends HomeState {
  final List<AllCoursesModel> allCoursesList;
  final List<AllCoursesModel> searchResults;
  final String query;
  
  HomeSearchResults({
    required this.allCoursesList,
    required this.searchResults,
    required this.query
  });
}

class CartUpdated extends HomeState {
  final List<AllCoursesModel> cartCourses;
  CartUpdated({required this.cartCourses});
}