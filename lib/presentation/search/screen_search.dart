import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/search/widget/search_idle.dart';
import 'package:netflix_clone/presentation/search/widget/search_result.dart';

class Screensearch extends StatefulWidget {
  const Screensearch({
    super.key,
  });

  @override
  State<Screensearch> createState() => _ScreensearchState();
}

class _ScreensearchState extends State<Screensearch> {
  final TextEditingController searchController = TextEditingController();

  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CupertinoSearchTextField(
              controller: searchController,
              backgroundColor: Colors.grey.withOpacity(0.4),
              prefixInsets: EdgeInsetsDirectional.zero,
              suffixInsets: const EdgeInsetsDirectional.only(end: 10),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: grey,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: grey,
              ),
              style: const TextStyle(color: Colors.white),
              onTap: () {
                setState(() {
                  isTapped = true;
                });
              },
              onSubmitted: (value) {
                setState(() {
                  isTapped = false;
                });
              },
            ),
            isTapped == true
                ? const SearchIdleWidget()
                : const SearchResultWidget()
          ],
        ),
      )),
    );
  }
}
