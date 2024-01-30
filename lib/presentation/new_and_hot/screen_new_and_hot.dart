import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/comming_soon_widget.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/everyone_watching_widget.dart';
import '../../api/api.dart';
import '../../core/constents.dart';
import '../../models/movie.dart';

class ScreenNewAndHot extends StatefulWidget {
  const ScreenNewAndHot({super.key});

  @override
  State<ScreenNewAndHot> createState() => _ScreenNewAndHotState();
}

class _ScreenNewAndHotState extends State<ScreenNewAndHot> {

  late Future<List<Movie>> trendingmovies;
  @override
  void initState() {
    super.initState();
    trendingmovies = Api().getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(95),
          child: AppBar(
            title: const Text(
              "New & Hot",
              style: TextStyle(
                  fontSize: 30, color: white, fontWeight: FontWeight.bold),
            ),
            actions: [
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
            bottom: TabBar(
              unselectedLabelColor: white,
              dividerColor: transparent,
              labelPadding: const EdgeInsets.symmetric(vertical: 6),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding:
                  const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
              labelColor: black,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              indicator: BoxDecoration(
                color: white,
                borderRadius: kradius30,
              ),
              tabs: const [
                Tab(
                  text: "🍿 Comming Soon",
                ),
                Tab(
                  text: " 👀 Everyone Watching",
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _buildComingSoon(),
            _buildEveryoneWatching(),
          ],
        ),
      ),
    );
  }

  Widget _buildComingSoon() {
    return SizedBox(
      child: FutureBuilder(
        future: trendingmovies,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: RefreshProgressIndicator()
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) => CommingSoonWIdget(
                snapshot: snapshot,
                index: index,
              ),
              itemCount: snapshot.data!.length,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _buildEveryoneWatching() {
       return SizedBox(
      child: FutureBuilder(
        future: trendingmovies,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child:  RefreshProgressIndicator()
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) => EveryoneWatchingWidget(snapshot: snapshot, index: index),
              itemCount: snapshot.data!.length,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
