import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constents.dart';
import '../../home/widget/custom_button_widget.dart';
import '../../widgets/netflix_logo_with_text.dart';
import '../../widgets/video_widget.dart';

class CommingSoonWIdget extends StatelessWidget {
  const CommingSoonWIdget({
    super.key, 
    required this.snapshot, 
    required this.index,
  });
  final AsyncSnapshot snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        kHeight,
        SizedBox(
          width: size.width * 0.15,
          height: size.height *7.5/10,
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Vote",
                style: TextStyle(fontSize: 18, color: grey),
              ),
              Padding(
                padding:const EdgeInsets.only(left: 5),
                child: Text(
                  "${snapshot.data[index].voteAverage}",
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width * 0.85,
          height: size.height *7.5/10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(size: size, snapshot: snapshot, index: index,),
              kHeight,
               Row(
                children: [
                  Expanded(
                    child: Text(
                      "${snapshot.data![index].originalTitle}",
                      style: GoogleFonts.shadowsIntoLight(fontSize: 20,letterSpacing: 1, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(),
                  const Row(
                    children: [
                      CustomButtonWidget(
                        icon: CupertinoIcons.bell,
                        title: "Remain me",
                        iconSize: 20,
                        textSize: 10,
                      ),
                      kWidth,
                      kWidth,
                      CustomButtonWidget(
                        icon: CupertinoIcons.info,
                        title: "Info",
                        iconSize: 20,
                        textSize: 10,
                      ),
                      kWidth,
                      kWidth5,
                    ],
                  ),
                ],
              ),
              kHeight5,
              Text("${snapshot.data![index].releaseDate}"),
              kHeight,
              const NetflixLogoWIthText(),
              Text(
                "${snapshot.data![index].title}",
                style: const TextStyle(
                  
                  fontSize: 18,
                ),
              ),
              kHeight,
               Text(
                "${snapshot.data[index].overview}",
                style: const TextStyle(color: grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}



