import 'package:edunexus/core/helper/app_images.dart';
import 'package:edunexus/core/helper/shared_pref_helper.dart';
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            CacheHelper().saveData(
              key: 'id',
              value:
                  courses
                      .map((course) => course.sId ?? 'Unknown')
                      .toSet()
                      .toList(),
            );
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
                                  childAspectRatio: 0.65,
                                ),
                            itemBuilder: (context, index) {
                              final course = courses[index];
                              final isInCart = context
                                  .watch<HomeCubit>()
                                  .isInCart(course);

                              return Stack(
                                children: [
                                  GrideViewCousre(
                                    course: course,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => CourseDetails(
                                                allCoursesModel: course,
                                              ),
                                        ),
                                      );
                                    },
                                  ),
                                  Positioned(
                                    right: 8,
                                    bottom: 8,
                                    child: ElevatedButton.icon(
                                      onPressed: () {
                                        BlocProvider.of<HomeCubit>(context).toggleCartCourse(course);
                                      },
                                      icon: Icon(
                                        isInCart ? Icons.remove_shopping_cart : Icons.add_shopping_cart,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                      label: Text(
                                        isInCart ? 'Remove' : 'Add to Cart',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: isInCart ? Colors.redAccent : AppColor.primaryColor,
                                        elevation: 4,
                                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30.r),
                                        ),
                                      ),
                                    ),
                                  ),

                                ],
                              );
                            },
                          ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Center(child: Text('Please wait...'));
          }
        },
      ),
    );
  }
}
