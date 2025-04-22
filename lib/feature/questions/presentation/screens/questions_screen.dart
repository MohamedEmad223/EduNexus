import 'package:edunexus/core/helper/app_images.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/feature/questions/presentation/widgets/answer_container_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Quize', style: AppTextStyle.poppins18secondBlackColor),
                  CircleAvatar(
                    radius: 15.r,
                    backgroundColor: AppColor.whiteColor,
                    child: SvgPicture.asset(AppImages.cancelIcone),
                  ),
                ],
              ),
              SizedBox(height: 50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 300.w,
                    child: LinearProgressIndicator(
                      value: 0.1,
                      backgroundColor: AppColor.whiteColor,
                      color: AppColor.primaryColor,
                      minHeight: 5.h,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  Text("5/1"),
                ],
              ),
              SizedBox(height: 50.h),

              Text(
                'Which of the following is not a principle of Object-Oriented Programming?',
                style: AppTextStyle.poppins18w500lightBlackColor,
              ),
              SizedBox(height: 20.h),
              AnswerContainerWidgets(
                answerOption: 'A',
                answerText: 'Abstraction',
              ),
              SizedBox(height: 20.h),
              AnswerContainerWidgets(
                answerOption: 'B',
                answerText: 'Polymorphism',
              ),
              SizedBox(height: 20.h),
              AnswerContainerWidgets(
                answerOption: 'C',
                answerText: 'Inheritance',
              ),
              SizedBox(height: 20.h),
              AnswerContainerWidgets(
                answerOption: 'D',
                answerText: 'Compilation',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
