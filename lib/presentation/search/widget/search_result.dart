
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:netflix_clone/presentation/search/widget/search_main_card.dart';
import 'package:netflix_clone/presentation/search/widget/stack_shimmer.dart';
import 'package:netflix_clone/presentation/search/widget/title.dart';
import '../../../core/string.dart';
import '../../../domin/models/movie.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({
    super.key,
    required this.movieList1, 
    required this.movieList2,

  });

  final Future<List<Movie>> movieList1;
  final Future<List<Movie>> movieList2;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Films'),
        FutureBuilder(
          future: Future.wait([movieList1,movieList2]),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const SearchMainCardShimmer();
            } else if (snapshot.hasData) {
              int length = snapshot.data![0].length + snapshot.data![1].length;
              List<dynamic> movies = snapshot.data![0];
              List<dynamic> series = snapshot.data![1];
              return movies.isNotEmpty && series.isNotEmpty
                  ? Expanded(
                    child: GridView.count(
                        padding: const EdgeInsets.only(top: 0, bottom: 10),
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 1 / 1.4,
                        children: List.generate(length, (index) {
                          if (index < movies.length) {
                            return SearchMainCard(
                              image: imageBaseUrl + movies[index].posterPath,
                            );
                          } else {
                            int seriesIndex = index - movies.length;
                            return SearchMainCard(
                              image:
                                  imageBaseUrl + series[seriesIndex].posterPath,
                            );
                          }
                        }),
                      ),
                  )
                  : const Align(
                      child: Text(
                        'No results found!!!',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
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
    );
  }
}




