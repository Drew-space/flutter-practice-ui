import '../movie_api/apikey.dart';

String trendingWeekUrl =
    "https://api.themoviedb.org/3/trending/movie/week?api_key=$apikey";

String trendingDayUrl =
    "https://api.themoviedb.org/3/trending/movie/day?api_key=$apikey";

String popularTvSeriesUrl =
    "https://api.themoviedb.org/3/tv/popular?api_key=$apikey&language=en-US&page=1";

String onairTvSeriesUrl =
    "https://api.themoviedb.org/3/tv/on_the_air?api_key=$apikey&language=en-US&page=1";

String popularMoviesUrl =
    "https://api.themoviedb.org/3/movie/popular?api_key=$apikey&language=en-US&page=1";

String nowPlayingMoviesUrl =
    "https://api.themoviedb.org/3/movie/now_playing?api_key=$apikey&language=en-US&page=1";

String topratedMoviesUrl =
    "https://api.themoviedb.org/3/movie/top_rated?api_key=$apikey&language=en-US&page=1";

String upcomingMoviesUrl =
    "https://api.themoviedb.org/3/movie/upcoming?api_key=$apikey&language=en-US&page=1";

String romanceMoviesUrl =
    "https://api.themoviedb.org/3/discover/movie?api_key=$apikey&language=en-US&sort_by=popularity.desc&with_genres=10749&page=1";

String allMoviesUrl =
    "https://api.themoviedb.org/3/discover/movie?api_key=$apikey&language=en-US&sort_by=popularity.desc&page=";
