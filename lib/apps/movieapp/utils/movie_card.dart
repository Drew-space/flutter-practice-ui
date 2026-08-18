import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice_ui/apps/movieapp/loading/shimmer_movie_card.dart';
import 'package:practice_ui/apps/movieapp/movielib/movie_api_link/all_api_link.dart';
import 'package:practice_ui/apps/movieapp/utils/movie_detail_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MovieCardScroller extends StatefulWidget {
  const MovieCardScroller({super.key});

  @override
  State<MovieCardScroller> createState() => _MovieCardScrollerState();
}

class _MovieCardScrollerState extends State<MovieCardScroller> {
  late final Future<List<Map<String, dynamic>>> _moviesFuture;

  final PageController _pageController = PageController(viewportFraction: 0.84);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _moviesFuture = _fetchNowPlaying();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<List<Map<String, dynamic>>> _fetchNowPlaying() async {
    final response = await http.get(Uri.parse(nowPlayingMoviesUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final results = data['results'] as List<dynamic>;

      return results
          .map(
            (movie) => {
              'title': movie['title'] ?? 'Unknown',
              'subtitle': movie['overview'] ?? '',
              'imageUrl': movie['poster_path'] != null
                  ? 'https://image.tmdb.org/t/p/w500${movie['poster_path']}'
                  : '',
            },
          )
          .toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _moviesFuture,
      builder: (context, snapshot) {
        // Replace this block in your FutureBuilder:
        // if (snapshot.connectionState == ConnectionState.waiting) {
        //   return SizedBox(
        //     height: 280,
        //     child: Column(
        //       children: [
        //         const Padding(
        //           padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Text(
        //                 "Now Playing🔥",
        //                 style: TextStyle(
        //                   color: Colors.white,
        //                   fontSize: 20,
        //                   fontWeight: FontWeight.bold,
        //                   letterSpacing: 0.3,
        //                 ),
        //               ),
        //               SizedBox(
        //                 width: 50,
        //                 height: 14,
        //                 child: DecoratedBox(
        //                   decoration: BoxDecoration(
        //                     color: Color(0xFF3D3D3D),
        //                     borderRadius: BorderRadius.all(Radius.circular(4)),
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //         SizedBox(
        //           height: 240,
        //           child: PageView.builder(
        //             padEnds: false,
        //             controller: PageController(viewportFraction: 0.84),
        //             itemCount: 3, // Show 3 shimmer cards
        //             itemBuilder: (_, __) => const ShimmerMovieCard(),
        //           ),
        //         ),
        //         const SizedBox(height: 14),
        //       ],
        //     ),
        //   );
        // }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Now Playing🔥",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.3,
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      height: 14,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xFF3D3D3D),
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 240,
                child: PageView.builder(
                  padEnds: false,
                  controller: _pageController, // reuse the real controller
                  itemCount: 3,
                  itemBuilder: (_, __) => const ShimmerMovieCard(),
                ),
              ),
              const SizedBox(height: 14),
            ],
          );
        }

        if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
          return SizedBox(
            height: 280,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wifi_off, color: Colors.grey[600], size: 32),
                  const SizedBox(height: 8),
                  Text(
                    snapshot.hasError
                        ? 'Something went wrong'
                        : 'No movies found',
                    style: TextStyle(color: Colors.grey[500], fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () =>
                        setState(() => _moviesFuture = _fetchNowPlaying()),
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
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Now Playing🔥",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.3,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "See All",
                      style: TextStyle(
                        color: Color(0xFF7a65c0),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 240,
              child: PageView.builder(
                padEnds: false,
                controller: _pageController,
                itemCount: movies.length,
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MovieDetailPage(movie: movies[index]),
                        ),
                      ),
                      child: _MovieCard(data: movies[index]),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 14),
            // SmoothPageIndicator(
            //   controller: _pageController,
            //   count: movies.length,
            //   onDotClicked: (index) {
            //     _pageController.animateToPage(
            //       index,
            //       duration: const Duration(milliseconds: 350),
            //       curve: Curves.easeInOut,
            //     );
            //   },
            //   effect: ExpandingDotsEffect(
            //     activeDotColor: const Color(0xFF7a65c0),
            //     dotColor: const Color(0xFFFFFFFF),
            //     dotHeight: 8,
            //     dotWidth: 8,
            //     expansionFactor: 3,
            //     spacing: 6,
            //   ),
            // ),
          ],
        );
      },
    );
  }
}

class _MovieCard extends StatelessWidget {
  final Map<String, dynamic> data;

  const _MovieCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1C),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              data['imageUrl'],
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: const Color(0xFF2A2A2A),
                child: const Center(
                  child: Icon(Icons.broken_image, color: Colors.white54),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.9)],
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.only(
                  left: 6,
                  bottom: 6,
                  top: 6,
                  right: 14,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.35),
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: Colors.white.withOpacity(0.25)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Play Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 18,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    data['title'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.3,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    data['subtitle'].toString().isNotEmpty
                        ? 'NOW PLAYING'
                        : 'OFFICIAL TRAILER',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
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
