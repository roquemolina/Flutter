import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/repositories/local_storage_repository.dart';
import 'package:movie_app/presentation/provider/providers.dart';

final favoriteMoviesProvider =
    StateNotifierProvider<StorageMoviesNotifier, Map<int, Movie>>((ref) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);
  return StorageMoviesNotifier(localStorageRepository: localStorageRepository);
});

class StorageMoviesNotifier extends StateNotifier<Map<int, Movie>> {
  int page = 0;
  final LocalStorageRepository localStorageRepository;

  StorageMoviesNotifier({
    required this.localStorageRepository,
  }) : super({});

  Future<List<Movie>> loadNextPage() async {
    final List<Movie> movies =
        await localStorageRepository.loadMovies(offset: page * 10, limit: 20);
    page++;
    final tempMoviesMap = <int, Movie>{};
    for (final movie in movies) {
      tempMoviesMap[movie.id] = movie;
    }
    state = {...state, ...tempMoviesMap};

    return movies;
  }

  Future<void> toggleFavorite(Movie movie) async {
    await localStorageRepository.toggleFavorite(movie);
    final bool isMovieinFavorites = state[movie.id] != null;
    if(isMovieinFavorites) {
      state.remove(movie.id);
      state = {...state};
    } else {
      state = {...state, movie.id: movie};
    }

  }
}
