
import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/downloads/widget/section_three.dart';
import 'package:netflix_clone/presentation/downloads/widget/section_two.dart';
import 'package:netflix_clone/presentation/downloads/widget/smart_widget.dart';
import 'widget/download_app_bar_widget.dart';


class ScreenDownlaod extends StatelessWidget {
  ScreenDownlaod({super.key});

  final _widgetList = [const SmartDownloads(), const Section2(), const Section3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          appbarTitle: 'Downloads',
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







