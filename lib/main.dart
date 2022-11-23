import 'package:flutter/material.dart';
import 'package:progetto_esame/views/widgets/home.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({Key? key}) : super(key: key);

  final ThemeData _darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    primarySwatch: Colors.grey,

    appBarTheme: const AppBarTheme(
      color: Color(0xFF0A0A0A),
      scrolledUnderElevation: 0.0,
      shadowColor: Colors.black,

    ),
    scaffoldBackgroundColor: const Color(0xFF121212),
    cardTheme: const CardTheme(
      color: Color(0xFF191919),
    ),
    backgroundColor: const Color(0xFF121212),

    //bg #1d1c1c
    //card #191918
    //hover #292829
    //appbar #191918

    /*colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.grey.shade900,
      onPrimary: Colors.white,
      secondary: Colors.grey.shade800,
      onSecondary: Colors.white,
      primaryContainer: Colors.grey.shade900,
      error: Colors.black,
      onError: Colors.white,
      background: Colors.grey.shade800,
      onBackground: Colors.white,
      surface: Colors.grey.shade900,
      onSurface: Colors.white,
    ),*/
  );

  final ThemeData _lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.grey,

        brightness: Brightness.light,
    ),
    /*colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Colors.orange,
      onPrimary: Colors.white,
      secondary: Colors.green,
      onSecondary: Colors.white,
      primaryContainer: Colors.orange,
      error: Colors.black,
      onError: Colors.white,
      background: Colors.blue,
      onBackground: Colors.white,
      surface: Colors.pink,
      onSurface: Colors.white,
    ),*/
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: _lightTheme,
        title: 'Shows',
        darkTheme: _darkTheme,

      home: const HomePage(),
    );
  }
}

