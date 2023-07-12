import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/infrastructure/datasources/moviedb_datasource.dart';
import 'package:movie_app/infrastructure/repositories/movie_repository_implementation.dart';

//read only - inmutable
final movieRepositoryProvider = Provider(
  (ref) {
    return MoviesRepositoryImpl(MoviesDbDatasource());
  },
);
