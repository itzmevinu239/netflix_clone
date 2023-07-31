import 'package:flutter/cupertino.dart';
import '../../core/constants.dart';
import 'main_card.dart';
import 'main_title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard(
      {super.key, required this.title, required this.popularList});
  final String title;
  final List popularList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        kHeight,

        // MainCardWidgets(),
        LimitedBox(
          maxHeight: 200,
          child: ListView.separated(
            itemBuilder: (context, index) => MainCardWidgets(
                index: index, posterpath: popularList[index]?.posterpath),
            separatorBuilder: (context, index) => kWidth,
            scrollDirection: Axis.horizontal,
            itemCount: popularList.length,
          ),
        )
      ],
    );
  }
}
