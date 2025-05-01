import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/feature/course_playing/presentation/screens/course_playing_screen.dart';
import 'package:edunexus/feature/home/data/model/all_courses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseContainerWidgets extends StatelessWidget {
  const CourseContainerWidgets({super.key, required this.allCoursesModel});

  final AllCoursesModel allCoursesModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 192.w,
      decoration: BoxDecoration(
        color: AppColor.lightPinkColor,
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
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  allCoursesModel.title ?? 'No title',
                  maxLines: 1,
                  style: AppTextStyle.poppins18w500lightBlackColor.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20.h),
                LinearProgressIndicator(
                  value: 0.5,
                  backgroundColor: AppColor.whiteColor,
                  color: AppColor.pinkColor,
                  minHeight: 5.h,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                SizedBox(height: 10.h),
                Text(
                  allCoursesModel.description ?? 'No description',
                  maxLines: 1,
                  style: AppTextStyle.poppins18w500lightBlackColor.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
            if (allCoursesModel.lessons != null &&
                allCoursesModel.lessons!.isNotEmpty)
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => CoursePlayingScreen(
                                CourseId: allCoursesModel.sId ?? '',
                                allCoursesModel: allCoursesModel,
                              ),
                        ),
                      ),
                  child: CircleAvatar(
                    radius: 20.r,
                    backgroundColor: AppColor.whiteColor,
                    child: Icon(
                      Icons.play_arrow,
                      color: AppColor.primaryColor,
                      size: 30.sp,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
