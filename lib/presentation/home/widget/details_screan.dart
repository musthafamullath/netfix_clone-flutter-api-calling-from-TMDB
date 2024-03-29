import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/application/apiconstants.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constents.dart';
import 'package:netflix_clone/domin/models/movie.dart';
import 'package:netflix_clone/presentation/widgets/rating_widget.dart';
import 'package:netflix_clone/presentation/widgets/release_date_widget.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: Padding(
              padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: black.withOpacity(0.5),
                ),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: white,
                      size: 32,
                    )),
              ),
            ),
            expandedHeight: size * 3 / 10,
            stretch: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                movie.title,
                style: GoogleFonts.belleza(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                child: Image.network(
                  "${ApiConstants.imagePath}${movie.backdropPath}",
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Text(
                    "Overview",
                    style: GoogleFonts.zenAntique(
                        fontSize: 35, fontWeight: FontWeight.w800),
                    textAlign: TextAlign.start,
                  ),
                  kHeight15,
                  Text(
                    movie.overview,
                    style: GoogleFonts.fahkwang(
                        fontSize: 20, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.justify,
                  ),
                  kHeight15,
                  SizedBox(
                    child: Row(
                      children: [
                        ReleaseDateWidget(movie: movie),
                        const Spacer(),
                        RatingWidget(movie: movie)
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
