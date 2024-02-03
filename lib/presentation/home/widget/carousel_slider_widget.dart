import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/apiconstants/apiconstants.dart';
import 'package:netflix_clone/presentation/home/widget/details_screan.dart';
import 'package:netflix_clone/presentation/home/widget/main_title.dart';


class CarouselSliderWIdget extends StatelessWidget {
  const CarouselSliderWIdget({
    super.key,
    required this.pictureSizewidth,
    required this.snapshot,
  });

  final double pictureSizewidth;
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MainTitle(title: "Trending Movies"),
              SizedBox(
                width: pictureSizewidth,
                child: CarouselSlider.builder(
                  itemCount: snapshot.data!.length,
                  options: CarouselOptions(
                    height: pictureSizewidth * 0.55,
                    autoPlay: true,
                    viewportFraction: 0.35,
                    enableInfiniteScroll: true,
                    pageSnapping: true,
                    enlargeCenterPage: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration: const Duration(seconds: 2),
                  ),
                  itemBuilder: (context, index, realIndex) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailsScreen(movie: snapshot.data[index]),
                            ),
                          );
                        },
                        child: SizedBox(
                          width: pictureSizewidth * 0.33,
                          height: pictureSizewidth * 0.6,
                          child: Image.network(
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.cover,
                              "${ApiConstants.imagePath}${snapshot.data[index].posterPath}"),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
