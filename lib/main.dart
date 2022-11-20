import 'package:flutter/material.dart';
import 'package:progetto_esame/views/widgets/home.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({Key? key}) : super(key: key);
  final _light = true;
  final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.amber,
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
    ).copyWith(secondary: Colors.red),
    textTheme: const TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
    ).apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
  );

  final ThemeData _lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.purple,
      backgroundColor: Colors.red,
      cardColor: Color(0xffd5dae0),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.light,
        primarySwatch: Colors.purple,
      ).copyWith(secondary: Colors.pink),
    textTheme: const TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
    ).apply(
      bodyColor: Colors.black87,
      displayColor: Colors.black87,
    ),
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

