import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/apiconstants/apiconstants.dart';
import 'package:netflix_clone/models/movie.dart';
import '../../models/series.dart';

String moviesList = ApiEndPoints.pastYearMovies;

Future<List<Movie>> getAllMoviesList(String value) async {
  final response = await http.get(Uri.parse(moviesList));
  if (response.statusCode == 200) {
    final bodyAsJson = jsonDecode(response.body) as Map<String, dynamic>;
    final data = MovieList.fromJson(bodyAsJson['results']);
    return value == ''
        ? data.movieList
        : data.movieList
            .where((element) =>
                element.title.toLowerCase().contains(value.toLowerCase()))
            .toList();
  } else {
    throw Exception('Server Failure Please Try Again!!!');
  }
}

String allSeries = ApiEndPoints.popularSeries;

Future<List<Series>> getAllSeriesList(String value) async {
  final response = await http.get(Uri.parse(allSeries));
  if (response.statusCode == 200) {
    final bodyAsJson = jsonDecode(response.body) as Map<String, dynamic>;
    final data = SeriesList.fromJson(bodyAsJson['results']);
    return value == ''
        ? data.seriesList
        : data.seriesList
            .where((element) =>
                element.title.toLowerCase().contains(value.toLowerCase()))
            .toList();
  } else {
    throw Exception('Server Failure Please Try Again!!!');
  }
}