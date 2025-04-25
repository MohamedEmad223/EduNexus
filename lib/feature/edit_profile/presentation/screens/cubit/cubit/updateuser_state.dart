part of 'updateuser_cubit.dart';

@immutable
sealed class UpdateuserState {}

final class UpdateuserInitial extends UpdateuserState {}

final class UpdateuserLoading extends UpdateuserState {}

final class UpdateuserSuccess extends UpdateuserState {
  final UpdateUserModel updateUserModel;

  UpdateuserSuccess({required this.updateUserModel});
}

final class UpdateuserError extends UpdateuserState {
  final String errorMessage;

  UpdateuserError({required this.errorMessage});
}
