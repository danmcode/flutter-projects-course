import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import 'package:newsapp/src/models/models.dart';

const String _authority = 'newsapi.org';
const String _apiKey = '10d03984466540df94065cb3bdc0cc66';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  String _selectedCategory = 'business';

  List<CategoryModel> categories = [
    CategoryModel(icon: FontAwesomeIcons.building, name: 'business'),
    CategoryModel(icon: FontAwesomeIcons.tv, name: 'entertainment'),
    CategoryModel(icon: FontAwesomeIcons.addressCard, name: 'general'),
    CategoryModel(icon: FontAwesomeIcons.headSideVirus, name: 'health'),
    CategoryModel(icon: FontAwesomeIcons.vials, name: 'science'),
    CategoryModel(icon: FontAwesomeIcons.volleyballBall, name: 'sports'),
    CategoryModel(icon: FontAwesomeIcons.memory, name: 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    getTopHeadLines();

    for (CategoryModel element in categories) {
      categoryArticles[element.name] = [];
    }
  }

  String get selectedCategory => _selectedCategory;
  set selectedCategory(String valor) {
    _selectedCategory = valor;

    getArticlesByCategory(valor);

    notifyListeners();
  }

  List<Article> get getArticleByCategorySelected =>
      categoryArticles[selectedCategory]!;

  getArticlesByCategory(String category) async {
    if (categoryArticles[category]!.isNotEmpty) {
      return categoryArticles[category];
    }

    String unencodedPath = '/v2/top-headlines';

    final url = Uri.https(_authority, unencodedPath,
        {'country': 'co', 'apiKey': _apiKey, 'category': category});

    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);

    categoryArticles[category]!.addAll(newsResponse.articles);

    notifyListeners();
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
