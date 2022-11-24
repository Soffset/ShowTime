import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      foregroundColor: Colors.white,
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
  );

  final ThemeData _lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      primarySwatch: Colors.grey,

      appBarTheme: const AppBarTheme(
        color: Color(0xFF035D63),
        //scrolledUnderElevation: 0.0,
        //shadowColor: Colors.black,
        foregroundColor: Colors.white,

        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        actionsIconTheme: IconThemeData(
          color: Colors.white,
        ),

        textTheme: TextTheme(
          // center text style
            headline6: TextStyle(
                color: Colors.white,
            ),
            // Side text style
            bodyText2: TextStyle(color: Colors.white)
        ),

        surfaceTintColor: Colors.white,

        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
        ),
      ),

      scaffoldBackgroundColor: Colors.white,
      cardTheme: const CardTheme(
        color: Color(0xFFF2F5F8),
      ),
      backgroundColor: Colors.white,
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

