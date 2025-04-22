
import 'package:edunexus/core/helper/app_images.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuizHeader extends StatelessWidget {
  const QuizHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Quiz',
          style: AppTextStyle.poppins18secondBlackColor,
        ),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: CircleAvatar(
            radius: 15.r,
            backgroundColor: AppColor.whiteColor,
            child: SvgPicture.asset(AppImages.cancelIcone),
          ),
        ),
      ],
    );
  }
}
