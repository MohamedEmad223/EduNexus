import 'package:edunexus/feature/auth/login/data/model/login_model.dart';
import 'package:edunexus/feature/auth/login/data/repo/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepository) : super(LoginInitial());

  final LoginRepository loginRepository;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login(String path, Map<String, dynamic> data) async {
    emit(LoginLoading());

    final result = await loginRepository.login(path, data);
    result.fold(
      (error) => emit(LoginError(errorMessage: error)),
      (loginModel) => emit(LoginSuccess(loginModel: loginModel)),
    );
  }
}
