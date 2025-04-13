import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/feature/edit_profile/presentation/widgets/image_container_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: AppTextStyle.poppins16w600primaryColor,
        ),
        centerTitle: true,
        backgroundColor: AppColor.backGroundColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 50.h),
          child: Column(children: [ImageContainerWidgets()]),
        ),
      ),
    );
  }
}
