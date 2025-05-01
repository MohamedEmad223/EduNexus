import 'package:edunexus/core/helper/app_constants.dart';
import 'package:edunexus/core/networking/dio_handler.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/feature/cart/cubit/courseenroll_cubit.dart';
import 'package:edunexus/feature/cart/data/repo/enroll_course_repo.dart';
import 'package:edunexus/feature/cart/presentation/widgets/cart_container_widgets.dart';
import 'package:edunexus/feature/cart/presentation/widgets/totla_price_widgets.dart';
import 'package:edunexus/feature/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay_with_paymob/pay_with_paymob.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  initState() {
    PaymentData.initialize(
      apiKey:
          AppConstants
              .apiKey, // Required: Found under Dashboard -> Settings -> Account Info -> API Key
      iframeId:
          AppConstants.iFrameId, // Required: Found under Developers -> iframes
      integrationCardId:
          AppConstants
              .onlineCardIdIntegrationId, // Required: Found under Developers -> Payment Integrations -> Online Card ID
      integrationMobileWalletId:
          AppConstants
              .mobileWalletIntegrationId, // Required: Found under Developers -> Payment Integrations -> Mobile Wallet ID
      // Optional User Data
      userData: UserData(
        email: "User Email", // Optional: Defaults to 'NA'
        phone: "User Phone", // Optional: Defaults to 'NA'
        name: "User First Name", // Optional: Defaults to 'NA'
        lastName: "User Last Name", // Optional: Defaults to 'NA'
      ),

      // Optional Style Customizations
      style: Style(
        primaryColor: Colors.blue, // Default: Colors.blue
        scaffoldColor: Colors.white, // Default: Colors.white
        appBarBackgroundColor: Colors.blue, // Default: Colors.blue
        appBarForegroundColor: Colors.white, // Default: Colors.white
        textStyle: TextStyle(), // Default: TextStyle()
        buttonStyle:
            ElevatedButton.styleFrom(), // Default: ElevatedButton.styleFrom()
        circleProgressColor: Colors.blue, // Default: Colors.blue
        unselectedColor: Colors.grey, // Default: Colors.grey
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseenrollCubit(EnrollCourseRepo(DioHandler())),
      child: Scaffold(
        backgroundColor: AppColor.backGroundColor,
        appBar: AppBar(
          title: Text(
            'Cart (${context.watch<HomeCubit>().cartCourses.length})',
          ),
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
      ),
    );
  }
}
