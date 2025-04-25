import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/feature/course_playing/presentation/screens/course_playing_screen.dart';
import 'package:edunexus/feature/courses/views/widgets/course_container_widgets.dart';
import 'package:edunexus/feature/courses/views/widgets/learned_today_container.dart';
import 'package:edunexus/feature/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<HomeCubit>(context);
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LearnedTodayContainer(),
            SizedBox(height: 20.h),
            if (cubit.allCoursesList.isEmpty)
              const Center(child: Text('No courses available'))
            else
              Expanded(
                child: GridView.builder(
                  itemCount: cubit.allCoursesList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 100.w / 135.h,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 15.h,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: CoursePlayingScreen(
                            allCoursesModel: cubit.allCoursesList[index],
                          ),
                          withNavBar: false,
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      },
                      child: CourseContainerWidgets(
                        allCoursesModel: cubit.allCoursesList[index],
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
