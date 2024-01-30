import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/home/widget/custom_button_widget.dart';
import '../../../core/colors/colors.dart';
import '../../../core/constents.dart';

class BackgroudCard extends StatelessWidget {
  const BackgroudCard(double pictureSizewidth, {super.key});

  @override
  Widget build(BuildContext context) {
    final pictureSizewidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          width: pictureSizewidth,
          height: pictureSizewidth * 1.50,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: NetworkImage(kImaged1),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtonWidget(
                  icon: CupertinoIcons.add,
                  title: "My List",
                ),
                _playButton(),
                const CustomButtonWidget(
                  icon: CupertinoIcons.info,
                  title: "Info",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
TextButton _playButton() {
    return TextButton.icon(
      onPressed: () {},
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(120, 35)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
           RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            
          )
        ),
        backgroundColor: MaterialStateProperty.all(white),
      ),
      icon: const Icon(
        CupertinoIcons.play_arrow_solid,
        size: 25,
        color: black,
      ),
      label:const Text(
        "Play",
        style: TextStyle(fontSize: 20, color: black),
      ),
    );
  }
