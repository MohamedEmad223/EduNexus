import 'package:edunexus/core/helper/app_images.dart';
import 'package:edunexus/feature/home/view/widgets/information_of_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.w),
          child: Column(
            children: [
              InformationOfUserWidget(),
              SizedBox(height: 50.h),
              Image.asset(AppImages.learn),
            ],
          ),
        ),
      ),
    );
  }
}
