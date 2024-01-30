import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class CircleAvatarVolumButton extends StatelessWidget {
  const CircleAvatarVolumButton({
    super.key,
    required this.buttonRadius, 
    required this.avatarRadius,
    
  });

  final double avatarRadius;
  final double buttonRadius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: black.withOpacity(0.5),
      radius: avatarRadius,
      child: IconButton(
        onPressed: () {},
        icon:  Icon(
          CupertinoIcons.volume_off,
          color: white,
          size: buttonRadius,
        ),
      ),
    );
  }
}