import 'package:edunexus/core/helper/app_constants.dart' show AppConstants;
import 'package:edunexus/core/helper/shared_pref_helper.dart';
import 'package:edunexus/feature/course_playing/data/models/video_check_model.dart';
import 'package:edunexus/feature/course_playing/data/repos/video_check_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'videocheck_state.dart';

class VideocheckCubit extends Cubit<VideocheckState> {
  VideocheckCubit(this.videoCheckRepo) : super(VideocheckInitial());

  final VideoCheckRepo videoCheckRepo;

  Future<void> getAllLessons(String path) async {
    emit(VideocheckLoading());

    final token =
        await CacheHelper().getSecuredData(key: AppConstants.token) ?? '';
    final result = await videoCheckRepo.checkVideo(path, token);
    result.fold((error) => emit(VideocheckError(message: error)), (
      allcheckVideoModel,
    ) {
      emit(VideocheckLoaded(checkVideoModel: allcheckVideoModel));
    });
  }
}
