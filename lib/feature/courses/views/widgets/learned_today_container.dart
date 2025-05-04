import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LearnedTodayContainer extends StatelessWidget {
  final String progress; // Between 0.0 and 1.0
  final String displayProgress; // For "46min / 60min"

  const LearnedTodayContainer({
    super.key,
    required this.progress,
    required this.displayProgress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: AppColor.lightBlackColor.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(2, 0),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Learned today',
              style: AppTextStyle.poppins12w400lightdarkGreyColor,
            ),
            SizedBox(height: 5.h),
            RichText(
              text: TextSpan(
                text: displayProgress,
                style: AppTextStyle.poppins16w400blackColor,
              ),
            ),
            SizedBox(height: 10.h),
            LinearProgressIndicator(
              value: progress.isNotEmpty ? double.parse(progress) : 0.0,
              backgroundColor: AppColor.lightGreyColor,
              color: AppColor.primaryColor,
              minHeight: 5.h,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ],
        ),
      ),
    );
  }
}
