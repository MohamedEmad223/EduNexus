import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 20.w),
          child: Column(
            children: [
              Row(children: [Text('Hi! Ali')]),
            ],
          ),
        ),
      ),
    );
  }
}
