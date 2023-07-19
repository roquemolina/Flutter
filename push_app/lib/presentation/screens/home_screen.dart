import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Permissions state'),
        actions: [
          IconButton(
            //TODO: request permission
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder:(context, index) {
        return ListTile(
          title: Text('Hi $index'),
          subtitle: Text('Sub $index'),
        );
      },
    );
  }
}
