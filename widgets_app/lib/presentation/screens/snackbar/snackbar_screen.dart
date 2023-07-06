import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hi World!'),
      action: SnackBarAction(label: 'OK!', onPressed: () {}),
      duration: const Duration(seconds: 1),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text(
            'Non aute qui cupidatat labore consequat pariatur. Lorem ad cillum in enim pariatur deserunt voluptate nostrud exercitation cillum cupidatat ad aliquip. Ipsum adipisicing nulla duis voluptate incididunt. Reprehenderit cillum ipsum sunt ad duis elit ut minim velit deserunt. Fugiat irure elit voluptate aute amet. Qui consectetur aliqua elit labore sint quis quis nostrud minim dolor. Nulla consectetur consectetur sint sunt quis proident veniam.'),
        actions: [
          TextButton(
            onPressed: () {
              return context.pop();
            },
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              return context.pop();
            },
            child: const Text('Accept'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Snackbars and dialogs'),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                    context: context, children: [const Text('Used licenses')]);
              },
              child: const Text('Licences'),
            ),
            FilledButton.tonal(
              onPressed: () {
                return openDialog(context);
              },
              child: const Text('Dialogs'),
            ),
          ]),
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: const Text('Show Snackbar'),
          onPressed: () {
            return showSnackBar(context);
          },
          icon: const Icon(Icons.remove_red_eye_outlined),
        ));
  }
}
