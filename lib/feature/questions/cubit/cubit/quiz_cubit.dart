import 'package:flutter_bloc/flutter_bloc.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial()) {
    // Initialize selectedAnswers with null for each question
    selectedAnswers = List.filled(quizData.length, null);
  }

  final List<Map<String, dynamic>> quizData = [
    {
      'question':
          'Which of the following is not a principle of Object-Oriented Programming?',
      'options': [
        'Encapsulation',
        'Polymorphism',
        'Inheritance',
        'Compilation',
      ],
      'answer': 'D',
    },
    {
      'question': 'What is the main purpose of encapsulation in OOP?',
      'options': [
        'To reduce the size of the code',
        'To protect data by restricting access',
        'To allow multiple inheritance',
        'To write procedural code',
      ],
      'answer': 'B',
    },
    {
      'question': 'Which OOP concept allows objects to take many forms?',
      'options': [
        'Abstraction',
        'Encapsulation',
        'Polymorphism',
        'Inheritance',
      ],
      'answer': 'C',
    },
    {
      'question': 'In OOP, what is a class?',
      'options': [
        'A blueprint for creating objects',
        'A type of loop',
        'A data structure for storing integers',
        'A function that returns a value',
      ],
      'answer': 'A',
    },
    {
      'question':
          'Which of the following allows a class to use properties and methods of another class?',
      'options': [
        'Encapsulation',
        'Abstraction',
        'Inheritance',
        'Function Overloading',
      ],
      'answer': 'C',
    },
  ];

  int currentIndex = 0;
  late List<String?> selectedAnswers; // Store user answers (A, B, C, D, or null)

  int get totalQuestions => quizData.length;

  void selectAnswer(String answer) {
    selectedAnswers[currentIndex] = answer;
    emit(QuizAnswerSelected(answer));
  }

  int getScore() {
    int score = 0;
    for (int i = 0; i < quizData.length; i++) {
      if (selectedAnswers[i] == quizData[i]['answer']) {
        score++;
      }
    }
    return score;
  }

  void nextQuestion() {
    if (currentIndex < totalQuestions - 1) {
      currentIndex++;
      emit(QuizQuestionChanged(currentIndex));
    } else {
      emit(QuizCompleted());
    }
  }

  void previousQuestion() {
    if (currentIndex > 0) {
      currentIndex--;
      emit(QuizQuestionChanged(currentIndex));
    }
  }

  void restartQuiz() {
    currentIndex = 0;
    selectedAnswers = List.filled(quizData.length, null); // Reset answers
    emit(QuizQuestionChanged(currentIndex));
  }
}