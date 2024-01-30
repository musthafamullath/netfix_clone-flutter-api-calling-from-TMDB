import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/api/api.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constents.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/presentation/home/widget/background_card.dart';
import 'package:netflix_clone/presentation/home/widget/carousel_slider_widget.dart';
import 'package:netflix_clone/presentation/home/widget/number_title_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title_card.dart';
import 'package:netflix_clone/presentation/widgets/netflix_logo_Widget.dart';

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
    final pictureSizewidth = MediaQuery.of(context).size.width;
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
            child: Stack(
              children: [
                ListView(
                  children: [
                    BackgroudCard(pictureSizewidth),
                    kpaddingsymetric2,
                    SizedBox(
                      child: FutureBuilder(
                        future: trendingmovies,
                        builder: (context, snapshot) {
                          if(snapshot.hasError){
                            return const Center(
                              child: RefreshProgressIndicator(),
                            );
                          }else if(snapshot.hasData){
                            return CarouselSliderWIdget(pictureSizewidth: pictureSizewidth, snapshot: snapshot,);
                          }else{
                            return const Center(
                              child:  CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                    kpaddingsymetric2,
                     SizedBox(
                      child: FutureBuilder(
                        future: topRatedmovies,
                        builder: (context, snapshot) {
                          if(snapshot.hasError){
                            return const Center(
                              child: RefreshProgressIndicator(),
                            );
                          }else if(snapshot.hasData){
                            return MainTitleCard(pictureSizewidth: pictureSizewidth, title: "Top Rated movies", snapshot: snapshot);
                          }else{
                            return const Center(
                              child:  CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                    kpaddingsymetric2,
                    SizedBox(
                      child: FutureBuilder(
                        future: nowPlayingmovies,
                        builder: (context, snapshot) {
                          if(snapshot.hasError){
                            return const Center(
                              child:  RefreshProgressIndicator(),
                            );
                          }else if(snapshot.hasData){
                            return NumberTitleCard(pictureSizewidth: pictureSizewidth, snapshot: snapshot);
                          }else{
                            return const Center(
                              child:  CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                    kpaddingsymetric2,
                      SizedBox(
                      child: FutureBuilder(
                        future: upComingmovies,
                        builder: (context, snapshot) {
                          if(snapshot.hasError){
                            return const Center(
                              child: RefreshProgressIndicator(),
                            );
                          }else if(snapshot.hasData){
                            return MainTitleCard(pictureSizewidth: pictureSizewidth, title: "Up Comming Movies", snapshot: snapshot);
                          }else{
                            return const Center(
                              child:  CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                    kpaddingsymetric2,
                     SizedBox(
                      child: FutureBuilder(
                        future: popularmovies,
                        builder: (context, snapshot) {
                          if(snapshot.hasError){
                            return const Center(
                              child: RefreshProgressIndicator(),
                            );
                          }else if(snapshot.hasData){
                            return MainTitleCard(pictureSizewidth: pictureSizewidth, title: "Popular Movies", snapshot: snapshot);
                          }else{
                            return const Center(
                              child:  CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                    kpaddingsymetric2,
                  ],
                ),
                scrollNotfier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(microseconds: 1000),
                        width: double.infinity,
                        height: pictureSizewidth * 0.27,
                        color: black.withOpacity(0.15),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                kWidth,
                                const NetflixLogoClass(
                                  logoWidth: 80,
                                  logoHeith: 80,
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.cast,
                                  size: 30,
                                  color: white,
                                ),
                                kWidth,
                                Container(
                                  width: 30,
                                  height: 25,
                                  color: blue,
                                ),
                                kWidth,
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("TV Shows", style: kHomeTitleText),
                                Text("Movies", style: kHomeTitleText),
                                Text("Categories", style: kHomeTitleText),
                              ],
                            ),
                          ],
                        ),
                      )
                    : kHeight,
              ],
            ),
          );
        },
      ),
    );
  }
}
