import 'package:edunexus/core/helper/app_images.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            children: [
              SizedBox(height: 50.h),
              SvgPicture.asset(AppImages.onBoardingImage),
              Text(
                "Find yourself by doing\n whatever you do",
                textAlign: TextAlign.center,
                style: AppTextStyle.poppins20BoldblackColor,
              ),
              SizedBox(height: 100.h),
              SizedBox(
                height: 55.h,
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {},
                  color: Color(0xffFF6636),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "Login",
                    style: AppTextStyle.poppins14BoldwhiteColor,
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              SizedBox(
                height: 55.h,
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.white,
                  textColor: AppColor.primaryColor,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: AppColor.primaryColor,
                      width: 2.5.w,
                    ),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Text(
                    "Register",
                    style: AppTextStyle.poppins14BoldprimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
