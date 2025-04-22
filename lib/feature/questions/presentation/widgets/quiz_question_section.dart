
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/feature/questions/cubit/cubit/quiz_cubit.dart';
import 'package:edunexus/feature/questions/presentation/widgets/answer_container_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizQuestionSection extends StatelessWidget {
  const QuizQuestionSection({
    super.key,
    required this.currentIndex,
    required this.questionData,
    required this.cubit,
  });

  final int currentIndex;
  final Map<String, dynamic> questionData;
  final QuizCubit cubit;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      transitionBuilder: (child, animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      child: Column(
        key: ValueKey(currentIndex),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            questionData['question'],
            style: AppTextStyle.poppins18w500lightBlackColor,
          ),
          SizedBox(height: 20.h),
          ...List.generate(
            questionData['options'].length,
            (i) => Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: AnswerContainerWidgets(
                answerOption: String.fromCharCode(65 + i),
                answerText: questionData['options'][i],
                onTap: () {
                  cubit.selectAnswer(String.fromCharCode(65 + i));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
