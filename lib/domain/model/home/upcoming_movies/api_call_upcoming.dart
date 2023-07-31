import 'dart:convert';

import 'package:netflix_clone/domain/model/home/upcoming_movies/upcoming_list.dart';
import 'package:http/http.dart' as http;
import '../../../../infrastructure/api_key.dart';

class TMDBServiceUpcoming {
  static Future<List<UpComingList>> getUpcomingMovies() async {
    const url = 'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey';

    final uri = Uri.parse(url);
    final response = await http.get(uri);

    // if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    final resopnseList = jsonData['results'] as List<dynamic>;

    final transformed = resopnseList.map((e) {
      return UpComingList(posterpath: e['poster_path']);
    }).toList();

    // }
    return transformed;
  }
}
