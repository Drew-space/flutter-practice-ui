import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MovieCardData {
  final String title;
  final String subtitle;
  final String imageUrl;

  const MovieCardData({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });
}

const List<MovieCardData> _movieCards = [
  MovieCardData(
    title: "Spider-Man: Brand New Day",
    subtitle: "OFFICIAL TRAILER",
    imageUrl: "https://i.ebayimg.com/images/g/PWwAAeSw9XlqKuMR/s-l1600.webp",
  ),
  MovieCardData(
    title: "The Avengers",
    subtitle: "OFFICIAL TRAILER",
    imageUrl: "https://image.tmdb.org/t/p/w500/RYMX2wcKCBAr24UyPD7xwmjaTn.jpg",
  ),
  MovieCardData(
    title: "Avengers: Age of Ultron",
    subtitle: "OFFICIAL TRAILER",
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIr8ziCY_1O-kYK_feVB_kMTXVR9ktGGpWN_uBKeVJp_kTnlgvM-wySL0&s=10",
  ),
  MovieCardData(
    title: "Avengers: Infinity War",
    subtitle: "OFFICIAL TRAILER",
    imageUrl: "https://image.tmdb.org/t/p/w500/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg",
  ),
];

class MovieCardScroller extends StatefulWidget {
  const MovieCardScroller({super.key});

  @override
  State<MovieCardScroller> createState() => _MovieCardScrollerState();
}

class _MovieCardScrollerState extends State<MovieCardScroller> {
  final PageController _pageController = PageController(viewportFraction: 0.84);
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 16, 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Top Movies",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.3,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // TODO: Navigate to full movie list
                },
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
            itemCount: _movieCards.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final data = _movieCards[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: _MovieCard(data: data),
              );
            },
          ),
        ),
        const SizedBox(height: 14),
        // SmoothPageIndicator(
        //   controller: _pageController,
        //   count: _movieCards.length,
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
  }
}

class _MovieCard extends StatelessWidget {
  final MovieCardData data;

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
            // Movie poster background
            Image.network(
              data.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: const Color(0xFF2A2A2A),
                child: const Center(
                  child: Icon(Icons.broken_image, color: Colors.white54),
                ),
              ),
            ),

            // Bottom gradient for text readability
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

            // Play Now button (centered)
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 6,
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

            // Title & subtitle at bottom
            Positioned(
              bottom: 18,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    data.title,
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
                    data.subtitle,
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
