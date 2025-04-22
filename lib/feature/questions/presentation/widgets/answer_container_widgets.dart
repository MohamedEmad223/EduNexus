import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnswerContainerWidgets extends StatelessWidget {
  AnswerContainerWidgets({
    super.key,
    required this.answerText,
    required this.answerOption,
  });

 

  final String answerText;
  final String answerOption;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      width: double.infinity,
      height: 60.h,
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(5.r),
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
            backgroundColor: AppColor.scaffoldBackgroundColor,
            child: Text(
              answerOption,
              style: AppTextStyle.poppins20BoldblackColor,
            ),
          ),
          SizedBox(width: 10.w),
          Text(answerText, style: AppTextStyle.poppins16w400blackColor),
        ],
      ),
    );
  }
}
