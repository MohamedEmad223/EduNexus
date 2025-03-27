import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class TextWidgets extends StatelessWidget {
  const TextWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Find yourself by doing\n whatever you do",
      textAlign: TextAlign.center,
      style: AppTextStyle.poppins20BoldblackColor,
    );
  }
}
