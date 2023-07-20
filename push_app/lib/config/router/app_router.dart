import 'package:go_router/go_router.dart';
import 'package:push_app/presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) {
      return const HomeScreen();
    },
  ),
  GoRoute(
    path: '/push-details/:messageId',
    builder: (context, state) {
      return DetailsScreen(
        pushMessageId: state.pathParameters['messageId'] ?? '',
      );
    },
  ),
]);
