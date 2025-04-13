import 'package:edunexus/core/helper/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageContainerWidgets extends StatelessWidget {
  const ImageContainerWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(right: 10.w),
        child: Container(
          height: 120.h,
          width: 120.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(60.r),
          ),
          child: Image.asset(
            AppImages.personIcon,
            width: 50.w,
            height: 50.h,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
