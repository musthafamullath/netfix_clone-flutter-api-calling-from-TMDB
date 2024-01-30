import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/models/movie.dart';

class ReleaseDateWidget extends StatelessWidget {
  const ReleaseDateWidget({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(
            "Release Date: ",
            style: GoogleFonts.zenAntique(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            movie.releaseDate,
            style: GoogleFonts.zenAntique(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
