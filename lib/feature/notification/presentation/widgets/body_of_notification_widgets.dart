import 'package:edunexus/core/helper/app_images.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodyOfNotificationWidgets extends StatelessWidget {
  const BodyOfNotificationWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // soft shadow
            offset: Offset(0, 4), // x: 0, y: 4 => bottom shadow
            blurRadius: 10, // blur to make it smooth
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        textBaseline: TextBaseline.alphabetic,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        children: [
          SizedBox(width: 20.w),
          Container(
            width: 56.w,
            height: 56.h,
            decoration: BoxDecoration(
              color: AppColor.lightPinkColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Image.asset(AppImages.notificationIcon),
          ),
          SizedBox(width: 20.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'No notifications yet',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.blackColor,
                ),
              ),
              Text(
                'No notifications yet',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.blackColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
