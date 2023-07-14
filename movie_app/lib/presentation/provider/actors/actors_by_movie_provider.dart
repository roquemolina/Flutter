import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/domain/entities/actor.dart';
import 'package:movie_app/presentation/provider/actors/actors_repository_provider.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorsMapNotifier, Map<String, List<Actor>>>((ref) {
  final actorsRepository = ref.watch(actorsRepositoryProvider);
  return ActorsMapNotifier(getActors: actorsRepository.getActorByMovie);
});

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorsMapNotifier extends StateNotifier<Map<String, List<Actor>>> {
  ActorsMapNotifier({
    required this.getActors,
  }) : super({});

  GetActorsCallback getActors;

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;
    final actors = await getActors(movieId);
    state = {...state, movieId: actors};
  }
}
