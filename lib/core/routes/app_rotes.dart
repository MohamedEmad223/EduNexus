import 'package:edunexus/core/routes/routes.dart';
import 'package:edunexus/core/widgets/bottom_navigaton_bar.dart';
import 'package:edunexus/feature/auth/login/views/screens/login_screen.dart';
import 'package:edunexus/feature/auth/register/view/screens/register_screen.dart';
import 'package:edunexus/feature/cart/cart_screen.dart';
import 'package:edunexus/feature/chat/chat_screen.dart';
import 'package:edunexus/feature/home/view/screens/home_screen.dart';
import 'package:edunexus/feature/on_boarding/view/on_boarding.dart';
import 'package:edunexus/feature/settings/views/screens/profile_screen.dart';
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
      case Routes.chatbot:
        return CustomPageRoute(builder: (context) => const ChatScreen());
      case Routes.botNavBar:
        return CustomPageRoute(builder: (context) => const BottomNavBar());
    }
    return null;
  }
}
