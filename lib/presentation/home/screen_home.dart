import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/home/widget/number_title_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title_card.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final pictureSizewidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: ListView(
      children: [
        MainTitleCard(
          pictureSizewidth: pictureSizewidth,
          title: 'Released in the past year',
        ),
        MainTitleCard(
          pictureSizewidth: pictureSizewidth,
          title: 'Trending Now',
        ),
        NumberTitleCard(pictureSizewidth: pictureSizewidth),
        MainTitleCard(
          pictureSizewidth: pictureSizewidth,
          title: 'Tense Dramas',
        ),
        MainTitleCard(
          pictureSizewidth: pictureSizewidth,
          title: 'South Indian Cinema',
        ),
      ],
    ));
  }
}


