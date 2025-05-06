import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/feature/courses/views/screens/course_details.dart';
import 'package:edunexus/feature/home/data/model/all_courses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class searchWidgets extends StatelessWidget {
  const searchWidgets({
    super.key,
    required String searchQuery,
    required this.filteredCourses,
  }) : _searchQuery = searchQuery;

  final String _searchQuery;
  final List<AllCoursesModel> filteredCourses;

  @override
  Widget build(BuildContext context) {
    if (filteredCourses.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.search_off, size: 64, color: Colors.grey),
            SizedBox(height: 16.h),
            Text(
              'No courses found for "$_searchQuery"',
              style: AppTextStyle.poppins14BoldprimaryColor.copyWith(
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: filteredCourses.length,
      itemBuilder: (context, index) {
        final course = filteredCourses[index];
        return ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.network(
              course.thumbnail ?? 'https://via.placeholder.com/60',
              width: 60.w,
              height: 60.h,
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) => Container(
                    width: 60.w,
                    height: 60.h,
                    color: Colors.grey[200],
                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
            ),
          ),
          title: Text(
            course.title ?? 'No title',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            course.category ?? 'No category',
            style: TextStyle(fontSize: 12.sp, color: Colors.grey),
          ),
          trailing: Text(
            course.price != null ? '\$${course.price}' : 'Free',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CourseDetails(allCoursesModel: course),
              ),
            );
          },
        );
      },
    );
  }
}