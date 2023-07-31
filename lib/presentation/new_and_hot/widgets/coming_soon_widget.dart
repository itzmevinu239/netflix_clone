import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone/domain/model/new&hot/comingSoon/coming_soon_list.dart';
import '../../../core/constants.dart';
import '../../home/widgets/custom_button_widget.dart';
import '../../widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  ComingSoonWidget({super.key, required this.index, required this.movies});
  List<ComingSoonList> movies;
  int index;
  @override
  Widget build(BuildContext context) {
    String formattedMonth =
        DateFormat.MMM().format(DateTime.parse(movies[index].releaseDate));
    String formattedDay =
        DateFormat.d().format(DateTime.parse(movies[index].releaseDate));
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            height: 480,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  formattedMonth,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(200, 158, 158, 158),
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  formattedDay,
                  style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3),
                ),
              ],
            ),
          ),
          SizedBox(
            width: size.width - 52,
            height: 480,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoWidgets(
                  posterpath: movies[index].backdropPath,
                ),
                kHeight20,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        movies[index].title,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Row(
                      children: [
                        CustomButtonWidget(
                          icon: Icons.alarm_off_rounded,
                          title: 'Remind Me',
                          iconSize: 18,
                          textSize: 12,
                        ),
                        kWidth25,
                        CustomButtonWidget(
                          icon: Icons.info_outline,
                          title: 'Info',
                          iconSize: 18,
                          textSize: 12,
                        ),
                        kWidth25,
                      ],
                    )
                  ],
                ),
                kHeight,
                Text(
                  movies[index].releaseDate,
                  style: kHometextstyle,
                ),
                kHeight20,
                Text(
                  movies[index].title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                kHeight20,
                Text(
                  movies[index].overviEw,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
