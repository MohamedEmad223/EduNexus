import 'package:edunexus/core/helper/app_images.dart';
import 'package:edunexus/core/widgets/border_button_widgets.dart';
import 'package:edunexus/core/widgets/default_button_widgets.dart';
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
              DefaultButtonWidgets(text: "Login"),
              SizedBox(height: 50.h),
              BorderButtonWidgets(text: "Register"),
            ],
          ),
        ),
      ),
    );
  }
}
