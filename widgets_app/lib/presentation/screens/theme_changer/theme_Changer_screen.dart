import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/provider/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  const ThemeChangerScreen({super.key});
  static const name = 'theme_changer_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDark = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update((state) => !state);
              //print(isDark);
            },
            icon: isDark
                ? const Icon(Icons.dark_mode_outlined)
                : const Icon(Icons.light_mode_outlined),
          ),
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List colorsList = ref.watch(colorListProvider);
    final int selectedIndexColor = ref.watch(selectedIndexColorProvider);
    return ListView.builder(
      itemCount: colorsList.length,
      itemBuilder: (context, index) {
        final Color color = colorsList[index];
        return RadioListTile(
          title: Text('This color', style: TextStyle(color: color)),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: index,
          groupValue: selectedIndexColor,
          onChanged: (value) {
            // ref.read(selectedIndexColorProvider.notifier).state = index;
            ref
                .read(selectedIndexColorProvider.notifier)
                .update((state) => index);
          },
        );
      },
    );
  }
}
