import 'package:bloc/bloc.dart';
import 'package:edunexus/feature/edit_profile/presentation/screens/data/model/updata_user_model.dart';
import 'package:meta/meta.dart';

part 'updateuser_state.dart';

class UpdateuserCubit extends Cubit<UpdateuserState> {
  UpdateuserCubit() : super(UpdateuserInitial());
}
