
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/feature/questions/cubit/cubit/quiz_cubit.dart';
import 'package:edunexus/feature/questions/presentation/widgets/quiz_header.dart';
import 'package:edunexus/feature/questions/presentation/widgets/quiz_navigation_buttons.dart';
import 'package:edunexus/feature/questions/presentation/widgets/quiz_progress_bar.dart';
import 'package:edunexus/feature/questions/presentation/widgets/quiz_question_section.dart' show QuizQuestionSection;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({super.key});

  static const double _horizontalPadding = 15.0;
  static const double _verticalSpacing = 50.0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(
      builder: (context, state) {
        final cubit = context.read<QuizCubit>();
        final index = cubit.currentIndex;
        final total = cubit.totalQuestions;
        final questionData = cubit.quizData[index];

        return Scaffold(
          backgroundColor: AppColor.secondaryColor,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: _horizontalPadding.w),
              child: Column(
                children: [
                  const QuizHeader(),
                  SizedBox(height: _verticalSpacing.h),
                  QuizProgressBar(currentIndex: index, totalQuestions: total),
                  SizedBox(height: _verticalSpacing.h),
                  QuizQuestionSection(
                    currentIndex: index,
                    questionData: questionData,
                    cubit: cubit,
                  ),
                  const Spacer(),
                  QuizNavigationButtons(
                    currentIndex: index,
                    totalQuestions: total,
                    cubit: cubit,
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
