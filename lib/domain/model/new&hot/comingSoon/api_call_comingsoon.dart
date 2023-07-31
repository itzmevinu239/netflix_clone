import 'coming_soon_list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TMDBserviceComingsoon {
  static Future<List<ComingSoonList>> getComingsoonList() async {
    const url =
        'https://api.themoviedb.org/3/movie/upcoming?api_key=dd05592d1a57ec428a5315664a0aea72';

    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final jsondata = jsonDecode(response.body);
    final responseList = jsondata['results'] as List<dynamic>;

    final transformed = responseList.map((e) {
      return ComingSoonList(
          backdropPath: e['backdrop_path'],
          title: e['title'],
          releaseDate: e['release_date'],overviEw: e['overview']);
    }).toList();
    return transformed;
  }
}
