import 'package:flutter/material.dart';

class Movie {
  final String title;
  final String imageUrl;
  final String duration;
  final String releaseDate;
  final double rating;

  const Movie({
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.releaseDate,
    required this.rating,
  });
}

final List<Movie> _movies = [
  Movie(
    title: "Avengers",
    imageUrl: "https://image.tmdb.org/t/p/w500/RYMX2wcKCBAr24UyPD7xwmjaTn.jpg",
    duration: "3h 45min",
    releaseDate: "2019",
    rating: 4.8,
  ),
  Movie(
    title: "Fast and Furious X",
    imageUrl: "https://image.tmdb.org/t/p/w500/1E5baAaEse26fej7uHcjOgEE2t2.jpg",
    duration: "2h 23min",
    releaseDate: "2023",
    rating: 4.2,
  ),
  Movie(
    title: "Annabelle",
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSpJrgkmNxh8yPwrAPZvdYSKiMZBTRewF-pRs-nsM1s4opsnZBfEbbjlaD&s=10",
    duration: "1h 30min",
    releaseDate: "2019",
    rating: 3.9,
  ),
  Movie(
    title: "Dragon Ball Super",
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTErCc8cxVJD6iS2hHTpKeO-hhyX9m-J40kQln8VTzNPw&s=10",
    duration: "2h 23min",
    releaseDate: "2022",
    rating: 4.5,
  ),
  Movie(
    title: "Spider-Man: No Way Home",
    imageUrl: "https://i.redd.it/wsx5cmsej9j91.jpg",
    duration: "2h 28min",
    releaseDate: "2021",
    rating: 4.7,
  ),
  Movie(
    title: "The Batman",
    imageUrl: "https://cdn.europosters.eu/image/1300/123341.jpg",
    duration: "2h 56min",
    releaseDate: "2022",
    rating: 4.6,
  ),
  Movie(
    title: "Joker",
    imageUrl: "https://image.tmdb.org/t/p/w500/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg",
    duration: "2h 2min",
    releaseDate: "2019",
    rating: 4.5,
  ),
  Movie(
    title: "Dune",
    imageUrl: "https://image.tmdb.org/t/p/w500/d5NXSklXo0qyIYkgV94XAgMIckC.jpg",
    duration: "2h 35min",
    releaseDate: "2021",
    rating: 4.4,
  ),
  Movie(
    title: "Oppenheimer",
    imageUrl: "https://image.tmdb.org/t/p/w500/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg",
    duration: "3h 0min",
    releaseDate: "2023",
    rating: 4.9,
  ),
  Movie(
    title: "Inception",
    imageUrl: "https://image.tmdb.org/t/p/w500/9gk7adHYeDvHkCSEqAvQNLV5Uge.jpg",
    duration: "2h 28min",
    releaseDate: "2010",
    rating: 4.8,
  ),
];

class MovieGrid extends StatelessWidget {
  const MovieGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Movies",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // TODO: Navigate to all movies
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
          const SizedBox(height: 16),
          // Grid
          GridView.builder(
            shrinkWrap: true, // <-- KEY: fits content height
            physics:
                const NeverScrollableScrollPhysics(), // <-- KEY: scrolls with parent
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.62,
              crossAxisSpacing: 14,
              mainAxisSpacing: 18,
            ),
            itemCount: _movies.length,
            itemBuilder: (context, index) {
              final movie = _movies[index];
              return _MovieCard(movie: movie);
            },
          ),
        ],
      ),
    );
  }
}

class _MovieCard extends StatelessWidget {
  final Movie movie;

  const _MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Poster
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  movie.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: const Color(0xFF2A2A2A),
                    child: const Center(
                      child: Icon(Icons.broken_image, color: Colors.white54),
                    ),
                  ),
                ),
                // Star rating badge
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          movie.rating.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        // Title
        Text(
          movie.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        // Duration & Release Date
        Row(
          children: [
            Text(
              movie.duration,
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 12,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 3,
              height: 3,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              movie.releaseDate,
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
