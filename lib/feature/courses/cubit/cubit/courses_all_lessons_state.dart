part of 'courses_all_lessons_cubit.dart';

sealed class CoursesAllLessonsState {}

final class CoursesAllLessonsInitial extends CoursesAllLessonsState {}

final class CoursesAllLessonsLoading extends CoursesAllLessonsState {}

final class CoursesAllLessonsSuccess extends CoursesAllLessonsState {
  final AllLessonsModel? allLessonsModel;
 
  CoursesAllLessonsSuccess({required this.allLessonsModel});
}

final class CoursesAllLessonsError extends CoursesAllLessonsState {
  final String? message;
  CoursesAllLessonsError({required this.message});
}
