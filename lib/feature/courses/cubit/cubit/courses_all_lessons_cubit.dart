import 'package:edunexus/core/helper/app_constants.dart';
import 'package:edunexus/core/helper/shared_pref_helper.dart';
import 'package:edunexus/feature/courses/data/model/all_lessons_model.dart';
import 'package:edunexus/feature/courses/data/repo/all_lessons_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'courses_all_lessons_state.dart';

class CoursesAllLessonsCubit extends Cubit<CoursesAllLessonsState> {
  CoursesAllLessonsCubit(this.allLessonsRepo)
    : super(CoursesAllLessonsInitial());
  final AllLessonsRepo allLessonsRepo;

  Future<void> getAllLessons(String path) async {
    emit(CoursesAllLessonsLoading());

    final token =
        await CacheHelper().getSecuredData(key: AppConstants.token) ?? '';
    final result = await allLessonsRepo.getAllLessons(path, token);
    result.fold((error) => emit(CoursesAllLessonsError(message: error)), (
      allLessonsModel,
    ) {
      emit(CoursesAllLessonsSuccess(allLessonsModel: [allLessonsModel]));
    });
  }
}
