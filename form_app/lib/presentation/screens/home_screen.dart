import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text('Cubits'),
            subtitle: const Text('State Manager'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => context.push('/cubit'), // context.push('/cubits'),
          ),
          ListTile(
            title: const Text('BloC'),
            subtitle: const Text('State Manager'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => context.push('/bloc'), // context.push('/cubits'),
          ),
          ListTile(
            title: const Text('New User'),
            subtitle: const Text('User Manager'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => context.push('/new-user'), // context.push('/cubits'),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
