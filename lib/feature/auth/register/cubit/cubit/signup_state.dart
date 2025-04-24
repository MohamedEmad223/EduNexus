part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {
  final SignUpModel signUpModel;

  SignupSuccess(this.signUpModel);
}

final class SignupError extends SignupState {
  final String errorMessage;

  SignupError(this.errorMessage);
}
