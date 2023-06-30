import 'package:flutter/material.dart';

import '../../../domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;

  const HerMessageBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            decoration: BoxDecoration(
              color: colors.secondary,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(message.text,
                  style: const TextStyle(color: Colors.white)),
            )),
        const SizedBox(
          height: 10,
        ),
        _ImageBubble(message.imageUrl!),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String image;

  const _ImageBubble(this.image);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //print(size);
//o a la derecha hago un breacpoint
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(
        image,
        width: size.width * 0.7,
        height: 200,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
              width: size.width * 0.7,
              height: 200,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: const Text('Loading...'));
        },
      ),
    );
  }
}
