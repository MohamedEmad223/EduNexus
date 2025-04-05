import 'package:edunexus/core/helper/app_images.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InformationOfUserWidget extends StatelessWidget {
  const InformationOfUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hi! Ali', style: AppTextStyle.poppins16w400blackColor),
            Text(
              'What do you wanna learn today?',
              style: AppTextStyle.poppins14w300blackColor,
            ),
          ],
        ),
        const Spacer(),
        Container(
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(25.r),
          ),
          child: Image.asset(AppImages.personIcon),
        ),
      ],
    );
  }
}
