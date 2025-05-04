import 'package:edunexus/core/helper/app_constants.dart';
import 'package:edunexus/core/helper/shared_pref_helper.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/feature/course_playing/cubit/cubit/progressofstudent_cubit.dart';
import 'package:edunexus/feature/course_playing/cubit/cubit/videocheck_cubit.dart';
import 'package:edunexus/feature/course_playing/presentation/widgets/content_widgets.dart';
import 'package:edunexus/feature/course_playing/presentation/widgets/disscussion.dart';
import 'package:edunexus/feature/course_playing/presentation/widgets/material_widgets.dart';
import 'package:edunexus/feature/course_playing/presentation/widgets/video_widget.dart';
import 'package:edunexus/feature/courses/cubit/cubit/courses_all_lessons_cubit.dart';
import 'package:edunexus/feature/home/cubit/home_cubit.dart';
import 'package:edunexus/feature/home/data/model/all_courses.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class CoursePlayingScreen extends StatefulWidget {
  final String? courseId;
  final AllCoursesModel? allCoursesModel;

  const CoursePlayingScreen({super.key, this.courseId, this.allCoursesModel});

  @override
  State<CoursePlayingScreen> createState() => _CoursePlayingScreenState();
}

class _CoursePlayingScreenState extends State<CoursePlayingScreen> {
  bool isVideoFinished = false;
  FlickManager? flickManager;
  String? _firstLessonId;
  String? progressPath;

  void handleVideoFinished() {
    if (isVideoFinished) return;
    setState(() {
      isVideoFinished = true;
    });

    final courseId = widget.courseId;
    final lessonId = _firstLessonId;

    if (courseId != null && lessonId != null) {
      final path = AppConstants.postCheckvideoFinish(courseId, lessonId);
      context.read<VideocheckCubit>().getAllLessons(path);
    }
    if (courseId != null && lessonId != null) {
      final path = AppConstants.postCheckvideoFinish(courseId, lessonId);
      context.read<VideocheckCubit>().getAllLessons(path);

      final progressPath = AppConstants.getProgressOfStudent(
        courseId,
      ); // Add this method
      setState(() {
        this.progressPath = progressPath;
      });
      context.read<ProgressofstudentCubit>().getAllLessons(progressPath);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CoursesAllLessonsCubit>().getAllLessons(
        AppConstants.getCourseLessons(widget.courseId ?? ""),
      );
      CacheHelper().saveData(key: 'id', value: widget.courseId ?? "");
    });
  }

  @override
  void dispose() {
    flickManager?.flickControlManager?.pause();
    flickManager?.dispose();

    super.dispose();
  }

 

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();

    return BlocListener<CoursesAllLessonsCubit, CoursesAllLessonsState>(
      listener: (context, state) {
        if (state is CoursesAllLessonsSuccess &&
            state.allLessonsModel?.lessons?.isNotEmpty == true) {
          _firstLessonId = state.allLessonsModel!.lessons!.first.id.toString();
        }
      },
      child: BlocBuilder<CoursesAllLessonsCubit, CoursesAllLessonsState>(
        builder: (context, state) {
          if (state is CoursesAllLessonsLoading) {
            return const Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: CircularProgressIndicator(color: AppColor.primaryColor),
              ),
            );
          } else if (state is CoursesAllLessonsError) {
            return Center(child: Text(state.message ?? ""));
          } else if (state is CoursesAllLessonsSuccess) {
            final allLessonsModel = state.allLessonsModel;

            flickManager ??= FlickManager(
              videoPlayerController: VideoPlayerController.network(
                allLessonsModel?.lessons?[0].path ?? '',
              ),
            );

            return DefaultTabController(
              length: 3,
              child: Scaffold(
                backgroundColor: AppColor.scaffoldBackgroundColor,
                body: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 200.h,
                          child: VideoWidget(
                            flickManager: flickManager!,
                            onVideoFinished: handleVideoFinished,
                            allCoursesModel: widget.allCoursesModel,
                          ),
                        ),
                        Positioned(
                          top: 40.h,
                          left: 15.w,
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(8.w),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          ContentWidgets(
                            isVideoFinished: isVideoFinished,
                            flickManager: flickManager!,
                            allCoursesModel: widget.allCoursesModel,
                          ),
                          Center(
                            child: MaterialWidgets(
                              summary:
                                  allLessonsModel?.lessons?[0].summary ??
                                  "There is no summary",
                              allCoursesModel: cubit.allCoursesList,
                            ),
                          ),
                          const Disscussion(),
                        ],
                      ),
                    ),
                  ],
                ),
                bottomNavigationBar: Container(
                  padding: EdgeInsets.symmetric(vertical: 30.w),
                  color: AppColor.whiteColor,
                  child: TabBar(
                    labelColor: AppColor.primaryColor,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: AppColor.primaryColor,
                    labelStyle: TextStyle(fontSize: 15.sp, height: 1.h),
                    unselectedLabelStyle: TextStyle(
                      fontSize: 14.sp,
                      height: 1.h,
                    ),
                    tabs: const [
                      Tab(text: 'Overview'),
                      Tab(text: 'Materials'),
                      Tab(text: 'Discussion'),
                    ],
                  ),
                ),
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
