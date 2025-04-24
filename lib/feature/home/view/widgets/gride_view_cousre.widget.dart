import 'package:cached_network_image/cached_network_image.dart';
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
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r),
              ),
              child: CachedNetworkImage(
                imageUrl: course?.thumbnail ?? 'There is no image',
                height: 100.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                course?.title ?? 'There is no title',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                course?.description ?? 'There is no description',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(course?.category ?? 'There is no category'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(course?.rate != null ? '${course!.rate}' : 'No rate'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                course?.price != null ? '\$${course!.price}' : 'No price',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
