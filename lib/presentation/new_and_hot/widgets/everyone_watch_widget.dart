import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants.dart';
import '../../../domain/model/new&hot/everyoneWatch/everyonewatchlist.dart';
import '../../home/widgets/custom_button_widget.dart';
import '../../widgets/video_widget.dart';

class EveryoneWatchWidgets extends StatelessWidget {
  EveryoneWatchWidgets({super.key, required this.index, required this.movies});
  List<EveryOneWatchList> movies;
  int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight,
          Text(
            movies[index].titles,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          kHeight,
          Text(
            movies[index].overView,
            style: const TextStyle(
                color: Color.fromARGB(255, 129, 129, 129),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          kHeight20,
          VideoWidgets(posterpath: movies[index].backdropPath),
          kHeight20,
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButtonWidget(
                icon: Icons.share,
                title: 'Share',
                iconSize: 25,
                textSize: 16,
              ),
              kWidth25,
              CustomButtonWidget(
                icon: Icons.add,
                title: 'My List',
                iconSize: 25,
                textSize: 16,
              ),
              kWidth25,
              CustomButtonWidget(
                icon: Icons.play_arrow,
                title: 'Play',
                iconSize: 25,
                textSize: 16,
              ),
              kWidth25,
            ],
          )
        ],
      ),
    );
  }
}
