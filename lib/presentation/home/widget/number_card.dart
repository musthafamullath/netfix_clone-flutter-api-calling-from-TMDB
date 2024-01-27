


import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constents.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({
    super.key,
    required this.pictureSizewidth,
    required this.index,
  });

  final double pictureSizewidth;
  final int index;

  @override
  Widget build(BuildContext context) { 
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: pictureSizewidth*1/8,
            ),
            Container(
              width: pictureSizewidth*0.33,
              height: pictureSizewidth*0.6,
              decoration:  BoxDecoration(
                borderRadius: kradius10,
                image:const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://media.themoviedb.org/t/p/w300_and_h450_bestv2/zVMyvNowgbsBAL6O6esWfRpAcOb.jpg"),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 10,
          bottom: 0,
          child:  BorderedText(
            strokeWidth:10.0,
            child: Text("${index + 1}",style: const TextStyle(fontSize: 100,decoration: TextDecoration.none,decorationColor: black ),),),),
      ],
    );
  }
}