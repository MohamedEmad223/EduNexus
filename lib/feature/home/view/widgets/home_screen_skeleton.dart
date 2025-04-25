import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreenSkeleton extends StatelessWidget {
  const HomeScreenSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.h,
              vertical: 20.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 24.w,
                  height: 24.h,
                  color: Colors.grey[300],
                ),
                SizedBox(height: 20.h),
                _buildUserInfoPlaceholder(),
                SizedBox(height: 50.h),
                Container(
                  height: 100.h,
                  width: double.infinity,
                  color: Colors.grey[300],
                ),
                SizedBox(height: 20.h),
                Text(
                  'Top Categories',
                  style: AppTextStyle.poppins20BoldblackColor,
                ),
                SizedBox(height: 20.h),
                _buildCategoriesPlaceholder(),
                SizedBox(height: 20.h),
                Text(
                  'Top Courses',
                  style: AppTextStyle.poppins20BoldblackColor,
                ),
                SizedBox(height: 20.h),
                _buildCoursesGridPlaceholder(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfoPlaceholder() {
    return Row(
      children: [
        Container(
          width: 50.w,
          height: 50.h,
          decoration:  BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[300],
          ),
        ),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100.w,
              height: 16.h,
              color: Colors.grey[300],
            ),
            SizedBox(height: 8.h),
            Container(
              width: 150.w,
              height: 14.h,
              color: Colors.grey[300],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoriesPlaceholder() {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Container(
              width: 100.w,
              height: 30.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(16.sp),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCoursesGridPlaceholder() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  color: Colors.grey[300],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100.w,
                      height: 16.h,
                      color: Colors.grey[300],
                    ),
                    SizedBox(height: 4.h),
                    Container(
                      width: 120.w,
                      height: 14.h,
                      color: Colors.grey[300],
                    ),
                    SizedBox(height: 4.h),
                    Container(
                      width: 50.w,
                      height: 14.h,
                      color: Colors.grey[300],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}