import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowOfScoreWidgets extends StatelessWidget {
  const RowOfScoreWidgets({
    super.key,
    required this.iconImage,
    required this.scoreText,
    required this.scoreValue,
  });
  final String iconImage;
  final String scoreText;
  final String scoreValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20.r,
          backgroundColor: AppColor.lightPinkColor,
          child: Image.asset(iconImage),
        ),
        SizedBox(width: 10.w),
        Text(
          scoreText,
          style: AppTextStyle.poppins14secondBlackColor.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColor.darkBlueColor,
          ),
        ),
        Spacer(),
        Text(
          scoreValue,
          style: AppTextStyle.poppins14secondBlackColor.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColor.darkBlueColor,
          ),
        ),
      ],
    );
  }
}
