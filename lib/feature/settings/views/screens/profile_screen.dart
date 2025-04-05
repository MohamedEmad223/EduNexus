import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/feature/settings/views/widgets/information_container_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Settings', style: AppTextStyle.poppins16w600primaryColor),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 100.h,
            color: AppColor.backGroundColor,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.w),
                child: InformationContainerSettings()
              ),
            ),
          ),
        ],
      ),
    );
  }
}
