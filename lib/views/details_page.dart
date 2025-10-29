import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../constants.dart';

class DetailsPage extends StatelessWidget {
  final Movie movie;
  const DetailsPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final posterUrl = movie.posterPath != null
        ? '${Constants.tmdbImageBase}${movie.posterPath}'
        : null;

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (posterUrl != null)
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    posterUrl,
                    height: 350,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image, size: 100),
                  ),
                ),
              ),
            const SizedBox(height: 16),
            Text(
              movie.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber[700]),
                const SizedBox(width: 8),
                Text('${movie.voteAverage}'),
                const SizedBox(width: 16),
                Text(movie.releaseDate ?? ''),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              movie.overview,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
