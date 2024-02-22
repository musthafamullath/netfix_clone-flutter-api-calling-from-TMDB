
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/application/api.dart';
import 'package:netflix_clone/application/apiconstants.dart';
import 'package:netflix_clone/core/string.dart';
import 'package:netflix_clone/domin/models/movie.dart';
import 'package:netflix_clone/presentation/home/widget/custom_button_widget.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/shimmer_for_new_and_hot.dart';
import '../../../core/colors/colors.dart';
import '../../../core/constents.dart';

class BackgroudCard extends StatefulWidget {
  const BackgroudCard(double pictureSizewidth, {super.key, 
  });
 
  @override
  State<BackgroudCard> createState() => _BackgroudCardState();
}

class _BackgroudCardState extends State<BackgroudCard> {
  late Future<List<Movie>> topRatedMovies;
  
  @override
  void initState(){
    topRatedMovies = Api().getTopRatedMovies();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final pictureSizewidth = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
            height: pictureSizewidth.height * 0.65,
            width: pictureSizewidth.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50)
            ),
            child: Stack(
              children: [
         FutureBuilder(
            future: topRatedMovies,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const ShimmerForAll(hightSize: double.infinity, widthSize: double.infinity);
              } else if (snapshot.hasData) {
                return LimitedBox(
                  maxHeight: 900,
                  child: CarouselSlider.builder(itemCount: snapshot.data!.length, itemBuilder: (context, index, realIndex) {
                    return SizedBox(
                          width:  double.infinity ,
                          height: 600 , 
                          child: Image.network(
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.cover,
                              "${ApiConstants.imagePath}${snapshot.data![index].posterPath}"),
                        );
                  }, options: CarouselOptions(
                    height: pictureSizewidth.height * 0.90,
                    autoPlay: true,
                    viewportFraction: 1,
                    aspectRatio: 0/10,
                    scrollDirection: Axis.vertical,
                    enlargeCenterPage: false,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration: const Duration(seconds: 3),
                  ) ),
                );
              } else {
                return const ShimmerForAll(hightSize: double.infinity, widthSize: double.infinity);
              }
            },
          ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color(0xFF000000),
                Color(0x00000000),
                Color(0x00000000),
                Color(0x00000000),
                Color(0x00000000),
                Color(0x00000000),
              ],
            ),
          ),
        ),
              ],
            ),
          ),
        // bannerBackground(pictureSizewidth),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Column(
            children: [
              const Text(
                'Drama • Crime • Action & Adventure',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              kkHeight(pictureSizewidth.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButtonWidget(
                    size: pictureSizewidth,
                    iconSize: 0.04,
                    buttonText: 'My List',
                    icon: fastLaughAdd,
                  ),
                  _playButton(),
                  CustomButtonWidget(
                    size: pictureSizewidth,
                    iconSize: 0.05,
                    buttonText: 'Info',
                    icon: info,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
    
//   Container bannerBackground(Size size) {
//   return ;
// }

TextButton _playButton() {
  return TextButton.icon(
    onPressed: () {},
    style: ButtonStyle(
      minimumSize: MaterialStateProperty.all(const Size(120, 35)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      )),
      backgroundColor: MaterialStateProperty.all(white),
    ),
    icon: const Icon(
      CupertinoIcons.play_arrow_solid,
      size: 25,
      color: black,
    ),
    label: const Text(
      "Play",
      style: TextStyle(fontSize: 20, color: black),
    ),
  );
}


 
}
