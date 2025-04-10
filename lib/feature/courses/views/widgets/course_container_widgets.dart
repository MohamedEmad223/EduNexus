import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseContainerWidgets extends StatelessWidget {
  const CourseContainerWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 192.w,
      decoration: BoxDecoration(
        color: AppColor.lightPinkColor,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: AppColor.lightBlackColor.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(2, 0),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'JavaScript for Beginners',
              style: AppTextStyle.poppins18w500lightBlackColor.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10.h),
            LinearProgressIndicator(
              value: 0.5,
              backgroundColor: AppColor.whiteColor,
              color: AppColor.pinkColor,
              minHeight: 5.h,
            ),
            SizedBox(height: 10.h),
            Text(
              'Completed',
              style: AppTextStyle.poppins18w500lightBlackColor.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              '14/24',
              style: AppTextStyle.poppins18w500lightBlackColor.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
