import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/presentation/provider/providers.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final step1 = ref.watch(nowPlayingMoviesProviders).isEmpty;
  final step2 = ref.watch(popularMoviesProviders).isEmpty;
  final step3 = ref.watch(topRatedMoviesProviders).isEmpty;
  final step4 = ref.watch(upcomingMoviesProviders).isEmpty;

  if (step1 || step2 || step3 || step4) return true;

  return false;
});
