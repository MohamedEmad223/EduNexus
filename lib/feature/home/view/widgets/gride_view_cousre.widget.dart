import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/feature/home/data/model/all_courses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GrideViewCousre extends StatelessWidget {
  const GrideViewCousre({super.key, this.onPressed, this.course});
  final void Function()? onPressed;

  final AllCoursesModel? course;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/home/img-container.png',
              width: 188.w,
              height: 150.h,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('intro to oop'),
            ),
            Padding(padding: const EdgeInsets.all(8.0), child: Text('100 EGP')),
          ],
        ),
      ),
    );
  }
}
