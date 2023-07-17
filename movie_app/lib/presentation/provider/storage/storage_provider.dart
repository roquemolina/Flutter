import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/infrastructure/datasources/isar_datasource.dart';
import 'package:movie_app/infrastructure/repositories/local_storage_repository_implementation.dart';

//read only - inmutable
final localStorageRepositoryProvider = Provider(
  (ref) {
    return LocalStorageRepositoryImpl(IsarDatasource());
  },
);
