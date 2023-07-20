import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_app/domain/entities/push_message.dart';
import 'package:push_app/presentation/blocs/notifications/notifications_bloc.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.pushMessageId});

  final String pushMessageId;

  @override
  Widget build(BuildContext context) {
    final PushMessage? message =
        context.watch<NotificationsBloc>().getMessageById(pushMessageId);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Push Details'),
        ),
        body: (message != null)
            ? DetailsView(message: message)
            : const Center(
                child: Text('No notifications'),
              ));
  }
}

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.message});
  final PushMessage message;

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        child: Column(
          children: [
            if (message.imageUrl != null) Image.network(message.imageUrl!),
            const SizedBox(
              height: 30,
            ),
            Text(message.title, style: textStyles.bodyMedium),
            Text(message.body),
            const Divider(),
            Text(message.data.toString()),
          ],
        ));
  }
}
