import 'dart:ui';
import 'package:flutter/material.dart';

class VideoCommentSheetDemo extends StatefulWidget {
  const VideoCommentSheetDemo({super.key});

  @override
  State<VideoCommentSheetDemo> createState() => _VideoCommentSheetDemoState();
}

class _VideoCommentSheetDemoState extends State<VideoCommentSheetDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _t;

  bool liked = false;
  int likeCount = 103;

  static const Color videoColor = Color(0xFF3B82F6);
  static const Color sheetColor = Color(0xFF17181C);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 480),
    );
    _t = CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get isExpanded => _controller.value > 0;

  void _open() {
    if (_controller.isAnimating) return;
    _controller.forward();
  }

  void _close() {
    if (_controller.isAnimating) return;
    _controller.reverse();
  }

  void _toggleLike() {
    setState(() {
      liked = !liked;
      likeCount += liked ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: AnimatedBuilder(
        animation: _t,
        builder: (context, child) {
          final t = _t.value;

          // Video: full-bleed square -> small docked card near the top,
          // centered with equal left/right margins.
          final videoTop = lerpDouble(0, 16, t)!;
          final videoLeft = lerpDouble(0, 28, t)!;
          final videoRight = lerpDouble(0, 28, t)!;
          final videoHeight = lerpDouble(size.height, size.height * 0.32, t)!;
          final videoRadius = lerpDouble(0, 18, t)!;

          // Sheet: slides up from fully below the screen to resting flush
          // with the bottom, taking up 60% of the screen height.
          final sheetHeight = size.height * 0.60;
          final sheetOffsetY = lerpDouble(sheetHeight * 1.15, 0, t)!;

          // Right-hand action rail and caption fade out as the video docks.
          final railOpacity = (1 - t * 2.5).clamp(0.0, 1.0);

          return Stack(
            children: [
              // Video
              Positioned(
                top: videoTop,
                left: videoLeft,
                right: videoRight,
                height: videoHeight,
                child: GestureDetector(
                  onTap: isExpanded ? _close : null,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(videoRadius),
                    child: Container(
                      color: videoColor,
                      child: Stack(
                        children: [
                          const Center(
                            child: Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.white54,
                              size: 56,
                            ),
                          ),

                          // Caption
                          Positioned(
                            left: 18,
                            right: 90,
                            bottom: 22,
                            child: Opacity(
                              opacity: railOpacity,
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'ix_drew',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Testing this new bottom sheet interaction, feels a lot smoother than a modal.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      height: 1.4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Right-hand action rail
                          Positioned(
                            right: 12,
                            bottom: 90,
                            child: Opacity(
                              opacity: railOpacity,
                              child: IgnorePointer(
                                ignoring: isExpanded,
                                child: Column(
                                  children: [
                                    _RailButton(
                                      icon: liked
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      label: '$likeCount',
                                      color: liked
                                          ? const Color(0xFFF43F5E)
                                          : Colors.white,
                                      onTap: _toggleLike,
                                    ),
                                    const SizedBox(height: 20),
                                    _RailButton(
                                      icon: Icons.mode_comment_outlined,
                                      label: '11',
                                      color: Colors.white,
                                      onTap: _open,
                                    ),
                                    const SizedBox(height: 20),
                                    const _RailButton(
                                      icon: Icons.reply_outlined,
                                      label: '5',
                                      color: Colors.white,
                                    ),
                                    const SizedBox(height: 20),
                                    const _RailButton(
                                      icon: Icons.bookmark_border,
                                      label: '',
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Bottom sheet
              Positioned(
                left: 0,
                right: 0,
                bottom: -sheetOffsetY,
                height: sheetHeight,
                child: _CommentSheet(
                  onClose: _close,
                  liked: liked,
                  likeCount: likeCount,
                  onToggleLike: _toggleLike,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _RailButton extends StatelessWidget {
  const _RailButton({
    required this.icon,
    required this.label,
    required this.color,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          Icon(icon, color: color, size: 26),
          if (label.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _CommentSheet extends StatelessWidget {
  const _CommentSheet({
    required this.onClose,
    required this.liked,
    required this.likeCount,
    required this.onToggleLike,
  });

  final VoidCallback onClose;
  final bool liked;
  final int likeCount;
  final VoidCallback onToggleLike;

  static const List<Map<String, String>> comments = [
    {
      'initials': 'TA',
      'name': 'Tobi A.',
      'time': '2h',
      'text': 'Yes, blogs are underrated for SEO honestly.',
    },
    {
      'initials': 'CN',
      'name': 'Chidi N.',
      'time': '1h',
      'text': 'This sheet transition is so clean, what did you build it in?',
    },
    {
      'initials': 'FO',
      'name': 'Faith O.',
      'time': '38m',
      'text': 'Been putting off starting a blog, this convinced me.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF17181C),
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 10),
              Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFF3A3A3E),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
                  children: [
                    Row(
                      children: [
                        const _Avatar(initials: 'JD', size: 36),
                        const SizedBox(width: 10),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ix_drew',
                              style: TextStyle(
                                color: Color(0xFFF2F2F3),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '@ix_drew',
                              style: TextStyle(
                                color: Color(0xFF8B8B90),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Testing this new bottom sheet interaction, feels a lot smoother than a modal.',
                      style: TextStyle(
                        color: Color(0xFFEDEDEF),
                        fontSize: 15,
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '8:33 AM · 18 Sep 26 · 24 Views',
                      style: TextStyle(
                        color: Color(0xFF8B8B90),
                        fontSize: 12.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Divider(color: Color(0xFF26262B), height: 1),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const _ActionIcon(
                          icon: Icons.mode_comment_outlined,
                          label: '11',
                          color: Color(0xFF8B8B90),
                        ),
                        const SizedBox(width: 22),
                        const _ActionIcon(
                          icon: Icons.repeat,
                          label: '5',
                          color: Color(0xFF8B8B90),
                        ),
                        const SizedBox(width: 22),
                        GestureDetector(
                          onTap: onToggleLike,
                          child: _ActionIcon(
                            icon: liked
                                ? Icons.favorite
                                : Icons.favorite_border,
                            label: '$likeCount',
                            color: liked
                                ? const Color(0xFFF43F5E)
                                : const Color(0xFF8B8B90),
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.bookmark_border,
                          color: Color(0xFF8B8B90),
                          size: 18,
                        ),
                        const SizedBox(width: 18),
                        const Icon(
                          Icons.share_outlined,
                          color: Color(0xFF8B8B90),
                          size: 18,
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      'Comments',
                      style: TextStyle(
                        color: Color(0xFFF2F2F3),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    for (final c in comments) _CommentRow(comment: c),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 6,
            right: 12,
            child: IconButton(
              onPressed: onClose,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xFF8B8B90),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionIcon extends StatelessWidget {
  const _ActionIcon({
    required this.icon,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 6),
        Text(label, style: TextStyle(fontSize: 13, color: color)),
      ],
    );
  }
}

class _CommentRow extends StatelessWidget {
  const _CommentRow({required this.comment});

  final Map<String, String> comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Avatar(initials: comment['initials']!, size: 30),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      comment['name']!,
                      style: const TextStyle(
                        color: Color(0xFFEDEDEF),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      comment['time']!,
                      style: const TextStyle(
                        color: Color(0xFF75757A),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  comment['text']!,
                  style: const TextStyle(
                    color: Color(0xFFC8C8CC),
                    fontSize: 13.5,
                    height: 1.4,
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

class _Avatar extends StatelessWidget {
  const _Avatar({required this.initials, required this.size});

  final String initials;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: Color(0xFF3B82F6),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: TextStyle(
          color: const Color(0xFFE6F1FB),
          fontSize: size * 0.36,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
