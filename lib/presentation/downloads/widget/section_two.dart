import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:netflix_clone/application/api.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/presentation/downloads/widget/download_image_widget.dart';
import 'package:netflix_clone/presentation/downloads/widget/downloadig_widget.dart';
import '../../../core/constents.dart';
import '../../../core/string.dart';



class Section2 extends StatefulWidget {
  const Section2({super.key});

  @override
  State<Section2> createState() => _Section2State();
}

class _Section2State extends State<Section2> {
  late Future<List<Movie>> trending;
   @override
  void initState() {
    trending = Api().getTrendingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Introduction Download for you",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        kHeight,
        const Text(
          "We will download a personalised selection of\n movies and shows for you, so there's\n always something to watch on your\ndevice",
          textAlign: TextAlign.center,
          style: TextStyle(color: grey, fontSize: 16),
        ),
        kHeight,
        SizedBox(
          width: size.width,
          height: size.width,
          child: FutureBuilder(future: trending , builder: (context, snapshot) {
            if (snapshot.hasError) {
                  return Center(
                    child: SpinKitFadingCircle(
                      itemBuilder: (BuildContext context, int index) {
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            color: index.isEven ? Colors.red : Colors.green,
                          ),
                        );
                      },
                    ),
                  );
                }else if(snapshot.hasData){
                  return   Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: size.width * 0.40,
                backgroundColor: grey.withOpacity(0.5),
              ),
              DownloadsImageWidget(
                imageList: imageBaseUrl + snapshot.data![3].posterPath,
                radius: 20,
                margin: const EdgeInsets.only(left: 160, bottom: 10),
                angle: 20,
                size: Size(size.width * 0.40, size.height * 0.25),
              ),
              DownloadsImageWidget(
                imageList: imageBaseUrl + snapshot.data![5].posterPath,
                radius: 20,
                margin: const EdgeInsets.only(right: 160, bottom: 10),
                angle: -20,
                size: Size(size.width * 0.40, size.height * 0.25),
              ),
              DownloadsImageWidget(
                imageList: imageBaseUrl + snapshot.data![7].posterPath,
                radius: 20,
                margin: const EdgeInsets.only(top: 15),
                angle: 0,
                size: Size(size.width * 0.40, size.height * 0.30),
              ),
            ],
          );
                }else{
                  return DownloadsLoadingWidget(size: size);
                }
          },)
          
        
        ),
      ],
    );
  }
}