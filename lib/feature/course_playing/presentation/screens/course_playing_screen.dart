import 'dart:developer';

import 'package:edunexus/core/helper/app_constants.dart';
import 'package:edunexus/core/helper/shared_pref_helper.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/feature/course_playing/cubit/cubit/progressofstudent_cubit.dart';
import 'package:edunexus/feature/course_playing/cubit/cubit/videocheck_cubit.dart';
import 'package:edunexus/feature/course_playing/presentation/widgets/back_arrow_widgets.dart';
import 'package:edunexus/feature/course_playing/presentation/widgets/content_widgets.dart';
import 'package:edunexus/feature/course_playing/presentation/widgets/disscussion.dart';
import 'package:edunexus/feature/course_playing/presentation/widgets/material_widgets.dart';
import 'package:edunexus/feature/course_playing/presentation/widgets/tab_bar_container_widgets.dart';
import 'package:edunexus/feature/course_playing/presentation/widgets/video_widget.dart';
import 'package:edunexus/feature/courses/cubit/cubit/courses_all_lessons_cubit.dart';
import 'package:edunexus/feature/courses/data/model/all_lessons_model.dart';
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
  String? progressPath;
  int currentLessonIndex = 0;
  bool isChangingLesson = false;

  void handleVideoFinished() {
    if (isVideoFinished || isChangingLesson) return;

    setState(() => isVideoFinished = true);

    final courseId = widget.courseId;
    final state = context.read<CoursesAllLessonsCubit>().state;

    String? lessonId;
    if (state is CoursesAllLessonsSuccess &&
        state.allLessonsModel?.lessons != null &&
        currentLessonIndex < state.allLessonsModel!.lessons!.length) {
      lessonId = state.allLessonsModel!.lessons![currentLessonIndex].id;
      print("✅ Lesson ID: $lessonId");
    }

    if (courseId != null && lessonId != null) {
      final path = AppConstants.postCheckvideoFinish(courseId, lessonId);
      print("✅ Full Path: $path");

      context.read<VideocheckCubit>().getAllLessons(path);

      final progressPath = AppConstants.getProgressOfStudent(courseId);
      this.progressPath = progressPath;

      if (!mounted) return;
      if (!context.read<ProgressofstudentCubit>().isClosed) {
        context.read<ProgressofstudentCubit>().getAllLessons(progressPath);
      }
    }

    if (state is CoursesAllLessonsSuccess &&
        currentLessonIndex + 1 < (state.allLessonsModel?.lessons?.length ?? 0)) {
      _changeLesson(currentLessonIndex + 1, state.allLessonsModel!.lessons!);
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
    if (flickManager != null) {
      flickManager?.flickControlManager?.pause();
      flickManager?.dispose();
    }
    super.dispose();
  }

  Future<void> _changeLesson(int newIndex, List<Lesson> allLessons) async {
    if (isChangingLesson) return; // Prevent multiple simultaneous changes
    
    setState(() {
      isChangingLesson = true;
    });

    try {
      // Properly dispose of the old manager
      if (flickManager != null) {
        await flickManager!.flickControlManager?.pause();
        
        // Store a local reference to dispose later
        final oldManager = flickManager;
        
        // Clear the reference immediately to prevent further usage
        setState(() {
          flickManager = null;
          currentLessonIndex = newIndex;
          isVideoFinished = false;
        });
        
        // Dispose after setState to ensure UI is updated
        await oldManager?.dispose();
      } else {
        setState(() {
          currentLessonIndex = newIndex;
          isVideoFinished = false;
        });
      }

      // Wait a moment before creating a new controller
      await Future.delayed(const Duration(milliseconds: 300));

      if (!mounted) return;

      // Create and initialize the new controller
      final videoUrl = allLessons[newIndex].path;
      if (videoUrl == null || videoUrl.isEmpty) {
        print("Error: Video URL is empty for lesson $newIndex");
        setState(() {
          isChangingLesson = false;
        });
        return;
      }

      try {
        // Create a new controller with the URL
        final newController = VideoPlayerController.network(videoUrl);
        
        // Initialize the controller first
        await newController.initialize();
        
        if (!mounted) {
          // If widget is disposed during initialization, clean up the controller
          await newController.dispose();
          return;
        }
        
        // Now create the FlickManager with the initialized controller
        final newManager = FlickManager(
          videoPlayerController: newController,
        );
        
        if (!mounted) {
          // If widget is disposed after initialization but before setting state
          await newManager.dispose();
          return;
        }
        
        // Update the state with the new manager
        setState(() {
          flickManager = newManager;
          isChangingLesson = false;
        });
        
        // Play the video
        newController.play();
      } catch (e) {
        print("Error initializing video: $e");
        setState(() {
          isChangingLesson = false;
        });
      }
    } catch (e) {
      log("Error during lesson change: $e");
      setState(() {
        isChangingLesson = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();

    return BlocBuilder<CoursesAllLessonsCubit, CoursesAllLessonsState>(
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
          final allLessons = state.allLessonsModel?.lessons ?? [];

          if (allLessons.isEmpty) {
            return const Center(child: Text("No lessons found."));
          }

          // Initialize the first video if needed and not changing lessons
          if (flickManager == null && !isChangingLesson) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _initializeFirstVideo(allLessons);
            });
            
            // Show loading while initializing
            return const Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: CircularProgressIndicator(color: AppColor.primaryColor),
              ),
            );
          }

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
                        child: isChangingLesson || flickManager == null
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: AppColor.primaryColor,
                                ),
                              )
                            : VideoWidget(
                                flickManager: flickManager!,
                                onVideoFinished: handleVideoFinished,
                                allCoursesModel: widget.allCoursesModel,
                              ),
                      ),
                      BackArrowWidgets(),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        ContentWidgets(
                          isVideoFinished: isVideoFinished,
                          flickManager: flickManager,
                          allCoursesModel: widget.allCoursesModel,
                          lessons: allLessons,
                          currentLessonIndex: currentLessonIndex,
                          onLessonChange: (newIndex) {
                            if (newIndex != currentLessonIndex && !isChangingLesson) {
                              _changeLesson(newIndex, allLessons);
                            }
                          },
                        ),
                        MaterialWidgets(
                          title: widget.allCoursesModel?.title ?? "",
                          pdfUrl: widget.allCoursesModel?.materials?.toString() ?? "",
                          summary:  currentLessonIndex < allLessons.length 
                              ? (allLessons[currentLessonIndex].summary ?? "There is no summary")
                              : "There is no summary",
                        ),
                        const Disscussion(),
                      ],
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: TabBarContainerWidgets(),
            ),
          );
        }

        return Container();
      },
    );
  }

  Future<void> _initializeFirstVideo(List<Lesson> allLessons) async {
    if (allLessons.isEmpty || isChangingLesson) return;
    
    setState(() {
      isChangingLesson = true;
    });

    try {
      final videoUrl = allLessons[currentLessonIndex].path;
      if (videoUrl == null || videoUrl.isEmpty) {
        print("Error: Video URL is empty for first lesson");
        setState(() {
          isChangingLesson = false;
        });
        return;
      }

      final controller = VideoPlayerController.network(videoUrl);
      await controller.initialize();
      
      if (!mounted) {
        await controller.dispose();
        return;
      }
      
      setState(() {
        flickManager = FlickManager(
          videoPlayerController: controller,
        );
        isChangingLesson = false;
      });
      
      controller.play();
    } catch (e) {
      print("Error initializing first video: $e");
      setState(() {
        isChangingLesson = false;
      });
    }
  }
}