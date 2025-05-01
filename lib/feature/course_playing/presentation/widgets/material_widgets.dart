import 'package:edunexus/core/helper/app_images.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/feature/home/data/model/all_courses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MaterialWidgets extends StatelessWidget {
  final String summary;
  final List<AllCoursesModel> allCoursesModel;
  const MaterialWidgets({super.key, required this.summary, required this.allCoursesModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Product Design v1.0',
                  style: AppTextStyle.poppins20BoldblackColor,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Text(
              '6h 14min · 24 Lessons',
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
            ),
            SizedBox(height: 30.h),
         
              Container(
                width: double.infinity,
                height: 80.h,
                decoration: BoxDecoration(
                  color: AppColor.secondaryColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [SvgPicture.asset(AppImages.fileIcone)],
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Create account on webflow.pdf'),
                        SizedBox(height: 5.h),
                        Text(
                          '2.5 MB',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.download,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            SizedBox(height: 20.h),
            Text('Summary', style: AppTextStyle.poppins20BoldblackColor),
            if (summary.isEmpty) const Text('No materials uploaded yet!'),
            if (summary.isNotEmpty) SizedBox(height: 8.h),
            ..._splitSummaryIntoLines(summary).map(
              (line) => Padding(
                padding: EdgeInsets.only(bottom: 6.h),
                child: Text(line, style: AppTextStyle.poppins14w300blackColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> _splitSummaryIntoLines(String summary) {
    // This regex splits before numbers like 1. 2. 3.
    final regex = RegExp(r'(?=\d+\.\s)');
    return summary
        .split(regex)
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
  }
}
