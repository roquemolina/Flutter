import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/config/helpers/human_formats.dart';
import 'package:movie_app/domain/entities/movie.dart';

typedef SearchMovieCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  final SearchMovieCallback searchMovies;
  List<Movie> initialMovies;
  StreamController<List<Movie>> debouncedMovies = StreamController.broadcast();
  StreamController<bool> isLoadingStream = StreamController.broadcast();
  //Timeout
  Timer? _debouceTimer;

  SearchMovieDelegate(
      {required this.searchMovies, required this.initialMovies});

  void clearStreams() {
    debouncedMovies.close();
  }

  void _onQueryChanged(String query) {
    //print('query changed');
    isLoadingStream.add(true);

    if (_debouceTimer?.isActive ?? false) _debouceTimer!.cancel();
    _debouceTimer = Timer(const Duration(milliseconds: 800), () async {
      //print('buscando pelis');
/*       if (query.isEmpty) {
        debouncedMovies.add([]);
        return;
      } */
      final movies = await searchMovies(query);
      initialMovies = movies;
      debouncedMovies.add(movies);
      isLoadingStream.add(false);
    });
  }

  Widget buildResultsAndSuggestions() {
    return StreamBuilder(
      initialData: initialMovies,
      stream: debouncedMovies.stream,
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return _MovieItem(
              movie: movie,
              onMovieSelected: (context, movie) {
                clearStreams();
                close(context, movie);
              },
            );
            /* ListTile(
              title: Text(movie.title), 
            );*/
          },
        );
      },
    );
  }

  @override
  String get searchFieldLabel => 'Search Movie';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      StreamBuilder(
        initialData: false,
        stream: isLoadingStream.stream,
        builder: (context, snapshot) {
          if (snapshot.data ?? false) {
            return SpinPerfect(
              duration: const Duration(seconds: 20),
              spins: 10,
              infinite: true,
              child: IconButton(
                onPressed: () => query = '',
                icon: const Icon(Icons.refresh_rounded),
              ),
            );
          }
          return FadeIn(
            animate: query.isNotEmpty,
            duration: const Duration(milliseconds: 200),
            child: IconButton(
              onPressed: () {
                query = '';
              },
              icon: const Icon(Icons.cancel_outlined),
            ),
          );
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        clearStreams();
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildResultsAndSuggestions();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChanged(query);
    return buildResultsAndSuggestions();
  }
}

class _MovieItem extends StatelessWidget {
  const _MovieItem({required this.movie, required this.onMovieSelected});
  final Movie movie;
  final Function onMovieSelected;

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        onMovieSelected(context, movie);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            SizedBox(
              width: size.width * .2,
              child: ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(20),
                child: Image.network(
                  movie.posterPath,
                  height: size.height * .15,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress != null) {
                      return const DecoratedBox(
                        decoration: BoxDecoration(color: Colors.black12),
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      );
                    }
                    return FadeIn(child: child);
                  },
                ),
              ),
            ),
            SizedBox(
              width: size.width * .7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: textStyles.bodyMedium,
                  ),
                  (movie.overview.length > 100)
                      ? Text('${movie.overview.substring(0, 100)}...')
                      : Text(movie.overview),
                  Row(
                    children: [
                      Icon(Icons.star_half_rounded,
                          color: Colors.yellow.shade400),
                      const SizedBox(width: 5),
                      Text(
                          HumanFormats.humanReadableNumber(
                              movie.voteAverage, 1),
                          style: textStyles.bodyMedium
                              ?.copyWith(color: Colors.yellow.shade900)),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
