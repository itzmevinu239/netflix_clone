import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/domain/model/new&hot/everyoneWatch/apicalleveryon.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/everyone_watch_widget.dart';
import '../../domain/model/new&hot/comingSoon/api_call_comingsoon.dart';
import '../../domain/model/new&hot/comingSoon/coming_soon_list.dart';
import '../../domain/model/new&hot/everyoneWatch/everyonewatchlist.dart';

class ScreenNewAndHot extends StatefulWidget {
  const ScreenNewAndHot({super.key});

  @override
  State<ScreenNewAndHot> createState() => _ScreenNewAndHotState();
}

class _ScreenNewAndHotState extends State<ScreenNewAndHot> {
  List<ComingSoonList> comingSoonMovies = [];
  List<EveryOneWatchList> everyoneWatchingList = [];
  @override
  void initState() {
    // TODO: implement initState
    comingsoon();
    everyoneWatch();
    super.initState();
  }

  comingsoon() async {
    final response = await TMDBserviceComingsoon.getComingsoonList();
    setState(() {
      comingSoonMovies = response;
    });
  }

  everyoneWatch() async {
    final response = await TMDBserviceEveryoneWatch.getEveryOneList();
    setState(() {
      everyoneWatchingList = response;
    });
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: Text(
              'New & Hot',
              style: kNewandHottextstyle,
            ),
            actions: [
              const Icon(
                Icons.cast,
                color: Colors.white,
                size: 30,
              ),
              kWidth,
              Container(
                width: 30,
                height: 30,
                color: Colors.blue,
              ),
              kWidth,
            ],
            bottom: TabBar(
              labelColor: ktextBlackColor,
              labelStyle:
                  const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              unselectedLabelColor: kWhiteColor,
              indicator: BoxDecoration(
                  color: kWhiteColor, borderRadius: BorderRadius.circular(30)),
              tabs: const [
                Tab(
                  text: '🍿 Coming Soon',
                ),
                Tab(
                  text: "👀 Everyone's Watching",
                )
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            _buildComingSoon(),
            _buildEveryonesWatching(),
          ],
        ),
      ),
    );
  }

  Widget _buildComingSoon() {
    return ListView.builder(
      itemBuilder: (context, index) =>
          ComingSoonWidget(index: index, movies: comingSoonMovies),
      itemCount: comingSoonMovies.length,
    );
  }

  Widget _buildEveryonesWatching() {
    return ListView.builder(
      itemBuilder: (context, index) => EveryoneWatchWidgets(
        index: index,
        movies: everyoneWatchingList,
      ),
      itemCount: everyoneWatchingList.length,
    );
  }
}
