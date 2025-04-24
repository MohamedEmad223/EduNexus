import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownWidgets extends StatelessWidget {
  const DropDownWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: null,
      decoration: InputDecoration(
        hintText: 'Select Role',
        hintStyle: AppTextStyle.poppins12greyColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: Colors.grey, width: 1.5.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: AppColor.primaryColor, width: 2.0.w),
        ),
      ),
      items:
          <String>['Instructor', 'Admin'].map((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
      onChanged: (String? value) {},
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please select a role";
        }
        return null;
      },
    );
  }
}
