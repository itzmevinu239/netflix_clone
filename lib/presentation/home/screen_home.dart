import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/domain/model/home/top_rated_list/api_call_top_rated.dart';
import 'package:netflix_clone/presentation/home/widgets/background_card.dart';
import 'package:netflix_clone/presentation/home/widgets/number_title_card.dart';
import '../../core/constants.dart';
import '../../domain/model/home/main_background_movie.dart/api_call_main_bg.dart';
import '../../domain/model/home/main_background_movie.dart/main_bg_movie.dart';
import '../../domain/model/home/popular_movies/api_call_popular.dart';
import '../../domain/model/home/popular_movies/popular_list.dart';
import '../../domain/model/home/top_rated_list/top_rated_list.dart';
import '../../domain/model/home/upcoming_movies/api_call_upcoming.dart';
import '../../domain/model/home/upcoming_movies/upcoming_list.dart';
import '../widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  List<PopularLIst> popularMoviesList = [];
  List<UpComingList> upcomingMoviesList = [];
  List<MainScreenBgMovie> mainBGMovie = [];
  List<TopRatedList> topratedmovielist = [];

  @override
  void initState() {
    // TODO: implement initState
    _mainBgMovie();
    _topRatedMovies();
    _getUpcoming();
    _popularmovies();

    super.initState();
  }

  _popularmovies() async {
    final response = await TMDBServicePopular.getPopularMovies();
    setState(() {
      popularMoviesList = response;
    });
  }

  _topRatedMovies() async {
    final response = await TMDBServiceTopRated.getTopRatedMovies();
    setState(() {
      topratedmovielist = response;
    });
  }

  _getUpcoming() async {
    final response = await TMDBServiceUpcoming.getUpcomingMovies();
    setState(() {
      upcomingMoviesList = response;
    });
  }

  _mainBgMovie() async {
    final response = await TMDBServiceMainBGMovie.getMainBGMovie();
    setState(() {
      mainBGMovie = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext context, index, _) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: NotificationListener<UserScrollNotification>(
              onNotification: (Notification) {
                final ScrollDirection direction = Notification.direction;
                if (direction == ScrollDirection.reverse) {
                  scrollNotifier.value = false;
                } else if (direction == ScrollDirection.forward) {
                  scrollNotifier.value = true;
                }
                return true;
              },
              child: Stack(
                children: [
                  mainBGMovie.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView(
                          children: [
                            BackGroundCard(
                              mainImage: mainBGMovie[5].posterPath,
                            ),
                            kHeight5,
                            MainTitleCard(
                              title: 'Popular Movie',
                              popularList: popularMoviesList,
                            ),
                            kHeight5,
                            NumberTitleCardWigget(
                                title: 'Top 10 TV Shows In India Today',
                                toprateList: topratedmovielist),
                            kHeight5,
                            MainTitleCard(
                              title: 'Upcoming Movies',
                              popularList: upcomingMoviesList,
                            ),
                          ],
                        ),
                  scrollNotifier.value == true
                      ? AnimatedContainer(
                          duration: const Duration(microseconds: 15000),

                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          width: double.infinity,
                          height: 90,
                          // color: Colors.transparent,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    'https://loodibee.com/wp-content/uploads/Netflix-N-Symbol-logo.png',
                                    width: 60,
                                    height: 50,
                                  ),
                                  const Spacer(),
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
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('TV Show', style: kHometextstyle),
                                  Text(
                                    'Movies',
                                    style: kHometextstyle,
                                  ),
                                  Text(
                                    'Categories',
                                    style: kHometextstyle,
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      : kHeight,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
