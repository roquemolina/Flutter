import 'package:flutter/material.dart';
import 'package:tikitoki/infrastructure/repositories/video_posts_repository_impl.dart';

import '../../domain/entities/videos_post.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostsRepositoryImpl videosRepository;

//flag
  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videosRepository});

  Future<void> loadNextPage() async {
/*     await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts.map((element) {
      return LocalVideoModel.fromJson(element).toVideoPostEntity();
    }).toList(); */
    final newVideos = await videosRepository.getTrendingVideosByPage(1);



    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
