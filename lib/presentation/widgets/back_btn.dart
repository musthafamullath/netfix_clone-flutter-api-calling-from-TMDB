import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';

class BackBTN extends StatelessWidget {
  const BackBTN({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      margin: const EdgeInsets.only(
        top: 10,
        left: 10,
      ),
      decoration: BoxDecoration(
          color: black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10)),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          CupertinoIcons.arrow_left,
          size: 25,
          color: white,
        ),
      ),
    );
  }
}