import 'dart:developer';

import 'package:edunexus/core/helper/helper_methods.dart';
import 'package:edunexus/core/routes/routes.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/feature/cart/presentation/widgets/cart_container_widgets.dart';
import 'package:edunexus/feature/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_with_paymob/pay_with_paymob.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      appBar: AppBar(
        title: Text('Cart (${context.watch<HomeCubit>().cartCourses.length})'),
        centerTitle: true,
        backgroundColor: AppColor.backGroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  final cartItems = context.watch<HomeCubit>().cartCourses;

                  if (cartItems.isEmpty) {
                    return const Center(child: Text('Your cart is empty'));
                  }

                  return ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final course = cartItems[index];
                      return CartContainerWidgets(
                        course: course,
                        onRemove: () {
                          context.read<HomeCubit>().toggleCartCourse(course);
                        },
                      );
                    },
                  );
                },
              ),
            ),
            TotalPriceWidget(),
          ],
        ),
      ),
    );
  }
}

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
                          builder:
                              (context) => PaymentView(
                                onPaymentSuccess: () {
                                  log('Payment successful!');
                                  context.read<HomeCubit>().clearCart();
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    Routes.botNavBar,
                                    (route) => false,
                                  );
                                  HelperMethods.showCustomSnackBarSuccess(
                                    context,
                                    'Payment successful!',
                                  );
                                },
                                onPaymentError: () {
                                  log('Payment error!');
                                },
                                price: double.parse(
                                  totalPrice.toStringAsFixed(2),
                                ), // Required: Total price (e.g., 100 for 100 EGP)
                              ),
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
              'Proceed to Payment',
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
