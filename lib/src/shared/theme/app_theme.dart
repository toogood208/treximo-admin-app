import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 18, color: Colors.black87),
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    iconTheme: IconThemeData(color: Color(0XFF2F80ED)),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(
      0XFF2F80ED,
    ),
    onPrimaryContainer: Color( 0XFF2F80ED,)
  ),
);

ThemeData darkTheme = ThemeData(
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 18, color: Colors.white70),
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.red,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.red,
    brightness: Brightness.dark,
  ),
);
