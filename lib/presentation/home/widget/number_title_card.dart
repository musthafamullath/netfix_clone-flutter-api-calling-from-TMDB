import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constents.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';
import '../../../apiconstants/apiconstants.dart';
import '../../../core/colors/colors.dart';
import '../../widgets/details_screan.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
    required this.pictureSizewidth,
    required this.snapshot,
  });

  final double pictureSizewidth;
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MainTitle(title: 'Top List of Now playing'),
          LimitedBox(
            maxHeight: 200,
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => kWidth5,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: pictureSizewidth * 1 / 10,
                            height: pictureSizewidth * 0.6,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsScreen(movie: snapshot.data[index]),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                width: pictureSizewidth * 0.33,
                                height: pictureSizewidth * 0.6,
                                child: Image.network(
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.cover,
                                    "${ApiConstants.imagePath}${snapshot.data[index].posterPath}"),
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
                }),
          )
        ],
      ),
    );
  }
}
