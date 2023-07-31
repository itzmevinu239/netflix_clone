import 'package:flutter/cupertino.dart';

import '../../../core/constants.dart';
import '../../widgets/main_title.dart';
import 'number_card.dart';

class NumberTitleCardWigget extends StatelessWidget {
  const NumberTitleCardWigget(
      {super.key, required this.title, required this.toprateList});
  final String title;
  final List toprateList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        kHeight,
        LimitedBox(
            maxHeight: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => NumberCardWidget(
                    index: index, posterpath: toprateList[index]?.posterpath),
                separatorBuilder: (context, index) => kWidth,
                itemCount: toprateList.length))
      ],
    );
  }
}
