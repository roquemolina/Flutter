import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/presentation/provider/providers.dart';

final searchMovieProvider = StateProvider<String>((ref) {
  return '';
});

final searchedMovieProvider =
    StateNotifierProvider<SearchedMovieNotifier, List<Movie>>((ref) {
  final moviesRepository = ref.read(movieRepositoryProvider);
  return SearchedMovieNotifier(
    searchMovies: moviesRepository.searchMovies,
    ref: ref,
  );
});

typedef SearchedMovieCallback = Future<List<Movie>> Function(String query);

class SearchedMovieNotifier extends StateNotifier<List<Movie>> {
  SearchedMovieNotifier({
    required this.ref,
    required this.searchMovies,
  }) : super([]);

  final SearchedMovieCallback searchMovies;
  final Ref ref;

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    final List<Movie> movies = await searchMovies(query);
    ref.read(searchMovieProvider.notifier).update((state) => query);
    state = movies;
    return movies;
  }
}
