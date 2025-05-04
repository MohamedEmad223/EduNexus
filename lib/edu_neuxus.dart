import 'package:edunexus/core/helper/app_constants.dart';
import 'package:edunexus/core/routes/app_rotes.dart';
import 'package:edunexus/core/routes/routes.dart';
import 'package:edunexus/feature/course_playing/cubit/cubit/videocheck_cubit.dart';
import 'package:edunexus/feature/course_playing/data/repos/video_check_repo.dart';
import 'package:edunexus/feature/home/cubit/home_cubit.dart';
import 'package:edunexus/feature/home/data/repos/all_courses_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/networking/dio_handler.dart';
import 'feature/courses/cubit/cubit/courses_all_lessons_cubit.dart';
import 'feature/courses/data/repo/all_lessons_repo.dart';

class EduNeuxus extends StatelessWidget {
  const EduNeuxus({
    super.key,
    required this.appRoutes,
    required this.isLoggedIn,
  });

  final AppRoutes appRoutes;
  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => VideocheckCubit(VideoCheckRepo(DioHandler())),
        ),
        BlocProvider(
          create:
              (context) => CoursesAllLessonsCubit(AllLessonsRepo(DioHandler())),
        ),
        BlocProvider(
          create:
              (context) =>
                  HomeCubit(AllCoursesRepo(DioHandler()))
                    ..getAllCourses(AppConstants.getAllCourses),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        ensureScreenSize: true,
        child: MaterialApp(
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              elevation: 0,
              color: Colors.white,
              surfaceTintColor: Colors.white,
              scrolledUnderElevation: 0,
            ),
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRoutes.generateRoute,
          initialRoute: isLoggedIn ? Routes.botNavBar : Routes.splash,
        ),
      ),
    );
  }
}
