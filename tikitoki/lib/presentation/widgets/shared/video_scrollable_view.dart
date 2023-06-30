import 'package:flutter/material.dart';
import 'package:tikitoki/presentation/widgets/shared/video_buttons.dart';

import '../../../domain/entities/videos_post.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: ((context, index) {
        final VideoPost videoPost = videos[index];

        return Stack(
          children: [
            //VideoPlayer + Gradient

            //Buttons
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPost),
            ),
          ],
        );
      }),
    );
  }
}
