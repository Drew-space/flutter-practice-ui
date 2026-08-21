// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:hugeicons/hugeicons.dart';
// import 'package:practice_ui/apps/movieapp/loading/loading_card.dart';
// import 'package:practice_ui/apps/movieapp/movielib/keys/all_api_link.dart';
// import 'package:practice_ui/apps/movieapp/pages/player/vidking_player_page.dart';

// class RomanceMovies extends StatefulWidget {
//   const RomanceMovies({super.key});

//   @override
//   State<RomanceMovies> createState() => _RomanceMoviesState();
// }

// class _RomanceMoviesState extends State<RomanceMovies> {
//   late Future<List<Map<String, dynamic>>> _romanceFuture;

//   @override
//   void initState() {
//     super.initState();
//     _romanceFuture = _fetchRomance();
//   }

//   Future<List<Map<String, dynamic>>> _fetchRomance() async {
//     final response = await http.get(Uri.parse(romanceMoviesUrl));

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       final results = data['results'] as List<dynamic>;

//       return results.map((movie) {
//         final rawDate = movie['release_date'] ?? '';
//         final parsedDate = rawDate.isNotEmpty
//             ? DateTime.tryParse(rawDate)
//             : null;

//         return {
//           'id': movie['id'],
//           'title': movie['title'] ?? 'Unknown',
//           'name': movie['title'],
//           'rating': (movie['vote_average'] as num?)?.toDouble() ?? 0.0,
//           'vote_average': movie['vote_average'],
//           'date': _formatDate(parsedDate),
//           'release_date': movie['release_date'],
//           'overview': movie['overview'] ?? '',
//           'poster_path': movie['poster_path'],
//           'backdrop_path': movie['backdrop_path'],
//           'imageUrl': movie['poster_path'] != null
//               ? 'https://image.tmdb.org/t/p/w500${movie['poster_path']}'
//               : '',
//         };
//       }).toList();
//     } else {
//       throw Exception('Failed to load romance movies');
//     }
//   }

//   String _formatDate(DateTime? date) {
//     if (date == null) return 'TBD';
//     final months = [
//       'Jan',
//       'Feb',
//       'Mar',
//       'Apr',
//       'May',
//       'Jun',
//       'Jul',
//       'Aug',
//       'Sep',
//       'Oct',
//       'Nov',
//       'Dec',
//     ];
//     return '${months[date.month - 1]} ${date.day.toString().padLeft(2, '0')} ${date.year}';
//   }

//   void _onMovieTap(Map<String, dynamic> movie) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => VidsrcPlayerPage(movie: movie)),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Map<String, dynamic>>>(
//       future: _romanceFuture,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return LoadingCard();
//         }

//         if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
//           return SizedBox(
//             height: 250,
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.wifi_off, color: Colors.grey[600], size: 32),
//                   const SizedBox(height: 8),
//                   Text(
//                     snapshot.hasError
//                         ? 'Something went wrong'
//                         : 'No romance movies',
//                     style: TextStyle(color: Colors.grey[500], fontSize: 14),
//                   ),
//                   const SizedBox(height: 12),
//                   GestureDetector(
//                     onTap: () =>
//                         setState(() => _romanceFuture = _fetchRomance()),
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 20,
//                         vertical: 8,
//                       ),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFF7a65c0),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: const Text(
//                         'Retry',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 13,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }

//         final movies = snapshot.data!;

//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       const Text(
//                         'Romance',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   GestureDetector(
//                     onTap: () {},
//                     child: Text(
//                       'See All',
//                       style: TextStyle(
//                         color: Colors.white.withOpacity(0.6),
//                         fontSize: 14,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 16),
//             // Horizontal scroll cards
//             SizedBox(
//               height: 250,
//               child: ListView.separated(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 scrollDirection: Axis.horizontal,
//                 itemCount: movies.length,
//                 separatorBuilder: (_, __) => const SizedBox(width: 14),
//                 itemBuilder: (context, index) {
//                   return _RomanceCard(
//                     movie: movies[index],
//                     onTap: () => _onMovieTap(movies[index]),
//                   );
//                 },
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// class _RomanceCard extends StatelessWidget {
//   final Map<String, dynamic> movie;
//   final VoidCallback onTap;

