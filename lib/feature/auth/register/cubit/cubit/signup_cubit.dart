import 'package:bloc/bloc.dart';
import 'package:edunexus/feature/auth/register/data/model/sign_up_model.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
}
