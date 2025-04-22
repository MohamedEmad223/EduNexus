import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());

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

  int get totalQuestions => quizData.length;

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
    emit(QuizQuestionChanged(currentIndex));
  }
}
