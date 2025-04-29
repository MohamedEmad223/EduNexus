import 'package:edunexus/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

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