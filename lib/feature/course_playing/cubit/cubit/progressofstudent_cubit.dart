import 'package:bloc/bloc.dart';
import 'package:edunexus/feature/course_playing/data/models/get_progress_of_student_model.dart';
import 'package:meta/meta.dart';

part 'progressofstudent_state.dart';

class ProgressofstudentCubit extends Cubit<ProgressofstudentState> {
  ProgressofstudentCubit() : super(ProgressofstudentInitial());
}
