import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/constents.dart';

class SearchMainCardShimmer extends StatelessWidget {
  const SearchMainCardShimmer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: LimitedBox(
        child: GridView.count(
          padding: const EdgeInsets.only(top: 0, bottom: 10),
          shrinkWrap: true,
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1 / 1.4,
          children: List.generate(15, (index) {
            return Shimmer(
              gradient: shimmerGradient,
              child: SizedBox(
                width: size.width * 0.35,
                height: size.height * 0.23,
                child: Shimmer(
                period: const Duration(seconds: 2),
                gradient: shimmerGradient,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.black,
                      ),
                ),
              )
              ),
            );
          }),
        ),
      ),
    );
  }
}