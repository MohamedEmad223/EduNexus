import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';

class NoSeekbarControls extends StatelessWidget {
  const NoSeekbarControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: FlickPlayToggle(
            size: 50,
            color: Colors.white,
            padding: const EdgeInsets.all(10),
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: FlickFullScreenToggle(
            color: Colors.white,
            size: 30,
          ),
        ),
      ],
    );
  }
}
