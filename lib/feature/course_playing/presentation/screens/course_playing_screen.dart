import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/feature/course_playing/presentation/widgets/content_widgets.dart';
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
                  ContentWidgets(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 10.h,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Product Design v1.0',
                              style: AppTextStyle.poppins20BoldblackColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Text('Discussion', style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(vertical: 30.w),
          color: AppColor.whiteColor,
          // height: 35.h, // Adjust the overall height of the TabBar
          child: TabBar(
            labelColor: AppColor.primaryColor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: AppColor.primaryColor,
            labelStyle: TextStyle(
              fontSize: 15.sp, // Adjust the font size of the selected label
              height: 1.h, // Adjust the line height of the selected label
            ),
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