//   const _RomanceCard({required this.movie, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 200,
//         decoration: BoxDecoration(
//           color: const Color(0xFF1C1C1E),
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // Poster image with padding inside the gray card
//             Padding(
//               padding: const EdgeInsets.all(8),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: Image.network(
//                   movie['imageUrl'],
//                   height: 175,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                   errorBuilder: (context, error, stackTrace) => Container(
//                     height: 175,
//                     color: const Color(0xFF2A2A2A),
//                     child: const Icon(
//                       Icons.broken_image,
//                       color: Colors.white54,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             // Text content sitting on the gray background
//             Padding(
//               padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Text(
//                           movie['title'],
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 6),
//                       HugeIcon(
//                         icon: HugeIcons.strokeRoundedStar,
//                         color: Colors.amber,
//                         size: 14,
//                       ),
//                       const SizedBox(width: 2),
//                       Text(
//                         movie['rating'].toString(),
//                         style: const TextStyle(
//                           color: Colors.white70,
//                           fontSize: 12,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     movie['date'],
//                     style: TextStyle(
//                       color: Colors.white.withOpacity(0.5),
//                       fontSize: 12,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hugeicons/hugeicons.dart';
import 'package:practice_ui/apps/movieapp/loading/loading_card.dart';
import 'package:practice_ui/apps/movieapp/movielib/keys/all_api_link.dart';
import 'package:practice_ui/apps/movieapp/pages/player/movie_player_page.dart';

class RomanceMovies extends StatefulWidget {
  const RomanceMovies({super.key});

  @override
  State<RomanceMovies> createState() => _RomanceMoviesState();
}

class _RomanceMoviesState extends State<RomanceMovies> {
  late Future<List<Map<String, dynamic>>> _romanceFuture;

  @override
  void initState() {
    super.initState();
    _romanceFuture = _fetchRomance();
  }

  Future<List<Map<String, dynamic>>> _fetchRomance() async {
    final response = await http.get(Uri.parse(romanceMoviesUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'] as List<dynamic>;
      return results.map((movie) {
        final rawDate = movie['release_date'] ?? '';
        final parsedDate = rawDate.isNotEmpty
            ? DateTime.tryParse(rawDate)
            : null;
        return {
          ...movie as Map<String, dynamic>,
          'title': movie['title'] ?? 'Unknown',
          'rating': (movie['vote_average'] as num?)?.toDouble() ?? 0.0,
          'date': _formatDate(parsedDate),
          'imageUrl': movie['poster_path'] != null
              ? 'https://image.tmdb.org/t/p/w500${movie['poster_path']}'
              : '',
        };
      }).toList();
    } else {
      throw Exception('Failed to load romance movies');
    }
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'TBD';
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.day.toString().padLeft(2, '0')} ${date.year}';
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
      future: _romanceFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingCard();
        }
        if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
          return SizedBox(
            height: 250,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wifi_off, color: Colors.grey[600], size: 32),
                  const SizedBox(height: 8),
                  Text(
                    snapshot.hasError
                        ? 'Something went wrong'
                        : 'No romance movies',
                    style: TextStyle(color: Colors.grey[500], fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () =>
                        setState(() => _romanceFuture = _fetchRomance()),
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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Romance',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 250,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                separatorBuilder: (_, __) => const SizedBox(width: 14),
                itemBuilder: (context, index) {
                  return _RomanceCard(
                    movie: movies[index],
                    onTap: () => _openPlayer(movies[index]),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class _RomanceCard extends StatelessWidget {
  final Map<String, dynamic> movie;
  final VoidCallback onTap;

  const _RomanceCard({required this.movie, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: const Color(0xFF1C1C1E),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  movie['imageUrl'],
                  height: 175,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 175,
                    color: const Color(0xFF2A2A2A),
                    child: const Icon(
                      Icons.broken_image,
                      color: Colors.white54,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          movie['title'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      HugeIcon(
                        icon: HugeIcons.strokeRoundedStar,
                        color: Colors.amber,
                        size: 14,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        movie['rating'].toString(),
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    movie['date'],
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
