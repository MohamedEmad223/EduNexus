import 'package:edunexus/core/helper/app_images.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EditRowWidget extends StatelessWidget {
  const EditRowWidget({
    super.key,
    required this.text,
    this.onPressed,
    this.imagePath,
  });
  final String text;
  final Function()? onPressed;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: AppColor.backGroundColor,
            borderRadius: BorderRadius.circular(25.r),
          ),
        
          height: 65.h,
          width: double.infinity,
          child: Row(
            children: [
              SvgPicture.asset(imagePath ?? 'error in path'),
              SizedBox(width: 10.w),
              Text(text, style: AppTextStyle.poppins14w300threedBlackColor),
              Spacer(),
              SvgPicture.asset(AppImages.arrowIcon),
            ],
          ),
        ),
      ),
    );
  }
}
