// import 'package:flutter/material.dart';
// import 'package:practice_ui/apps/movieapp/widgets/movie_notificationicon.dart';

// class MovieUserprofileRow extends StatelessWidget {
//   const MovieUserprofileRow({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           spacing: 5,
//           children: [
//             const CircleAvatar(
//               radius: 25,
//               backgroundImage: NetworkImage(
//                 "https://img.magnific.com/free-photo/confident-waitress-looking-camera_23-2147830510.jpg",
//               ),
//             ),
//             const SizedBox(width: 10),
//             const Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Hi Alex.R",
//                   style: TextStyle(
//                     fontSize: 17,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   "Enjoy your movie",
//                   style: TextStyle(fontSize: 16, color: Colors.white60),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         const MovieNotificationIcon(),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:practice_ui/apps/movieapp/widgets/movie_notificationicon.dart';

class MovieUserprofileRow extends StatelessWidget {
  final VoidCallback? onSearchTap;

  const MovieUserprofileRow({super.key, this.onSearchTap});

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Enjoy your movie",
                  style: TextStyle(fontSize: 16, color: Colors.white60),
                ),
              ],
            ),
          ],
        ),
        MovieNotificationIcon(onSearchTap: onSearchTap),
      ],
    );
  }
}
