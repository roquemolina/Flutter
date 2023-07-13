import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final messages = <String>[
      'Loading',
      '1',
      '2',
      '3',
      'Now',
      'Ups!',
    ];
    return Stream.periodic(const Duration(seconds: 1), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        const CircularProgressIndicator(),
        const SizedBox(height: 10),
        StreamBuilder(
          stream: getLoadingMessages(),
          builder: (context, snapshop) {
          if(!snapshop.hasData) return const Text('Loading');
          return Text(snapshop.data!);  

        })
      ],
    ));
  }
}
