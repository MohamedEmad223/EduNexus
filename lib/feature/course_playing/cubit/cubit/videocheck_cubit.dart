import 'package:edunexus/core/helper/app_constants.dart';
import 'package:edunexus/core/helper/shared_pref_helper.dart';
import 'package:edunexus/feature/course_playing/data/models/video_check_model.dart';
import 'package:edunexus/feature/course_playing/data/repos/video_check_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'videocheck_state.dart';

class VideocheckCubit extends Cubit<VideocheckState> {
  VideocheckCubit(this.videoCheckRepo) : super(VideocheckInitial());

  final VideoCheckRepo videoCheckRepo;

  Future<void> getAllLessons(String path) async {
    if (isClosed) return;
    emit(VideocheckLoading());

    final token =
        await CacheHelper().getSecuredData(key: AppConstants.token) ?? '';
    final result = await videoCheckRepo.checkVideo(path, token);

    if (isClosed) return;

    result.fold(
      (error) {
        if (!isClosed) emit(VideocheckError(message: error));
      },
      (allcheckVideoModel) {
        if (!isClosed) emit(VideocheckLoaded(checkVideoModel: allcheckVideoModel));
      },
    );
  }

  Future<void> completeCourse(String path) async {
    if (isClosed) return;
    emit(VideocheckCompleteLoading());

    final token =
        await CacheHelper().getSecuredData(key: AppConstants.token) ?? '';
    final result = await videoCheckRepo.completeCourse(path, token);

    if (isClosed) return;

    result.fold(
      (error) {
        if (!isClosed) emit(VideocheckCompleteError(message: error));
      },
      (message) {
        if (!isClosed) emit(VideocheckCompleteSuccess(message: message));
      },
    );
  }
}