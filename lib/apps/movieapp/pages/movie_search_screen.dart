// import 'package:flutter/material.dart';
// import 'package:hugeicons/hugeicons.dart';

// class MovieSearchScreen extends StatefulWidget {
//   const MovieSearchScreen({super.key});

//   @override
//   State<MovieSearchScreen> createState() => _MovieSearchScreenState();
// }

// class _MovieSearchScreenState extends State<MovieSearchScreen> {
//   final TextEditingController _controller = TextEditingController();
//   final FocusNode _focusNode = FocusNode();
//   bool _hasQuery = false;

//   final List<Map<String, String>> _recentSearches = [
//     {'title': 'Spider-Man', 'year': '2026'},
//     {'title': 'Dune', 'year': '2024'},
//     {'title': 'The Batman', 'year': '2022'},
//   ];

//   final List<String> _trending = [
//     'Avengers: Secret Wars',
//     'Deadpool & Wolverine',
//     'Captain America 4',
//     'Kalki 2898 AD',
//     'Vikram',
//   ];
//   final List<Map<String, String>> _results = [
//     {
//       'title': 'Spider-Man: Brand New Day',
//       'year': '2026',
//       'genre': 'Action',
//       'rating': '8.9',
//       'imageUrl':
//           'https://images.unsplash.com/photo-1635805737707-575885ab0820?w=400',
//     },
//     {
//       'title': 'Spider-Man: No Way Home',
//       'year': '2021',
//       'genre': 'Action',
//       'rating': '8.7',
//       'imageUrl':
//           'https://images.unsplash.com/photo-1626814026160-2237a95fc5a0?w=400',
//     },
//     {
//       'title': 'The Amazing Spider-Man',
//       'year': '2012',
//       'genre': 'Action',
//       'rating': '7.0',
//       'imageUrl':
//           'https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=400',
//     },
//     {
//       'title': 'Dune: Part Three',
//       'year': '2026',
//       'genre': 'Sci-Fi',
//       'rating': '9.1',
//       'imageUrl':
//           'https://images.unsplash.com/photo-1446776811953-b23d57bd21aa?w=400',
//     },
//     {
//       'title': 'The Batman: Gotham Knight',
//       'year': '2025',
//       'genre': 'Crime',
//       'rating': '8.7',
//       'imageUrl':
//           'https://images.unsplash.com/photo-1509347528160-9a9e33742cdb?w=400',
//     },
//     {
//       'title': 'Avengers: Secret Wars',
//       'year': '2027',
//       'genre': 'Action',
//       'rating': '9.3',
//       'imageUrl':
//           'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?w=400',
//     },
//     {
//       'title': 'Deadpool & Wolverine',
//       'year': '2024',
//       'genre': 'Action',
//       'rating': '8.5',
//       'imageUrl':
//           'https://images.unsplash.com/photo-1534447677768-be436bb09401?w=400',
//     },
//     {
//       'title': 'Kalki 2898 AD',
//       'year': '2024',
//       'genre': 'Sci-Fi/Action',
//       'rating': '8.2',
//       'imageUrl':
//           'https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?w=400',
//     },
//     {
//       'title': 'Captain America: Brave New World',
//       'year': '2025',
//       'genre': 'Action',
//       'rating': '8.0',
//       'imageUrl':
//           'https://images.unsplash.com/photo-1478720568477-152d9b164e26?w=400',
//     },

//     {
//       'title': 'Oppenheimer',
//       'year': '2023',
//       'genre': 'Drama',
//       'rating': '8.6',
//       'imageUrl':
//           'https://images.unsplash.com/photo-1616530940355-351fabd9524b?w=400',
//     },
//     {
//       'title': 'Inception',
//       'year': '2010',
//       'genre': 'Sci-Fi',
//       'rating': '8.8',
//       'imageUrl':
//           'https://images.unsplash.com/photo-1533488765986-dfa2a9939acd?w=400',
//     },
//     {
//       'title': 'The Dark Knight',
//       'year': '2008',
//       'genre': 'Action',
//       'rating': '9.0',
//       'imageUrl':
//           'https://images.unsplash.com/photo-1485846234645-a62644f84728?w=400',
//     },
//     {
//       'title': 'Interstellar',
//       'year': '2014',
//       'genre': 'Sci-Fi',
//       'rating': '8.7',
//       'imageUrl':
//           'https://images.unsplash.com/photo-1419242902214-272b3f66ee7a?w=400',
//     },
//   ];

