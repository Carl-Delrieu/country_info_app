import 'package:country_info_app/presentation/theming/colors.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = _lightThemeBuilder();
final ThemeData darkTheme = _darkThemeBuilder();

ThemeData _lightThemeBuilder() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: lightPrimaryColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: lightAccentColor,
    ),
    backgroundColor: lightBackgroundColor,
  );
}

ThemeData _darkThemeBuilder() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    brightness: Brightness.dark,
    primaryColor: darkPrimaryColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: darkAccentColor,
    ),
    backgroundColor: darkBackgroundColor,
  );
}