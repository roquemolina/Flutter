import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Inmutable
final colorListProvider = Provider<List>((ref) => colorList);

//Mutable
final isDarkModeProvider = StateProvider<bool>((ref) => false);

final selectedIndexColorProvider = StateProvider<int>((ref) => 0);

// AppTheme custom object

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);
  
//Controller or Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  //state = new AppTheme();
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
