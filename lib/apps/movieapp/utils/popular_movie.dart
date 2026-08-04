import 'package:flutter/material.dart';

class PopularMovie extends StatelessWidget {
  const PopularMovie({super.key});

  final List<Movie> movies = const [
    Movie(
      title: 'The Witcher',
      rating: 6.4,
      genres: ['Action', 'Fantasy'],
      duration: '1h 44m',
      posterUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTP19mcnPntnbjm5jf_W_TOmryj_bvqyjIRPL0X3BqZDoMl4zPjtHHxCz8&s=10",
    ),
    Movie(
      title: 'Tale of the Nine Tailed',
      rating: 8.4,
      genres: ['Horror', 'Fantasy'],
      duration: '1h 10m',
      posterUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSRxulYERG3_2hdB79BEig1RAI2bvW-7Mblm02w5k7eNpxOgaij-H8kFfM&s=10",
    ),

    Movie(
      title: 'Spider-Man: Across the Spider-Verse',
      rating: 8.7,
      genres: ['Animation', 'Action'],
      duration: '2h 20m',
      posterUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTi4PP972ZrE4fITVkxsIozmtTY93TqG8axcru66P6XhkpQBQktBeW3tpQ&s=10",
    ),
    Movie(
      title: 'John Wick: Chapter 4',
      rating: 7.7,
      genres: ['Action', 'Thriller'],
      duration: '2h 49m',
      posterUrl:
          "https://m.media-amazon.com/images/I/81fk-N7tvbL._AC_UF894,1000_QL80_.jpg",
    ),
    Movie(
      title: 'Guardians of the Galaxy Vol. 3',
      rating: 7.9,
      genres: ['Action', 'Comedy'],
      duration: '2h 30m',
      posterUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaEBIqHsETvwHnL4RNPkw0OQVFa6umdrmj3PQAqz0M8g&s=10",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Popular',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white70,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text(
                  'See All',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Movie cards (non-scrollable — parent SingleChildScrollView handles scrolling)
          ...movies.map(
            (movie) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: MovieCard(movie: movie),
            ),
          ),
        ],
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 90,
            height: 130,
            color: const Color(0xFF1A1A1A),
            child: Image.network(
              movie.posterUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const Center(
                child: Icon(Icons.movie, color: Colors.white24, size: 32),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    height: 1.2,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.star, color: Color(0xFFE50914), size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '${movie.rating}/10 ',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'IMDb',
                      style: TextStyle(fontSize: 13, color: Colors.white54),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: movie.genres
                      .map(
                        (genre) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2A2A2A),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            genre,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      color: Colors.white38,
                      size: 14,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      movie.duration,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white54,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Movie {
  final String title;
  final double rating;
  final List<String> genres;
  final String duration;
  final String posterUrl;
  const Movie({
    required this.title,
    required this.rating,
    required this.genres,
    required this.duration,
    required this.posterUrl,
  });
}
