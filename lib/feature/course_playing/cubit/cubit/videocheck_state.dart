part of 'videocheck_cubit.dart';

@immutable
sealed class VideocheckState {}

final class VideocheckInitial extends VideocheckState {}


final class VideocheckLoading extends VideocheckState {}

final class VideocheckLoaded extends VideocheckState {
  final CheckVideoModel checkVideoModel;

  VideocheckLoaded({required this.checkVideoModel});
}


final class VideocheckError extends VideocheckState {
  final String message;

  VideocheckError({required this.message});
}
