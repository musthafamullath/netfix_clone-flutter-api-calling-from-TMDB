import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constents.dart';
import 'package:netflix_clone/presentation/home/widget/details_screan.dart';
import 'package:netflix_clone/presentation/home/widget/main_title.dart';

import '../../../apiconstants/apiconstants.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    super.key,
    required this.pictureSizewidth,
    required this.title,
    required this.snapshot,
  });

  final double pictureSizewidth;
  final String title;
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainTitle(title: title),
              LimitedBox(
                maxHeight: 200,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => kWidth5,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
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
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
