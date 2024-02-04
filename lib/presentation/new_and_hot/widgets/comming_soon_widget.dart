import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/string.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/action_widget.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/constents.dart';
import 'package:intl/intl.dart';

class ComingSoonCard extends StatelessWidget {
  const ComingSoonCard({
    super.key,
    required this.image,
    required this.overview,
    required this.title,
    required this.date,
  });

  final String image;
  final String title;
  final String overview;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _newAndHotSideDate(size, date),
          SizedBox(
            // height: size.height * 0.6,
            width: size.width - 50,
            child: Column(
              children: [
                _newAndHotMainImage(size, image),
                _cardDetails(size, title, overview, date),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding _cardDetails(
      Size size, String title, String overview, DateTime date) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: GoogleFonts.shadowsIntoLight(
                    fontWeight: FontWeight.bold,letterSpacing: 3,  height: 1),
              ),
              const Spacer(),
              ActionWidget(
                icon: notification,
                iconSize: 0.06,
                text: 'Remind Me',
                height: 0.006,
                textSize: 13,
                textColor: Colors.grey.shade600,
              ),
              kkWidth(size.width * 0.08),
              ActionWidget(
                icon: info,
                iconSize: 0.055,
                text: 'Info',
                height: 0.007,
                textSize: 13,
                textColor: Colors.grey.shade600,
              ),
            ],
          ),
          Text(
            'Releasing on ${DateFormat('EEEE').format(date)} ',
            style: const TextStyle(
              fontWeight: FontWeight.w100,
              fontSize: 10,
            ),
          ),
          kkHeight(10),
          Image.asset(filmLogo),
          kkHeight(10),
          Text(
            overview,
            style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 14,
                color: Colors.grey.shade600),
          ),
          kkHeight(size.height * 0.04)
        ],
      ),
    );
  }

  Container _newAndHotMainImage(Size size, String image) {
    return Container(
      width: double.infinity,
      height: size.height * 0.255,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: image,
            imageBuilder: (context, imageProvider) => ClipRRect(
              borderRadius: BorderRadius.circular(14),
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
                  borderRadius: BorderRadius.circular(14),
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

  SizedBox _newAndHotSideDate(Size size, DateTime date) {
    return SizedBox(
      width: 50,
      // height: size.height * 0.6,
      child: Column(
        children: [
          Text(
            DateFormat('MMM').format(date).toUpperCase(),
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w100,
                color: Colors.grey.shade600),
          ),
          Text(
            DateFormat('dd').format(date),
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              height: 1,
            ),
          )
        ],
      ),
    );
  }
}
