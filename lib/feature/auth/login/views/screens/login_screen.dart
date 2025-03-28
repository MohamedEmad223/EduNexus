import 'package:edunexus/core/helper/app_images.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.h, vertical: 70.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  AppImages.splashLogo,
                  alignment: Alignment.center,
                ),
              ),
              SizedBox(height: 80.h),
              Text("Email", style: AppTextStyle.poppins14secondBlackColor),
            ],
          ),
        ),
      ),
    );
  }
}
