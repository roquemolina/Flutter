import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});
  static const name = 'buttons';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context.pop('/home');
        },
      ),
    );
  }
}

class _ButtonView extends StatelessWidget {
  const _ButtonView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 20,
          ),
          child: Wrap(spacing: 10, alignment: WrapAlignment.center, children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated Buttton'),
            ),
            const ElevatedButton(
              onPressed: null,
              child: Text('Disable Buttton'),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.access_alarm_rounded),
              label: const Text('Elevated Icon Buttton'),
            ),
            FilledButton(
              onPressed: () {},
              child: const Text('Filled Buttton'),
            ),
            FilledButton.icon(
              onPressed: () {},
              label: const Text('Filled Icon Buttton'),
              icon: const Icon(Icons.accessibility_new),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined Buttton'),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              label: const Text('Outlined Icon Buttton'),
              icon: const Icon(Icons.terminal),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Text Buttton'),
            ),
            TextButton.icon(
              onPressed: () {},
              label: const Text('Text Icon Buttton'),
              icon: const Icon(Icons.account_tree_outlined),
            ),
            IconButton(
              icon: const Icon(Icons.hail),
              onPressed: () {},
            ),
            IconButton(
                icon: const Icon(Icons.hail),
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(colors.primary),
                )),
            const CustomButton(),
          ])),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'HolaMundo',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
