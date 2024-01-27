

import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

ValueNotifier<int> indexChageNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChageNotifier,
      builder: (context, int newIndex, _) {
        return BottomNavigationBar(
          currentIndex: newIndex,
          elevation: 0,
          onTap: (index) {
            indexChageNotifier.value = index;
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: backgroundColor,
          selectedItemColor: white,
          unselectedItemColor: grey,
          selectedIconTheme: const IconThemeData(color: white),
          unselectedIconTheme: const IconThemeData(color: grey),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.collections_outlined), label: "New & Hot"),
            BottomNavigationBarItem(
                icon: Icon(Icons.emoji_emotions_outlined),
                label: "Fast Laughs"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.arrow_circle_down_outlined),
                label: "Downloads"),
          ],
        );
      },
    );
  }
}
