import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:practice_ui/apps/movieapp/models/bookmarks_services.dart';

import 'package:practice_ui/apps/movieapp/pages/player/movie_player_page.dart';
import 'package:practice_ui/apps/movieapp/pages/player/tv_show_player_page.dart';

class MovieBookmarksScreen extends StatefulWidget {
  const MovieBookmarksScreen({super.key});

  @override
  State<MovieBookmarksScreen> createState() => _MovieBookmarksScreenState();
}

class _MovieBookmarksScreenState extends State<MovieBookmarksScreen> {
  final BookmarksService _bookmarksService = BookmarksService();

  List<Map<String, dynamic>> _bookmarks = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadBookmarks();
    // Listen for changes
    _bookmarksService.watchStream.listen((_) {
      _loadBookmarks();
    });
  }

  void _loadBookmarks() {
    setState(() {
      _bookmarks = _bookmarksService.getAllBookmarks();
      _isLoading = false;
    });
  }

  /// Check if it's a TV show
  bool _isTvShow(Map<String, dynamic> movie) {
    final mediaType = movie['media_type']?.toString().toLowerCase();
    if (mediaType == 'tv') return true;
    if (mediaType == 'movie') return false;
    if (movie['title'] == null && movie['name'] != null) return true;
    if (movie['number_of_seasons'] != null) return true;
    return false;
  }

  void _openPlayer(Map<String, dynamic> movie) {
    if (_isTvShow(movie)) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => TvShowPlayerPage(movie: movie, season: 1, episode: 1),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => MoviePlayerPage(movie: movie)),
      );
    }
  }

  Future<void> _removeBookmark(String id) async {
    await _bookmarksService.removeBookmark(id);
    _loadBookmarks();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Removed from Wishlist'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasBookmarks = _bookmarks.isNotEmpty;

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // ── Header ──
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'My Wishlist',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                  ],
                ),
              ),
            ),

            if (_isLoading) ...[
              const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: CircularProgressIndicator(color: Color(0xFF7C3AED)),
                ),
              ),
            ] else if (hasBookmarks) ...[
              // ── Bookmark Count ──
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  child: Text(
                    '${_bookmarks.length} ${_bookmarks.length == 1 ? 'title' : 'titles'} saved',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              // ── Wishlist List ──
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final movie = _bookmarks[index];
                  return _WishlistItem(
                    movie: movie,
                    onTap: () => _openPlayer(movie),
                    onRemove: () => _removeBookmark(movie['id'].toString()),
                  );
                }, childCount: _bookmarks.length),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
            ] else ...[
              SliverFillRemaining(hasScrollBody: false, child: _EmptyState()),
            ],
          ],
        ),
      ),
    );
  }
}

// ─── Wishlist Item ─────────────────────────────────────────────

class _WishlistItem extends StatelessWidget {
  final Map<String, dynamic> movie;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  const _WishlistItem({
    required this.movie,
    required this.onTap,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final title = movie['title'] ?? movie['name'] ?? 'Unknown';
    final year = movie['release_date']?.toString().isNotEmpty == true
        ? DateTime.tryParse(movie['release_date'])?.year.toString()
        : movie['first_air_date']?.toString().isNotEmpty == true
        ? DateTime.tryParse(movie['first_air_date'])?.year.toString()
        : 'TBD';
    final genre = movie['genre_ids'] != null
        ? 'Movie'
        : (movie['number_of_seasons'] != null ? 'TV Series' : 'Movie');
    final rating = (movie['vote_average'] as num?)?.toDouble() ?? 0.0;
    final imageUrl = movie['poster_path'] != null
        ? 'https://image.tmdb.org/t/p/w500${movie['poster_path']}'
        : '';

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Poster thumbnail
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: imageUrl.isNotEmpty
                  ? Image.network(
                      imageUrl,
                      width: 80,
                      height: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        width: 80,
                        height: 100,
                        color: const Color(0xFF2A2A2A),
                        child: const Icon(
                          Icons.broken_image,
                          color: Colors.white54,
                        ),
                      ),
                    )
                  : Container(
                      width: 80,
                      height: 100,
                      color: const Color(0xFF2A2A2A),
                      child: const Icon(Icons.movie, color: Colors.white54),
                    ),
            ),
            const SizedBox(width: 14),

            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 2),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
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
                        rating.toStringAsFixed(1),
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

            // Heart icon (remove)
            GestureDetector(
              onTap: onRemove,
              child: Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Icon(
                  Icons.favorite,
                  size: 22,
                  color: const Color(0xFF7C3AED),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Empty State ───────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            const Text(
              'No Wishlist Yet',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Save movies you want to watch later. Tap the heart icon on any movie to add it here.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[500],
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
