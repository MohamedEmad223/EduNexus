import 'package:edunexus/core/helper/app_images.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/feature/settings/views/widgets/edit_row_widget.dart';
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
          InformationContainerSettings(),
          SizedBox(height: 50.h),
          EditRowWidget(text: 'Edit Profile', imagePath: AppImages.editIcon),
          SizedBox(height: 20.h),
          EditRowWidget(
            text: 'Courses History',
            imagePath: AppImages.coursesHistoryIcon,
          ),
          SizedBox(height: 20.h),
          EditRowWidget(text: 'Courses', imagePath: AppImages.coursesIcon),
          SizedBox(height: 20.h),
          EditRowWidget(
            text: 'Change Password',
            imagePath: AppImages.changePasswordIcon,
          ),
          SizedBox(height: 20.h),
          EditRowWidget(text: 'log Out', imagePath: AppImages.logOutIcon),
        ],
      ),
    );
  }
}
