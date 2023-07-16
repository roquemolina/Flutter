//moviedb to work and interract with tmdb.org

import 'package:dio/dio.dart';
import 'package:movie_app/config/constants/environment.dart';
import 'package:movie_app/domain/datasources/movies_datasource.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/infrastructure/mappers/movie_mapper.dart';
import 'package:movie_app/infrastructure/models/moviedb/movie_details.dart';
import 'package:movie_app/infrastructure/models/moviedb/moviedb_response.dart';

class MoviesDbDatasource extends MoviesDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.movieDbKey,
      'language': 'en-US',
    },
  ));

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final movieDBResponse = MovieDbResponse.fromJson(json);
    final List<Movie> movies = movieDBResponse.results
        //no-poster filter O_O
        .where((moviedb) =>
            moviedb.posterPath !=
            'https://i0.pickpik.com/photos/286/573/109/error-not-found-404-lego-preview.jpg')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing', queryParameters: {
      'page': page,
    });
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get('/movie/popular', queryParameters: {
      'page': page,
    });
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await dio.get('/movie/top_rated', queryParameters: {
      'page': page,
    });
    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response = await dio.get('/movie/upcoming', queryParameters: {
      'page': page,
    });
    return _jsonToMovies(response.data);
  }

  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/movie/$id');
    if (response.statusCode != 200) {
      throw Exception('Movie with id: $id not found');
    }
    final movieDetails = MovieDetails.fromJson(response.data);
    final Movie movie = MovieMapper.movieDetailsToEntity(movieDetails);

    return movie;
  }

  @override
  Future<List<Movie>> searchMovies(query) async {
    if (query.isEmpty) return [];
    final response = await dio.get('/search/movie', queryParameters: {
      'query': query,
    });
    return _jsonToMovies(response.data);
  }
}

//https://api.themoviedb.org/3/movie/now_playing?api_key=9d6a90c2b95d4a700ee5cb9705c94b0f