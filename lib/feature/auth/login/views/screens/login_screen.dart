import 'package:edunexus/feature/auth/login/views/widgets/form_of_login_screen.dart';
import 'package:edunexus/feature/auth/login/views/widgets/image_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.h, vertical: 80.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageWidgets(),
                SizedBox(height: 80.h),
                FormOfLoginScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
