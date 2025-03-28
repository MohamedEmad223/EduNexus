import 'package:edunexus/core/helper/app_images.dart';
import 'package:edunexus/core/routes/routes.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/core/widgets/border_button_widgets.dart';
import 'package:edunexus/feature/on_boarding/widgets/text_widgets.dart';
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
              TextWidgets(),
              SizedBox(height: 100.h),
              SizedBox(
                height: 55.h,
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.login,
                      (route) => false,
                    );
                  },
                  color: AppColor.primaryColor,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.sp),
                  ),
                  child: Text(
                    "Login",
                    style: AppTextStyle.poppins14BoldwhiteColor,
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              BorderButtonWidgets(text: "Register", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
