import 'package:flutter/material.dart';

const Color _customColor = Color(0xFFFF9000);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.yellow,
  Colors.pink,
  Colors.black,
  Colors.green,
];

class AppTheme {
  final int selectedColor;
//constructor
  AppTheme({this.selectedColor = 0,})
    : assert(selectedColor >= 0 && selectedColor < _colorThemes.length - 1,
     'Selected color cannot be smaller than 0');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      brightness: Brightness.light,
    );
  }
}
