import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class TvShow {
  final String title;
  final double rating;
  final String date;
  final String imageUrl;

  const TvShow({
    required this.title,
    required this.rating,
    required this.date,
    required this.imageUrl,
  });
}

final List<TvShow> _tvShows = [
  const TvShow(
    title: "Stranger Things",
    rating: 8.7,
    date: "Jul 15 2026",
    imageUrl: "https://image.tmdb.org/t/p/w500/49WJfeN0moxb9IPfGn8AIqMGskD.jpg",
  ),
  const TvShow(
    title: "The Witcher",
    rating: 8.2,
    date: "Aug 22 2026",
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrpQa4kPsu6vyXAGfOOHSuscIGwdQuxyOs0Lp-EndlqkhFdcxNPg0kt-lws9e49GAqx2wxRg&s=10",
  ),
  const TvShow(
    title: "House of the Dragon",
    rating: 8.4,
    date: "Sep 10 2026",
    imageUrl: "https://image.tmdb.org/t/p/w500/1X4h40fcB4WWUmIBK0auT4zRBAV.jpg",
  ),
  const TvShow(
    title: "The Last of Us",
    rating: 8.8,
    date: "Oct 05 2026",
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSQX_39GAE9caPnge5G42RUfLm5l5nmHdH195y4aeg0i2eFOrS8j2iA71NBpKu2Vt50lNI&s=10",
  ),
  const TvShow(
    title: "Breaking Bad",
    rating: 9.5,
    date: "Nov 18 2026",
    imageUrl:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOcWkpWG_NRrU2M8-WB8EbEcJk7smhdrY1eO0ttKXm0bo2ooOEWxk3zBSbsFrSgSJh2OEKOQ&s=10",
  ),
  const TvShow(
    title: "Game of Thrones",
    rating: 9.2,
    date: "Dec 01 2026",
    imageUrl: "https://image.tmdb.org/t/p/w500/1XS1oqL89opfnbLl8WnZY1O1uJx.jpg",
  ),
];

class MovieTvShows extends StatelessWidget {
  const MovieTvShows({super.key});

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
                "Tv Shows",
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
        // Horizontal scroll
        SizedBox(
          height: 250,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: _tvShows.length,
            separatorBuilder: (_, __) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              return _TvShowCard(tvShow: _tvShows[index]);
            },
          ),
        ),
      ],
    );
  }
}

class _TvShowCard extends StatelessWidget {
  final TvShow tvShow;

  const _TvShowCard({required this.tvShow});

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
                tvShow.imageUrl,
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
    );
  }
}
