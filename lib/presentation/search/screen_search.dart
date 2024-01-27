import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constents.dart';
import 'package:netflix_clone/presentation/search/widget/search_result.dart';

class Screensearch extends StatelessWidget {
  const Screensearch({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children:[
              CupertinoSearchTextField(
                backgroundColor:  Colors.grey.withOpacity(0.4),
                prefixIcon : const Icon(CupertinoIcons.search,color: grey,),
                suffixIcon : const Icon(CupertinoIcons.xmark_circle_fill,color: grey,),
                style: const TextStyle(color: Colors.white),
              ),
              kHeight,
              // const Expanded(child:  SearchIdleWidget()),
              const Expanded(child:  SearchResultWidget()),
            ],
          ),
        )
        ),
    );
  }
}