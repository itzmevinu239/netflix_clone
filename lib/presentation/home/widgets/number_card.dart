import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class NumberCardWidget extends StatefulWidget {
  const NumberCardWidget(
      {super.key, required this.index, required this.posterpath});
  final int index;
  final String posterpath;

  @override
  State<NumberCardWidget> createState() => _NumberCardWidgetState();
}

class _NumberCardWidgetState extends State<NumberCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 38,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                width: 135,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://image.tmdb.org/t/p/w500${widget.posterpath}'),
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 2,
          bottom: -23,
          child: BorderedText(
            strokeWidth: 2,
            strokeColor: Colors.white,
            child: Text(
              '${widget.index + 1}',
              style: const TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 150,
                  color: ktextBlackColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
