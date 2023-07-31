import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../infrastructure/api_key.dart';
import 'downloads_list.dart';

class TMDBServiceDownload {
  static Future<List<DownloadList>> getDownloadMovies() async {
    const url = 'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey';

    final uri = Uri.parse(url);
    final response = await http.get(uri);

    final jsonData = jsonDecode(response.body);
    final reponseList = jsonData['results'] as List<dynamic>;

    final tranformed = reponseList.map((e) {
      return DownloadList(posterpath: e['poster_path']);
    }).toList();

    return tranformed;
  }
}
