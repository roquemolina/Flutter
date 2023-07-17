import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/domain/entities/movie.dart';

class MoviePosterLink extends StatelessWidget {
  const MoviePosterLink({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/home/0/movie/${movie.id}'),
      child: ClipRRect(
        borderRadius: BorderRadiusDirectional.circular(20),
        child: FadeIn(
          child: Image.network(movie.posterPath),
        ),
      ),
    );
  }
}
