import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hugeicons/hugeicons.dart';
import 'package:practice_ui/apps/movieapp/movielib/movie_api/apikey.dart';
import 'package:practice_ui/apps/movieapp/movielib/keys/all_api_link.dart';
import 'package:practice_ui/apps/movieapp/pages/player/movie_player_page.dart';
import 'package:practice_ui/apps/movieapp/pages/player/tv_show_player_page.dart';

class MovieSearchScreen extends StatefulWidget {
  const MovieSearchScreen({super.key});

  @override
  State<MovieSearchScreen> createState() => _MovieSearchScreenState();
}

class _MovieSearchScreenState extends State<MovieSearchScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String _query = '';
  Timer? _debounce;
  bool _isNavigating = false;

  late final Future<List<Map<String, dynamic>>> _trendingFuture;

  @override
  void initState() {
    super.initState();
    _trendingFuture = _fetchTrending();
    _controller.addListener(_onSearchChanged);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _focusNode.requestFocus(),
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      setState(() => _query = _controller.text.trim());
    });
  }

  Future<List<Map<String, dynamic>>> _fetchTrending() async {
    final response = await http.get(Uri.parse(trendingDayUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'] as List<dynamic>;
      return results.take(10).map((m) => _mapMovie(m)).toList();
    }
    throw Exception('Failed to load trending');
  }

  Future<List<Map<String, dynamic>>> _searchMulti(String query) async {
    if (query.isEmpty) return [];
    final url =
        'https://api.themoviedb.org/3/search/multi?api_key=$apikey&query=${Uri.encodeComponent(query)}&language=en-US&page=1';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'] as List<dynamic>;
      return results
          .where((m) => m['media_type'] == 'movie' || m['media_type'] == 'tv')
          .map((m) => _mapMovie(m))
          .toList();
    }
    throw Exception('Search failed');
  }

  Map<String, dynamic> _mapMovie(dynamic movie) {
    final isMovie = movie['media_type'] == 'movie' || movie['title'] != null;
    final rawDate = movie['release_date'] ?? movie['first_air_date'] ?? '';
    final parsedDate = rawDate.isNotEmpty ? DateTime.tryParse(rawDate) : null;
    final posterPath = movie['poster_path']?.toString();
    final backdropPath = movie['backdrop_path']?.toString();

    return {
      'id': movie['id'],
      'title': movie['title'] ?? movie['name'] ?? 'Unknown',
      'name': isMovie ? null : (movie['name'] ?? 'Unknown'),
      'year': parsedDate?.year.toString() ?? 'TBD',
      'genre': isMovie ? 'Movie' : 'TV Show',
      'rating': (movie['vote_average'] as num?)?.toDouble() ?? 0.0,
      'vote_average': movie['vote_average'],
      'release_date': movie['release_date'],
      'first_air_date': movie['first_air_date'],
      'overview': movie['overview'] ?? '',
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
      'imageUrl': posterPath != null
          ? 'https://image.tmdb.org/t/p/w500$posterPath'
          : '',
      'media_type': movie['media_type'] ?? (isMovie ? 'movie' : 'tv'),
      // TV-specific fields (may be null from search, fetched later)
      'number_of_seasons': movie['number_of_seasons'],
      'number_of_episodes': movie['number_of_episodes'],
      'seasons': movie['seasons'],
    };
  }

  /// Fetch full TV show details including seasons & episode counts
  Future<Map<String, dynamic>> _fetchTvDetails(int tvId) async {
    final url =
        'https://api.themoviedb.org/3/tv/$tvId?api_key=$apikey&language=en-US';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return {
        'number_of_seasons': data['number_of_seasons'] as int?,
        'number_of_episodes': data['number_of_episodes'] as int?,
        'seasons': (data['seasons'] as List<dynamic>?)
            ?.where((s) => s['season_number'] != 0)
            ?.map(
              (s) => {
                'id': s['id'],
                'name': s['name'],
                'season_number': s['season_number'],
                'episode_count': s['episode_count'],
                'poster_path': s['poster_path'],
                'overview': s['overview'],
                'air_date': s['air_date'],
              },
            )
            ?.toList(),
      };
    }
    throw Exception('Failed to fetch TV details');
  }

  void _onResultTap(Map<String, dynamic> movie) async {
    if (_isNavigating) return;
    _isNavigating = true;

    // Show loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(
        child: CircularProgressIndicator(color: Color(0xFF8B5CF6)),
      ),
    );

    try {
      final isTv = movie['name'] != null || movie['media_type'] == 'tv';

      // For TV shows, fetch full details so we get seasons & episodes
      if (isTv && movie['id'] != null) {
        final tvDetails = await _fetchTvDetails(movie['id'] as int);
        movie['number_of_seasons'] = tvDetails['number_of_seasons'];
        movie['number_of_episodes'] = tvDetails['number_of_episodes'];
        movie['seasons'] = tvDetails['seasons'];
      }

      if (mounted) {
        Navigator.of(context).pop(); // close loading

        // ── ROUTE TO THE CORRECT PLAYER ──
        if (isTv) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  TvShowPlayerPage(movie: movie, season: 1, episode: 1),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MoviePlayerPage(movie: movie),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        Navigator.of(context).pop(); // close loading
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to load details: $e'),
            backgroundColor: Colors.red[800],
          ),
        );
      }
    } finally {
      _isNavigating = false;
    }
  }

  // void _onResultTap(Map<String, dynamic> movie) async {
  //   if (_isNavigating) return;
  //   _isNavigating = true;

  //   // Show loading indicator
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (_) => const Center(
  //       child: CircularProgressIndicator(color: Color(0xFF8B5CF6)),
  //     ),
  //   );

  //   try {
  //     final isTv = movie['name'] != null || movie['media_type'] == 'tv';

  //     // For TV shows, fetch full details so we get seasons & episodes
  //     if (isTv && movie['id'] != null) {
  //       final tvDetails = await _fetchTvDetails(movie['id'] as int);
  //       movie['number_of_seasons'] = tvDetails['number_of_seasons'];
  //       movie['number_of_episodes'] = tvDetails['number_of_episodes'];
  //       movie['seasons'] = tvDetails['seasons'];
  //     }

  //     if (mounted) {
  //       Navigator.of(context).pop(); // close loading
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => VidsrcPlayerPage(
  //             movie: movie,
  //             season: isTv ? 1 : 0,
  //             episode: isTv ? 1 : 0,
  //           ),
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     if (mounted) {
  //       Navigator.of(context).pop(); // close loading
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Failed to load details: $e'),
  //           backgroundColor: Colors.red[800],
  //         ),
  //       );
  //     }
  //   } finally {
  //     _isNavigating = false;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // ── Custom Black Search Bar ──
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.08),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 12),
                      HugeIcon(
                        icon: HugeIcons.strokeRoundedSearch01,
                        size: 18,
                        color: Colors.grey[500]!,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          focusNode: _focusNode,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Search movies, shows...',
                            hintStyle: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 15,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                            isDense: true,
                          ),
                        ),
                      ),
                      if (_query.isNotEmpty)
                        GestureDetector(
                          onTap: () {
                            _controller.clear();
                            setState(() => _query = '');
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: HugeIcon(
                              icon: HugeIcons.strokeRoundedCancel01,
                              size: 18,
                              color: Colors.grey[500]!,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),

            // ── Content ──
            if (_query.isEmpty) ...[
              // Trending from API
              const SliverToBoxAdapter(child: SizedBox(height: 28)),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Text(
                    'Trending Now',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: FutureBuilder<List<Map<String, dynamic>>>(
                  future: _trendingFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox(
                        height: 200,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFF8B5CF6),
                            strokeWidth: 2,
                          ),
                        ),
                      );
                    }
                    if (snapshot.hasError ||
                        !snapshot.hasData ||
                        snapshot.data!.isEmpty) {
                      return SizedBox(
                        height: 100,
                        child: Center(
                          child: Text(
                            snapshot.hasError
                                ? 'Failed to load trending'
                                : 'No trending data',
                            style: TextStyle(color: Colors.grey[500]),
                          ),
                        ),
                      );
                    }
                    final trending = snapshot.data!;
                    return ListView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: trending.length,
                      itemBuilder: (context, index) {
                        final movie = trending[index];
                        return GestureDetector(
                          onTap: () => _onResultTap(movie),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            child: Row(
                              children: [
                                Container(
                                  width: 28,
                                  height: 28,
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${index + 1}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: index < 3
                                          ? const Color(0xFF8B5CF6)
                                          : Colors.grey[600],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    movie['title'],
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                HugeIcon(
                                  icon: HugeIcons.strokeRoundedArrowRight01,
                                  size: 18,
                                  color: Colors.grey[600]!,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ] else ...[
              // ── Live Search Results ──
              SliverToBoxAdapter(
                child: FutureBuilder<List<Map<String, dynamic>>>(
                  future: _searchMulti(_query),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox(
                        height: 400,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFF8B5CF6),
                            strokeWidth: 2,
                          ),
                        ),
                      );
                    }
                    if (snapshot.hasError) {
                      return SizedBox(
                        height: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Search failed',
                                style: TextStyle(color: Colors.grey[500]),
                              ),
                              const SizedBox(height: 12),
                              GestureDetector(
                                onTap: () => setState(() {}),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF8B5CF6),
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
                    final results = snapshot.data ?? [];
                    if (results.isEmpty) {
                      return SizedBox(
                        height: 300,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              HugeIcon(
                                icon: HugeIcons.strokeRoundedSearch01,
                                size: 48,
                                color: Colors.grey[700]!,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'No results for "$_query"',
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${results.length} results for "$_query"',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 12),
                          ...results.map(
                            (movie) => Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: GestureDetector(
                                onTap: () => _onResultTap(movie),
                                child: _SearchResultItem(
                                  title: movie['title'],
                                  year: movie['year'],
                                  genre: movie['genre'],
                                  rating: movie['rating'].toString(),
                                  imageUrl: movie['imageUrl'],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _SearchResultItem extends StatelessWidget {
  final String title;
  final String year;
  final String genre;
  final String rating;
  final String imageUrl;

  const _SearchResultItem({
    required this.title,
    required this.year,
    required this.genre,
    required this.rating,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: imageUrl.isNotEmpty
              ? Image.network(
                  imageUrl,
                  width: 70,
                  height: 90,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: 70,
                    height: 90,
                    color: const Color(0xFF2A2A2A),
                    child: const Icon(
                      Icons.broken_image,
                      color: Colors.white54,
                    ),
                  ),
                )
              : Container(
                  width: 70,
                  height: 90,
                  color: const Color(0xFF2A2A2A),
                  child: const Icon(Icons.movie, color: Colors.white54),
                ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 2),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              Text(
                '$year — $genre',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  HugeIcon(
                    icon: HugeIcons.strokeRoundedStar,
                    size: 13,
                    color: Colors.amber,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    rating,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
