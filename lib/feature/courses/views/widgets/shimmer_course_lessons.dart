import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCourseLessons extends StatelessWidget {
  const ShimmerCourseLessons({super.key});

  @override
  Widget build(BuildContext context) {
    return 
   ListView.separated(
    itemCount: 4, 
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    separatorBuilder: (_, __) => SizedBox(height: 10.h),
    itemBuilder: (context, index) {
      return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: ListTile(
          leading: Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          title: Container(
            height: 12.h,
            width: double.infinity,
            color: Colors.white,
          ),
          subtitle: Container(
            height: 10.h,
            width: 200.w,
            color: Colors.white,
          ),
        ),
      );
    },
  );
}

  }
