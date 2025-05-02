import 'package:bloc/bloc.dart';
import 'package:edunexus/feature/course_playing/data/models/video_check_model.dart';
import 'package:meta/meta.dart';

part 'videocheck_state.dart';

class VideocheckCubit extends Cubit<VideocheckState> {
  VideocheckCubit() : super(VideocheckInitial());
}
