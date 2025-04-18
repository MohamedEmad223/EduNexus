import 'package:edunexus/core/helper/app_images.dart';
import 'package:edunexus/core/routes/routes.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/feature/home/view/widgets/information_of_user_widget.dart';
import 'package:edunexus/feature/home/view/widgets/list_view_categories_widgets.dart';
import 'package:edunexus/feature/notification/presentation/screens/notificatios_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificatiosScreen(),
                    ),
                  );
                },
                child: Image.asset(AppImages.notificationIcon),
              ),
              SizedBox(height: 20.h),
              InformationOfUserWidget(),
              SizedBox(height: 50.h),
              Image.asset(AppImages.learn),
              SizedBox(height: 20.h),
              Text(
                'Top Categories',
                style: AppTextStyle.poppins20BoldblackColor,
              ),
              SizedBox(height: 20.h),
              ListViewCategoriesWidgets(),
              SizedBox(height: 20.h),
              Text('Top Courses', style: AppTextStyle.poppins20BoldblackColor),

              // TODO: i will add courses card here when they finidh designed them
            ],
          ),
        ),
      ),
    );
  }
}
