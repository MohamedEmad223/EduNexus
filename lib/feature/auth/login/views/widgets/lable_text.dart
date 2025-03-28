import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class LableText extends StatelessWidget {
  const LableText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: AppTextStyle.poppins14secondBlackColor);
  }
}
