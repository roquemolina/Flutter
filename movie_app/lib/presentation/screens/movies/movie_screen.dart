import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/presentation/provider/providers.dart';

class MovieScreen extends ConsumerStatefulWidget {
  const MovieScreen({super.key, required this.movieId});

  static const name = 'movie-screen';
  final String movieId;

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    super.initState();
    //                 bc we're inside state we use vvvvv widget.movieid
    ref.read(movieInfoProvider.notifier).loadMovie(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    final movies = ref.watch(movieInfoProvider);
    final Movie? movie = movies[widget.movieId];
    if (movie == null) return const Scaffold(body: Center(child: CircularProgressIndicator(),));
   
    return Scaffold(
      appBar: AppBar(
        title: Text('MovieID : ${movie.title}'),
      ),
    );
  }
}
