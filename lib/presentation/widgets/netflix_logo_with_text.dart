import 'package:flutter/cupertino.dart';
import 'package:netflix_clone/core/constents.dart';

class NetflixLogoWIthText extends StatelessWidget {
  const NetflixLogoWIthText({
    super.key, this.videoText = "FILM",
  });
  final String videoText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          kImageNetflixcroped,
          width: 10,
          height: 15,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
         Padding(
          padding:const EdgeInsets.only(left: 3),
          child: Text(
            videoText,
            style:const TextStyle(letterSpacing: 4, fontSize: 8),
          ),
        ),
      ],
    );
  }
}