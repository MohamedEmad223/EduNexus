import 'package:flutter/material.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Courses Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}