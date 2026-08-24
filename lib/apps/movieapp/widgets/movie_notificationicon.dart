import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class MovieNotificationIcon extends StatelessWidget {
  final VoidCallback? onSearchTap;

  const MovieNotificationIcon({super.key, this.onSearchTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: onSearchTap,
                child: const HugeIcon(
                  icon: HugeIcons.strokeRoundedSearch01,
                  size: 24,
                  color: Colors.white,
                ),
              ),

              const SizedBox(width: 16),
            ],
          ),
        ),
      ],
    );
  }
}
