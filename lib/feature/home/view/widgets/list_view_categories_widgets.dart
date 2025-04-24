import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewCategoriesWidgets extends StatelessWidget {
  const ListViewCategoriesWidgets({super.key, required this.categories});

  final List<dynamic> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: ListView.builder(
        itemCount: categories.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: Container(
              height: 30.h,
              width: 60.w,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text('$category'),
            ),
          );
        },
      ),
    );
  }
}
