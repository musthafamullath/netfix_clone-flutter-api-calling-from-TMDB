

import 'package:flutter/cupertino.dart';
import 'package:netflix_clone/core/constents.dart';

class NetflixLogoClass extends StatelessWidget {
  const NetflixLogoClass({super.key, 
  this.logoWidth = 70, 
  this.logoHeith = 70});

final double logoWidth;
final double logoHeith;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      kImageNetflixcropedLongedName,
      fit: BoxFit.fitWidth,
      filterQuality: FilterQuality.high,
      width: logoWidth,
      height: logoHeith,
    );
  }
}

