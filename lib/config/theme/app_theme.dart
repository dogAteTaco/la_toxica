import 'package:flutter/material.dart';

const List<Color> colors = [
  Colors.black,
  Colors.blue,
  Color.fromARGB(255, 17, 2, 128),
  Colors.orange,
  Colors.pink,
  Colors.green,
  Colors.purple
];

class AppTheme {
  final int selectedColors;

  const AppTheme({required this.selectedColors, required Brightness brightness})
      : assert(selectedColors >= 0 && selectedColors < colors.length,
            'no te pases de lanza compa solo es el rango de 0 a ${colors.length - 1}');

  get brightness => null;

  set selectedColor(int selectedColor) {}

  ThemeData theme() => ThemeData(
      colorSchemeSeed: colors[selectedColors], brightness: Brightness.light);
}
