import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.icon,
    required this.title,
    this.iconSize = 25,
    this.textSize = 18,
  });
  final IconData icon;
  final String title;
  final double iconSize;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: white,
          size: iconSize,
        ),
        Text(
          title,
          style:  TextStyle(
            fontSize: textSize,
          ),
        ),
      ],
    );
  }
}