import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/api_service.dart';

class MovieViewModel extends ChangeNotifier {
  final ApiService _apiService;

  MovieViewModel({ApiService? apiService})
      : _apiService = apiService ?? ApiService();

  List<Movie> _movies = [];
  bool _isLoading = false;
  String? _error;

  List<Movie> get movies => _movies;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchMovies() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final fetched = await _apiService.fetchPopularMovies();
      _movies = fetched;
    } catch (e) {
      _error = e.toString();
      _movies = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
