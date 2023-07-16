import 'package:go_router/go_router.dart';
import 'package:movie_app/presentation/screens/screens.dart';
import 'package:movie_app/presentation/views/views.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    //Shell routes
    ShellRoute(
      builder: (context, state, child) {
        return HomeScreen(
          childView: child,
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (context, state) {
            return const HomeView();
          },
          routes: <RouteBase>[
            GoRoute(
              // vvvvv no slash. inherith from father ^^^^
              path: 'movie/:id',
              name: MovieScreen.name,
              builder: (context, state) {
                final movieId =
                    state.pathParameters['id'] ?? 'No params available';
                return MovieScreen(movieId: movieId);
              },
            ),
          ],
        ),
        GoRoute(
          path: '/favorites',
          builder: (context, state) {
            return const FavoritesView();
          },
        ),
      ],
    ),

    //Child Routes
    //
    /* GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(childView: HomeView(),),
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
    ), */
  ],
);
