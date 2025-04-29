import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/feature/cart/presentation/widgets/cart_container_widgets.dart';
import 'package:edunexus/feature/cart/presentation/widgets/totla_price_widgets.dart';
import 'package:edunexus/feature/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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


