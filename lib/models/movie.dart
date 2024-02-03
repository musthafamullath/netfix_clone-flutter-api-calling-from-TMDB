class Movie {
  String backdropPath;
  String title;
  String originalTitle;
  String overview;
  String posterPath;
  DateTime releaseDate;
  double voteAverage;
  Movie({
    required this.backdropPath,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      backdropPath: json["backdrop_path"] ?? "https://firebasestorage.googleapis.com/v0/b/api-netflix-4acce.appspot.com/o/Error%20image.jpg?alt=media&token=902c101f-c10e-4f4e-8318-aad84c640ff3",
      title: json["title"] as String,
      originalTitle: json["original_title"] as String,
      overview: json["overview"] as String,
      posterPath: json["poster_path"] as String,
      releaseDate: DateTime.tryParse(json['release_date'])! ,
      voteAverage: json["vote_average"] as double,
    );
  }
}

class MovieList {
  List<Movie> movieList;
  MovieList({required this.movieList});

  factory MovieList.fromJson(List<dynamic> json) {
    List<Movie> popular = [];
    popular = json.map((popular) => Movie.fromJson(popular)).toList();
    return MovieList(movieList: popular);
  }
}
