import 'package:flutter/cupertino.dart';

class SearchWidgetTitle extends StatelessWidget {
  const SearchWidgetTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}