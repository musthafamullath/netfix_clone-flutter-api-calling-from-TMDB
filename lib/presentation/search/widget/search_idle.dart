import 'package:flutter/cupertino.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constents.dart';
import 'package:netflix_clone/presentation/search/widget/title.dart';

const imageUrl =
    "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/zVMyvNowgbsBAL6O6esWfRpAcOb.jpg";

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: "Top Searches"),
        kHeight,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => const TopSearchItemTile(),
            separatorBuilder: (context, index) => kHeight12,
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}



class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 70,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        kWidth,
        const Expanded(
          child: Text(
            "Movie Name",
            style: TextStyle(
                color: white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const Icon(CupertinoIcons.play_circle,color: white,size: 45,)
      ],
    );
  }
}
