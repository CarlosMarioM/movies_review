import 'package:flutter/material.dart';
import 'util/theme.dart';
import 'views/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: AppTheme.dark,
      theme: AppTheme.theme,
      home: Builder(builder: (context) {
        return const MyHomePage(title: 'Movielicious');
      }),
    );
  }
}