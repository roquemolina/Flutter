import 'package:go_router/go_router.dart';
import 'package:movie_app/presentation/screens/screens.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      path: '/home/:page',
      name: HomeScreen.name,
      builder: (context, state) {
        final pageIndex = state.pathParameters['page'] ?? '0';
        return HomeScreen(pageIndex: int.parse(pageIndex));
      },
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
    GoRoute(
      path: '/',
      redirect: (context, state) => '/home/0',
    ),
  ],
);
