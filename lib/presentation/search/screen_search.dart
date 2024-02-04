import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/application/api.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/presentation/fast_laughs/widgets/debouncer.dart';
import 'package:netflix_clone/presentation/search/search.dart';
import 'package:netflix_clone/presentation/search/widget/search_idle.dart';
import 'package:netflix_clone/presentation/search/widget/search_result.dart';


ValueNotifier<List<Movie>> searching = ValueNotifier([]);

class Screensearch extends StatefulWidget {
  const Screensearch({
    super.key,
  });

  @override
  State<Screensearch> createState() => _ScreensearchState();
}

class _ScreensearchState extends State<Screensearch> {
  final TextEditingController searchController = TextEditingController();
  late Future<List<Movie>> popular;
  late Future<List<Movie>> upcoming;


  final Debouncer debouncer =
      Debouncer(delay: const Duration(milliseconds: 500));

  bool isTapped = false;

  @override
  void initState() {
    popular = Api().getNowPlayingMovies();
    upcoming = Api().getUpComingMovies();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              controller: searchController,
              backgroundColor: Colors.grey.withOpacity(0.4),
              prefixInsets: EdgeInsetsDirectional.zero,
              suffixInsets: const EdgeInsetsDirectional.only(end: 10),
              prefixIcon: const Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Icon(
                  CupertinoIcons.search,
                  color: grey,
                ),
              ),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: grey,
              ),
              style: const TextStyle(color: Colors.white),
              onTap: () {
                setState(() {
                  isTapped = true;
                });
              },
              onChanged: (value) {
                debouncer.run(() {
                  setState(() {
                    popular = getAllMoviesList(value);
                    upcoming = getAllMoviesList(value);
                    
                  });
                });
              },
            ),
            isTapped == true
                ? Expanded(
                    child: SearchIdleWidget(
                    popularSearches: popular,
                  ))
                : Expanded(
                    child: SearchResultWidget(
                    movieList1: popular, movieList2: upcoming,
                    
                  ))
          ],
        ),
      )),
    );
  }
}

