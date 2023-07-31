import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix_clone/domain/model/home/popular_movies/popular_list.dart';

import '../../../../infrastructure/api_key.dart';

class TMDBServicePopular {
  static Future<List<PopularLIst>> getPopularMovies() async {
    const url = 'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey';

    final uri = Uri.parse(url);
    final response = await http.get(uri);

    //if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    final reponseList = jsonData['results'] as List<dynamic>;

    final tranformed = reponseList.map((e) {
      return PopularLIst(posterpath: e['poster_path']);
    }).toList();
    //}
    return tranformed;
  }
}
