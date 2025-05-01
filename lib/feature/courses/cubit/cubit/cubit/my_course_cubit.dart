import 'package:edunexus/core/helper/app_constants.dart';
import 'package:edunexus/core/helper/shared_pref_helper.dart';
import 'package:edunexus/feature/courses/data/repo/my_courses_repo.dart';
import 'package:edunexus/feature/home/data/model/all_courses.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_course_state.dart';

class MyCourseCubit extends Cubit<MyCourseState> {
  MyCourseCubit(this.myCoursesRepo) : super(MyCourseInitial());

  final MyCoursesRepo myCoursesRepo;
  Future<void> getMyCourses(String path) async {
    emit(MyCourseLoading());
    final token = await CacheHelper().getSecuredData(key: AppConstants.token) ?? '';
    final result = await myCoursesRepo.getMyCourses(path, token);
    result.fold(
      (error) => emit(MyCourseError(errorMessage: error)),
      (myCoursesList) => emit(MyCourseSuccess(myCoursesList:  myCoursesList as List<AllCoursesModel>?)),
    );
  }
}
