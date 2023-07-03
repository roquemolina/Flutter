import 'package:flutter/material.dart';

const Color _customColor = Color(0xFFFF9000);

const List<Color> colorList = [
  _customColor,
  Colors.blue,
  Colors.yellow,
  Colors.pink,
  Colors.black,
  Colors.green,
  Colors.teal,
  Colors.orange,
  Colors.pinkAccent,
];

class AppTheme {
  final int selectedColor;
//constructor
  AppTheme({
    this.selectedColor = 0,
    })
    : assert(selectedColor >= 0,
     'Selected color must be greater than 0'),
      assert(selectedColor < colorList.length,
     'Selected color must be smaller than available color list');

  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorList[selectedColor],
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        centerTitle: true,
      )
    );
  }
}
