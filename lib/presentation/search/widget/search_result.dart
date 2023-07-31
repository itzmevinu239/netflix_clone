import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/domain/model/search/searched/searched_list.dart';
import 'package:netflix_clone/presentation/search/widget/title.dart';

// ignore: must_be_immutable
class SearchResultWidget extends StatefulWidget {
  SearchResultWidget({super.key, required this.results});
  List<SearchedList> results;

  @override
  State<SearchResultWidget> createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchWidgetTitle(title: 'Movies & TV'),
        kHeight,
        Expanded(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1 / 1.4,
            children: List.generate(
              widget.results.length,
              (index) {
                return MainCard(
                  posterpath: widget.results[index].posterPath,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  final posterpath;
  const MainCard({super.key, required this.posterpath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage('https://www.themoviedb.org/t/p/w500$posterpath'),
        ),
      ),
    );
  }
}
