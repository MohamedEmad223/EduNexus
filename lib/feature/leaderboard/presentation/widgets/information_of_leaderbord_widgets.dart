import 'package:edunexus/core/helper/app_images.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InformationOfLeaderbordWidgets extends StatelessWidget {
  const InformationOfLeaderbordWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w),

        width: double.infinity,
        height: 55.h,
        decoration: BoxDecoration(
          color: AppColor.lightPinkColor,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          children: [
            Text(
              '1',
              style: AppTextStyle.poppins16w400blackColor.copyWith(
                fontSize: 14.sp,
              ),
            ),
            SizedBox(width: 20.w),
            CircleAvatar(
              radius: 20.r,
              backgroundImage: AssetImage(AppImages.twoleaderBoardImage),
            ),
            SizedBox(width: 20.w),

            Text(
              'Ali Asharf',
              style: AppTextStyle.poppins16w400blackColor.copyWith(
                fontSize: 14.sp,
              ),
            ),
            Spacer(),
            Text(
              '100 pts',
              style: AppTextStyle.poppins12greyColor.copyWith(
                fontSize: 14.sp,
                color: Color(0xff4F4F4F),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
