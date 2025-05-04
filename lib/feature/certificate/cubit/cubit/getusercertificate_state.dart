part of 'getusercertificate_cubit.dart';

sealed class GetusercertificateState {}

final class GetusercertificateInitial extends GetusercertificateState {}

final class GetusercertificateLoading extends GetusercertificateState {}

final class GetusercertificateSuccess extends GetusercertificateState {
  final UserCertificateModel? userCertificateModel;

  GetusercertificateSuccess({required this.userCertificateModel});
}

final class GetusercertificateFailure extends GetusercertificateState {
  final String? error;

  GetusercertificateFailure({required this.error});
}
