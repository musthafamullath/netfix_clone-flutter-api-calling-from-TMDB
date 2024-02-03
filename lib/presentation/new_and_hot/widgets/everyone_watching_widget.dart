import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constents.dart';
import 'package:netflix_clone/core/string.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/action_widget.dart';
import 'package:shimmer/shimmer.dart';

class EveryWatchCard extends StatelessWidget {
  const EveryWatchCard({
    super.key,
    required this.image,
    required this.title,
    required this.overview,
  });

  final String image;
  final String title;
  final String overview;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kkHeight(10),
          Image.asset(seriesLogo),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          kkHeight(10),
          Text(
            overview,
            style: TextStyle(
              fontWeight: FontWeight.w100,
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
          kkHeight(30),
          _newAndHotMainImage(size, image),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              children: [
                const Spacer(),
                ActionWidget(
                  icon: fastLaughShare,
                  iconSize: 0.05,
                  text: 'Share',
                  textSize: 13,
                  height: 0.01,
                  textColor: Colors.grey.shade500,
                ),
                kkWidth(20),
                ActionWidget(
                  icon: fastLaughAdd,
                  iconSize: 0.05,
                  text: 'My List',
                  textSize: 13,
                  height: 0.01,
                  textColor: Colors.grey.shade500,
                ),
                kkWidth(25),
                ActionWidget(
                  icon: fastLaughPlay,
                  iconSize: 0.05,
                  text: 'Play',
                  textSize: 13,
                  height: 0.01,
                  textColor: Colors.grey.shade500,
                )
              ],
            ),
          ),
          kkHeight(10),
        ],
      ),
    );
  }

  SizedBox _newAndHotMainImage(Size size, String image) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Stack(
        children: [
          CachedNetworkImage(
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
          Positioned(
            top: 10,
            left: 10,
            child: Image.asset(
              logo,
              width: 16,
            ),
          ),
        ],
      ),
    );
  }
}