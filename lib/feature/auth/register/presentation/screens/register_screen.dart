import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/feature/auth/login/views/widgets/do_not_have_an_account.dart';
import 'package:edunexus/feature/auth/login/views/widgets/lable_text.dart';
import 'package:edunexus/feature/auth/register/presentation/widgets/form_sign_up.dart';
import 'package:edunexus/feature/auth/register/presentation/widgets/sign_up_title_text_widget.dart';
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
              SignUpTitleTextWidget(
                title: 'Create Account',
                style: AppTextStyle.poppins36w600primaryColor,
              ),
              SignUpTitleTextWidget(
                title: 'Welcome! Sign up to continue!',
                style: AppTextStyle.poppins12greyColor,
              ),
              SizedBox(height: 40.h),
              LableText(text: "Name"),
              SizedBox(height: 10.h),
              FormSignUp(),
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
