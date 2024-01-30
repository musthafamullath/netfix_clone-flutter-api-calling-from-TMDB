import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/api/api.dart';
import 'package:netflix_clone/apiconstants/apiconstants.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constents.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/presentation/search/widget/title.dart';



class SearchIdleWidget extends StatefulWidget {
  const SearchIdleWidget({super.key});

  @override
  State<SearchIdleWidget> createState() => _SearchIdleWidgetState();
}

class _SearchIdleWidgetState extends State<SearchIdleWidget> {
  late Future<List<Movie>> trendingmovies;

  @override
  void initState() {
    super.initState();
    trendingmovies = Api().getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchTextTitle(title: "Top Searches"),
          kHeight,
          Expanded(
            child: FutureBuilder(
              future: trendingmovies,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: RefreshProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => TopSearchItemTile(
                      snapshot: snapshot,
                      index: index,
                      title: snapshot.data![index].title,
                      moviePoster: ApiConstants.imagePath +
                          snapshot.data![index].backdropPath,
                    ),
                    separatorBuilder: (context, index) => kHeight12,
                    itemCount: 10,
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile(
      {super.key,
      required this.snapshot,
      required this.index,
      required this.title,
      required this.moviePoster});
  final AsyncSnapshot snapshot;
  final int index;
  final String title;
  final String moviePoster;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 70,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(moviePoster),
            ),
          ),
        ),
        kWidth,
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
                color: white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const Icon(
          CupertinoIcons.play_circle,
          color: white,
          size: 45,
        )
      ],
    );
  }
}
