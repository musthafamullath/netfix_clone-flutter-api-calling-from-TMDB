import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:netflix_clone/api/api.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/presentation/new_and_hot/new_and_hot_app_bar.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/comming_soon_widget.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/everyone_watching_widget.dart';

import '../../core/string.dart';

class ScreenNewAndHot extends StatefulWidget {
  const ScreenNewAndHot({super.key});

  @override
  State<ScreenNewAndHot> createState() => _ScreenNewAndHotState();
}

class _ScreenNewAndHotState extends State<ScreenNewAndHot> {
  late Future<List<Movie>> upComingMovies;
  late Future<List<Movie>> popularSeries;

  @override
  void initState() {
    upComingMovies = Api().getUpComingMovies();
    popularSeries = Api().getNowPlayingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(size.height * 0.115),
            child: const NewAndHotAppBar(),
          ),
          body: TabBarView(
            children: [
              _tabViewOne(context, upComingMovies, size),
              _tavViewTwo(popularSeries),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabViewOne(
    BuildContext context,
    Future<List<Movie>> upComingMovies,
    Size size,
  ) {
    return FutureBuilder(
      future: upComingMovies,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Error loading');
        } else if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return ComingSoonCard(
                image: imageBaseUrl + snapshot.data![index].backdropPath,
                title: snapshot.data![index].title,
                overview: snapshot.data![index].overview,
                date: snapshot.data![index].releaseDate,
              );
            },
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
    );
  }

  Widget _tavViewTwo(Future<List<Movie>> popularMovies) {
    return FutureBuilder(
      future: popularMovies,
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
          return ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return EveryWatchCard(
                image: imageBaseUrl + snapshot.data![index].backdropPath,
                title: snapshot.data![index].title,
                overview: snapshot.data![index].overview,
              );
            },
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
    );
  }
}

