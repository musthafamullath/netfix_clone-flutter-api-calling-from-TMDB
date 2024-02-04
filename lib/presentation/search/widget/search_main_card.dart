import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constents.dart';
import 'package:shimmer/shimmer.dart';

class SearchMainCard extends StatelessWidget {
  const SearchMainCard({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      child: CachedNetworkImage(
        imageUrl: image,
        imageBuilder: (context, imageProvider) => ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image(
            image: imageProvider,
            fit: BoxFit.cover,
            width: size.width,
            height: size.height,
          ),
        ),
        placeholder: (context, url) => Shimmer(
          gradient: shimmerGradient,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}