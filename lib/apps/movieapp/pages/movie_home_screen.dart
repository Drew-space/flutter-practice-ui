// import 'package:flutter/material.dart';
// import 'package:practice_ui/apps/movieapp/widgets/movie_card.dart';
// import 'package:practice_ui/apps/movieapp/widgets/movie_grid.dart';
// import 'package:practice_ui/apps/movieapp/widgets/movie_trend.dart';
// import 'package:practice_ui/apps/movieapp/widgets/movie_tv_shows.dart';
// import 'package:practice_ui/apps/movieapp/widgets/movie_userprofile.dart';
// import 'package:practice_ui/apps/movieapp/widgets/romance_movie.dart';
// import 'package:practice_ui/apps/movieapp/widgets/tv_series.dart';

// class MovieHomeScreen extends StatelessWidget {
//   const MovieHomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         bottom: false,
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 2),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 16),
//                 const MovieUserprofileRow(),
//                 const SizedBox(height: 35),
//                 const MovieCardScroller(),
//                 const SizedBox(height: 24),
//                 const MovieTrend(),
//                 const SizedBox(height: 24),
//                 const TvSeries(),
//                 const SizedBox(height: 24),
//                 const RomanceMovies(),
//                 const SizedBox(height: 24),
//                 const MovieTvShows(),
//                 const SizedBox(height: 24),
//                 const MovieGrid(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:practice_ui/apps/movieapp/widgets/movie_card.dart';
import 'package:practice_ui/apps/movieapp/widgets/movie_grid.dart';
import 'package:practice_ui/apps/movieapp/widgets/movie_trend.dart';
import 'package:practice_ui/apps/movieapp/widgets/movie_tv_shows.dart';
import 'package:practice_ui/apps/movieapp/widgets/movie_userprofile.dart';
import 'package:practice_ui/apps/movieapp/widgets/romance_movie.dart';
import 'package:practice_ui/apps/movieapp/widgets/tv_series.dart';

class MovieHomeScreen extends StatelessWidget {
  final VoidCallback? onSearchTap;

  const MovieHomeScreen({super.key, this.onSearchTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                MovieUserprofileRow(onSearchTap: onSearchTap),
                const SizedBox(height: 35),
                const MovieCardScroller(),
                const SizedBox(height: 24),
                const MovieTrend(),
                const SizedBox(height: 24),
                const TvSeries(),
                const SizedBox(height: 24),
                const RomanceMovies(),
                const SizedBox(height: 24),
                const MovieTvShows(),
                const SizedBox(height: 24),
                const MovieGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
