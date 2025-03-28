import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class DoNotHaveAnAccount extends StatelessWidget {
  const DoNotHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?", style: AppTextStyle.poppins12greyColor),
        TextButton(
          onPressed: () {},
          child: Text(
            "Register",
            textAlign: TextAlign.center,
            style: AppTextStyle.poppins14BoldprimaryColor,
          ),
        ),
      ],
    );
  }
}
