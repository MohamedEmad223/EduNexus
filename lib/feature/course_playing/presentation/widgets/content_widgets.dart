import 'dart:developer';

import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/feature/courses/data/model/all_lessons_model.dart';
import 'package:edunexus/feature/courses/views/widgets/quiz_row_course_details_widgets.dart';
import 'package:edunexus/feature/courses/views/widgets/row_course_details_widgets.dart';
import 'package:edunexus/feature/home/data/model/all_courses.dart';
import 'package:edunexus/feature/questions/cubit/cubit/quiz_cubit.dart';
import 'package:edunexus/feature/questions/presentation/screens/questions_screen.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContentWidgets extends StatelessWidget {
  final bool isVideoFinished;
  final FlickManager? flickManager; // Make nullable
  final AllCoursesModel? allCoursesModel;
  final List<Lesson> lessons;
  final int currentLessonIndex;
  final Function(int) onLessonChange;

  const ContentWidgets({
    super.key,
    required this.isVideoFinished,
    required this.flickManager, // Still required but might be null during transitions
    this.allCoursesModel,
    required this.lessons,
    required this.currentLessonIndex,
    required this.onLessonChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    allCoursesModel?.title ?? 'No title',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: AppTextStyle.poppins20BoldblackColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Text(
              '${_calculateTotalDuration(lessons)} · ${lessons.length} Lessons',
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
            ),
            SizedBox(height: 12.h),
            Text(
              'About this course',
              style: AppTextStyle.poppins20BoldblackColor.copyWith(
                fontSize: 16.sp,
              ),
            ),

            Text(
              allCoursesModel?.description ??
                  'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.',
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
            ),
            SizedBox(height: 20.h),
            Text(
              'Course content',
              style: AppTextStyle.poppins20BoldblackColor.copyWith(
                fontSize: 16.sp,
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: lessons.length,
              itemBuilder: (context, index) {
                final lesson = lessons[index];
                log(lesson.path.toString());

                // Check if this lesson has been completed or is currently playing
                final bool isCurrentLesson = index == currentLessonIndex;
                final bool isCompleted =
                    index < currentLessonIndex ||
                    (isCurrentLesson && isVideoFinished);

                return GestureDetector(
                  onTap: () {
                    // Only allow changing to a different lesson if not the current one
                    if (index != currentLessonIndex) {
                      onLessonChange(index);
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: RowCourseDetailsWidgets(
                      isLocked: false, // We don't want to lock lessons
                      isFinshed: isCompleted, // Show as finished if completed
                      index: (index + 1).toString().padLeft(2, '0'),
                      title: lesson.content ?? 'No Title',
                      time: _getLessonDuration(lesson),
                      isPurshesed: true,
                      // Only pass flickManager for current lesson and only if not null
                      flickManager: isCurrentLesson ? flickManager : null,
                    ),
                  ),
                );
              },
            ),

            SizedBox(height: 20.h),

            InkWell(
              onTap: () {
                // Only navigate to quiz if all lessons are completed
                final bool allLessonsCompleted =
                    currentLessonIndex >= lessons.length - 1 && isVideoFinished;

                if (allLessonsCompleted) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => BlocProvider(
                            create: (context) => QuizCubit(),
                            child: QuestionsScreen(),
                          ),
                    ),
                  );
                } else {
                  // Show a snackbar indicating that all lessons must be completed first
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Please complete all lessons before taking the quiz.',
                      ),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: QuizRowCourseDetailsWidgets(
                isFinshed: false,
                index: (lessons.length + 1).toString().padLeft(2, '0'),
                title: 'Quiz',
                time: '15 min',
                isPurshesed:
                    currentLessonIndex >= lessons.length - 1 && isVideoFinished,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to format lesson duration
  String _getLessonDuration(Lesson lesson) {
    // You can implement actual duration calculation if you have the data
    return '2.5 Min';
  }

  // Helper method to calculate total course duration
  String _calculateTotalDuration(List<Lesson> lessons) {
    // Placeholder - replace with actual calculation based on your data
    return '6h 14min';
  }
}
