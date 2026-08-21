// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:hugeicons/hugeicons.dart';
// import 'package:practice_ui/apps/movieapp/loading/loading_card.dart';
// import 'package:practice_ui/apps/movieapp/movielib/keys/all_api_link.dart';
// import 'package:practice_ui/apps/movieapp/widgets/movie_detail_page.dart';

// class TvSeries extends StatefulWidget {
//   const TvSeries({super.key});

//   @override
//   State<TvSeries> createState() => _TvSeriesState();
// }

// class _TvSeriesState extends State<TvSeries> {
//   late Future<List<Map<String, dynamic>>> _tvFuture;

//   @override
//   void initState() {
//     super.initState();
//     _tvFuture = _fetchTvSeries();
//   }

//   Future<List<Map<String, dynamic>>> _fetchTvSeries() async {
//     final response = await http.get(Uri.parse(onairTvSeriesUrl));

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       final results = data['results'] as List<dynamic>;

//       return results.map((tv) {
//         final rawDate = tv['first_air_date'] ?? '';
//         final parsedDate = rawDate.isNotEmpty
//             ? DateTime.tryParse(rawDate)
//             : null;

//         // Spread full TMDB data so detail page gets everything
//         return {
//           ...tv as Map<String, dynamic>,
//           'display_title': tv['name'] ?? 'Unknown',
//           'display_rating': (tv['vote_average'] as num?)?.toDouble() ?? 0.0,
//           'display_date': _formatDate(parsedDate),
//           'imageUrl': tv['poster_path'] != null
//               ? 'https://image.tmdb.org/t/p/w500${tv['poster_path']}'
//               : '',
//         };
//       }).toList();
//     } else {
//       throw Exception('Failed to load TV series');
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

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Map<String, dynamic>>>(
//       future: _tvFuture,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const LoadingCard();
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
//                         : 'No TV series found',
//                     style: TextStyle(color: Colors.grey[500], fontSize: 14),
//                   ),
//                   const SizedBox(height: 12),
//                   GestureDetector(
//                     onTap: () => setState(() => _tvFuture = _fetchTvSeries()),
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

//         final shows = snapshot.data!;

//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     "On Air Series",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {},
//                     child: Text(
//                       "See All",
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
//             // Horizontal scroll
//             SizedBox(
//               height: 250,
//               child: ListView.separated(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 scrollDirection: Axis.horizontal,
//                 itemCount: shows.length,
//                 separatorBuilder: (_, __) => const SizedBox(width: 14),
//                 itemBuilder: (context, index) {
//                   return _TvCard(show: shows[index]);
//                 },
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// class _TvCard extends StatelessWidget {
//   final Map<String, dynamic> show;

//   const _TvCard({required this.show});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (_) => MovieDetailPage(movie: show)),
//         );
//       },
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
//                   show['imageUrl'],
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
//                           show['display_title'],
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
//                         show['display_rating'].toString(),
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
//                     show['display_date'],
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
import 'package:practice_ui/apps/movieapp/pages/player/tv_show_player_page.dart';

class TvSeries extends StatefulWidget {
  const TvSeries({super.key});

  @override
  State<TvSeries> createState() => _TvSeriesState();
}

class _TvSeriesState extends State<TvSeries> {
  late Future<List<Map<String, dynamic>>> _tvFuture;

  @override
  void initState() {
    super.initState();
    _tvFuture = _fetchTvSeries();
  }

  Future<List<Map<String, dynamic>>> _fetchTvSeries() async {
    final response = await http.get(Uri.parse(onairTvSeriesUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'] as List<dynamic>;
      return results.map((tv) {
        final rawDate = tv['first_air_date'] ?? '';
        final parsedDate = rawDate.isNotEmpty
            ? DateTime.tryParse(rawDate)
            : null;
        return {
          ...tv as Map<String, dynamic>,
          'display_title': tv['name'] ?? 'Unknown',
          'display_rating': (tv['vote_average'] as num?)?.toDouble() ?? 0.0,
          'display_date': _formatDate(parsedDate),
          'imageUrl': tv['poster_path'] != null
              ? 'https://image.tmdb.org/t/p/w500${tv['poster_path']}'
              : '',
        };
      }).toList();
    } else {
      throw Exception('Failed to load TV series');
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

  void _openPlayer(Map<String, dynamic> show) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TvShowPlayerPage(movie: show, season: 1, episode: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _tvFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingCard();
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
                        : 'No TV series found',
                    style: TextStyle(color: Colors.grey[500], fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () => setState(() => _tvFuture = _fetchTvSeries()),
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

        final shows = snapshot.data!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "On Air Series",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "See All",
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
                itemCount: shows.length,
                separatorBuilder: (_, __) => const SizedBox(width: 14),
                itemBuilder: (context, index) {
                  return _TvCard(
                    show: shows[index],
                    onTap: () => _openPlayer(shows[index]),
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

class _TvCard extends StatelessWidget {
  final Map<String, dynamic> show;
  final VoidCallback onTap;

  const _TvCard({required this.show, required this.onTap});

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
                  show['imageUrl'],
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
                          show['display_title'],
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
                        show['display_rating'].toString(),
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
                    show['display_date'],
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
