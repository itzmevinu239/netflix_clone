import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/domain/model/downloads/api_call_downloaded.dart';
import 'package:netflix_clone/presentation/widgets/app_bar.dart';

import '../../domain/model/downloads/downloads_list.dart';

class ScreenDownload extends StatefulWidget {
  const ScreenDownload({super.key});

  @override
  State<ScreenDownload> createState() => _ScreenDownloadState();
}

class _ScreenDownloadState extends State<ScreenDownload> {
  List<DownloadList> downloadMovielist = [];

  @override
  void initState() {
    _downloadmovies();
    // TODO: implement initState
    super.initState();
  }

  _downloadmovies() async {
    final response = await TMDBServiceDownload.getDownloadMovies();
    setState(() {
      downloadMovielist = response;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: 'Downloads',
          ),
        ),
        body: downloadMovielist.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: [
                  kHeight,
                  const _SmartDownloads(),
                  kHeight20,
                  Section2(movies: downloadMovielist),
                  const Section3()
                ],
              ));
  }
}

// ignore: must_be_immutable
class Section2 extends StatelessWidget {
  Section2({super.key, required this.movies});

  List movies;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          textAlign: TextAlign.center,
          'Itroduce Download for you',
          style: TextStyle(
            color: kWhiteColor,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        const Text(
          textAlign: TextAlign.center,
          'We willdownload a personalised selection of\nmovies and shows for you, '
          'so there is\nalways something to watch on your\ndevice.',
          style: TextStyle(color: Colors.grey, fontSize: 18),
        ),
        kHeight,
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: size.width * 0.39,
                backgroundColor: Colors.grey.shade900,
              ),
              DownloadImageWidget(
                imageList: movies[3].posterpath!,
                margin: const EdgeInsets.only(left: 150, bottom: 40),
                angle: 20,
                size: Size(size.width * 0.41, size.width * 0.56),
              ),
              DownloadImageWidget(
                imageList: movies[8].posterpath!,
                margin: const EdgeInsets.only(right: 150, bottom: 40),
                angle: -20,
                size: Size(size.width * 0.41, size.width * 0.56),
              ),
              DownloadImageWidget(
                imageList: movies[4].posterpath!,
                margin: const EdgeInsets.only(bottom: 15),
                size: Size(size.width * 0.46, size.width * 0.62),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: kButtonColorBlue,
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Setup",
                style: TextStyle(fontSize: 20, color: kButtonColorWhite),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: kButtonColorWhite,
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See what you can download',
              style: TextStyle(fontSize: 20, color: ktextBlackColor),
            ),
          ),
        ),
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        kWidth,
        Icon(
          Icons.settings,
          color: kWhiteColor,
        ),
        kWidth,
        Text(
          'Smart Download',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}

class DownloadImageWidget extends StatelessWidget {
  const DownloadImageWidget(
      {super.key,
      this.angle = 0,
      required this.imageList,
      required this.size,
      required this.margin});
  final double angle;
  final String imageList;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
              image: NetworkImage('https://image.tmdb.org/t/p/w500$imageList'),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
