import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';

class VideoWidgets extends StatelessWidget {
  const VideoWidgets({
    super.key,required this.posterpath
  });
  final String posterpath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            'https://image.tmdb.org/t/p/w500$posterpath',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: 8,
          bottom: 8,
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.5),
            radius: 20,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off,
                color: kWhiteColor,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
