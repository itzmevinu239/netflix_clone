import 'package:flutter/cupertino.dart';
import 'package:netflix_clone/core/constants.dart';
import '../../../core/colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {super.key,
      required this.icon,
      required this.title,
      this.iconSize = 25,
      this.textSize = 16});
  final IconData icon;
  final String title;
  final double iconSize;
  final double textSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhiteColor,
          size: iconSize,
        ),
        kHeight5,
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: textSize),
        ),
      ],
    );
  }
}
