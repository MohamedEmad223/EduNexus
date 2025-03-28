import 'package:edunexus/core/helper/app_images.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/core/widgets/text_form_feild.dart';
import 'package:edunexus/feature/auth/login/views/widgets/do_not_have_an_account.dart';
import 'package:edunexus/feature/auth/login/views/widgets/lable_text.dart';
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
          padding: EdgeInsets.symmetric(horizontal: 20.0.h, vertical: 80.0.w),
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
              LableText(text: "Email"),
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
              SizedBox(height: 20.h),
              LableText(text: "Password"),
              SizedBox(height: 10.h),
              AppTextFormField(
                hintText: "Enter your password",
                isObscureText: true,
                suffixIcon: const Icon(Icons.visibility_off),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your password";
                  } else if (value.length < 6) {
                    return "Password must be at least 6 characters long";
                  }
                  return null;
                },
              ),
              SizedBox(height: 80.h),
              SizedBox(
                height: 55.h,
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {},
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
              DoNotHaveAnAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
