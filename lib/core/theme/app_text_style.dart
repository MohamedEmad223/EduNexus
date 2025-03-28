import 'package:edunexus/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle poppins20BoldblackColor = GoogleFonts.poppins(
    color: AppColor.blackColor,
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle poppins14BoldwhiteColor = GoogleFonts.poppins(
    color: AppColor.whiteColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );

    static TextStyle poppins14secondBlackColor = GoogleFonts.poppins(
    color: AppColor.secondBlackColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );

   static TextStyle poppins12greyColor = GoogleFonts.poppins(
    color: AppColor.greyColor,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );

   static TextStyle poppins14BoldprimaryColor = GoogleFonts.poppins(
    color: AppColor.primaryColor,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
  );
}
