import 'dart:convert';

import 'package:http/http.dart' as http;

import 'everyonewatchlist.dart';

class TMDBserviceEveryoneWatch {
  static Future<List<EveryOneWatchList>> getEveryOneList() async {
    const url =
        'https://api.themoviedb.org/3/movie/upcoming?api_key=dd05592d1a57ec428a5315664a0aea72';

    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final jsondata = jsonDecode(response.body);
    final responseList = jsondata['results'] as List<dynamic>;
    //print('object$responseList');

    final transformed = responseList.map((e) {
      return EveryOneWatchList(
          backdropPath: e['backdrop_path'],
          titles: e['title'],
          overView: e['overview']);
    }).toList();
    return transformed;
  }
}
