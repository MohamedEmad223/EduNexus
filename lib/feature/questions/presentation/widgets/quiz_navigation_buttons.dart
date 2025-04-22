import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/feature/questions/cubit/cubit/quiz_cubit.dart';
import 'package:edunexus/feature/result/presentation/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizNavigationButtons extends StatelessWidget {
  const QuizNavigationButtons({
    super.key,
    required this.currentIndex,
    required this.totalQuestions,
    required this.cubit,
  });

  final int currentIndex;
  final int totalQuestions;
  final QuizCubit cubit;

  static const double _buttonWidth = 80.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        currentIndex > 0
            ? _buildButton(
              text: "Back",
              onPressed: () => cubit.previousQuestion(),
            )
            : SizedBox(width: _buttonWidth.w),
        _buildButton(
          text: currentIndex == totalQuestions - 1 ? "Finish" : "Next",
          onPressed:
              cubit.selectedAnswers[cubit.currentIndex] != null
                  ? () {
                    if (currentIndex < totalQuestions - 1) {
                      cubit.nextQuestion();
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => ResultScreen(
                                score: cubit.getScore(),
                                totalQuestions: cubit.totalQuestions,
                              ),
                        ),
                      );
                    }
                  }
                  : null,
        ),
      ],
    );
  }

  Widget _buildButton({
    required String text,
    required VoidCallback? onPressed,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      ),
      onPressed: onPressed,
      child: Text(text, style: AppTextStyle.poppins14BoldwhiteColor),
    );
  }
}
