import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/core/widgets/text_form_feild.dart';
import 'package:edunexus/feature/auth/login/views/widgets/do_not_have_an_account.dart';
import 'package:edunexus/feature/auth/login/views/widgets/lable_text.dart';
import 'package:edunexus/feature/auth/register/view/widgets/drop_down_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 50.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Create Account',
                  style: AppTextStyle.poppins36w600primaryColor,
                ),
              ),
              Center(
                child: Text(
                  'Welcome! Sign up to continue!',
                  style: AppTextStyle.poppins12greyColor,
                ),
              ),
              SizedBox(height: 40.h),
              LableText(text: "Name"),
              SizedBox(height: 10.h),
              AppTextFormField(
                hintText: "Enter your name",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your Name";
                  } else if (value.length < 3) {
                    return "Name must be at least 3 characters long";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.h),
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
              SizedBox(height: 20.h),
              LableText(text: "Role"),
              SizedBox(height: 10.h),
              DropDownWidgets(),
              SizedBox(height: 50.h),
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
                    "Register",
                    style: AppTextStyle.poppins14BoldwhiteColor,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              DoNotHaveAnAccount(
                text: "Login",
                onPressed:
                    () => Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/login',
                      (route) => false,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
