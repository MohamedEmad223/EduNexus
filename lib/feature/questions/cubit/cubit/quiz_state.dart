part of 'quiz_cubit.dart';

@immutable
sealed class QuizState {}

final class QuizInitial extends QuizState {}

class QuizQuestionChanged extends QuizState {
  final int currentIndex;

  QuizQuestionChanged(this.currentIndex);
}

class QuizCompleted extends QuizState {}
