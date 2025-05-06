part of 'videocheck_cubit.dart';

abstract class VideocheckState {}

class VideocheckInitial extends VideocheckState {}

class VideocheckLoading extends VideocheckState {}

class VideocheckLoaded extends VideocheckState {
  final CheckVideoModel checkVideoModel;

  VideocheckLoaded({required this.checkVideoModel});
}

class VideocheckError extends VideocheckState {
  final String? message;

  VideocheckError({this.message});
}

class VideocheckCompleteLoading extends VideocheckState {}

class VideocheckCompleteSuccess extends VideocheckState {
  final String? message;

  VideocheckCompleteSuccess({required this.message});
}

class VideocheckCompleteError extends VideocheckState {
  final String? message;

  VideocheckCompleteError({this.message});
}