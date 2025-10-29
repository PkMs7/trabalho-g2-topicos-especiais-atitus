import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/movie_view_model.dart';
import '../constants.dart';
import '../models/movie.dart';
import 'details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CineApp - Populares'),
      ),
      body: SafeArea(
        child: Consumer<MovieViewModel>(
          builder: (context, vm, child) {
            if (vm.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (vm.error != null) {
              return Center(child: Text('Erro: ${vm.error}'));
            }

            final movies = vm.movies;
            if (movies.isEmpty) {
              return const Center(child: Text('Nenhum filme encontrado'));
            }

            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final Movie movie = movies[index];
                final posterUrl = movie.posterPath != null
                    ? '${Constants.tmdbImageBase}${movie.posterPath}'
                    : null;

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(8),
                    leading: posterUrl != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              posterUrl,
                              width: 60,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.broken_image),
                            ),
                          )
                        : const SizedBox(width: 60, child: Icon(Icons.movie)),
                    title: Text(movie.title),
                    subtitle: Text(
                        'Nota: ${movie.voteAverage}  •  ${movie.releaseDate ?? '—'}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => DetailsPage(movie: movie)),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
