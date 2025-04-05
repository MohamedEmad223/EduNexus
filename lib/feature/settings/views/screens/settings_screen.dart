import 'package:edunexus/core/helper/app_images.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/feature/settings/views/widgets/information_container_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          InformationContainerSettings(),
          SizedBox(height: 50.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: AppColor.backGroundColor,
                borderRadius: BorderRadius.circular(25.r),
              ),

              height: 65.h,
              width: double.infinity,
              child: Row(
                children: [
                  SvgPicture.asset(AppImages.editIcon),
                  SizedBox(width: 10.w),
                  Text(
                    'Edit Profile',
                    style: AppTextStyle.poppins14w300threedBlackColor,
                  ),
                  Spacer(),
                  SvgPicture.asset(AppImages.arrowIcon),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
