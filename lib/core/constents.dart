import 'package:flutter/material.dart';

const kWidth = SizedBox(width: 10);
const kWidth15 = SizedBox(width: 15);
const kWidth5 = SizedBox(width: 5);
const kHeight = SizedBox(height: 10);
const kHeight15 = SizedBox(height: 15);
const kHeight5 = SizedBox(height: 5);
const kHeight12 = SizedBox(height: 12);
const kHeight25 = SizedBox(height: 25);
const kHeight50 = SizedBox(height: 50);
kkWidth(double width) => SizedBox(width: width);
kkHeight(double height) => SizedBox(height: height);


//borderRedius
final BorderRadius kradius10 = BorderRadius.circular(10);
final BorderRadius kradius30 = BorderRadius.circular(30);
//padding
const kpaddingsymetric2 = Padding(padding: EdgeInsets.symmetric(vertical: 2));
//image
const kImaged1 = "https://media.themoviedb.org/t/p/w220_and_h330_face/A7EByudX0eOzlkQ2FIbogzyazm2.jpg";
const kImaged2 = "https://media.themoviedb.org/t/p/w220_and_h330_face/siduVKgOnABO4WH4lOwPQwaGwJp.jpg";
const kImaged3 = "https://media.themoviedb.org/t/p/w220_and_h330_face/wj1VRcVsh39nkxLkZP8tuGd96tc.jpg";
const kImagelandscape = "https://media.themoviedb.org/t/p/w355_and_h200_multi_faces/hLYGNwf0T4Cvewt8n9WoKODlMjN.jpg";
//textstyles
TextStyle kHomeTitleText = const TextStyle(fontSize: 16,fontWeight: FontWeight.bold);
//netflixImage 
const kImageNetflix = "assets/netflix-symbol-black-removebg.png";
const kImageNetflixcroped = "assets/netflix-symbol-black__1_-removebg-preview.png";
const kImageNetflixcropedLongedName = "assets/pngimg.com - netflix_PNG25.png";
//shimmerGradient
final shimmerGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: <Color>[
    Colors.grey[900]!,
    Colors.grey[200]!,
    Colors.grey[500]!,
    Colors.grey[200]!,
    Colors.grey[900]!
  ],
  stops: const <double>[0.0, 0.35, 0.5, 0.65, 1.0],
);

//mainImage
const mainImage =
    "https://firebasestorage.googleapis.com/v0/b/api-netflix-4acce.appspot.com/o/Error%20image.jpg?alt=media&token=902c101f-c10e-4f4e-8318-aad84c640ff3";


const kTextStyleHome = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
);