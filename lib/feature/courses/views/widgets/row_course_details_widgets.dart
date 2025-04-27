import 'package:edunexus/core/helper/app_images.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowCourseDetailsWidgets extends StatefulWidget {
  const RowCourseDetailsWidgets({
    super.key,
    required this.index,
    required this.title,
    required this.time,
    required this.isFinshed,
    required this.isPurshesed,
  });
  final String index;
  final String title;
  final String time;
  final bool isFinshed;
  final bool isPurshesed;

  @override
  State<RowCourseDetailsWidgets> createState() =>
      _RowCourseDetailsWidgetsState();
}

class _RowCourseDetailsWidgetsState extends State<RowCourseDetailsWidgets> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Index number
        Text(
          widget.index,
          style: AppTextStyle.poppins12w400lightdarkGreyColor.copyWith(
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(width: 10.w),

        // Done icon (conditionally visible)
        Visibility(
          visible: widget.isFinshed,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Image.asset(AppImages.doneIcone, width: 20.w, height: 20.h),
        ),
        SizedBox(width: 10.w),

        // Title & time
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title, style: TextStyle(fontSize: 14.sp)),
              SizedBox(height: 4.h),
              Text(
                widget.time,
                style: AppTextStyle.poppins12greyColor.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.primaryColor,
                ),
              ),
            ],
          ),
        ),

        // Play icon
        CircleAvatar(
          radius: 20.r,
          backgroundColor:
              widget.isPurshesed
                  ? AppColor.primaryColor
                  : AppColor.primaryColor,
          child:
              widget.isPurshesed
                  ? Icon(Icons.pause, color: Colors.white, size: 30.sp)
                  : Icon(Icons.quiz, color: Colors.white, size: 25.sp),
        ),
      ],
    );
  }
}
