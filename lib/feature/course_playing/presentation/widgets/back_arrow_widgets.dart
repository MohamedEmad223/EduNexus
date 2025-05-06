import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackArrowWidgets extends StatelessWidget {
  const BackArrowWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40.h,
      left: 15.w,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(8.w),
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
    );
  }
}
