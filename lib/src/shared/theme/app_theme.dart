import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  
    brightness: Brightness.light,
    useMaterial3: true,
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
      titleLarge:  TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      bodyMedium:  TextStyle(fontSize: 16, color: Colors.white),
    ),
    navigationRailTheme: const NavigationRailThemeData(
        minExtendedWidth: 250,
        useIndicator: true,
        backgroundColor: Colors.transparent,
        labelType: NavigationRailLabelType.none,
        selectedIconTheme: IconThemeData(color: Color(0XFF2F80ED))),
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      iconTheme: IconThemeData(color: Color(0XFF2F80ED)),
    ),
    colorScheme: ColorScheme.fromSeed(
      surfaceContainer: Colors.white,
      secondary: Colors.blue,
      seedColor: const Color(
        0XFF2F80ED,
      ),
      onPrimaryContainer: const Color(
        0XFF2F80ED,
      ),
      
      
    ),
    scaffoldBackgroundColor: const Color(0xFFE5E5E5));

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
