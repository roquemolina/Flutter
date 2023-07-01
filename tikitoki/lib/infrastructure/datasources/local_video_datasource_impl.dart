import 'package:tikitoki/domain/datasources/video_posts_datasource.dart';
import 'package:tikitoki/domain/entities/videos_post.dart';
import 'package:tikitoki/infrastructure/models/local_video_model.dart';
import 'package:tikitoki/shared/data/local_video_post.dart';

class LocalVideosDatasource implements VideoPostDatasource {
  @override
  Future<List<VideoPost>> getFavoritesVideosByUser(int userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts.map((element) {
      return LocalVideoModel.fromJson(element).toVideoPostEntity();
    }).toList();

    return newVideos;
  }
}
