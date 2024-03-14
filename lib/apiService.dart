import 'dart:convert';

import 'package:flutter_api/Results.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Results>> getResults(int index) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=71d23e5aa6f496147883bb6aeb35f71e&language=en-US&page=$index'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<Results> list = [];

      for (var i = 0; i < data['results'].length; i++) {
        final entry = data['results'][i];
        list.add(Results.fromJson(entry));
      }
      return list;
    } else {
      throw Exception('Resposse Failed');
    }
  }
}
