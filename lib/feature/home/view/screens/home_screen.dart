import 'package:edunexus/core/helper/app_images.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/feature/courses/views/screens/course_details.dart';
import 'package:edunexus/feature/home/cubit/home_cubit.dart';
import 'package:edunexus/feature/home/view/widgets/gride_view_cousre.widget.dart';
import 'package:edunexus/feature/home/view/widgets/home_screen_skeleton.dart';
import 'package:edunexus/feature/home/view/widgets/information_of_user_widget.dart';
import 'package:edunexus/feature/home/view/widgets/list_view_categories_widgets.dart';
import 'package:edunexus/feature/notification/presentation/screens/notificatios_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const HomeScreenSkeleton();
          } else if (state is HomeError) {
            return Center(
              child: Text(
                state.errorMessage,
                style: AppTextStyle.poppins14BoldprimaryColor,
              ),
            );
          } else if (state is HomeSuccess) {
            final courses = state.allCoursesList;

            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.h,
                    vertical: 20.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NotificatiosScreen(),
                            ),
                          );
                        },
                        child: Image.asset(AppImages.notificationIcon),
                      ),
                      SizedBox(height: 20.h),
                      const InformationOfUserWidget(),
                      SizedBox(height: 50.h),
                      Image.asset(AppImages.learn),
                      SizedBox(height: 20.h),
                      Text(
                        'Top Categories',
                        style: AppTextStyle.poppins20BoldblackColor,
                      ),
                      SizedBox(height: 20.h),
                      ListViewCategoriesWidgets(
                        categories:
                            courses
                                .map((course) => course.category ?? 'Unknown')
                                .toSet()
                                .toList(),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'Top Courses',
                        style: AppTextStyle.poppins20BoldblackColor,
                      ),
                      SizedBox(height: 20.h),
                      courses.isEmpty
                          ? const Center(child: Text('No courses available'))
                          : GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: courses.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.w,
                                  mainAxisSpacing: 10.h,
                                  childAspectRatio: 1 / 1.5,
                                ),
                            itemBuilder: (context, index) {
                              final course = courses[index];
                              return GrideViewCousre(
                                course: course,
                                onPressed: () {
                                  PersistentNavBarNavigator.pushNewScreen(
                                    context,
                                    screen: CourseDetails(
                                      allCoursesModel: course,
                                    ),
                                    withNavBar: false,
                                    pageTransitionAnimation:
                                        PageTransitionAnimation.cupertino,
                                  );
                                },
                              );
                            },
                          ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

// Skeleton widget
