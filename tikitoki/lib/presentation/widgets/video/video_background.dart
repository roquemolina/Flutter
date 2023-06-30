import 'package:flutter/material.dart';

class VideoBackground extends StatelessWidget {
  const VideoBackground(
      {super.key,
      this.colors = const [
        Colors.transparent,
        Colors.black87,
      ]});
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: DecoratedBox(
            decoration: BoxDecoration(
      gradient: LinearGradient(
          colors: colors,
          stops: const [0.8, 1.0],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter),
    )));
  }
}
