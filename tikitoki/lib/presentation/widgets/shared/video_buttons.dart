import 'package:flutter/material.dart';

import '../../../domain/entities/videos_post.dart';

class VideoButtons extends StatelessWidget {

  final VideoPost video;
  const VideoButtons({
    super.key,
    required this.video,
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButtom(
          value: video.likes,
          iconData: Icons.favorite,
          iconColor: Colors.red),
        _CustomIconButtom(
          value: video.views,
          iconData: Icons.remove_red_eye_outlined,
          ),

      ],
    );
  }
}

class _CustomIconButtom extends StatelessWidget {
  const _CustomIconButtom({
    super.key,
    required this.value,
    required this.iconData,
    iconColor,
    }):
    color = iconColor ??Colors.grey;

  final int value;
  final IconData iconData;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
              onPressed: () {},
              icon:  Icon(
                iconData,
                color: color,
                size: 36,
                )),
                Text(value.toString()),
      ],
    );
  }
}