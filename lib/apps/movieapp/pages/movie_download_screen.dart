import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class MovieDownloadScreen extends StatelessWidget {
  const MovieDownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hasDownloads = true;

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // ── Header ──
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Downloads',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                  ],
                ),
              ),
            ),

            if (hasDownloads) ...[
              // ── Count ──
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: Text(
                    '3 movies',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              // ── Downloaded Movies ──
              SliverList(
                delegate: SliverChildListDelegate([
                  _DownloadedMovieItem(
                    title: 'Spider-Man: Brand New Day',
                    quality: '4K',
                    size: '2.1 GB',
                    duration: '2h 15m',
                    imageUrl:
                        'https://images.unsplash.com/photo-1635805737707-575885ab0820?w=400',
                  ),
                  _DownloadedMovieItem(
                    title: 'Dune: Part Three',
                    quality: 'HD',
                    size: '1.4 GB',
                    duration: '2h 45m',
                    imageUrl:
                        'https://images.unsplash.com/photo-1446776811953-b23d57bd21aa?w=400',
                  ),
                  _DownloadingMovieItem(
                    title: 'The Batman: Gotham Knight',
                    quality: '4K',
                    size: '1.8 GB',
                    downloadedSize: '1.2 GB',
                    progress: 0.65,
                    imageUrl:
                        'https://images.unsplash.com/photo-1509347528160-9a9e33742cdb?w=400',
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
                icon: HugeIcons.strokeRoundedDownloadSquare01,
                size: 48,
                color: Colors.grey[700]!,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'No Downloads Yet',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Movies you download will appear here. Start browsing to find your next watch!',
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
                  'Browse Movies',
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

// ─── Downloaded Movie Item (Compact) ───────────────────────────

class _DownloadedMovieItem extends StatelessWidget {
  final String title;
  final String quality;
  final String size;
  final String duration;
  final String imageUrl;

  const _DownloadedMovieItem({
    required this.title,
    required this.quality,
    required this.size,
    required this.duration,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Smaller Poster
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              children: [
                Image.network(
                  imageUrl,
                  width: 70,
                  height: 90,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 6,
                  left: 6,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Text(
                      quality,
                      style: const TextStyle(
                        fontSize: 9,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),

          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 2),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  '$size  •  $duration',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // Delete icon at top right
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: GestureDetector(
              onTap: () {},
              child: HugeIcon(
                icon: HugeIcons.strokeRoundedDelete01,
                size: 20,
                color: Colors.grey[500]!,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Downloading Movie Item (Compact) ────────────────────────

class _DownloadingMovieItem extends StatelessWidget {
  final String title;
  final String quality;
  final String size;
  final String downloadedSize;
  final double progress;
  final String imageUrl;

  const _DownloadingMovieItem({
    required this.title,
    required this.quality,
    required this.size,
    required this.downloadedSize,
    required this.progress,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Smaller Poster with pause overlay
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              children: [
                Image.network(
                  imageUrl,
                  width: 70,
                  height: 90,
                  fit: BoxFit.cover,
                ),

                Positioned(
                  top: 6,
                  left: 6,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Text(
                      quality,
                      style: const TextStyle(
                        fontSize: 9,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),

          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 2),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$downloadedSize / $size',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${(progress * 100).toInt()}%',
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.white.withOpacity(0.05),
                    valueColor: const AlwaysStoppedAnimation(Color(0xFF7C3AED)),
                    minHeight: 3,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '2.4 MB/s  •  Downloading',
                  style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                ),
              ],
            ),
          ),

          // Delete icon at top right
          // Padding(
          //   padding: const EdgeInsets.only(top: 2),
          //   child: GestureDetector(
          //     onTap: () {},
          //     child: HugeIcon(
          //       icon: HugeIcons.strokeRoundedDelete01,
          //       size: 20,
          //       color: Colors.grey[500]!,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
