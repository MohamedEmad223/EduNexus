import 'package:edunexus/core/helper/app_images.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/core/widgets/text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              SizedBox(height: 10.h),
              AppTextFormField(
                hintText: "Enter your email",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your email";
                  } else if (!RegExp(
                    r"^[a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]+",
                  ).hasMatch(value)) {
                    return "Please enter a valid email address";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
