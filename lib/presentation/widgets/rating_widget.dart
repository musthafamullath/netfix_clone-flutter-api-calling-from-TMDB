
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/domin/models/movie.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
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
            "Rating: ",
            style: GoogleFonts.zenAntique(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Icon(
            CupertinoIcons.star_fill,color: Colors.amber,size: 10,
          ),
          Text(" ${movie.voteAverage.toStringAsFixed(1)}/10",style: GoogleFonts.zenAntique(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),)
        ],
      ),
    );
  }
}