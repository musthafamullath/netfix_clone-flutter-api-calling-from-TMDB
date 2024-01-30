
import 'package:flutter/cupertino.dart';

import '../../../core/colors/colors.dart';

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
