import 'package:edunexus/core/helper/app_images.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/feature/courses/views/widgets/add_to_cart_widgets.dart';
import 'package:edunexus/feature/courses/views/widgets/row_course_details_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Main content layout
            Column(
              children: [
                // Image part
                Image.asset(
                  AppImages.courseDetails,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300.h,
                ),
              ],
            ),

            // Floating container above bottom of the image
            Positioned(
              top: 250.h, // Adjust to control how much it overlaps
              left: 0.w,
              right: 0.w,
              child: Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title and price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Product Design v1.0',
                          style: AppTextStyle.poppins20BoldblackColor,
                        ),
                        Text(
                          '\$74.00',
                          style: AppTextStyle.poppins16w600primaryColor,
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      '6h 14min · 24 Lessons',
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      'About this course',
                      style: AppTextStyle.poppins20BoldblackColor.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.',
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                    SizedBox(height: 30.h),
                    RowCourseDetailsWidgets(),
                  ],
                ),
              ),
            ),

            AddToCartWidgets(),
          ],
        ),
      ),
    );
  }
}
