import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/feature/course_playing/presentation/widgets/video_widget.dart';
import 'package:flutter/material.dart';

class CoursePlayingScreen extends StatelessWidget {
  const CoursePlayingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,

      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Course Playing'),
        centerTitle: true,
        backgroundColor: AppColor.scaffoldBackgroundColor,
      ),
      body: Column(children: [VideoWidget()]),
    );
  }
}
