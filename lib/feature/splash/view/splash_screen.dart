import 'package:edunexus/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 5000), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.onBoarding,
        (route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: SvgPicture.asset(AppImages.splashLogo)),
      ),
    );
  }
}