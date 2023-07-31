import 'dart:convert';

import 'package:netflix_clone/domain/model/search/searched/searched_list.dart';
import 'package:http/http.dart' as http;

class TMDBserviceSearched {
  Future<List<SearchedList>> getSearchedList() async {
    const url =
        'https://api.themoviedb.org/3/movie/upcoming?api_key=dd05592d1a57ec428a5315664a0aea72';

    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final jsondata = jsonDecode(response.body);
    final responseList = jsondata['results'] as List<dynamic>;

    final transformed = responseList.map((e) {
      return SearchedList(posterPath: e['poster_path']);
    }).toList();
    return transformed;
  }
}

Future<List<SearchedList>> getimageSearchGrid(
    String search, List<SearchedList> searchList) async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/search/movie?api_key=dd05592d1a57ec428a5315664a0aea72&query=${search}'));

  final jsondata = jsonDecode(response.body);
  final resposelist = jsondata['results'] as List<dynamic>;
  final tranformed = resposelist.map((e) {
    return SearchedList(posterPath: e['poster_path']);
  }).toList();

  return tranformed;
}
