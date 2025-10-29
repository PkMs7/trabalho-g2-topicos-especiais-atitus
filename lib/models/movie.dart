class Movie {
  final int id;
  final String title;
  final String overview;
  final String? posterPath;
  final double voteAverage;
  final String? releaseDate;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    this.posterPath,
    required this.voteAverage,
    this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    // Garante casts seguros e uso de fallback
    final dynamic voteValue = json['vote_average'];
    double voteAverage = 0.0;
    if (voteValue is int) {
      voteAverage = voteValue.toDouble();
    } else if (voteValue is double) {
      voteAverage = voteValue;
    } else if (voteValue is num) {
      voteAverage = voteValue.toDouble();
    }

    return Movie(
      id: (json['id'] as num).toInt(),
      title: (json['title'] as String?) ?? '',
      overview: (json['overview'] as String?) ?? '',
      posterPath: json['poster_path'] as String?,
      voteAverage: voteAverage,
      releaseDate: json['release_date'] as String?,
    );
  }
}
