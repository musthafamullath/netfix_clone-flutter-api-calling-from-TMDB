import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../core/colors/colors.dart';

class VideoPlayButton extends StatefulWidget {
  const VideoPlayButton({
    super.key,
    required this.playerController,
  });
  final VideoPlayerController playerController;

  @override
  State<VideoPlayButton> createState() => _VideoPlayButtonState();
}

class _VideoPlayButtonState extends State<VideoPlayButton> {
  bool isPlay = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          IconButton(
              onPressed: () {
                setState(() {
                  if (isPlay) {
                    widget.playerController.pause();
                  } else {
                    widget.playerController.play();
                  }
                });
                isPlay = !isPlay;
              },
              icon: isPlay
                  ? const Icon(
                      CupertinoIcons.pause_fill,
                      color: white,
                      size: 30,
                    )
                  : const Icon(
                      CupertinoIcons.play_fill,
                      color: white,
                      size: 30,
                    )),
          isPlay
              ? const Text(
                  "Pause",
                  style: TextStyle(fontSize: 16,),
                )
              : const Text(
                  "Play",
                  style: TextStyle(fontSize: 16,),
                )
        ],
      ),
    );
  }
}