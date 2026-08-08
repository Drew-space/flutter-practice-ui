import 'package:flutter/material.dart';
import 'package:practice_ui/apps/movieapp/utils/movie_card.dart';
import 'package:practice_ui/apps/movieapp/utils/movie_grid.dart';
import 'package:practice_ui/apps/movieapp/utils/movie_trend.dart';
import 'package:practice_ui/apps/movieapp/utils/movie_tv_shows.dart';
import 'package:practice_ui/apps/movieapp/utils/movie_userprofile.dart';
import 'package:practice_ui/apps/movieapp/utils/popular_movie.dart';
import 'package:practice_ui/apps/movieapp/utils/tv_series.dart';

class MovieHomeScreen extends StatelessWidget {
  const MovieHomeScreen({super.key});

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
                const MovieUserprofileRow(),
                const SizedBox(height: 35),
                const MovieCardScroller(),
                const SizedBox(height: 24),
                const MovieTrend(),
                const SizedBox(height: 24),
                const TvSeries(),
                const PopularMovie(),
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
