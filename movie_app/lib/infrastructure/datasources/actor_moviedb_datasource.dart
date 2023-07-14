//moviedb to work and interract with tmdb.org
import 'package:dio/dio.dart';
import 'package:movie_app/config/constants/environment.dart';
import 'package:movie_app/domain/datasources/actors_datasource.dart';
import 'package:movie_app/domain/entities/actor.dart';
import 'package:movie_app/infrastructure/mappers/actor_mapper.dart';
import 'package:movie_app/infrastructure/models/moviedb/credits_response.dart';

class ActorMovieDbDatasource extends ActorsDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.movieDbKey,
    },
  ));

  List<Actor> _jsonToActors(Map<String, dynamic> json) {
    final creditsDBResponse = CreditsResponse.fromJson(json);
    final List<Actor> actors = creditsDBResponse.cast
        .map((actordb) => ActorMapper.castDBToEntity(actordb))
        .toList();
    return actors;
  }

  @override
  Future<List<Actor>> getActorByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');
    return _jsonToActors(response.data);
  }
}
