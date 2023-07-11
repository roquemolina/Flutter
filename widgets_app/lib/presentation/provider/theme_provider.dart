import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Mutable
final isDarkModeProvider = StateProvider<bool>((ref) => false);

//Inmutable
final colorListProvider = Provider<List>((ref) => colorList);

final selectedIndexColorProvider = StateProvider<int>((ref) => 0);