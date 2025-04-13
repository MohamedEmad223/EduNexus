import 'package:flutter/material.dart';

class NotificatiosScreen extends StatelessWidget {
  const NotificatiosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Text(
          'No notifications yet!',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
}