import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/presentation/provider/providers.dart';
import 'package:movie_app/presentation/widgets/widgets.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  bool isLastPage = false;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  void loadNextPage() async {
    if (isLoading || isLastPage) return;
    isLoading = true;

    final movies =
        await ref.read(favoriteMoviesProvider.notifier).loadNextPage();
    isLoading = false;
    if (movies.isEmpty) {
      isLastPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMovies = ref.watch(favoriteMoviesProvider);
    //Map ^^^^ to list vvvvv
    final List<Movie> movieList = favoriteMovies.values.toList();
    final colors = Theme.of(context).colorScheme;

    if (favoriteMovies.isEmpty) {
      return Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_outline_sharp, size: 60, color: colors.primary),
          Text(
            'No favorites',
            style: TextStyle(fontSize: 30, color: colors.primary),
          ),
        ],
      ));
    }

    return Scaffold(
      body: MovieMasonry(
        loadNextPage: loadNextPage,
        movies: movieList,
      ),
    );
  }
}
