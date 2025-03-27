import 'package:edunexus/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle poppins20BoldprimiryColor = GoogleFonts.poppins(
    color: AppColor.primaryColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static TextStyle poppins20BoldwhiteColor = GoogleFonts.poppins(
    color: AppColor.whiteColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
}
