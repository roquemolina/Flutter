import 'package:movie_app/domain/entities/actor.dart';
import 'package:movie_app/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castDBToEntity(Cast castdb) => Actor(
        id: castdb.id,
        name: castdb.name,
        profilePath: castdb.profilePath != null
            ? 'https://image.tmdb.org/t/p/w500${castdb.profilePath}'
            : 'https://i0.pickpik.com/photos/286/573/109/error-not-found-404-lego-preview.jpg',
        character: castdb.character,
      );
}
