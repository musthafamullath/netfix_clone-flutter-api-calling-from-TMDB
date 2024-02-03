import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/string.dart';
import 'package:netflix_clone/presentation/fast_laughs/widgets/video_action_widget.dart';
import 'package:netflix_clone/presentation/fast_laughs/widgets/video_player_button.dart';
import 'package:video_player/video_player.dart';

class VideoListItem extends StatefulWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  VideoPlayerController? playerController;
  bool isVolumeOn = true;
  @override
  void initState() {
    super.initState();
    setState(() {
      playerController =
          VideoPlayerController.networkUrl(Uri.parse(videoList[widget.index]));
    });
    playerController!.initialize();
    playerController!.play();
    playerController!.setVolume(4);
    playerController!.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    playerController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    

    return Stack(
      children: [
        SizedBox.square(
          child: VideoPlayer(playerController!),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                vedioCircleAvatarWidget(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5,
                                color: black,
                                spreadRadius: 1,
                                offset: Offset(2.5, 2.5))
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: black,
                          backgroundImage:
                              NetworkImage(imageList[widget.index]),
                        ),
                      ),
                    ),
                    const VideoActionWidget(
                      icon: Icons.emoji_emotions,
                      title: "LOL",
                    ),
                    const VideoActionWidget(
                        icon: CupertinoIcons.add, title: "My List"),
                    const VideoActionWidget(
                        icon: CupertinoIcons.paperplane, title: "Share"),
                    VideoPlayButton(
                      playerController: playerController!,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  CircleAvatar vedioCircleAvatarWidget() {
    return CircleAvatar(
      backgroundColor: black.withOpacity(0.5),
      radius: 30,
      child: InkWell(
        onTap: () {
          setState(() {
            isVolumeOn == false
                ? playerController!.setVolume(4)
                : playerController!.setVolume(0);
            isVolumeOn = !isVolumeOn;
          });
        },
        child: isVolumeOn
            ? const Icon(
                CupertinoIcons.volume_up,
                color: white,
                size: 30,
              )
            : const Icon(
                CupertinoIcons.volume_off,
                color: white,
                size: 30,
              ),
      ),
    );
  }
}


