import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/downloads/screen_downloads.dart';
import 'package:netflix_clone/presentation/home/screen_home.dart';
import 'package:netflix_clone/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflix_clone/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix_clone/presentation/search/screen_search.dart';

import '../fast_laughs/screen_fast_laugh.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final _pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastLaugh(),
    const ScreenSearch(),
    ScreenDownload(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ValueListenableBuilder(
          valueListenable: indexchangeNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
        bottomNavigationBar: const BottomNavigationWidget(),
      ),
    );
  }
}
