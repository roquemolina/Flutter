import 'package:flutter/material.dart';
import 'package:tikitoki/infrastructure/models/local_video_model.dart';
import 'package:tikitoki/shared/data/local_video_post.dart';

import '../../domain/entities/videos_post.dart';

class DiscoverProvider extends ChangeNotifier {
//TODO: Repository, DataSource

//flag
  bool initialLoading = true;

  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts.map((element) {
      return LocalVideoModel.fromJson(element).toVideoPostEntity();
    }).toList();

//TODO: fetch videos from another datasource
    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
