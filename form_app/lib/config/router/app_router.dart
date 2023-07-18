import 'package:form_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/cubit',
      builder: (context, state) {
        return const CubitCounterScreen();
      },
    ),
    GoRoute(
      path: '/bloc',
      builder: (context, state) {
        return const BlocCounterScreen();
      },
    ),
    GoRoute(
      path: '/new-user',
      builder: (context, state) {
        return const RegisterScreen();
      },
    ),
  ],
);
