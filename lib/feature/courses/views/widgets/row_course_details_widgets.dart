import 'package:edunexus/core/helper/app_images.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class RowCourseDetailsWidgets extends StatelessWidget {
  const RowCourseDetailsWidgets({
    super.key,
    required this.index,
    required this.title,
    required this.time,
    required this.isFinshed,
    required this.isPurshesed,
    required this.isLocked,
    this.flickManager,
    this.onPlayPause,
  });

  final String index;
  final String title;
  final String time;
  final bool isFinshed;
  final bool isPurshesed;
  final bool isLocked;
  final FlickManager? flickManager;
  final VoidCallback? onPlayPause;

  @override
  Widget build(BuildContext context) {
    final controller = flickManager?.flickVideoManager?.videoPlayerController;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          index,
          style: AppTextStyle.poppins12w400lightdarkGreyColor.copyWith(
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(width: 10.w),
        Visibility(
          visible: isFinshed,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Image.asset(
            AppImages.doneIcone,
            width: 20.w,
            height: 20.h,
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(height: 4.h),
              Text(
                time,
                style: AppTextStyle.poppins12greyColor.copyWith(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.primaryColor,
                ),
              ),
            ],
          ),
        ),
        if (flickManager != null && controller != null)
          ValueListenableBuilder<VideoPlayerValue>(
            valueListenable: controller,
            builder: (context, value, child) {
              final isPlaying = value.isPlaying;
              return GestureDetector(
                onTap: isLocked || !isPurshesed
                    ? null
                    : () {
                        if (isPlaying) {
                          flickManager!.flickControlManager?.pause();
                        } else {
                          flickManager!.flickControlManager?.play();
                        }
                        onPlayPause?.call();
                      },
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundColor: isLocked || !isPurshesed
                      ? AppColor.greyColor
                      : AppColor.primaryColor,
                  child: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                    size: 25.sp,
                  ),
                ),
              );
            },
          )
        else
          CircleAvatar(
            radius: 20.r,
            backgroundColor: AppColor.greyColor,
            child: Icon(
              Icons.lock,
              color: Colors.white,
              size: 25.sp,
            ),
          ),
      ],
    );
  }
}
