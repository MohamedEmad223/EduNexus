import 'package:edunexus/core/helper/app_images.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowCourseDetailsWidgets extends StatelessWidget {
  const RowCourseDetailsWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Index number
                        Text('01', style: TextStyle(fontSize: 14.sp)),
                        SizedBox(width: 10.w),

                        // Status icon
                        Image.asset(
                          AppImages.doneIcone,
                          width: 20.w,
                          height: 20.h,
                        ),
                        SizedBox(width: 10.w),
                        // Title and duration
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome to the Course',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                '6:10 min',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        CircleAvatar(
                          radius: 20.r,
                          backgroundColor: AppColor.primaryColor,
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 30.sp,
                          ),
                        ),
                      ],
                    );
  }
}