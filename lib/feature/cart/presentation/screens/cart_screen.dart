import 'package:edunexus/core/helper/app_images.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 116.h,
              color: AppColor.primaryColor,
              child: Row(children: [Column(children: [
        Image.asset(AppImages.)
                    ],
                  )]),
            ),
          ],
        ),
      ),
    );
  }
}
