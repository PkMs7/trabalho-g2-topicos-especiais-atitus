import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';
import '../constants.dart';

class ApiService {
  final String _apiKey = Constants.tmdbApiKey;
  final String _baseUrl = Constants.tmdbBaseUrl;

  Future<List<Movie>> fetchPopularMovies(
      {int page = 1, String language = 'pt-BR'}) async {
    final uri = Uri.parse(
        '$_baseUrl/movie/popular?api_key=$_apiKey&language=$language&page=$page');

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
          json.decode(response.body) as Map<String, dynamic>;
      final List<dynamic> results =
          data['results'] as List<dynamic>? ?? <dynamic>[];
      return results
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception(
          'Falha ao buscar filmes: ${response.statusCode} - ${response.reasonPhrase}');
    }
  }
}
