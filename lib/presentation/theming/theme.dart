import 'package:country_info_app/presentation/theming/colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: lightPrimaryColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: lightAccentColor,
    ),
    backgroundColor: lightBackgroundColor,

);

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: darkPrimaryColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: darkAccentColor,
    ),
    backgroundColor: darkBackgroundColor,
);