

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constents.dart';
import 'package:netflix_clone/presentation/widgets/app_bar_widget.dart';

class ScreenDownlaod extends StatelessWidget {
  ScreenDownlaod({super.key});

  final _widgetList = [const _SmartDownloads(), Section2(), const Section3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: "Downloads",
        ),
      ),
      body: ListView.separated(
        padding:const EdgeInsets.all(10) ,
        itemBuilder: (context, index) => _widgetList[index] ,
        separatorBuilder: (context, index) => const SizedBox(height: 20,),
        itemCount: _widgetList.length,
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});
  final List imageList = [
    kImaged1,
    kImaged2,
    kImaged3,
  ];
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
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: size.width * 0.40,
                backgroundColor: grey.withOpacity(0.5),
              ),
              DownloadsImageWidget(
                imageList: imageList[0],
                radius: 20,
                margin: const EdgeInsets.only(left: 160, bottom: 10),
                angle: 20,
                size: Size(size.width * 0.40, size.height * 0.25),
              ),
              DownloadsImageWidget(
                imageList: imageList[1],
                radius: 20,
                margin: const EdgeInsets.only(right: 160, bottom: 10),
                angle: -20,
                size: Size(size.width * 0.40, size.height * 0.25),
              ),
              DownloadsImageWidget(
                imageList: imageList[2],
                radius: 20,
                margin: const EdgeInsets.only(top: 15),
                angle: 0,
                size: Size(size.width * 0.40, size.height * 0.30),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: blue,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Set up',
                style: TextStyle(
                    color: white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          color: white,
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See what you can download',
              style: TextStyle(
                  color: black, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.settings,
          color: white,
        ),
        kWidth,
        Text("Smart Downloads"),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    required this.imageList,
    required this.margin,
    required this.angle,
    required this.size,
    this.radius = 10,
  });

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              imageList,
            ),
          ),
        ),
      ),
    );
  }
}
