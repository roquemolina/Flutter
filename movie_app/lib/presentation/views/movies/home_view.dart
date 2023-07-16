import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/presentation/widgets/widgets.dart';

import '../../provider/providers.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProviders.notifier).loadNextPage();
    ref.read(popularMoviesProviders.notifier).loadNextPage();
    ref.read(topRatedMoviesProviders.notifier).loadNextPage();
    ref.read(upcomingMoviesProviders.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return const FullScreenLoader();
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProviders);
    final popularMovies = ref.watch(popularMoviesProviders);
    final topRatedMovies = ref.watch(topRatedMoviesProviders);
    final upcomingMovies = ref.watch(upcomingMoviesProviders);
    final List<Movie> moviesSlideshow = ref.watch(moviesSlideshowProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Padding(
              padding: EdgeInsets.only(top: 10),
              child: CustomAppBar(),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            ((context, index) {
              return Column(
                children: [
                  MoviesSlideShow(movies: moviesSlideshow),
                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'On cinema',
                    subtitle: 'Cinema',
                    loadNextPage: () {
                      ref
                          .read(nowPlayingMoviesProviders.notifier)
                          .loadNextPage();
                    },
                  ),
                  MovieHorizontalListview(
                    movies: popularMovies,
                    title: 'Popular',
                    subtitle: 'Pop',
                    loadNextPage: () {
                      ref.read(popularMoviesProviders.notifier).loadNextPage();
                    },
                  ),
                  MovieHorizontalListview(
                    movies: topRatedMovies,
                    title: 'Top Rated',
                    subtitle: 'Top',
                    loadNextPage: () {
                      ref.read(topRatedMoviesProviders.notifier).loadNextPage();
                    },
                  ),
                  MovieHorizontalListview(
                    movies: upcomingMovies,
                    title: 'Upcoming',
                    subtitle: 'Coming',
                    loadNextPage: () {
                      ref.read(upcomingMoviesProviders.notifier).loadNextPage();
                    },
                  ),
                ],
              );
            }),
            childCount: 1,
          ),
        ),
      ],
    );
  }
}
