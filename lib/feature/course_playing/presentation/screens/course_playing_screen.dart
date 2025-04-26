import 'package:edunexus/core/helper/app_constants.dart';
import 'package:edunexus/feature/course_playing/presentation/widgets/disscussion.dart';
import 'package:edunexus/feature/courses/cubit/cubit/courses_all_lessons_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/feature/course_playing/presentation/widgets/content_widgets.dart';
import 'package:edunexus/feature/course_playing/presentation/widgets/material_widgets.dart';
import 'package:edunexus/feature/course_playing/presentation/widgets/video_widget.dart';

class CoursePlayingScreen extends StatefulWidget {
  final String? CourseId;

   CoursePlayingScreen({super.key,  this.CourseId,});

  @override
  State<CoursePlayingScreen> createState() => _CoursePlayingScreenState();
}

class _CoursePlayingScreenState extends State<CoursePlayingScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CoursesAllLessonsCubit>().getAllLessons(AppConstants.getCourseLessons(widget.CourseId??""));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursesAllLessonsCubit, CoursesAllLessonsState>(
  builder: (context, state) {
    if (state is CoursesAllLessonsLoading) {
      return const Center(child: Scaffold(backgroundColor: Colors.white,
          body: CircularProgressIndicator()));
    }else if (state is CoursesAllLessonsError) {
      return Center(child: Text(state.message??""));
    } else if (state is CoursesAllLessonsSuccess) {
      final allLessonsModel = state.allLessonsModel;
      return  DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: AppColor.scaffoldBackgroundColor,
          body: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                      height: 200.h,
                      child: VideoWidget(allLessonsModel: allLessonsModel!)
                  ),
                  Positioned(
                    top: 40.h,
                    left: 15.w,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(8.w),
                        child: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    const ContentWidgets(),
                    Center(child: MaterialWidgets(summary:allLessonsModel.lessons?[0].summary??"There is no summary",)),
                    const Disscussion(),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(vertical: 30.w),
            color: AppColor.whiteColor,
            child: TabBar(
              labelColor: AppColor.primaryColor,
              unselectedLabelColor: Colors.grey,
              indicatorColor: AppColor.primaryColor,
              labelStyle: TextStyle(fontSize: 15.sp, height: 1.h),
              unselectedLabelStyle: TextStyle(fontSize: 14.sp, height: 1.h),
              tabs: const [
                Tab(text: 'Overview'),
                Tab(text: 'Materials'),
                Tab(text: 'Discussion'),
              ],
            ),
          ),
        ),
      );
    }

   return Container();},
);
  }
}
