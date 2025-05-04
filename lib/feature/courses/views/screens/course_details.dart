import 'package:cached_network_image/cached_network_image.dart';
import 'package:edunexus/core/helper/app_constants.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/feature/courses/cubit/cubit/courses_all_lessons_cubit.dart';
import 'package:edunexus/feature/home/data/model/all_courses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key, this.allCoursesModel});
  final AllCoursesModel? allCoursesModel;

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  late CoursesAllLessonsCubit coursesAllLessonsCubit;
  _initLessonsCubit() {
    coursesAllLessonsCubit = BlocProvider.of<CoursesAllLessonsCubit>(context);
    coursesAllLessonsCubit.getAllLessons(
      AppConstants.getCourseLessons(widget.allCoursesModel?.sId ?? 'Unknown'),
    );
  }

  @override
  void initState() {
    _initLessonsCubit();
    super.initState();
  }

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
                  imageUrl:
                      widget.allCoursesModel?.thumbnail ?? 'There is no image',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.allCoursesModel?.title ??
                                'There is no title',
                            style: AppTextStyle.poppins20BoldblackColor
                                .copyWith(fontSize: 20.sp),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          widget.allCoursesModel?.price != null
                              ? '\$${widget.allCoursesModel!.price}'
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
                      widget.allCoursesModel?.description ??
                          'There is no description',
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      "Catregory",
                      style: AppTextStyle.poppins20BoldblackColor,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      widget.allCoursesModel?.category ??
                          'There is no description',
                      style: AppTextStyle.poppins16w600primaryColor.copyWith(
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "Content",
                      style: AppTextStyle.poppins20BoldblackColor,
                    ),
                    SizedBox(height: 4.h),

                    BlocBuilder<CoursesAllLessonsCubit, CoursesAllLessonsState>(
                      builder: (context, state) {
                        if (state is CoursesAllLessonsLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is CoursesAllLessonsSuccess) {
                          final lessons = state.allLessonsModel;
                          return ListView.separated(
                            itemCount: lessons!.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            separatorBuilder: (_, __) => SizedBox(height: 10.h),
                            itemBuilder: (context, index) {
                              final lesson = lessons[index];
                              return ListTile(
                                leading: Icon(
                                  Icons.play_circle,
                                  size: 40.sp,
                                  color: AppColor.primaryColor,
                                ),
                                subtitle: Text(lesson.description ?? ''),
                                tileColor: Colors.grey.shade100,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                              );
                            },
                          );
                        } else if (state is CoursesAllLessonsError) {
                          return Text('Failed to load lessons.');
                        } else {
                          return SizedBox.shrink();
                        }
                      },
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
