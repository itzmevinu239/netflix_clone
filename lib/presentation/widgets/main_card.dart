import 'package:flutter/cupertino.dart';

class MainCardWidgets extends StatefulWidget {
  const MainCardWidgets(
      {super.key, required this.posterpath, required this.index});
  final String posterpath;
  final int index;

  @override
  State<MainCardWidgets> createState() => _MainCardWidgetsState();
}

class _MainCardWidgetsState extends State<MainCardWidgets> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
