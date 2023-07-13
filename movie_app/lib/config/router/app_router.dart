import 'package:go_router/go_router.dart';
import 'package:movie_app/presentation/screens/screens.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          // vvvvv no slash. inherith from father ^^^^
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (context, state) {
            final movieId = state.pathParameters['id'] ?? 'No params available';
            return MovieScreen(movieId: movieId);
          },
        ),
      ],
    ),
  ],
);
