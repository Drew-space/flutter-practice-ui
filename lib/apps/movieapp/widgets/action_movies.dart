import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice_ui/apps/movieapp/loading/loading_card.dart';
import 'package:practice_ui/apps/movieapp/movielib/movie_api/apikey.dart';
import 'package:practice_ui/apps/movieapp/pages/player/movie_player_page.dart';

class ActionMovies extends StatefulWidget {
  const ActionMovies({super.key});

  @override
  State<ActionMovies> createState() => _ActionMoviesState();
}

class _ActionMoviesState extends State<ActionMovies> {
  late Future<List<Map<String, dynamic>>> _actionFuture;

  @override
  void initState() {
    super.initState();
    _actionFuture = _fetchActionMovies();
  }

  /// Fetch at least 20 action movies from TMDB discover API
  Future<List<Map<String, dynamic>>> _fetchActionMovies() async {
    final List<Map<String, dynamic>> allMovies = [];
    int page = 3;

    while (allMovies.length < 20) {
      final url =
          'https://api.themoviedb.org/3/discover/movie?api_key=$apikey'
          '&with_genres=28'
          '&sort_by=popularity.desc'
          '&language=en-US'
          '&page=$page';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final results = data['results'] as List<dynamic>;

        if (results.isEmpty) break;

        final mapped = results.map((movie) {
          final rawDate = movie['release_date'] ?? '';
          final parsedDate = rawDate.isNotEmpty
              ? DateTime.tryParse(rawDate)
              : null;
          final runtime = movie['runtime'] as int?;

          return {
            ...movie as Map<String, dynamic>,
            'title': movie['title'] ?? 'Unknown',
            'rating': (movie['vote_average'] as num?)?.toDouble() ?? 0.0,
            'duration': _estimateDuration(runtime),
            'releaseDate': parsedDate?.year.toString() ?? 'TBD',
            'imageUrl': movie['poster_path'] != null
                ? 'https://image.tmdb.org/t/p/w500${movie['poster_path']}'
                : '',
          };
        }).toList();

        allMovies.addAll(mapped);
        page++;

        if (page > 5) break;
      } else {
        throw Exception('Failed to load action movies');
      }
    }

    return allMovies;
  }

  String _estimateDuration(int? runtime) {
    if (runtime == null || runtime == 0) return '2h 0min';
    final hours = runtime ~/ 60;
    final mins = runtime % 60;
    return '${hours}h ${mins}min';
  }

  void _openPlayer(Map<String, dynamic> movie) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => MoviePlayerPage(movie: movie)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _actionFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 400,
            child: Center(
              child: CircularProgressIndicator(
                color: Color(0xFF7a65c0),
                strokeWidth: 2,
              ),
            ),
          );
        }

        if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
          return SizedBox(
            height: 400,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wifi_off, color: Colors.grey[600], size: 32),
                  const SizedBox(height: 8),
                  Text(
                    snapshot.hasError
                        ? 'Something went wrong'
                        : 'No action movies found',
                    style: TextStyle(color: Colors.grey[500], fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () =>
                        setState(() => _actionFuture = _fetchActionMovies()),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF7a65c0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Retry',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        final movies = snapshot.data!;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Action Movies',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        color: Color(0xFF7a65c0),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Grid — same as MovieGrid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.62,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 18,
                ),
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _openPlayer(movies[index]),
                    child: _ActionGridCard(movie: movies[index]),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ActionGridCard extends StatelessWidget {
  final Map<String, dynamic> movie;

  const _ActionGridCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Poster — tall, with star rating badge
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  movie['imageUrl'],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: const Color(0xFF2A2A2A),
                    child: const Center(
                      child: Icon(Icons.broken_image, color: Colors.white54),
                    ),
                  ),
                ),
                // Star rating badge (top-right)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          movie['rating'].toStringAsFixed(1),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        // Title
        Text(
          movie['title'],
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        // Duration & Release Date row
        Row(
          children: [
            Text(
              movie['duration'],
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 12,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 3,
              height: 3,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              movie['releaseDate'],
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
