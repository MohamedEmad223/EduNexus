import 'package:cached_network_image/cached_network_image.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/feature/home/data/model/all_courses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartContainerWidgets extends StatelessWidget {
  const CartContainerWidgets({
    super.key,
    required this.course,
    required this.onRemove,
  });

  final AllCoursesModel course;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //height: 116.h,
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(5.r),
        boxShadow: [
          BoxShadow(
            color: AppColor.lightBlackColor.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(2, 0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5.r),
              bottomLeft: Radius.circular(5.r),
            ),
            child: CachedNetworkImage(
              width: 100.w,
              height: 125.h,
              fit: BoxFit.cover,
              placeholder:
                  (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.primaryColor,
                    ),
                  ),
              imageUrl: course.thumbnail ?? "there is no images",
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          course.title ?? 'Course Title',
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.poppins12w400lightdarkGreyColor
                              .copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColor.blackColor,
                              ),
                        ),
                      ),
                      IconButton(
                        onPressed: onRemove,
                        icon: Icon(Icons.delete, color: AppColor.primaryColor),
                      ),
                    ],
                  ),
                  Text(
                    'Mon, 23 Nov - Tue, 1 Dec',
                    style: AppTextStyle.poppins12w400lightdarkGreyColor
                        .copyWith(fontSize: 10.sp),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    '10:00 am - 11:00 am',
                    style: AppTextStyle.poppins12w400lightdarkGreyColor
                        .copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColor.lightBlueColor,
                        ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    '${course.price ?? '0'} EGP',
                    textAlign: TextAlign.right,
                    style: AppTextStyle.poppins12w400lightdarkGreyColor
                        .copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColor.blackColor,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
