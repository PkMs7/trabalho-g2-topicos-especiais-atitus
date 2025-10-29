import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/movie_view_model.dart';
import 'views/home_page.dart';

void main() {
  runApp(const CineApp());
}

class CineApp extends StatelessWidget {
  const CineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MovieViewModel>(
      create: (_) => MovieViewModel()..fetchMovies(),
      child: MaterialApp(
        title: 'CineApp',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const HomePage(),
      ),
    );
  }
}
