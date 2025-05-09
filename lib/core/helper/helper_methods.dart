import 'package:edunexus/core/helper/app_images.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HelperMethods {
  HelperMethods._();
  static Future<Widget?> showLoadingAlertDialog(context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder:
          (context) => PopScope(
            canPop: false,
            child: AbsorbPointer(
              absorbing: true,
              child: AlertDialog.adaptive(
                contentPadding: EdgeInsets.zero,
                backgroundColor: AppColor.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                content: SizedBox(
                  height: 200.h,
                  width: 100.w,
                  child: const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
    );
  }

  static void svgPrecacheImage() {
    const cacheSvgImages = [
      AppImages.arrowIcon,
      AppImages.bankCard,
      AppImages.cancelIcone,
      AppImages.cartImage,
      AppImages.correctIcon,
      AppImages.courseDetails,
      AppImages.coursesHistoryIcon,
      AppImages.coursesIcon,
      AppImages.crownIcone,
      AppImages.doneIcone,
      AppImages.editIcon,
      AppImages.editProfile,
      AppImages.fileIcone,
      AppImages.icon,
      AppImages.iconApp,
      AppImages.learn,
      AppImages.lockIcon,
      AppImages.logOutIcon,
      AppImages.notificationIcon,
      AppImages.onBoardingImage,
      AppImages.oneleaderBoardImage,
      AppImages.personIcon,
      AppImages.resultScreen,
      AppImages.splashLogo,
      AppImages.threeleaderBoardImage,
      AppImages.timeIcon,
      AppImages.twoleaderBoardImage,
    ];

    for (String element in cacheSvgImages) {
      var loader = SvgAssetLoader(element);
      svg.cache.putIfAbsent(
        loader.cacheKey(null),
        () => loader.loadBytes(null),
      );
    }
  }

  static Future<Widget?> showAlertDialog(context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder:
          (context) => PopScope(
            canPop: true,
            child: AbsorbPointer(
              absorbing: true,
              child: AlertDialog.adaptive(
                contentPadding: EdgeInsets.zero,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                content: SizedBox(
                  height: 200.h,
                  width: 100.w,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.h,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Do you want to Log Out?",
                          style: AppTextStyle.poppins16w400blackColor,
                        ),

                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Cancel",
                                style: AppTextStyle.poppins16w400blackColor,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Log Out",
                                style: AppTextStyle.poppins16w400blackColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
    );
  }

  static void showCustomSnackBarSuccess(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          title,
          textAlign: TextAlign.left,
          style: AppTextStyle.poppins14BoldwhiteColor,
        ),
        backgroundColor: Colors.teal,
        duration: const Duration(seconds: 3),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        elevation: 4,
      ),
    );
  }

  static void showCustomSnackBarError(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          title,
          textAlign: TextAlign.left,
          style: AppTextStyle.poppins14BoldwhiteColor,
        ),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        elevation: 4,
      ),
    );
  }
}
