import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:practice_ui/apps/movieapp/models/movie_models.dart';

import 'package:practice_ui/apps/movieapp/movielib/movie_api/apikey.dart';

class TMDBService {
  static final TMDBService _instance = TMDBService._internal();
  factory TMDBService() => _instance;
  TMDBService._internal();

  static const String _baseUrl = 'https://api.themoviedb.org/3';

  // ── Genre Map ──
  static const Map<int, String> genreMap = {
    28: 'Action',
    12: 'Adventure',
    16: 'Animation',
    35: 'Comedy',
    80: 'Crime',
    99: 'Documentary',
    18: 'Drama',
    10751: 'Family',
    14: 'Fantasy',
    36: 'History',
    27: 'Horror',
    10402: 'Music',
    9648: 'Mystery',
    10749: 'Romance',
    878: 'Sci-Fi',
    10770: 'TV Movie',
    53: 'Thriller',
    10752: 'War',
    37: 'Western',
    10759: 'Action & Adventure',
    10762: 'Kids',
    10763: 'News',
    10764: 'Reality',
    10765: 'Sci-Fi & Fantasy',
    10766: 'Soap',
    10767: 'Talk',
    10768: 'War & Politics',
  };

  // ── Fetch Methods ──
  Future<List<MovieModel>> fetchNowPlaying() => _fetchMovies(
    '$_baseUrl/movie/now_playing?api_key=$apikey&language=en-US&page=1',
  );

  Future<List<MovieModel>> fetchTrendingWeek() =>
      _fetchMovies('$_baseUrl/trending/movie/week?api_key=$apikey');

  Future<List<MovieModel>> fetchTrendingDay() =>
      _fetchMovies('$_baseUrl/trending/movie/day?api_key=$apikey');

  Future<List<MovieModel>> fetchPopularMovies() => _fetchMovies(
    '$_baseUrl/movie/popular?api_key=$apikey&language=en-US&page=1',
  );

  Future<List<MovieModel>> fetchTopRated() => _fetchMovies(
    '$_baseUrl/movie/top_rated?api_key=$apikey&language=en-US&page=1',
  );

  Future<List<MovieModel>> fetchUpcoming() => _fetchMovies(
    '$_baseUrl/movie/upcoming?api_key=$apikey&language=en-US&page=1',
  );

  Future<List<MovieModel>> fetchPopularTv() => _fetchMovies(
    '$_baseUrl/tv/popular?api_key=$apikey&language=en-US&page=1',
  );

  Future<List<MovieModel>> fetchOnAirTv() => _fetchMovies(
    '$_baseUrl/tv/on_the_air?api_key=$apikey&language=en-US&page=1',
  );

  Future<List<MovieModel>> fetchDiscoverMovies({int page = 1}) => _fetchMovies(
    '$_baseUrl/discover/movie?api_key=$apikey&language=en-US&sort_by=popularity.desc&page=$page',
  );

  // ── Core Fetch ──
  Future<List<MovieModel>> _fetchMovies(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'] as List<dynamic>? ?? [];
      return results.map((m) => MovieModel.fromJson(m)).toList();
    }
    throw Exception('Failed to load movies: ${response.statusCode}');
  }

  // ── Fetch Full Details + Cast ──
  Future<MovieModel> fetchMovieDetails(MovieModel movie) async {
    final type = movie.isMovie ? 'movie' : 'tv';

    final detailsUrl = '$_baseUrl/$type/${movie.id}?api_key=$apikey';
    final creditsUrl = '$_baseUrl/$type/${movie.id}/credits?api_key=$apikey';

    final responses = await Future.wait([
      http.get(Uri.parse(detailsUrl)),
      http.get(Uri.parse(creditsUrl)),
    ]);

    // Parse Details
    if (responses[0].statusCode == 200) {
      final data = jsonDecode(responses[0].body);

      // Runtime
      final mins =
          data['runtime'] as int? ??
          (data['episode_run_time'] as List<dynamic>?)?.firstOrNull as int?;
      if (mins != null && mins > 0) {
        final h = mins ~/ 60;
        final m = mins % 60;
        movie.runtime = h > 0 ? '${h}h ${m}m' : '${m}m';
      }

      // Studio
      final companies = data['production_companies'] as List<dynamic>? ?? [];
      if (companies.isNotEmpty) {
        movie.studio = companies[0]['name']?.toString() ?? 'TBA';
      }

      // Genres
      final genreList = data['genres'] as List<dynamic>? ?? [];
      movie.genres = genreList.map((g) => g['name'].toString()).toList();

      // TV-specific
      movie.numberOfSeasons = data['number_of_seasons'];
      movie.numberOfEpisodes = data['number_of_episodes'];

      final seasonsData = data['seasons'] as List<dynamic>? ?? [];
      movie.seasons = seasonsData
          .where((s) => s['season_number'] != 0) // Skip specials
          .map((s) => SeasonModel.fromJson(s))
          .toList();
    }

    // Parse Credits
    if (responses[1].statusCode == 200) {
      final data = jsonDecode(responses[1].body);

      final castList = data['cast'] as List<dynamic>? ?? [];
      movie.cast = castList.take(12).map((c) => CastModel.fromJson(c)).toList();

      final crew = data['crew'] as List<dynamic>? ?? [];
      final director = crew.firstWhere(
        (c) => c['job'] == 'Director',
        orElse: () => null,
      );
      if (director != null) {
        movie.director = director['name'] ?? 'TBA';
      }
    }

    // Fallback genres
    if (movie.genres.isEmpty) {
      movie.genres = movie.genreIds
          .map((id) => genreMap[id])
          .whereType<String>()
          .toList();
      if (movie.genres.isEmpty) movie.genres = ['Action', 'Adventure'];
    }

    return movie;
  }

  // ── Search ──
  Future<List<MovieModel>> search(String query) async {
    final url = '$_baseUrl/search/multi?api_key=$apikey&query=$query&page=1';
    return _fetchMovies(url);
  }
}
