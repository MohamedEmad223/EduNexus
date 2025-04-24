import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/feature/courses/views/widgets/row_course_details_widgets.dart';
import 'package:edunexus/feature/questions/cubit/cubit/quiz_cubit.dart';
import 'package:edunexus/feature/questions/presentation/screens/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContentWidgets extends StatelessWidget {
  const ContentWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Product Design v1.0',
                style: AppTextStyle.poppins20BoldblackColor,
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Text(
            '6h 14min · 24 Lessons',
            style: TextStyle(fontSize: 12.sp, color: Colors.grey),
          ),
          SizedBox(height: 12.h),
          Text(
            'About this course',
            style: AppTextStyle.poppins20BoldblackColor.copyWith(
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.',
            style: TextStyle(fontSize: 12.sp, color: Colors.grey),
          ),
          SizedBox(height: 30.h),
          RowCourseDetailsWidgets(
            isFinshed: true,
            index: '01',
            title: 'Introduction to Product Design',
            time: '2h 30min',
            isPurshesed: true,
          ),
          SizedBox(height: 20.h),
          RowCourseDetailsWidgets(
            isFinshed: false,
            index: '02',
            title: 'Quiz',
            time: '2h ',
            isPurshesed: true,
          ),
          SizedBox(height: 20.h),

          InkWell(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => BlocProvider(
                        create: (context) => QuizCubit(),
                        child: QuestionsScreen(),
                      ),
                ),
                (route) => false,
              );
            },
            child: RowCourseDetailsWidgets(
              isFinshed: true,
              index: '03',
              title: 'Introduction to Product Design',
              time: '2h 30min',
              isPurshesed: false,
            ),
          ),
        ],
      ),
    );
  }
}
