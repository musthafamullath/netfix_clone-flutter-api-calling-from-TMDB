

import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constents.dart';
import 'package:netflix_clone/presentation/widgets/main_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    super.key,
    required this.pictureSizewidth,
     required this.title,
  });

  final double pictureSizewidth;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
       MainTitle(title:title),
      LimitedBox(
        maxHeight: 200,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => MainCards(pictureSizewidth: pictureSizewidth),
          separatorBuilder: (context, index) => kWidth5,
          itemCount: 10,
        ),
      )
          ],
        ),
    );
  }
}