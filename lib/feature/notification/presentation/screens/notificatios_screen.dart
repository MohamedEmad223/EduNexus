import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/feature/notification/presentation/widgets/body_of_notification_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificatiosScreen extends StatelessWidget {
  const NotificatiosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: AppTextStyle.poppins14BoldprimaryColor,
        ),
        centerTitle: true,
        backgroundColor: AppColor.whiteColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: [
              Expanded(
                // 👈 This allows ListView to take remaining space
                child: ListView.separated(
                  itemCount: 10,
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => SizedBox(height: 20.h),
                  itemBuilder: (context, index) => BodyOfNotificationWidgets(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
