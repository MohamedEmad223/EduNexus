import 'package:edunexus/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBarContainerWidgets extends StatelessWidget {
  const TabBarContainerWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
