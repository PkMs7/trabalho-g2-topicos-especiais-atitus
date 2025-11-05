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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: RichText(
          text: const TextSpan(
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w900,
              fontSize: 28,
              letterSpacing: 1.5,
            ),
            children: [
              TextSpan(
                text: 'C',
                style: TextStyle(color: Color(0xFFE50914)),
              ),
              TextSpan(
                text: 'ine',
                style: TextStyle(color: Colors.white),
              ),
              TextSpan(
                text: 'A',
                style: TextStyle(color: Color(0xFFE50914)),
              ),
              TextSpan(
                text: 'pp',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Consumer<MovieViewModel>(
          builder: (context, vm, child) {
            if (vm.isLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Color(0xFFE50914)),
              );
            }

            if (vm.error != null) {
              return Center(
                child: Text(
                  'Erro: ${vm.error}',
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }

            final movies = vm.movies;
            if (movies.isEmpty) {
              return const Center(
                child: Text(
                  'Nenhum filme encontrado',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }

            return GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 12,
                childAspectRatio: 0.6,
              ),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final Movie movie = movies[index];
                final posterUrl = movie.posterPath != null
                    ? '${Constants.tmdbImageBase}${movie.posterPath}'
                    : null;

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailsPage(movie: movie),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: posterUrl != null
                              ? Image.network(
                                  posterUrl,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  loadingBuilder: (context, child, progress) {
                                    if (progress == null) return child;
                                    return const Center(
                                      child: CircularProgressIndicator(
                                        color: Color(0xFFE50914),
                                        strokeWidth: 2,
                                      ),
                                    );
                                  },
                                  errorBuilder:
                                      (context, error, stackTrace) =>
                                          Container(
                                    color: Colors.grey[900],
                                    child: const Icon(
                                      Icons.broken_image,
                                      color: Colors.white70,
                                      size: 40,
                                    ),
                                  ),
                                )
                              : Container(
                                  color: Colors.grey[900],
                                  child: const Icon(
                                    Icons.movie,
                                    color: Colors.white70,
                                    size: 40,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        movie.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          const Icon(Icons.star,
                              color: Colors.amber, size: 14),
                          const SizedBox(width: 4),
                          Text(
                            movie.voteAverage.toString(),
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
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
