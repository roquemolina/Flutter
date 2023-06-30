import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tikitoki/config/helpers/human_formats.dart';

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
        const SizedBox(
          height: 5,
        ),
        _CustomIconButtom(
          value: video.views,
          iconData: Icons.remove_red_eye_outlined,
        ),
        const SizedBox(
          height: 5,
        ),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 5),
          child: const _CustomIconButtom(
            value: 0,
            iconData: Icons.play_circle_outline,
          ),
        ),
        const SizedBox(
          height: 20,
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
  }) : color = iconColor ?? Colors.grey;

  final int value;
  final IconData iconData;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              iconData,
              color: color,
              size: 36,
            )),
        if (value > 0) Text(HumanFormats.humanReadableNumber(value.toDouble())),
      ],
    );
  }
}
