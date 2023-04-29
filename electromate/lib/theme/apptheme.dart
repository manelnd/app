// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.blue,
    colorScheme: ColorScheme(
      primary: Colors.blueAccent,
      primaryContainer: Colors.blue,
      secondary: Colors.greenAccent,
      secondaryContainer: Colors.green,
      surface: Colors.white,
      background: Colors.grey.shade300,
      error: Colors.red,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.white,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(fontSize: 16),
      displayLarge: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(fontSize: 18.0),
      bodyLarge: TextStyle(fontSize: 14.0),
      bodyMedium: TextStyle(fontSize: 12.0),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.grey,
    colorScheme: ColorScheme.dark(
      primary: Colors.blueAccent,
      secondary: Colors.grey[700]!,
    ),
    scaffoldBackgroundColor: Colors.black,
    textTheme: TextTheme(
      titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(fontSize: 16),
      displayLarge: TextStyle(
          fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.white),
      displayMedium: TextStyle(
          fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.white),
      titleMedium: TextStyle(fontSize: 18.0, color: Colors.white),
      bodyLarge: TextStyle(fontSize: 14.0, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 12.0, color: Colors.white),
    ),
    iconTheme: IconThemeData(color: Colors.white),
  );
}
