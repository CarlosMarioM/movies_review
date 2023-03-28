import 'package:flutter/material.dart';

class AppTheme {
  static final dark = ThemeData.dark();
  static final theme = ThemeData(
    scaffoldBackgroundColor: Colors.grey[300],
    textTheme: TextTheme(
      labelLarge: TextStyle(
        color: Colors.grey[400],
      ),
      labelMedium: TextStyle(
        color: Colors.grey[400],
      ),
      labelSmall: TextStyle(
        color: Colors.grey[400],
      ),
    ),
    useMaterial3: true,
    iconTheme: const IconThemeData(color: Colors.white),
    primarySwatch: Colors.indigo,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue[900],
      titleTextStyle: const TextStyle(
          color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700),
    ),
  );
}
