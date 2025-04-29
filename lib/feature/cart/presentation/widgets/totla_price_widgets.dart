import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/feature/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalPriceWidget extends StatelessWidget {
  const TotalPriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<HomeCubit>().cartCourses;
    // Calculate total price; assuming AllCoursesModel has a 'price' property as a double
    final totalPrice = cartItems.fold<double>(
      0.0,
      (sum, course) => sum + (course.price ?? 0.0),
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: AppColor.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10.r),
      ),
      margin: EdgeInsets.only(top: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Price:',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor.blackColor,
                  ),
                ),
                Text(
                  '\$${totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed:
                cartItems.isEmpty
                    ? null
                    : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CheckoutScreen(),
                        ),
                      );
                    },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Text(
              'Checkout',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColor.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: AppColor.backGroundColor,
      ),
      body: const Center(child: Text('Checkout process to be implemented')),
    );
  }
}
