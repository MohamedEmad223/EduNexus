import 'package:edunexus/core/helper/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 50),
              SvgPicture.asset(AppImages.onBoardingImage),
              Text(
                "Find yourself by doing\n whatever you do",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 100),
              SizedBox(
                height: 55,
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {},
                  color: Color(0xffFF6636),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text("Login"),
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                height: 55,
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Color(0xffFF6636),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xffFF6636), width: 2.5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text("Register"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
