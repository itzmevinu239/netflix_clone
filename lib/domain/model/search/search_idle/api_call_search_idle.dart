import 'dart:convert';

import 'package:http/http.dart' as http;

import 'main_search_list.dart';

class TMDBserviceSearchIdle {
  Future<List<MainSearchList>> getMainSearchList() async {
    const url =
        'https://api.themoviedb.org/3/movie/upcoming?api_key=dd05592d1a57ec428a5315664a0aea72';

    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final jsondata = jsonDecode(response.body);
    final responseList = jsondata['results'] as List<dynamic>;

    final transformed = responseList.map((e) {
      return MainSearchList(posterpath: e['backdrop_path'], title: e['title']);
    }).toList();
    return transformed;
  }
}
