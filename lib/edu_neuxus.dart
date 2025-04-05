import 'package:edunexus/core/routes/app_rotes.dart';
import 'package:edunexus/core/routes/routes.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EduNeuxus extends StatelessWidget {
  const EduNeuxus({super.key, required this.appRoutes});
  final AppRoutes appRoutes;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      ensureScreenSize: true,

      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            elevation: 0,
            color: Colors.white,
            surfaceTintColor: Colors.white,
            scrolledUnderElevation: 0,
            iconTheme: IconThemeData(
              color: AppColor.scaffoldBackgroundColor,
              size: 28.r,
            ),
          ),),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRoutes.generateRoute,
        initialRoute: Routes.botNavBar,
      ),
    );
  }
}
