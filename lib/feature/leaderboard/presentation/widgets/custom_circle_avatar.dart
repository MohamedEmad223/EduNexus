import 'package:edunexus/core/helper/app_images.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.all(4.sp),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.primaryColor,
          ),
          child: CircleAvatar(
            radius: 40.sp,
            backgroundImage: AssetImage(AppImages.twoleaderBoardImage),
          ),
        ),
        Positioned(
          left: 20.sp,
          right: 20.sp,
          bottom: 70.sp,
          child: Image.asset(AppImages.crownIcone),
        ),
        Positioned(
          top: 65.sp,
          left: 20.sp,
          right: 20.sp,
          child: CircleAvatar(
            backgroundColor: AppColor.primaryColor,
            child: Text(
              '2',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.whiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
