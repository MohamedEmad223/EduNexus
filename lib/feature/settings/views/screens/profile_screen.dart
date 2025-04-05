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
      body: Column(children: [InformationContainerSettings(),Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.h),
        child: Container(
          color: AppColor.backGroundColor,
          height: 65.h,
          width: double.infinity  ,
          child: Row(children: [
            SvgPicture.asset(AppImages.personIcon),
          ],),
        ),
      )]),
    );
  }
}
