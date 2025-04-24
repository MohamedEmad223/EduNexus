import 'package:edunexus/feature/auth/register/data/model/sign_up_model.dart';
import 'package:edunexus/feature/auth/register/data/repo/sign_up_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.signUpRepository) : super(SignupInitial());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final SignUpRepository signUpRepository;

  Future<void> signUp(String path, Map<String, dynamic> data) async {
    emit(SignupLoading());

    final result = await signUpRepository.signUp(path, data);
    result.fold(
      (error) => emit(SignupError(errorMessage: error)),
      (signUpModel) => emit(SignupSuccess(signUpModel: signUpModel)),
    );
  }
}
