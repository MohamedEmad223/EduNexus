import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart'), centerTitle: true),
      body: Center(
        child: Text('Your cart is empty!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
