import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import 'custom_button_widget.dart';

class BackGroundCard extends StatefulWidget {
  final mainImage;
  const BackGroundCard({super.key, this.mainImage});
  

  @override
  State<BackGroundCard> createState() => _BackGroundCardState();
}

class _BackGroundCardState extends State<BackGroundCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 650,
          decoration:  BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://image.tmdb.org/t/p/w500${widget.mainImage}"),
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          right: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomButtonWidget(
                icon: Icons.add,
                title: 'My List',
              ),
              kWidth,
              _PlayButton(),
              kWidth,
              const CustomButtonWidget(icon: Icons.info_outline, title: 'Info')
            ],
          ),
        )
      ],
    );
  }

  TextButton _PlayButton() {
    return TextButton.icon(
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(kWhiteColor),
      ),
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        color: ktextBlackColor,
        size: 25,
      ),
      label: const Padding(
        padding: EdgeInsets.only(right: 8),
        child: Text(
          'Play',
          style: TextStyle(
              color: ktextBlackColor,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
