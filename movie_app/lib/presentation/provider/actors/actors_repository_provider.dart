import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:movie_app/infrastructure/repositories/actor_repository_impl.dart';

//read only - inmutable
final actorsRepositoryProvider = Provider(
  (ref) {
    return ActorsRepositoryImpl(ActorMovieDbDatasource());
  },
);
