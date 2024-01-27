

import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constents.dart';
import 'package:netflix_clone/presentation/search/widget/title.dart';

const imageUrl =
    "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/zVMyvNowgbsBAL6O6esWfRpAcOb.jpg";

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        const SearchTextTitle(title: "Movies & TV"),
        kHeight,
        Expanded(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 1/1.4,
            children: List.generate(
              20,
              (index) {
                return const MainCard();
              },
            ),
          ),
        )
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image:
            const DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(7)
      ),
      
    );
  }
}
