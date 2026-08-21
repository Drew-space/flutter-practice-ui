// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:hugeicons/hugeicons.dart';
// import 'package:http/http.dart' as http;
// import 'package:practice_ui/apps/movieapp/loading/loading_card.dart';
// import 'package:practice_ui/apps/movieapp/movielib/keys/all_api_link.dart';
// import 'package:practice_ui/apps/movieapp/pages/player/vidking_player_page.dart';

// class TvShow {
//   final int id;
//   final String title;
//   final double rating;
//   final String date;
//   final String imageUrl;
//   final String? posterPath;
//   final String? backdropPath;
//   final String? overview;
//   final String? firstAirDate;
//   final int? numberOfSeasons;
//   final int? numberOfEpisodes;

//   const TvShow({
//     required this.id,
//     required this.title,
//     required this.rating,
//     required this.date,
//     required this.imageUrl,
//     this.posterPath,
//     this.backdropPath,
//     this.overview,
//     this.firstAirDate,
//     this.numberOfSeasons,
//     this.numberOfEpisodes,
//   });
// }

// class MovieTvShows extends StatefulWidget {
//   const MovieTvShows({super.key});

//   @override
//   State<MovieTvShows> createState() => _MovieTvShowsState();
// }

// class _MovieTvShowsState extends State<MovieTvShows> {
//   late Future<List<TvShow>> _tvShowsFuture;

//   @override
//   void initState() {
//     super.initState();
//     _tvShowsFuture = _fetchTvShows();
//   }

//   Future<List<TvShow>> _fetchTvShows() async {
//     final response = await http.get(Uri.parse(popularTvSeriesUrl));

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       final results = data['results'] as List<dynamic>;

//       return results.map((show) {
//         final rawDate = show['first_air_date'] ?? '';
//         final parsedDate = rawDate.isNotEmpty
//             ? DateTime.tryParse(rawDate)
//             : null;

//         final posterPath = show['poster_path']?.toString();
//         final backdropPath = show['backdrop_path']?.toString();

//         return TvShow(
//           id: show['id'] ?? 0,
//           title: show['name'] ?? 'Unknown',
//           rating: (show['vote_average'] as num?)?.toDouble() ?? 0.0,
//           date: _formatDate(parsedDate),
//           imageUrl: posterPath != null
//               ? 'https://image.tmdb.org/t/p/w500$posterPath'
//               : '',
//           posterPath: posterPath,
//           backdropPath: backdropPath,
//           overview: show['overview']?.toString() ?? '',
//           firstAirDate: show['first_air_date']?.toString() ?? '',
//           numberOfSeasons: show['number_of_seasons'] as int?,
//           numberOfEpisodes: show['number_of_episodes'] as int?,
//         );
//       }).toList();
//     } else {
//       throw Exception('Failed to load TV shows');
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

//   void _onTvShowTap(TvShow tvShow) {
//     // Convert TvShow to Map<String, dynamic> for VidsrcPlayerPage
//     final movieMap = <String, dynamic>{
//       'id': tvShow.id,
//       'name': tvShow.title, // TV shows use 'name' in VidsrcPlayerPage
//       'title': null, // null so _isMovie returns false
//       'vote_average': tvShow.rating,
//       'first_air_date': tvShow.firstAirDate,
//       'overview': tvShow.overview,
//       'poster_path': tvShow.posterPath,
//       'backdrop_path': tvShow.backdropPath,
//       'number_of_seasons': tvShow.numberOfSeasons ?? 1,
//       'number_of_episodes': tvShow.numberOfEpisodes ?? 1,
//     };

//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) =>
//             VidsrcPlayerPage(movie: movieMap, season: 1, episode: 1),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<TvShow>>(
//       future: _tvShowsFuture,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const SizedBox(height: 250, child: LoadingCard());
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
//                     snapshot.hasError ? 'Something went wrong' : 'No TV shows',
//                     style: TextStyle(color: Colors.grey[500], fontSize: 14),
//                   ),
//                   const SizedBox(height: 12),
//                   GestureDetector(
//                     onTap: () =>
//                         setState(() => _tvShowsFuture = _fetchTvShows()),
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

//         final tvShows = snapshot.data!;

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
//                     "TV Shows",
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
//                 itemCount: tvShows.length,
//                 separatorBuilder: (_, __) => const SizedBox(width: 14),
//                 itemBuilder: (context, index) {
//                   return _TvShowCard(
//                     tvShow: tvShows[index],
//                     onTap: () => _onTvShowTap(tvShows[index]),
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

