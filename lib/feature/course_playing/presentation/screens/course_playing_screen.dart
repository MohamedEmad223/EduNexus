import 'package:edunexus/feature/course_playing/presentation/widgets/disscussion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/feature/course_playing/presentation/widgets/content_widgets.dart';
import 'package:edunexus/feature/course_playing/presentation/widgets/material_widgets.dart';
import 'package:edunexus/feature/course_playing/presentation/widgets/video_widget.dart';

class CoursePlayingScreen extends StatelessWidget {
  const CoursePlayingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColor.scaffoldBackgroundColor,
        body: Column(
          children: [
            Stack(
              children: [
                const VideoWidget(),
                Positioned(
                  top: 40.h, // adjust based on your UI needs
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
                  Center(child: MaterialWidgets()),
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
}
