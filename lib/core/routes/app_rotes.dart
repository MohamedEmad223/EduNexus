import 'package:edunexus/core/routes/routes.dart';
import 'package:edunexus/core/widgets/bottom_navigaton_bar.dart';
import 'package:edunexus/feature/auth/login/views/screens/login_screen.dart';
import 'package:edunexus/feature/auth/register/view/screens/register_screen.dart';
import 'package:edunexus/feature/cart/presentation/screens/cart_screen.dart';
import 'package:edunexus/feature/courses/views/screens/course_details.dart';
import 'package:edunexus/feature/courses/views/screens/courses_screen.dart';
import 'package:edunexus/feature/edit_profile/presentation/screens/edit_peofile_screen.dart';
import 'package:edunexus/feature/home/view/screens/home_screen.dart';
import 'package:edunexus/feature/leaderboard/presentation/screens/leader_board_screen.dart';
import 'package:edunexus/feature/notification/presentation/screens/notificatios_screen.dart';
import 'package:edunexus/feature/on_boarding/view/on_boarding.dart';
import 'package:edunexus/feature/result/presentation/screens/result_screen.dart';
import 'package:edunexus/feature/settings/views/screens/settings_screen.dart';
import 'package:edunexus/feature/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';

class CustomPageRoute extends MaterialPageRoute {
  CustomPageRoute({required super.builder});

  @override
  Duration get transitionDuration => const Duration(milliseconds: 750);
}

class AppRoutes {
  Route? generateRoute(RouteSettings routeSettings) {
    // ignore: unused_local_variable
    var args = routeSettings.arguments;
    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case Routes.login:
        return CustomPageRoute(builder: (context) => const LoginScreen());
      case Routes.register:
        return CustomPageRoute(builder: (context) => const RegisterScreen());
      case Routes.home:
        return CustomPageRoute(builder: (context) => const HomeScreen());
      case Routes.settings:
        return CustomPageRoute(builder: (context) => const SettingsScreen());
      case Routes.cart:
        return CustomPageRoute(builder: (context) => const CartScreen());
      case Routes.botNavBar:
        return CustomPageRoute(builder: (context) => const BottomNavBar());
      case Routes.course:
        return CustomPageRoute(builder: (context) => const CoursesScreen());
      case Routes.courseDetails:
        return CustomPageRoute(builder: (context) => const CourseDetails());
      case Routes.leaderBoard:
        return CustomPageRoute(builder: (context) => const LeaderBoardScreen());
      case Routes.resultScreen:
        return CustomPageRoute(builder: (context) => const ResultScreen());
      case Routes.notificationScreen:
        return CustomPageRoute(builder: (context) => const NotificatiosScreen());
      case Routes.editProfileScreen:
        return CustomPageRoute(builder: (context) => const EditProfileScreen());
    }
    return null;
  }
}
