import 'dart:convert';

import 'package:netflix_clone/apiconstants/apiconstants.dart';

import 'package:netflix_clone/models/movie.dart';
import 'package:http/http.dart' as http;

class Api{
  static const _trandingUrl = 'https://api.themoviedb.org/3/trending/movie/day?api_key=${ApiConstants.apiKey}';
  static const _topRatedUrl = 'https://api.themoviedb.org/3/movie/top_rated?api_key=${ApiConstants.apiKey}';
  static const _upComingUrl = 'https://api.themoviedb.org/3/movie/upcoming?api_key=${ApiConstants.apiKey}';
  static const _nowPlayingUrl = 'https://api.themoviedb.org/3/movie/now_playing?api_key=${ApiConstants.apiKey}';
  static const _popularUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=${ApiConstants.apiKey}';


  Future<List<Movie>>getTrendingMovies()async{
    final response = await http.get(Uri.parse(_trandingUrl));
    if(response.statusCode == 200){
      final decodedData = json.decode(response.body)["results"] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }else {
      throw Exception("Something happened");
    }
  }
  Future<List<Movie>>getTopRatedMovies()async{
    final response = await http.get(Uri.parse(_topRatedUrl));
    if(response.statusCode == 200){
      final decodedData = json.decode(response.body)["results"] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }else {
      throw Exception("Something happened");
    }
  }
  Future<List<Movie>>getUpComingMovies()async{
    final response = await http.get(Uri.parse(_upComingUrl));
    if(response.statusCode == 200){
      final decodedData = json.decode(response.body)["results"] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }else {
      throw Exception("Something happened");
    }
  }
  Future<List<Movie>>getNowPlayingMovies()async{
    final response = await http.get(Uri.parse(_nowPlayingUrl));
    if(response.statusCode == 200){
      final decodedData = json.decode(response.body)["results"] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }else {
      throw Exception("Something happened");
    }
  }
  Future<List<Movie>>getPopularMovies()async{
    final response = await http.get(Uri.parse(_popularUrl));
    if(response.statusCode == 200){
      final decodedData = json.decode(response.body)["results"] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }else {
      throw Exception("Something happened");
    }
  }
  
}