// class _TvShowCard extends StatelessWidget {
//   final TvShow tvShow;
//   final VoidCallback onTap;

//   const _TvShowCard({required this.tvShow, required this.onTap});

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
//                   tvShow.imageUrl,
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
//                           tvShow.title,
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
//                         tvShow.rating.toString(),
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
//                     tvShow.date,
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
import 'package:hugeicons/hugeicons.dart';
import 'package:http/http.dart' as http;
import 'package:practice_ui/apps/movieapp/loading/loading_card.dart';
import 'package:practice_ui/apps/movieapp/movielib/keys/all_api_link.dart';
import 'package:practice_ui/apps/movieapp/pages/player/tv_show_player_page.dart';

class TvShow {
  final int id;
  final String title;
  final double rating;
  final String date;
  final String imageUrl;
  final String? posterPath;
  final String? backdropPath;
  final String? overview;
  final String? firstAirDate;
  final int? numberOfSeasons;
  final int? numberOfEpisodes;

  const TvShow({
    required this.id,
    required this.title,
    required this.rating,
    required this.date,
    required this.imageUrl,
    this.posterPath,
    this.backdropPath,
    this.overview,
    this.firstAirDate,
    this.numberOfSeasons,
    this.numberOfEpisodes,
  });
}

class MovieTvShows extends StatefulWidget {
  const MovieTvShows({super.key});

  @override
  State<MovieTvShows> createState() => _MovieTvShowsState();
}

class _MovieTvShowsState extends State<MovieTvShows> {
  late Future<List<TvShow>> _tvShowsFuture;

  @override
  void initState() {
    super.initState();
    _tvShowsFuture = _fetchTvShows();
  }

  Future<List<TvShow>> _fetchTvShows() async {
    final response = await http.get(Uri.parse(popularTvSeriesUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'] as List<dynamic>;
      return results.map((show) {
        final rawDate = show['first_air_date'] ?? '';
        final parsedDate = rawDate.isNotEmpty
            ? DateTime.tryParse(rawDate)
            : null;
        final posterPath = show['poster_path']?.toString();
        final backdropPath = show['backdrop_path']?.toString();
        return TvShow(
          id: show['id'] ?? 0,
          title: show['name'] ?? 'Unknown',
          rating: (show['vote_average'] as num?)?.toDouble() ?? 0.0,
          date: _formatDate(parsedDate),
          imageUrl: posterPath != null
              ? 'https://image.tmdb.org/t/p/w500$posterPath'
              : '',
          posterPath: posterPath,
          backdropPath: backdropPath,
          overview: show['overview']?.toString() ?? '',
          firstAirDate: show['first_air_date']?.toString() ?? '',
          numberOfSeasons: show['number_of_seasons'] as int?,
          numberOfEpisodes: show['number_of_episodes'] as int?,
        );
      }).toList();
    } else {
      throw Exception('Failed to load TV shows');
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

  void _openPlayer(TvShow tvShow) {
    // Convert TvShow to Map for TvShowPlayerPage
    final movieMap = <String, dynamic>{
      'id': tvShow.id,
      'name': tvShow.title,
      'vote_average': tvShow.rating,
      'first_air_date': tvShow.firstAirDate,
      'overview': tvShow.overview,
      'poster_path': tvShow.posterPath,
      'backdrop_path': tvShow.backdropPath,
      'number_of_seasons': tvShow.numberOfSeasons ?? 1,
      'number_of_episodes': tvShow.numberOfEpisodes ?? 1,
    };

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            TvShowPlayerPage(movie: movieMap, season: 1, episode: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TvShow>>(
      future: _tvShowsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(height: 250, child: LoadingCard());
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
                    snapshot.hasError ? 'Something went wrong' : 'No TV shows',
                    style: TextStyle(color: Colors.grey[500], fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () =>
                        setState(() => _tvShowsFuture = _fetchTvShows()),
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

        final tvShows = snapshot.data!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "TV Shows",
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
                itemCount: tvShows.length,
                separatorBuilder: (_, __) => const SizedBox(width: 14),
                itemBuilder: (context, index) {
                  return _TvShowCard(
                    tvShow: tvShows[index],
                    onTap: () => _openPlayer(tvShows[index]),
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

class _TvShowCard extends StatelessWidget {
  final TvShow tvShow;
  final VoidCallback onTap;

  const _TvShowCard({required this.tvShow, required this.onTap});

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
                  tvShow.imageUrl,
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
                          tvShow.title,
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
                        tvShow.rating.toString(),
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
                    tvShow.date,
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
