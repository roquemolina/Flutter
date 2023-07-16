import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/presentation/delegates/search_movie_delegate.dart';
import 'package:movie_app/presentation/provider/providers.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.movie_filter_outlined, color: colors.primary),
              const SizedBox(width: 5),
              Text('Movie App', style: titleStyle),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    //TODO
                    final searchedMovies = ref.read(searchedMovieProvider);
                    final searchQuery = ref.read(searchMovieProvider);

                    showSearch<Movie?>(
                            query: searchQuery,
                            context: context,
                            delegate: SearchMovieDelegate(
                                initialMovies: searchedMovies,
                                searchMovies: ref
                                    .read(searchedMovieProvider.notifier)
                                    .searchMovies))
                        .then((movie) {
                      if (movie == null) return;

                      context.push('/movie/${movie.id}');
                    });
                  },
                  icon: const Icon(Icons.search)),
            ],
          ),
        ),
      ),
    );
  }
}
