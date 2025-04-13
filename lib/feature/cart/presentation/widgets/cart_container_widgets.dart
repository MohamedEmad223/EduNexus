import 'package:edunexus/core/helper/app_images.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartContainerWidgets extends StatelessWidget {
  const CartContainerWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 116.h,
      color: AppColor.whiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Image.asset(
                AppImages.cartImage,
                height: 116.h,
                fit: BoxFit.cover,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'intro to oop',
                    style: AppTextStyle.poppins12w400lightdarkGreyColor
                        .copyWith(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColor.blackColor,
                        ),
                  ),
                  SizedBox(width: 35.w),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete, color: AppColor.primaryColor),
                  ),
                ],
              ),
              Text(
                'Mon, 23 nov - Tue, 1 Dec',
                style: AppTextStyle.poppins12w400lightdarkGreyColor.copyWith(
                  fontSize: 10.sp,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                '10:00 am - 11:00 am',
                style: AppTextStyle.poppins12w400lightdarkGreyColor.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColor.lightBlueColor,
                ),
              ),
              SizedBox(height: 10.h),

              Text(
                '120 EGP',
                textAlign: TextAlign.right,
                style: AppTextStyle.poppins12w400lightdarkGreyColor.copyWith(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColor.blackColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
