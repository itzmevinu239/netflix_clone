import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/domain/model/search/search_idle/main_search_list.dart';
import 'package:netflix_clone/presentation/search/widget/title.dart';
import '../../../core/constants.dart';

class SearchIdleWidget extends StatelessWidget {
  final List<MainSearchList> result;
  const SearchIdleWidget({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchWidgetTitle(
          title: 'Top Searches',
        ),
        kHeight,
        Expanded(
          child: result.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  shrinkWrap: true,
                  // ignore: unnecessary_null_comparison
                  itemBuilder: (ctx, index) => result[index].title == null
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : TopSearchItemTile(
                          title: result[index].title,
                          posterPath: result[index].posterpath,
                        ),
                  separatorBuilder: (ctx, index) => kHeight,
                  itemCount: result.length),
        ),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final String title;
  final String posterPath;
  const TopSearchItemTile(
      {super.key, required this.title, required this.posterPath});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.33,
          height: 70,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image:
                  NetworkImage('https://image.tmdb.org/t/p/w500/$posterPath'),
            ),
          ),
        ),
        kWidth,
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
                color: kWhiteColor, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const CircleAvatar(
          backgroundColor: kWhiteColor,
          radius: 23,
          child: CircleAvatar(
            radius: 21,
            backgroundColor: ktextBlackColor,
            child: Icon(
              CupertinoIcons.play_fill,
              color: kWhiteColor,
            ),
          ),
        ),
      ],
    );
  }
}
