import 'package:edunexus/feature/home/data/model/all_courses.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({super.key, required this.allCoursesModel});

  final AllCoursesModel allCoursesModel;

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late FlickManager flickManager;

  @override
void initState() {
  super.initState();
  
  final path = widget.allCoursesModel.lessons?[4];

  flickManager = FlickManager(
    videoPlayerController: VideoPlayerController.network(
      path ??
          'https://res.cloudinary.com/placeholder/video/upload/v0000000000/default.mp4', // fallback
    ),
  );
}

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlickVideoPlayer(flickManager: flickManager);
  }
}
