import '../entities/videos_post.dart';

abstract class VideoPostRepository {

  Future<List<VideoPost>> getTrendingVideosByPage (int page);
  Future<List<VideoPost>> getFavoritesVideosByUser (int userID);

}