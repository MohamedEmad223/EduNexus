import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BorderButtonWidgets extends StatelessWidget {
  const BorderButtonWidgets({super.key, required this.text, this.onPressed});

  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        color: Colors.white,
        textColor: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColor.primaryColor, width: 2.5.w),
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Text(text, style: AppTextStyle.poppins14BoldprimaryColor),
      ),
    );
  }
}
