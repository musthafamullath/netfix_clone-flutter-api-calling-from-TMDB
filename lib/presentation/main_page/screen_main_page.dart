

import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/downloads/screen_downlaods.dart';
import 'package:netflix_clone/presentation/fast_laughs/screen_fast_laugh.dart';
import 'package:netflix_clone/presentation/home/screen_home.dart';
import 'package:netflix_clone/presentation/main_page/widget/bottom_nav.dart';
import 'package:netflix_clone/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix_clone/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final _pages = [
   const ScreenHome(),
   const ScreenNewAndHot(),
   const ScreenFastLaughs(),
   const Screensearch(),
   ScreenDownlaod()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChageNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
