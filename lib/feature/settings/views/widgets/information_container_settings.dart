import 'package:edunexus/core/helper/app_images.dart';
import 'package:edunexus/core/helper/shared_pref_helper.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InformationContainerSettings extends StatelessWidget {
  const InformationContainerSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
  
      color: AppColor.backGroundColor,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.w),
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    height: 60.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Image.asset(AppImages.personIcon),
                  ),
                ],
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    CacheHelper().getData(key: 'name'),
                    style: AppTextStyle.poppins16w400blackColor,
                  ),
                  Text(
                    CacheHelper().getData(key: 'email') ?? "uK",
                    style: AppTextStyle.poppins14w300blackColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
