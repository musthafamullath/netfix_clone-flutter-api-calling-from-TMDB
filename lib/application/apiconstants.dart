
class ApiConstants{
  // static const apiKey = '9be54736eab97c2b19df1c0d1b510c72';
  static const apiKey = 'fa61f6de54b1ff90029da5080b0fb398';
  static const imagePath = 'https://image.tmdb.org/t/p/w500';
  static const kBaseUrl = "https://api.themoviedb.org/3";
}
class ApiEndPoints{
    static const popularMovies = "${ApiConstants.kBaseUrl}/movie/popular?api_key=${ApiConstants.apiKey}";
  static const trendingMovies = "${ApiConstants.kBaseUrl}/trending/movie/day?api_key=${ApiConstants.apiKey}";
  static const pastYearMovies = "${ApiConstants.kBaseUrl}/discover/movie?api_key=${ApiConstants.apiKey}";
  static const upComingMovies = "${ApiConstants.kBaseUrl}/movie/upcoming?api_key=${ApiConstants.apiKey}";

  static const topRatedSeries = '${ApiConstants.kBaseUrl}/tv/top_rated?api_key=${ApiConstants.apiKey}';
  static const popularSeries = '${ApiConstants.kBaseUrl}/tv/popular?api_key=${ApiConstants.apiKey}';
  static const allSeries = '${ApiConstants.kBaseUrl}/discover/tv?api_key=${ApiConstants.apiKey}';
  static const airingTodaySeries = '${ApiConstants.kBaseUrl}/tv/airing_today?api_key=${ApiConstants.apiKey}';
}

