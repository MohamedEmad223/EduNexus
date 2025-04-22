part of 'quiz_cubit.dart';

abstract class QuizState {}

class QuizInitial extends QuizState {}

class QuizQuestionChanged extends QuizState {
  final int currentIndex;

  QuizQuestionChanged(this.currentIndex);
}

class QuizAnswerSelected extends QuizState {
  final String selectedAnswer;

  QuizAnswerSelected(this.selectedAnswer);
}

class QuizCompleted extends QuizState {}