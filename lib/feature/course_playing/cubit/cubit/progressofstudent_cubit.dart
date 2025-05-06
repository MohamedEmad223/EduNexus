import 'package:edunexus/core/helper/app_constants.dart';
import 'package:edunexus/core/helper/shared_pref_helper.dart';
import 'package:edunexus/feature/course_playing/data/models/get_progress_of_student_model.dart';
import 'package:edunexus/feature/course_playing/data/repos/get_progress_of_student_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'progressofstudent_state.dart';

class ProgressofstudentCubit extends Cubit<ProgressofstudentState> {
  ProgressofstudentCubit(this.getProgressOfStudentRepo)
    : super(ProgressofstudentInitial());

  final GetProgressOfStudentRepo getProgressOfStudentRepo;

  Future<void> getAllLessons(String path) async {
    if (isClosed) return; // Prevent emit if already closed
    emit(ProgressofstudentLoading());

    final token =
        await CacheHelper().getSecuredData(key: AppConstants.token) ?? '';
    final result = await getProgressOfStudentRepo.getProgressOfStudent(
      path,
      token,
    );
    if (isClosed) return;
    result.fold(
      (error) {
        if (!isClosed) emit(ProgressofstudentError(message: error));
      },
      (getProgressOfStudentModel) {
        if (!isClosed) {
          emit(
            ProgressofstudentLoaded(
              getProgressOfStudentModel: getProgressOfStudentModel,
            ),
          );
        }
      },
    );
  }
}
