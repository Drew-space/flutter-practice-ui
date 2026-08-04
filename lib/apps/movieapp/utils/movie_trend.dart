import 'package:flutter/material.dart';

class TrendingMovie {
  final String title;
  final double rating;
  final String date;
  final String imageUrl;

  const TrendingMovie({
    required this.title,
    required this.rating,
    required this.date,
    required this.imageUrl,
  });
}

final List<TrendingMovie> _trendingMovies = [
  const TrendingMovie(
    title: "Avatar Aang: The Last Airbender",
    rating: 8.9,
    date: "Jan 09 2026",
    imageUrl:
        "https://miscrave.com/wp-content/uploads/2026/04/Legend-of-Aang-Avatar-Movie-700x1015.jpg",
  ),
  const TrendingMovie(
    title: "Strantger 5",
    rating: 7.9,
    date: "Feb 15 2026",
    imageUrl: "https://image.tmdb.org/t/p/w500/49WJfeN0moxb9IPfGn8AIqMGskD.jpg",
  ),
  const TrendingMovie(
    title: "The Batman",
    rating: 9.2,
    date: "Mar 04 2026",
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIMCpS3OjmxGAhuR99vetHATrUSMK2Cih6TB10Dnk9op5yB-y4DEVQsw9h3814Z8MirrCe&s=10",
  ),
  const TrendingMovie(
    title: "Dune: Part Two",
    rating: 8.7,
    date: "Apr 12 2026",
    imageUrl: "https://image.tmdb.org/t/p/w500/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg",
  ),
  const TrendingMovie(
    title: "Oppenheimer",
    rating: 9.0,
    date: "May 20 2026",
    imageUrl: "https://image.tmdb.org/t/p/w500/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg",
  ),
  const TrendingMovie(
    title: "Deadpool 3",
    rating: 8.5,
    date: "Jun 18 2026",
    imageUrl: "https://image.tmdb.org/t/p/w500/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg",
  ),
];

class MovieTrend extends StatelessWidget {
  const MovieTrend({super.key});

  @override
  Widget build(BuildContext context) {
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
                "Trending now",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  "See All",
                  style: TextStyle(color: Colors.white60, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Horizontal scroll
        SizedBox(
          height: 250,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: _trendingMovies.length,
            separatorBuilder: (_, __) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              return _TrendCard(movie: _trendingMovies[index]);
            },
          ),
        ),
      ],
    );
  }
}

class _TrendCard extends StatelessWidget {
  final TrendingMovie movie;

  const _TrendCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E), // <-- gray card background
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
                movie.imageUrl,
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
                        movie.title,
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
                    const Icon(Icons.star, color: Colors.amber, size: 14),
                    const SizedBox(width: 2),
                    Text(
                      movie.rating.toString(),
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
                  movie.date,
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
