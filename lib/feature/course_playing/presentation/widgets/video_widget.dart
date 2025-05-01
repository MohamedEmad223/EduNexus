import 'package:edunexus/feature/home/data/model/all_courses.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key,
    required this.flickManager,
    this.onVideoFinished, this.allCoursesModel,
  });

  final FlickManager flickManager;
  final VoidCallback? onVideoFinished;
  final AllCoursesModel? allCoursesModel;

  @override
  Widget build(BuildContext context) {
    // Optionally, listen to video end
    flickManager.flickVideoManager?.videoPlayerController?.addListener(() {
      final controller = flickManager.flickVideoManager?.videoPlayerController;
      if (controller != null &&
          controller.value.isInitialized &&
          controller.value.position >= controller.value.duration) {
        onVideoFinished?.call();
      }
    });

    return FlickVideoPlayer(flickManager: flickManager);
  }
}
