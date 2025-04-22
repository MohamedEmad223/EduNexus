import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/feature/questions/cubit/cubit/quiz_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnswerContainerWidgets extends StatelessWidget {
  const AnswerContainerWidgets({
    super.key,
    required this.answerText,
    required this.answerOption,
    this.onTap,
  });

  final String answerText;
  final String answerOption;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<QuizCubit>();
    final isSelected = cubit.selectedAnswers[cubit.currentIndex] == answerOption;

    return GestureDetector(
      onTap: onTap, // Allow taps even if an answer is selected
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        width: double.infinity,
        height: 60.h,
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primaryColor.withOpacity(0.1) : AppColor.whiteColor,
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(
            color: isSelected ? AppColor.primaryColor : AppColor.whiteColor,
            width: 2.w,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColor.lightGreyColor.withOpacity(0.5),
              blurRadius: 5.r,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 15.r,
              backgroundColor: isSelected
                  ? AppColor.primaryColor
                  : AppColor.scaffoldBackgroundColor,
              child: Text(
                answerOption,
                style: isSelected
                    ? AppTextStyle.poppins20BoldblackColor.copyWith(
                        color: AppColor.whiteColor,
                      )
                    : AppTextStyle.poppins20BoldblackColor,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Text(
                answerText,
                style: AppTextStyle.poppins16w400blackColor.copyWith(
                  fontSize: 14.sp,
                  color: isSelected ? AppColor.primaryColor : AppColor.blackColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}