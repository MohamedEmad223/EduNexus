import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class DoNotHaveAnAccount extends StatelessWidget {
  const DoNotHaveAnAccount({super.key, required this.text, this.onPressed});
  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?", style: AppTextStyle.poppins12greyColor),
        TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: AppTextStyle.poppins14BoldprimaryColor,
          ),
        ),
      ],
    );
  }
}
