import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  //Parametros que recibe la clase
  String _apyKey = 'd9f2f354a9918f31fd6c8f69be4ffe68';
  String _baseUrl = 'api.themoviedb.org';
  String _languaje = 'es-ES';

  List<Movie> onDisplayMovies = [];

  MoviesProvider() {
    print('Movies Provider Inicializado');

    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _apyKey,
      'language': _languaje,
      'page': '1',
    });

    // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);

    //Llamar la instanciua de NowPlaying
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    //Decodificar el JSON
    print(nowPlayingResponse.results[1].title);
    onDisplayMovies = nowPlayingResponse.results;

    //Redibujar widgets
    notifyListeners();
  }
}
