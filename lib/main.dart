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
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
    ).copyWith( secondary: Colors.grey ),
    textTheme: const TextTheme(
      bodyText1: TextStyle( color: Colors.white,),
      bodyText2: TextStyle( color: Colors.white,),
    ),
  );

  final ThemeData _lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: Colors.purple,
      backgroundColor: Colors.grey,
      cardColor: Color(0xffd5dae0),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.light,
        primarySwatch: Colors.purple,
      ).copyWith(secondary: Colors.pink),
    textTheme: const TextTheme(
      bodyText1: TextStyle( color: Colors.white),
      bodyText2: TextStyle( color: Colors.black87 ),
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

