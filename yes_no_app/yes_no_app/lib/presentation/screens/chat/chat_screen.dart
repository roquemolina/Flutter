import 'package:flutter/material.dart';

import '../../widgets/chat/my_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.onPrimary,
        title: const Text('Popis ♥'),
        centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.all(3.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://media.licdn.com/dms/image/C5603AQEp3PO0GG_EHA/profile-displayphoto-shrink_800_800/0/1516465621009?e=2147483647&v=beta&t=w7M7boBL3ym6gB69pL6ub-9LbR9nApwXAsrJ0qaW80I'),
          ),
        ),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return MyMessageBubble();
                }),
          ),
          const Text('Mundis'),
        ]),
      ),
    );
  }
}
