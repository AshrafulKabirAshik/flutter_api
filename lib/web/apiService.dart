import 'dart:convert';


import 'package:http/http.dart' as http;

import '../movieTMDB/Results.dart';
import '../movieYTS/YtsData.dart';

class ApiService {
  Future<List<Results>> getResults(int index) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movieTMDB/top_rated?api_key=71d23e5aa6f496147883bb6aeb35f71e&language=en-US&page=$index'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final List<Results> list = [];

      for (var i = 0; i < data['results'].length; i++) {
        final entry = data['results'][i];
        list.add(Results.fromJson(entry));
      }

      return list;
    } else {
      throw Exception('Response Failed');
    }
  }

  Future<YtsData> getYtsResults() async {
    final responseYts = await http
        .get(Uri.parse('https://yts.mx/api/v2/list_movies.json?limit=50'));
    var data = jsonDecode(responseYts.body.toString());
    if (responseYts.statusCode == 200) {
      return YtsData.fromJson(data);
    } else {
      throw Exception('Response Failed');
    }
  }
}
