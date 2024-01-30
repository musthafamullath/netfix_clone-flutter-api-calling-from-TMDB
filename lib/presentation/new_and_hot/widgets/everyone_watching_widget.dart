import 'package:flutter/cupertino.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import '../../../core/constents.dart';
import '../../home/widget/custom_button_widget.dart';
import '../../widgets/netflix_logo_with_text.dart';
import '../../widgets/video_widget.dart';

class EveryoneWatchingWidget extends StatelessWidget {
  const EveryoneWatchingWidget({
    super.key, 
    required this.snapshot, 
    required this.index,
  });

  final AsyncSnapshot snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NetflixLogoWIthText(
            videoText: "SERIES",
          ),
           Text(
            "${snapshot.data![index].title}",
            style:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          kHeight5,
           Text(
            "${snapshot.data[index].overview}",
            style:const TextStyle(color: grey, fontSize: 13.8),
          ),
          kHeight50,
          VideoWidget(
            size: size,
            buttonRadius: 22.5,
            avatarRadius: 22.5, 
            snapshot: snapshot, 
            index: index,
          ),
          kHeight25,
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButtonWidget(
                icon: CupertinoIcons.paperplane,
                title: 'Share',
                iconSize: 30,
                textSize: 10,
              ),
              kWidth15,
              CustomButtonWidget(
                icon: CupertinoIcons.add,
                title: 'My List',
                iconSize: 30,
                textSize: 10,
              ),
              kWidth15,
              CustomButtonWidget(
                icon: CupertinoIcons.play_fill,
                title: 'Play',
                iconSize: 30,
                textSize: 10,
              ),
              kWidth15,
            ],
          )
        ],
      ),
    );
  }
}
