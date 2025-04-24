import 'package:bloc/bloc.dart';
import 'package:edunexus/feature/auth/login/data/model/login_model.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
}
