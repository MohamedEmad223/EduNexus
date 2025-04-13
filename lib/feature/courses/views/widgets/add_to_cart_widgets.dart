import 'package:edunexus/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddToCartWidgets extends StatelessWidget {
  const AddToCartWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
              bottom: 20.h,
              left: 16.w,
              right: 16.w,
              child: Row(
                children: [
                  Container(
                    height: 50.h,
                    width: 50.h,
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.star_border, color: Colors.orange),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: 12.w),

                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primaryColor,
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
  }
}