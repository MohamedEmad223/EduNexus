import 'package:edunexus/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizProgressBar extends StatelessWidget {
  const QuizProgressBar({
    super.key,
    required this.currentIndex,
    required this.totalQuestions,
  });

  final int currentIndex;
  final int totalQuestions;

  static const double _progressBarWidth = 300.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: _progressBarWidth.w,
          child: LinearProgressIndicator(
            value: (currentIndex + 1) / totalQuestions,
            backgroundColor: AppColor.whiteColor,
            color: AppColor.primaryColor,
            minHeight: 5.h,
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        Text("${currentIndex + 1}/$totalQuestions"),
      ],
    );
  }
}
