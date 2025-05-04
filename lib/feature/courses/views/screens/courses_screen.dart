import 'dart:developer';

import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/feature/course_playing/cubit/cubit/progressofstudent_cubit.dart';
import 'package:edunexus/feature/courses/cubit/cubit/cubit/my_course_cubit.dart';
import 'package:edunexus/feature/courses/views/widgets/course_container_widgets.dart';
import 'package:edunexus/feature/courses/views/widgets/learned_today_container.dart';
import 'package:edunexus/feature/courses/views/widgets/shimmer_course_gride.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backGroundColor,
        elevation: 0,
        title: Text(
          'My Courses',
          style: AppTextStyle.poppins18w500lightBlackColor,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: BlocBuilder<MyCourseCubit, MyCourseState>(
          builder: (context, state) {
            if (state is MyCourseLoading) {
              return ShimmerCourseGrid();
            } else if (state is MyCourseError) {
              return Center(
                child: Text(state.errorMessage ?? 'Something went wrong'),
              );
            } else if (state is MyCourseSuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<ProgressofstudentCubit, ProgressofstudentState>(
                    builder: (context, state) {
                      if (state is ProgressofstudentLoaded) {
                        final progressStr =
                            state.getProgressOfStudentModel.progress ?? "0";
                        final progressDouble =
                            double.tryParse(progressStr) ?? 0;
                        final progress = progressDouble;
                        log('Progress: $progressStr');
                        log('Progress double: $progressDouble');

                        return LearnedTodayContainer(
                          progress: progress.toString(),
                          displayProgress:
                              '${(progress * 60).toInt()}min / 60min',
                        );
                      } else if (state is ProgressofstudentLoading) {
                        return ShimmerCourseGrid();
                      }

                      return SizedBox.shrink();
                    },
                  ),

                  SizedBox(height: 20.h),
                  Expanded(
                    child: GridView.builder(
                      itemCount: state.myCoursesList!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 100.w / 135.h,
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 15.h,
                      ),
                      itemBuilder: (context, index) {
                        return CourseContainerWidgets(
                          allCoursesModel: state.myCoursesList![index],
                        );
                      },
                    ),
                  ),
                ],
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                const Center(child: Text('No data to show')),
              ],
            );
          },
        ),
      ),
    );
  }
}
