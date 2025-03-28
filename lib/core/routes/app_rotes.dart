import 'package:edunexus/core/routes/routes.dart';
import 'package:edunexus/feature/on_boarding/view/on_boarding.dart';
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
        return MaterialPageRoute(builder: (context) => const OnBoardingScreen());
      case Routes.login:
        return CustomPageRoute(builder: (context) => const LoginScreen());
    }
    return null;
  }
}
