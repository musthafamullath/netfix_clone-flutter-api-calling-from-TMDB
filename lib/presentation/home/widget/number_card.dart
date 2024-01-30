import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constents.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({
    super.key,
    required this.pictureSizewidth,
    required this.index,
  });

  final double pictureSizewidth;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: pictureSizewidth * 1 / 10,
              height: pictureSizewidth * 0.6,
            ),
            Container(
              width: pictureSizewidth * 0.33,
              height: pictureSizewidth * 0.6,
              decoration: BoxDecoration(
                borderRadius: kradius10,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                  kImaged1),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 2,
          bottom: -30,
          child: BorderedText(
            strokeWidth: 4,
            strokeColor: white,
            child: Text(
              "${index + 1}",
              style: const TextStyle(
                  fontSize: 110,
                  color: black,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  decorationColor: black),
            ),
          ),
        ),
      ],
    );
  }
}
