import 'package:edunexus/feature/on_boarding/on_boarding.dart';
import 'package:flutter/material.dart';

class EduNeuxus extends StatelessWidget {
  const EduNeuxus({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnBoarding(),
    );
  }
}
