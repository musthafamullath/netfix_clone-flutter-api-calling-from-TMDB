

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/api/api.dart';

import 'package:netflix_clone/core/constents.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/presentation/home/widget/background_card.dart';
import 'package:netflix_clone/presentation/home/widget/carousel_slider_widget.dart';
import 'package:netflix_clone/presentation/home/widget/number_title_card.dart';

import 'package:netflix_clone/presentation/home/widget/main_title_card.dart';

import 'package:netflix_clone/presentation/widgets/home_screen_appbar.dart';

import '../widgets/shimmer_widgets.dart';


ValueNotifier<bool> scrollNotfier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  late Future<List<Movie>> trendingmovies;
  late Future<List<Movie>> topRatedmovies;
  late Future<List<Movie>> upComingmovies;
  late Future<List<Movie>> nowPlayingmovies;
  late Future<List<Movie>> popularmovies;

  @override
  void initState() {
    super.initState();
    trendingmovies = Api().getTrendingMovies();
    topRatedmovies = Api().getTopRatedMovies();
    upComingmovies = Api().getUpComingMovies();
    nowPlayingmovies = Api().getNowPlayingMovies();
    popularmovies = Api().getPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    final pictureSizewidth = MediaQuery.of(context).size;
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotfier,
        builder: (BuildContext contex, intdex, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotfier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotfier.value = true;
              }
              return true;
            },
            child:
             Stack(
              children: [
                ListView(
                  children: [
                    BackgroudCard(pictureSizewidth.width, ),
                    kpaddingsymetric2,
                    SizedBox(
                      child: FutureBuilder(
                        future: trendingmovies,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return ErrorLoading(size: pictureSizewidth);
                          } else if (snapshot.hasData) {
                            return CarouselSliderWIdget(
                              pictureSizewidth: pictureSizewidth.width,
                              snapshot: snapshot,
                            );
                          } else {
                            return ListViewLoading(size: pictureSizewidth);
                          }
                        },
                      ),
                    ),
                    kpaddingsymetric2,
                    SizedBox(
                      child: FutureBuilder(
                        future: topRatedmovies,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return ErrorLoading(size: pictureSizewidth);
                          } else if (snapshot.hasData) {
                            return MainTitleCard(
                                pictureSizewidth: pictureSizewidth.width,
                                title: "Top Rated movies",
                                snapshot: snapshot);
                          } else {
                            return ListViewLoading(size: pictureSizewidth);
                          }
                        },
                      ),
                    ),
                    kpaddingsymetric2,
                    SizedBox(
                      child: FutureBuilder(
                        future: nowPlayingmovies,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return  ErrorLoading(size: pictureSizewidth);
                          } else if (snapshot.hasData) {
                            return NumberTitleCard(
                                pictureSizewidth: pictureSizewidth.width,
                                snapshot: snapshot);
                          } else {
                            return ListViewLoading(size: pictureSizewidth);
                          }
                        },
                      ),
                    ),
                    kpaddingsymetric2,
                    SizedBox(
                      child: FutureBuilder(
                        future: upComingmovies,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return ErrorLoading(size: pictureSizewidth);
                          } else if (snapshot.hasData) {
                            return MainTitleCard(
                                pictureSizewidth: pictureSizewidth.width,
                                title: "Up Comming Movies",
                                snapshot: snapshot);
                          } else {
                            return ListViewLoading(size: pictureSizewidth);
                          }
                        },
                      ),
                    ),
                    kpaddingsymetric2,
                    SizedBox(
                      child: FutureBuilder(
                        future: popularmovies,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return ErrorLoading(size: pictureSizewidth);
                          } else if (snapshot.hasData) {
                            return MainTitleCard(
                                pictureSizewidth: pictureSizewidth.width,
                                title: "Popular Movies",
                                snapshot: snapshot);
                          } else {
                            return ListViewLoading(size: pictureSizewidth);
                          }
                        },
                      ),
                    ),
                    kpaddingsymetric2,
                  ],
                ),
                scrollNotfier.value == true
                    ?HomeScreenAppbar(size: pictureSizewidth)
                    : kkHeight(0),
              ],
            ),
          );
        },
      ),
    );
  }
}
