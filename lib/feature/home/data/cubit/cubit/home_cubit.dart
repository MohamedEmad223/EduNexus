import 'package:bloc/bloc.dart';
import 'package:edunexus/feature/home/data/model/all_courses.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
}
