import 'package:flutter/material.dart';
import 'package:practice_ui/apps/movieapp/utils/movie_notificationIcon.dart';

class MovieUserprofileRow extends StatelessWidget {
  const MovieUserprofileRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // <-- SafeArea removed
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 5,
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                "https://img.magnific.com/free-photo/confident-waitress-looking-camera_23-2147830510.jpg",
              ),
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi Alex.R",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                Text(
                  "Enjoy your movie",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white60,
                  ),
                ),
              ],
            ),
          ],
        ),
        const MovieNotificationIcon(),
      ],
    );
  }
}
