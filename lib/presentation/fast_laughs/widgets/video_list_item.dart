import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: black.withOpacity(0.5),
                  radius: 30,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off,
                      color: white,
                      size: 30,
                    ),
                  ),
                ),
                 Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const  EdgeInsets.symmetric(vertical: 10),
                      child:  Container(
                        decoration:const BoxDecoration(
                          color: white,
                          shape: BoxShape.circle,
                          boxShadow:  [
                            BoxShadow(
                                blurRadius: 5,
                                color: black,
                                spreadRadius: 1,offset: Offset(2.5, 2.5))
                          ],
                        ),
                        child:const CircleAvatar(
                         radius: 30,
                         backgroundImage: NetworkImage(
                             "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/zVMyvNowgbsBAL6O6esWfRpAcOb.jpg"),
                            ),
                      ),
                    ),
                    const VideoActionWidget(icon: Icons.emoji_emotions, title: "LOL"),
                    const VideoActionWidget(
                        icon: CupertinoIcons.add, title: "My List"),
                    const VideoActionWidget(
                        icon: CupertinoIcons.paperplane, title: "Share"),
                    const VideoActionWidget(
                        icon: CupertinoIcons.play_fill, title: "play"),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class VideoActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: white,
            size: 30,
            shadows: const [
              Shadow(
                color: black,
                blurRadius: 10,
                offset: Offset(2.5, 2.5),
              )
            ],
          ),
          Text(
            title,
            style: const TextStyle(
              color: white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
