import 'package:flutter/material.dart';
import 'package:netflix_clone/apiconstants/apiconstants.dart';
import 'package:netflix_clone/core/constents.dart';
import 'package:netflix_clone/presentation/search/widget/title.dart';

import '../../../api/api.dart';
import '../../../models/movie.dart';

class SearchResultWidget extends StatefulWidget {
  const SearchResultWidget({
    super.key,
  });

  @override
  State<SearchResultWidget> createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
  late Future<List<Movie>> topRatedmovies;
  @override
  void initState() {
    super.initState();
    topRatedmovies = Api().getTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight,
          const SearchTextTitle(title: "Movies & TV"),
          kHeight,
          FutureBuilder(
            future: topRatedmovies,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: RefreshProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                return Expanded(
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 1 / 1.4,
                    children: List.generate(
                      20,
                      (index) {
                        return MainCard(poster: ApiConstants.imagePath+snapshot.data![index].posterPath,);
                      },
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        ],
      ),
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({
    super.key, 
    required this.poster,
  });
  final String poster;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(poster), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(7)),
    );
  }
}
