import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:practice_ui/apps/movieapp/widgets/movie_notificationicon.dart';

class MovieUserprofileRow extends StatelessWidget {
  final VoidCallback? onSearchTap;

  const MovieUserprofileRow({super.key, this.onSearchTap});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 5,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: user?.photoURL != null
                    ? NetworkImage(user!.photoURL!)
                    : const NetworkImage(
                        "https://img.magnific.com/free-photo/confident-waitress-looking-camera_23-2147830510.jpg",
                      ),
                onBackgroundImageError: (_, __) =>
                    const Icon(Icons.person, color: Colors.white54),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi ${user?.displayName?.split(' ').first ?? 'Guest'}",
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Enjoy your movie",
                    style: TextStyle(fontSize: 16, color: Colors.white60),
                  ),
                ],
              ),
            ],
          ),
          MovieNotificationIcon(onSearchTap: onSearchTap),
        ],
      ),
    );
  }
}
