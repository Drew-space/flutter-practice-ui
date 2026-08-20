class MovieModel {
  final int id;
  final String title;
  final String? name; // For TV shows
  final String overview;
  final String? posterPath;
  final String? backdropPath;
  final double voteAverage;
  final int voteCount;
  final String? releaseDate;
  final String? firstAirDate;
  final List<int> genreIds;
  final String originalLanguage;
  final double popularity;
  final String mediaType; // 'movie' or 'tv'
  final bool isAdult;

  // Extra fields fetched later
  List<CastModel> cast = [];
  String runtime = 'TBA';
  String studio = 'TBA';
  List<String> genres = [];
  String director = 'TBA';
  int? numberOfSeasons;
  int? numberOfEpisodes;
  List<SeasonModel> seasons = [];

  MovieModel({
    required this.id,
    required this.title,
    this.name,
    required this.overview,
    this.posterPath,
    this.backdropPath,
    required this.voteAverage,
    required this.voteCount,
    this.releaseDate,
    this.firstAirDate,
    required this.genreIds,
    required this.originalLanguage,
    required this.popularity,
    required this.mediaType,
    required this.isAdult,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? json['name'] ?? 'Unknown',
      name: json['name'],
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
      releaseDate: json['release_date'],
      firstAirDate: json['first_air_date'],
      genreIds: List<int>.from(json['genre_ids'] ?? []),
      originalLanguage: json['original_language'] ?? 'en',
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
      mediaType: json['media_type'] ?? (json['title'] != null ? 'movie' : 'tv'),
      isAdult: json['adult'] ?? false,
    );
  }

  String get displayTitle => title;
  String get displayDate => releaseDate ?? firstAirDate ?? '';
  String get year {
    final date = displayDate;
    if (date.isEmpty) return 'TBD';
    final parsed = DateTime.tryParse(date);
    return parsed?.year.toString() ?? 'TBD';
  }

  String get posterUrl =>
      posterPath != null ? 'https://image.tmdb.org/t/p/w500$posterPath' : '';

  String get backdropUrl => backdropPath != null
      ? 'https://image.tmdb.org/t/p/original$backdropPath'
      : '';

  String get vidkingUrl => mediaType == 'movie'
      ? 'https://www.vidking.net/embed/movie/$id?color=7C3AED&autoPlay=true'
      : 'https://www.vidking.net/embed/tv/$id/1/1?color=7C3AED&autoPlay=true&nextEpisode=true&episodeSelector=true';

  bool get isMovie => mediaType == 'movie';
}

class CastModel {
  final String name;
  final String role;
  final String? profilePath;

  CastModel({required this.name, required this.role, this.profilePath});

  String get imageUrl =>
      profilePath != null ? 'https://image.tmdb.org/t/p/w200$profilePath' : '';

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      name: json['name'] ?? 'Unknown',
      role: json['character'] ?? json['known_for_department'] ?? 'Unknown',
      profilePath: json['profile_path'],
    );
  }
}

class SeasonModel {
  final int seasonNumber;
  final String name;
  final int episodeCount;
  final String? posterPath;
  final String? airDate;

  SeasonModel({
    required this.seasonNumber,
    required this.name,
    required this.episodeCount,
    this.posterPath,
    this.airDate,
  });

  factory SeasonModel.fromJson(Map<String, dynamic> json) {
    return SeasonModel(
      seasonNumber: json['season_number'] ?? 1,
      name: json['name'] ?? 'Season ${json['season_number']}',
      episodeCount: json['episode_count'] ?? 0,
      posterPath: json['poster_path'],
      airDate: json['air_date'],
    );
  }
}
