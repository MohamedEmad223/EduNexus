import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/feature/course_playing/presentation/widgets/content_widgets.dart';
import 'package:edunexus/feature/course_playing/presentation/widgets/material_widgets.dart';
import 'package:edunexus/feature/course_playing/presentation/widgets/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoursePlayingScreen extends StatelessWidget {
  const CoursePlayingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColor.scaffoldBackgroundColor,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text('Course Playing'),
          centerTitle: true,
          backgroundColor: AppColor.scaffoldBackgroundColor,
        ),
        body: Column(
          children: [
            const VideoWidget(),
            Expanded(
              child: TabBarView(
                children: [
                  const ContentWidgets(),
                  Center(child: MaterialWidgets()),
                  Center(
                    child: Text(
                      'Discussion',
                      style: TextStyle(fontSize: 20.sp),
                    ),
                  ),
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
