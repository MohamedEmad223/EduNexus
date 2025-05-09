import 'package:edunexus/core/helper/app_constants.dart';
import 'package:edunexus/core/helper/shared_pref_helper.dart';
import 'package:edunexus/feature/home/data/model/all_courses.dart';
import 'package:edunexus/feature/home/data/repos/all_courses_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.allCoursesRepo) : super(HomeInitial());

  final AllCoursesRepo allCoursesRepo;
  List<AllCoursesModel> allCoursesList = [];
  final List<AllCoursesModel> cartCourses = [];
  List<AllCoursesModel> searchResults = [];

  Future<void> getAllCourses(String path) async {
    emit(HomeLoading());

    final token = await CacheHelper().getSecuredData(key: AppConstants.token) ?? '';
    final result = await allCoursesRepo.getAllCourses(path, token);
    result.fold((error) => emit(HomeError(errorMessage: error)), (allCoursesList) {
      this.allCoursesList = allCoursesList;
      emit(HomeSuccess(allCoursesList: allCoursesList));
    });
  }

  void toggleCartCourse(AllCoursesModel course) {
    if (cartCourses.contains(course)) {
      cartCourses.remove(course);
    } else {
      cartCourses.add(course);
    }
    emit(HomeSuccess(allCoursesList: allCoursesList));
  }

  bool isInCart(AllCoursesModel course) {
    return cartCourses.contains(course);
  }

  void clearCart() {
    cartCourses.clear();
    emit(HomeSuccess(allCoursesList: allCoursesList));
  }
  
  void searchCourses(String query) {
    if (query.isEmpty) {
      searchResults = [];
      emit(HomeSuccess(allCoursesList: allCoursesList));
      return;
    }
    
    searchResults = allCoursesList.where((course) {
      final title = course.title?.toLowerCase() ?? '';
      final description = course.description?.toLowerCase() ?? '';
      final category = course.category?.toLowerCase() ?? '';
      final searchLower = query.toLowerCase();
      
      return title.contains(searchLower) || 
             description.contains(searchLower) || 
             category.contains(searchLower);
    }).toList();
    
    emit(HomeSearchResults(
      allCoursesList: allCoursesList,
      searchResults: searchResults,
      query: query
    ));
  }
  
  void clearSearch() {
    searchResults = [];
    emit(HomeSuccess(allCoursesList: allCoursesList));
  }
}