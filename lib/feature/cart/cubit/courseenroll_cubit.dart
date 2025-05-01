import 'package:edunexus/core/helper/app_constants.dart';
import 'package:edunexus/core/helper/shared_pref_helper.dart';
import 'package:edunexus/feature/cart/data/repo/enroll_course_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'courseenroll_state.dart';

class CourseenrollCubit extends Cubit<CourseenrollState> {
  CourseenrollCubit(this.enrollCourseRepo) : super(CourseenrollInitial());

  final EnrollCourseRepo enrollCourseRepo;

  Future<void> enrollCourses(String path) async {
    emit(CourseenrollLoading());

    final token =
        await CacheHelper().getSecuredData(key: AppConstants.token) ?? '';
    final result = await enrollCourseRepo.enrollCourse(path, token);
    result.fold((error) => emit(CourseenrollError(message: error)), (
      allLessonsModel,
    ) {
      emit(CourseenrollSuccess(message: allLessonsModel.toString()));
    });
  }
}
