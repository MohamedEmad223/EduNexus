import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/feature/cart/presentation/widgets/cart_container_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
        backgroundColor: AppColor.backGroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: Column(children: [CartContainerWidgets()]),
      ),
    );
  }
}
