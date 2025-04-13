import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/core/widgets/text_form_feild.dart';
import 'package:edunexus/feature/edit_profile/presentation/widgets/image_container_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: AppTextStyle.poppins16w600primaryColor,
        ),
        centerTitle: true,
        backgroundColor: AppColor.backGroundColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 50.h),
          child: Column(
            children: [
              ImageContainerWidgets(),
              SizedBox(height: 50.h),
              AppTextFormField(
                hintText: 'Enter your name',
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your Name";
                  }
                  return null;
                },
                backgroundColor: AppColor.lightPinkColor,
              ),
              SizedBox(height: 20.h),

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
                backgroundColor: AppColor.lightPinkColor,
              ),
              SizedBox(height: 20.h),

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
                backgroundColor: AppColor.lightPinkColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