//   // final List<Map<String, String>> _results = [
//   //   {
//   //     'title': 'Spider-Man: Brand New Day',
//   //     'year': '2026',
//   //     'genre': 'Action',
//   //     'rating': '8.9',
//   //     'imageUrl':
//   //         'https://images.unsplash.com/photo-1635805737707-575885ab0820?w=400',
//   //   },
//   //   {
//   //     'title': 'Spider-Man: No Way Home',
//   //     'year': '2021',
//   //     'genre': 'Action',
//   //     'rating': '8.7',
//   //     'imageUrl':
//   //         'https://images.unsplash.com/photo-1626814026160-2237a95fc5a0?w=400',
//   //   },
//   //   {
//   //     'title': 'The Amazing Spider-Man',
//   //     'year': '2012',
//   //     'genre': 'Action',
//   //     'rating': '7.0',
//   //     'imageUrl':
//   //         'https://images.unsplash.com/photo-1560932687-45ce2eb0a400?w=400',
//   //   },
//   // ];

//   @override
//   void initState() {
//     super.initState();
//     _controller.addListener(() {
//       setState(() => _hasQuery = _controller.text.isNotEmpty);
//     });
//     WidgetsBinding.instance.addPostFrameCallback(
//       (_) => _focusNode.requestFocus(),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _focusNode.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF0A0A0A),
//       body: SafeArea(
//         bottom: false,
//         child: CustomScrollView(
//           physics: const BouncingScrollPhysics(),
//           slivers: [
//             // ── Search Bar ──
//             SliverToBoxAdapter(
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         height: 44,
//                         decoration: BoxDecoration(
//                           color: Colors.white.withOpacity(0.05),
//                           borderRadius: BorderRadius.circular(30),
//                           border: Border.all(
//                             color: Colors.white.withOpacity(0.08),
//                             width: 1,
//                           ),
//                         ),
//                         child: Row(
//                           children: [
//                             const SizedBox(width: 12),
//                             HugeIcon(
//                               icon: HugeIcons.strokeRoundedSearch01,
//                               size: 18,
//                               color: Colors.grey[500]!,
//                             ),
//                             const SizedBox(width: 10),
//                             Expanded(
//                               child: TextField(
//                                 controller: _controller,
//                                 focusNode: _focusNode,
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                                 decoration: InputDecoration(
//                                   hintText: 'Search movies, shows...',
//                                   hintStyle: TextStyle(
//                                     color: Colors.grey[600],
//                                     fontSize: 15,
//                                   ),
//                                   border: InputBorder.none,
//                                   contentPadding: EdgeInsets.zero,
//                                   isDense: true,
//                                 ),
//                               ),
//                             ),
//                             if (_hasQuery)
//                               GestureDetector(
//                                 onTap: () {
//                                   _controller.clear();
//                                   setState(() => _hasQuery = false);
//                                 },
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(right: 12),
//                                   child: HugeIcon(
//                                     icon: HugeIcons.strokeRoundedCancel01,
//                                     size: 18,
//                                     color: Colors.grey[500]!,
//                                   ),
//                                 ),
//                               ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             // ── Content ──
//             if (!_hasQuery) ...[
//               // Recent Searches
//               SliverToBoxAdapter(
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [],
//                   ),
//                 ),
//               ),
//               SliverToBoxAdapter(),

//               // Trending Searches
//               SliverToBoxAdapter(
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(16, 28, 16, 0),
//                   child: const Text(
//                     'Trending Now',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               SliverList(
//                 delegate: SliverChildBuilderDelegate((context, index) {
//                   final title = _trending[index];
//                   return GestureDetector(
//                     onTap: () {
//                       _controller.text = title;
//                       setState(() => _hasQuery = true);
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 16,
//                         vertical: 14,
//                       ),
//                       child: Row(
//                         children: [
//                           Container(
//                             width: 28,
//                             height: 28,
//                             alignment: Alignment.center,
//                             child: Text(
//                               '${index + 1}',
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w700,
//                                 color: index < 3
//                                     ? const Color(0xFF8B5CF6)
//                                     : Colors.grey[600],
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: Text(
//                               title,
//                               style: const TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                           HugeIcon(
//                             icon: HugeIcons.strokeRoundedArrowRight01,
//                             size: 18,
//                             color: Colors.grey[600]!,
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }, childCount: _trending.length),
//               ),
//             ] else ...[
//               // ── Search Results ──
//               SliverToBoxAdapter(
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
//                   child: Text(
//                     '${_results.length} results found',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey[500],
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//               SliverList(
//                 delegate: SliverChildBuilderDelegate((context, index) {
//                   final movie = _results[index];
//                   return _SearchResultItem(
//                     title: movie['title']!,
//                     year: movie['year']!,
//                     genre: movie['genre']!,
//                     rating: movie['rating']!,
//                     imageUrl: movie['imageUrl']!,
//                   );
//                 }, childCount: _results.length),
//               ),
//               const SliverToBoxAdapter(child: SizedBox(height: 24)),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ─── Search Result Item ────────────────────────────────────────

