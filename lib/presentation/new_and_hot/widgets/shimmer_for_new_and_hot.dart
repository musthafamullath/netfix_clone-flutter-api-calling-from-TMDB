import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constents.dart';

import 'package:shimmer/shimmer.dart';

import '../../../core/colors/colors.dart';

class ShimmerForAll extends StatelessWidget {
  const ShimmerForAll({

    super.key, required this.hightSize, required this.widthSize,
  });
  final double hightSize;
  final double widthSize;
  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: shimmerGradient,
      child:Container(
        width: hightSize,
        height: widthSize,
        color: black,
      ),
    );
  }
}
