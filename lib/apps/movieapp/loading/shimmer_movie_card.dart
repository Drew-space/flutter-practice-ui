import 'package:flutter/material.dart';

class ShimmerMovieCard extends StatefulWidget {
  const ShimmerMovieCard({super.key});

  @override
  State<ShimmerMovieCard> createState() => _ShimmerMovieCardState();
}

class _ShimmerMovieCardState extends State<ShimmerMovieCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final t = _controller.value * 2 - 1;
        return Container(
          width: double.infinity,
          // Fill whatever height the parent gives (GridView cell, etc.)
          // instead of forcing 240 and fighting the parent's constraints.
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment(t - 1, 0),
              end: Alignment(t + 1, 0),
              colors: const [
                Color(0xFF1C1C1C),
                Color(0xFF3D3D3D),
                Color(0xFF1C1C1C),
              ],
              stops: const [0.35, 0.5, 0.65],
            ),
          ),
          child: child,
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min, // don't demand more space than needed
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 160,
            height: 20,
            margin: const EdgeInsets.only(left: 16, bottom: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF3D3D3D).withOpacity(0.5),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Container(
            width: 100,
            height: 12,
            margin: const EdgeInsets.only(left: 16, bottom: 18),
            decoration: BoxDecoration(
              color: const Color(0xFF3D3D3D).withOpacity(0.5),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}
