import 'package:flutter/material.dart';
import 'package:progetto_esame/views/widgets/home.dart';
import 'dart:developer' as developer;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista films',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.white,
        textTheme: const TextTheme(
          bodyText2: TextStyle( color: Colors.white ),
        ),
      ),

      home: HomePage(),
    );
  }
}

