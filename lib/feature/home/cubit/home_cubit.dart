import 'package:edunexus/core/helper/app_constants.dart';
import 'package:edunexus/core/helper/shared_pref_helper.dart';
import 'package:edunexus/feature/home/data/model/all_courses.dart';
import 'package:edunexus/feature/home/data/model/lessone_model.dart';
import 'package:edunexus/feature/home/data/repos/all_courses_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.allCoursesRepo) : super(HomeInitial());

  final AllCoursesRepo allCoursesRepo;
   List<AllCoursesModel> allCoursesList = [];

  Future<void> getAllCourses(String path) async {
    emit(HomeLoading());

    final token = await CacheHelper().getSecuredData(key: AppConstants.token) ?? '';
    final result = await allCoursesRepo.getAllCourses(path, token);
    result.fold((error) => emit(HomeError(errorMessage: error)), (
      allCoursesList,
    ) {
      this.allCoursesList = allCoursesList;
      emit(HomeSuccess(allCoursesList: allCoursesList));
    });
  }


}
