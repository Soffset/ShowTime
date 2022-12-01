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
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(
      brightness: Brightness.dark,
      background: const Color(0xFF121212),
    ),

    appBarTheme: const AppBarTheme(
      color: Color(0xFF0A0A0A),
      scrolledUnderElevation: 0.0,
      shadowColor: Colors.black,
      foregroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    scaffoldBackgroundColor: const Color(0xFF121212),
    cardTheme: const CardTheme(
      color: Color(0xFF191919),
    ),


  );

  final ThemeData _lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      appBarTheme: const AppBarTheme(
        color: Color(0xFF035D63),
        scrolledUnderElevation: 0.0,
        shadowColor: Colors.black,
        foregroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        actionsIconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),

      scaffoldBackgroundColor: Colors.white,
      cardTheme: const CardTheme(
        color: Color(0xFFF2F5F8),
      ),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(
          brightness: Brightness.light,
          background: const Color(0xFFF2F5F8)
      ),

  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: _lightTheme,
        title: 'Shows',
        darkTheme: _darkTheme,
        debugShowCheckedModeBanner: false,

      home: const HomePage(),
    );
  }
}

