import 'package:flutter/material.dart';
import '../../../core/constents.dart';
import '../../../core/string.dart';

class SmartDownloads extends StatelessWidget {
  const SmartDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        kkWidth(size.width * 0.014),
        SizedBox(
          width: 23,
          child: Image.asset(
            setting,
            fit: BoxFit.cover,
            color: Colors.white,
          ),
        ),
        kkWidth(size.width * 0.04),
        const Text(
          'Smart Downloads',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}