// class _SearchResultItem extends StatelessWidget {
//   final String title;
//   final String year;
//   final String genre;
//   final String rating;
//   final String imageUrl;

//   const _SearchResultItem({
//     required this.title,
//     required this.year,
//     required this.genre,
//     required this.rating,
//     required this.imageUrl,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Poster
//           ClipRRect(
//             borderRadius: BorderRadius.circular(8),
//             child: Image.network(
//               imageUrl,
//               width: 70,
//               height: 90,
//               fit: BoxFit.cover,
//             ),
//           ),
//           const SizedBox(width: 14),

//           // Info
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 2),
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w700,
//                     color: Colors.white,
//                   ),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 6),
//                 Text(
//                   '$year — $genre',
//                   style: const TextStyle(
//                     fontSize: 13,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   children: [
//                     HugeIcon(
//                       icon: HugeIcons.strokeRoundedStar,
//                       size: 13,
//                       color: Colors.amber,
//                     ),
//                     const SizedBox(width: 4),
//                     Text(
//                       rating,
//                       style: const TextStyle(
//                         fontSize: 13,
//                         color: Colors.white,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),

//           // Bookmark
//           Padding(
//             padding: const EdgeInsets.only(top: 2),
//             child: GestureDetector(
//               onTap: () {},
//               child: HugeIcon(
//                 icon: HugeIcons.strokeRoundedBookmark02,
//                 size: 20,
//                 color: Colors.grey[500]!,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hugeicons/hugeicons.dart';
import 'package:practice_ui/apps/movieapp/movielib/movie_api/apikey.dart';
import 'package:practice_ui/apps/movieapp/movielib/keys/all_api_link.dart';

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

  final List<Map<String, String>> _recentSearches = [
    {'title': 'Spider-Man', 'year': '2026'},
    {'title': 'Dune', 'year': '2024'},
    {'title': 'The Batman', 'year': '2022'},
  ];

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
      return results.map((m) => _mapMovie(m)).toList();
    }
    throw Exception('Failed to load trending');
  }

  Future<List<Map<String, dynamic>>> _searchMovies(String query) async {
    if (query.isEmpty) return [];
    final url =
        'https://api.themoviedb.org/3/search/movie?api_key=$apikey&query=${Uri.encodeComponent(query)}&language=en-US&page=1';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'] as List<dynamic>;
      return results.map((m) => _mapMovie(m)).toList();
    }
    throw Exception('Search failed');
  }

  Map<String, dynamic> _mapMovie(dynamic movie) {
    final rawDate = movie['release_date'] ?? '';
    final parsedDate = rawDate.isNotEmpty ? DateTime.tryParse(rawDate) : null;
    return {
      'title': movie['title'] ?? movie['name'] ?? 'Unknown',
      'year': parsedDate?.year.toString() ?? 'TBD',
      'genre': 'Movie',
      'rating': (movie['vote_average'] as num?)?.toDouble() ?? 0.0,
      'imageUrl': movie['poster_path'] != null
          ? 'https://image.tmdb.org/t/p/w500${movie['poster_path']}'
          : '',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // ── Search Bar ──
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
                      itemCount: trending.length > 10 ? 10 : trending.length,
                      itemBuilder: (context, index) {
                        final movie = trending[index];
                        return GestureDetector(
                          onTap: () {
                            _controller.text = movie['title'];
                            setState(() => _query = movie['title']);
                          },
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
                  future: _searchMovies(_query),
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
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${results.length} results found',
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
                              child: _SearchResultItem(
                                title: movie['title'],
                                year: movie['year'],
                                genre: movie['genre'],
                                rating: movie['rating'].toString(),
                                imageUrl: movie['imageUrl'],
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
          child: Image.network(
            imageUrl,
            width: 70,
            height: 90,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              width: 70,
              height: 90,
              color: const Color(0xFF2A2A2A),
              child: const Icon(Icons.broken_image, color: Colors.white54),
            ),
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
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: GestureDetector(
            onTap: () {},
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedBookmark02,
              size: 20,
              color: Colors.grey[500]!,
            ),
          ),
        ),
      ],
    );
  }
}
