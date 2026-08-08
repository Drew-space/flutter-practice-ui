// import 'package:flutter/material.dart';
// import 'package:hugeicons/hugeicons.dart';

// class PopularMovie extends StatelessWidget {
//   const PopularMovie({super.key});

//   final List<Movie> movies = const [
//     Movie(
//       title: 'The Witcher',
//       rating: 6.4,
//       date: 'Dec 20 2025',
//       posterUrl:
//           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTP19mcnPntnbjm5jf_W_TOmryj_bvqyjIRPL0X3BqZDoMl4zPjtHHxCz8&s=10",
//     ),
//     Movie(
//       title: 'Tale of the Nine Tailed',
//       rating: 8.4,
//       date: 'Jan 15 2026',
//       posterUrl:
//           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSRxulYERG3_2hdB79BEig1RAI2bvW-7Mblm02w5k7eNpxOgaij-H8kFfM&s=10",
//     ),
//     Movie(
//       title: 'Spider-Man: Across the Spider-Verse',
//       rating: 8.7,
//       date: 'Jun 02 2026',
//       posterUrl:
//           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTi4PP972ZrE4fITVkxsIozmtTY93TqG8axcru66P6XhkpQBQktBeW3tpQ&s=10",
//     ),
//     Movie(
//       title: 'John Wick: Chapter 4',
//       rating: 7.7,
//       date: 'Mar 24 2026',
//       posterUrl:
//           "https://m.media-amazon.com/images/I/81fk-N7tvbL._AC_UF894,1000_QL80_.jpg",
//     ),
//     Movie(
//       title: 'Guardians of the Galaxy Vol. 3',
//       rating: 7.9,
//       date: 'May 05 2026',
//       posterUrl:
//           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaEBIqHsETvwHnL4RNPkw0OQVFa6umdrmj3PQAqz0M8g&s=10",
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Header
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 'Popular',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {},
//                 child: Text(
//                   'See All',
//                   style: TextStyle(
//                     color: Colors.white.withOpacity(0.6),
//                     fontSize: 14,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 16),
//         // Horizontal scroll cards
//         SizedBox(
//           height: 250,
//           child: ListView.separated(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             scrollDirection: Axis.horizontal,
//             itemCount: movies.length,
//             separatorBuilder: (_, __) => const SizedBox(width: 14),
//             itemBuilder: (context, index) {
//               return _PopularCard(movie: movies[index]);
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _PopularCard extends StatelessWidget {
//   final Movie movie;

//   const _PopularCard({required this.movie});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 200,
//       decoration: BoxDecoration(
//         color: const Color(0xFF1C1C1E),
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           // Poster image with padding inside the gray card
//           Padding(
//             padding: const EdgeInsets.all(8),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: Image.network(
//                 movie.posterUrl,
//                 height: 175,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//                 errorBuilder: (context, error, stackTrace) => Container(
//                   height: 175,
//                   color: const Color(0xFF2A2A2A),
//                   child: const Icon(Icons.broken_image, color: Colors.white54),
//                 ),
//               ),
//             ),
//           ),
//           // Text content sitting on the gray background
//           Padding(
//             padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Text(
//                         movie.title,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 6),
//                     HugeIcon(
//                       icon: HugeIcons.strokeRoundedStar,
//                       color: Colors.amber,
//                       size: 14,
//                     ),
//                     const SizedBox(width: 2),
//                     Text(
//                       movie.rating.toString(),
//                       style: const TextStyle(
//                         color: Colors.white70,
//                         fontSize: 12,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   movie.date,
//                   style: TextStyle(
//                     color: Colors.white.withOpacity(0.5),
//                     fontSize: 12,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Movie {
//   final String title;
//   final double rating;
//   final String date;
//   final String posterUrl;

//   const Movie({
//     required this.title,
//     required this.rating,
//     required this.date,
//     required this.posterUrl,
//   });
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hugeicons/hugeicons.dart';
import 'package:practice_ui/apps/movieapp/movielib/movie_api_link/all_api_link.dart';

class PopularMovie extends StatefulWidget {
  const PopularMovie({super.key});

  @override
  State<PopularMovie> createState() => _PopularMovieState();
}

class _PopularMovieState extends State<PopularMovie> {
  late Future<List<Map<String, dynamic>>> _popularFuture;

  @override
  void initState() {
    super.initState();
    _popularFuture = _fetchPopular();
  }

  Future<List<Map<String, dynamic>>> _fetchPopular() async {
    final response = await http.get(Uri.parse(popularMoviesUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'] as List<dynamic>;

      return results.map((movie) {
        final rawDate = movie['release_date'] ?? '';
        final parsedDate = rawDate.isNotEmpty
            ? DateTime.tryParse(rawDate)
            : null;

        return {
          'title': movie['title'] ?? 'Unknown',
          'rating': (movie['vote_average'] as num?)?.toDouble() ?? 0.0,
          'date': _formatDate(parsedDate),
          'imageUrl': movie['poster_path'] != null
              ? 'https://image.tmdb.org/t/p/w500${movie['poster_path']}'
              : '',
        };
      }).toList();
    } else {
      throw Exception('Failed to load popular movies');
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _popularFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 250,
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
                        : 'No popular movies',
                    style: TextStyle(color: Colors.grey[500], fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () =>
                        setState(() => _popularFuture = _fetchPopular()),
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
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular',
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
            // Horizontal scroll cards
            SizedBox(
              height: 250,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                separatorBuilder: (_, __) => const SizedBox(width: 14),
                itemBuilder: (context, index) {
                  return _PopularCard(movie: movies[index]);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class _PopularCard extends StatelessWidget {
  final Map<String, dynamic> movie;

  const _PopularCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Poster image with padding inside the gray card
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
                  child: const Icon(Icons.broken_image, color: Colors.white54),
                ),
              ),
            ),
          ),
          // Text content sitting on the gray background
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
    );
  }
}
