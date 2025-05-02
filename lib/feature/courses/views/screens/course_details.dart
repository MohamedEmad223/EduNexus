import 'package:cached_network_image/cached_network_image.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/feature/home/data/model/all_courses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({super.key, this.allCoursesModel});
  final AllCoursesModel? allCoursesModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                CachedNetworkImage(
                  imageUrl: allCoursesModel?.thumbnail ?? 'There is no image',
                  placeholder:
                      (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300.h,
                ),
              ],
            ),
            Positioned(
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: AppColor.whiteColor),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Positioned(
              top: 250.h,
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
                          allCoursesModel?.title ?? 'There is no title',
                          style: AppTextStyle.poppins20BoldblackColor.copyWith(
                            fontSize: 20.sp,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Text(
                          allCoursesModel?.price != null
                              ? '\$${allCoursesModel!.price}'
                              : 'No price',
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
                      allCoursesModel?.description ?? 'There is no description',
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      "Catregory",
                      style: AppTextStyle.poppins20BoldblackColor,
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      allCoursesModel?.category ?? 'There is no description',
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
