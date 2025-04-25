import 'package:edunexus/core/helper/app_images.dart';
import 'package:edunexus/core/routes/routes.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/feature/result/presentation/widgets/row_of_score_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, this.score, this.totalQuestions});

  final int? score;
  final int? totalQuestions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Center(child: Image.asset(AppImages.resultScreen)),
              SizedBox(height: 50.h),
              Text(
                'Results of Fantasy Quiz #156',
                style: AppTextStyle.poppins14secondBlackColor.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.darkBlueColor,
                ),
              ),
              SizedBox(height: 40.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  children: [
                    RowOfScoreWidgets(
                      iconImage: AppImages.icon,
                      scoreText: 'SCORE GAINED',
                      scoreValue: score.toString(),
                    ),
                    Divider(color: AppColor.lightGreyColor, thickness: 1.h),
                    RowOfScoreWidgets(
                      iconImage: AppImages.correctIcon,
                      scoreText: 'CORRECT ANSWERS',
                      scoreValue: totalQuestions.toString(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 150.h),
              SizedBox(
                height: 55.h,
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      Routes.botNavBar,
                      arguments: 0,
                    );
                  },
                  color: AppColor.primaryColor,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.sp),
                  ),
                  child: Text(
                    "Continue",
                    style: AppTextStyle.poppins14BoldwhiteColor,
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
