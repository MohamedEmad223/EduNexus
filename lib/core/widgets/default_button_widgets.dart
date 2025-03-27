import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultButtonWidgets extends StatelessWidget {
  const DefaultButtonWidgets({super.key, required this.text, this.onPressed});
  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        color: Color(0xffFF6636),
        textColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Text(text, style: AppTextStyle.poppins14BoldwhiteColor),
      ),
    );
  }
}
