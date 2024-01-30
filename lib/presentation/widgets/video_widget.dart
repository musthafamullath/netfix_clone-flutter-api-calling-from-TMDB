import 'package:flutter/cupertino.dart';
import 'package:netflix_clone/apiconstants/apiconstants.dart';
import 'circle_avatar_volum_button.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key,
    required this.size,
    this.buttonRadius = 15,
    this.avatarRadius = 15, 
    required this.snapshot, 
    required this.index,
  });

  final Size size;
  final double buttonRadius;
  final double avatarRadius;
  final AsyncSnapshot snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: size.height * 2.5 / 10,
          child: Image.network(
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
            "${ApiConstants.imagePath}${snapshot.data[index].backdropPath}"
          ),
        ),
         Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatarVolumButton(
            buttonRadius: buttonRadius,
            avatarRadius: avatarRadius,
          ),
        )
      ],
    );
  }
}