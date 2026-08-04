import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class MovieNotificationIcon extends StatelessWidget {
  const MovieNotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.grey.shade200, width: 2),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const HugeIcon(
                icon: HugeIcons.strokeRoundedSearch01,
                size: 24,
                color: Colors.white,
              ),

              const SizedBox(width: 16),

              Stack(
                clipBehavior: Clip.none,
                children: [
                  const HugeIcon(
                    color: Colors.white,
                    icon: HugeIcons.strokeRoundedNotification01,
                    size: 24,
                  ),
                  Positioned(
                    top: -2,
                    right: -2,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Color(0xFF7a65c0),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1.5),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
