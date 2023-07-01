import '../entities/videos_post.dart';

abstract class VideoPostDatasource {

  Future<List<VideoPost>> getTrendingVideosByPage (int page);
  Future<List<VideoPost>> getFavoritesVideosByUser (int userID);

}