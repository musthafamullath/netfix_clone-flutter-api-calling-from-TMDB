


import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constents.dart';
import 'package:netflix_clone/presentation/home/widget/number_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
    required this.pictureSizewidth,
  });

  final double pictureSizewidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: 'Top 10 TV Shows In India Today'),
        LimitedBox(
          maxHeight: 200,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => NumberCard(
              pictureSizewidth: pictureSizewidth,
              index: index,
            ),
            separatorBuilder: (context, index) => kWidth5,
            itemCount: 10,
          ),
        )
      ],
    );
  }
}