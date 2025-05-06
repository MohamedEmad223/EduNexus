import 'package:edunexus/feature/home/data/model/all_courses.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';

class VideoWidget extends StatefulWidget {
  final FlickManager flickManager;
  final Function onVideoFinished;
  final AllCoursesModel? allCoursesModel;

  const VideoWidget({
    super.key,
    required this.flickManager,
    required this.onVideoFinished,
    this.allCoursesModel,
  });

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  bool _isListening = false;

  void _setupVideoListener() {
    if (_isListening) return;
    
    _isListening = true;
    
    // Add listener to track video completion
    final controller = widget.flickManager.flickVideoManager?.videoPlayerController;
    if (controller != null) {
      controller.addListener(_checkVideoProgress);
    }
  }

  void _removeVideoListener() {
    if (!_isListening) return;
    
    final controller = widget.flickManager.flickVideoManager?.videoPlayerController;
    if (controller != null) {
      controller.removeListener(_checkVideoProgress);
    }
    
    _isListening = false;
  }

  void _checkVideoProgress() {
    final controller = widget.flickManager.flickVideoManager?.videoPlayerController;
    if (controller == null) return;
    
    if (controller.value.isInitialized &&
        controller.value.position >= controller.value.duration - const Duration(seconds: 1) &&
        !controller.value.isBuffering) {
      _removeVideoListener();
      widget.onVideoFinished();
    }
  }

  @override
  void initState() {
    super.initState();
    
    // Wait for the widget to be fully built before setting up the listener
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setupVideoListener();
    });
  }

  @override
  void didUpdateWidget(VideoWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    // If the FlickManager instance changed, update our listeners
    if (oldWidget.flickManager != widget.flickManager) {
      _removeVideoListener();
      
      // Wait for the widget to be fully updated before setting up the new listener
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _setupVideoListener();
      });
    }
  }

  @override
  void dispose() {
    _removeVideoListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlickVideoPlayer(
      flickManager: widget.flickManager,
      flickVideoWithControls: const FlickVideoWithControls(
        controls: FlickPortraitControls(),
        videoFit: BoxFit.contain,
      ),
      flickVideoWithControlsFullscreen: const FlickVideoWithControls(
        controls: FlickLandscapeControls(),
        videoFit: BoxFit.contain,
      ),
    );
  }
}