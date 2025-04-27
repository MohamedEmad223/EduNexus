import 'package:edunexus/feature/courses/data/model/all_lessons_model.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({super.key, required this.allLessonsModel});

  final AllLessonsModel allLessonsModel;

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> with WidgetsBindingObserver {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    final path = widget.allLessonsModel.lessons?[0].path;

    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(
        path ?? 'https://res.cloudinary.com/placeholder/video/upload/v0000000000/default.mp4',
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    // 👇 PAUSE the video manually before dispose
    flickManager.flickControlManager?.pause(); 

    flickManager.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused) {
      flickManager.flickControlManager?.pause();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return FlickVideoPlayer(flickManager: flickManager);
  }
}
