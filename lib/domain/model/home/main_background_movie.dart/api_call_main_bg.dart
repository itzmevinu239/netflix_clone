import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../infrastructure/api_key.dart';
import 'main_bg_movie.dart';

class TMDBServiceMainBGMovie {
  static Future<List<MainScreenBgMovie>> getMainBGMovie() async {
    const url =
        'https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    final jsondata = jsonDecode(response.body);
    final responseList = jsondata['results'] as List<dynamic>;

    final transFormed = responseList.map((e) {
      return MainScreenBgMovie(posterPath: e['poster_path']);
    }).toList();
    return transFormed;
  }
}
