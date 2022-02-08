import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:newsapp/src/models/models.dart';

const String _authority = 'newsapi.org';
const String _apiKey = '10d03984466540df94065cb3bdc0cc66';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  NewsService() {
    getTopHeadLines();
  }

  getTopHeadLines() async {
    String unencodedPath = '/v2/top-headlines';

    final url = Uri.https(_authority, unencodedPath, {
      'country': 'co',
      'apiKey': _apiKey,
    });

    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);

    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }
}
