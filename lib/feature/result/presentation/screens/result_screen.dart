import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Result'), centerTitle: true),
      body: Center(
        child: Text('Your result is ready!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
