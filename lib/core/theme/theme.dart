import 'package:flutter/material.dart';

class AppTheme {
  static Color darkAccentColor = Colors.blueGrey.shade600;

  const AppTheme._();

  static final lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final darkTheme = ThemeData(
    primaryColor: darkAccentColor,
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: darkAccentColor, background: darkAccentColor),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
