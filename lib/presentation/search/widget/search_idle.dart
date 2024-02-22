
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:netflix_clone/core/constents.dart';
import 'package:netflix_clone/domin/models/movie.dart';
import 'package:netflix_clone/presentation/search/widget/popular_search.dart';
import 'package:netflix_clone/presentation/search/widget/title.dart';
import '../../../core/string.dart';



class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({
    super.key,
    required this.popularSearches,
  });

  final Future<List<Movie>> popularSearches;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchTextTitle(title: 'Popular Searches'),
          FutureBuilder(
            future: popularSearches,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return SpinKitFadingCircle(
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: index.isEven ? Colors.red : Colors.green,
                      ),
                    );
                  },
                );
              } else if (snapshot.hasData) {
                return Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 0),
                    itemBuilder: (context, index) => PopularSearchItemTile(
                      imageList:
                          imageBaseUrl + snapshot.data![index].backdropPath,
                      movieName: snapshot.data![index].title,
                    ),
                    separatorBuilder: (context, index) => kkHeight(10),
                    itemCount: snapshot.data!.length,
                  ),
                );
              } else {
                return SpinKitFadingCircle(
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: index.isEven ? Colors.red : Colors.green,
                      ),
                    );
                  },
                );
              }
            },
          )
        ],
      ),
    );
  }
}
