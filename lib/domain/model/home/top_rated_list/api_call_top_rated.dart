import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/domain/model/home/top_rated_list/top_rated_list.dart';
import '../../../../infrastructure/api_key.dart';

class TMDBServiceTopRated {
  static Future<List<TopRatedList>> getTopRatedMovies() async {
    const url = 'https://api.themoviedb.org/3/tv/on_the_air?api_key=$apiKey';

    final uri = Uri.parse(url);
    final response = await http.get(uri);

    final jsondata = jsonDecode(response.body);
    final responslist = jsondata['results'] as List<dynamic>;

    final transformed = responslist.map((e) {
      return TopRatedList(posterpath: e['poster_path']);
    }).toList();
    return transformed;
  }
}
