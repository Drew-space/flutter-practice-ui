import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class MovieBookmarksScreen extends StatelessWidget {
  const MovieBookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hasBookmarks = true;

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // ── Header ──
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.05),
                          shape: BoxShape.circle,
                        ),
                        child: HugeIcon(
                          icon: HugeIcons.strokeRoundedArrowLeft01,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        'My Wishlist',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 40), // balance the back button
                  ],
                ),
              ),
            ),

            if (hasBookmarks) ...[
              // ── Wishlist List ──
              SliverList(
                delegate: SliverChildListDelegate([
                  _WishlistItem(
                    title: 'Vikram',
                    year: '2022',
                    genre: 'Action',
                    duration: '174 mins',
                    rating: '4.8',
                    imageUrl:
                        'https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=400',
                  ),
                  _WishlistItem(
                    title: 'Hobbs & Shaw',
                    year: '2019',
                    genre: 'Action',
                    duration: '186 mins',
                    rating: '4.7',
                    imageUrl:
                        'https://images.unsplash.com/photo-1626814026160-2237a95fc5a0?w=400',
                  ),
                  _WishlistItem(
                    title: 'Kalki 2898 AD',
                    year: '2024',
                    genre: 'Sci-fi/Action',
                    duration: '186 mins',
                    rating: '4.7',
                    imageUrl:
                        'https://images.unsplash.com/photo-1446776811953-b23d57bd21aa?w=400',
                  ),
                  _WishlistItem(
                    title: 'Winnie-the-Pooh',
                    year: '2023',
                    genre: 'Horror/Crime',
                    duration: '186 mins',
                    rating: '4.7',
                    imageUrl:
                        'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?w=400',
                  ),
                  const SizedBox(height: 24),
                ]),
              ),
            ] else ...[
              SliverFillRemaining(hasScrollBody: false, child: _EmptyState()),
            ],
          ],
        ),
      ),
    );
  }
}

// ─── Wishlist Item ─────────────────────────────────────────────

class _WishlistItem extends StatelessWidget {
  final String title;
  final String year;
  final String genre;
  final String duration;
  final String rating;
  final String imageUrl;

  const _WishlistItem({
    required this.title,
    required this.year,
    required this.genre,
    required this.duration,
    required this.rating,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Poster thumbnail
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 80,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 14),

          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 2),
                // Title
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                // Year + Genre (red)
                Text(
                  '$year — $genre',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                // Duration & Rating row
                Row(
                  children: [
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedTime02,
                      size: 13,
                      color: Colors.grey[500]!,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      duration,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 12),
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedStar,
                      size: 13,
                      color: Colors.amber,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      rating,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Heart icon
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Icon(
              Icons.favorite,
              size: 22,
              color: const Color(0xFF7C3AED),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Empty State ───────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.03),
                shape: BoxShape.circle,
              ),
              child: HugeIcon(
                icon: HugeIcons.strokeRoundedFavourite,
                size: 20,
                color: Colors.grey[700]!,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'No Wishlist Yet',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Save movies you want to watch later. Tap the heart icon on any movie to add it here.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[500],
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF7C3AED),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Discover Movies',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
