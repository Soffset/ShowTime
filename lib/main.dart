import 'package:flutter/material.dart';
import 'package:progetto_esame/views/widgets/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista films',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: Colors.white,
        textTheme: const TextTheme(
          bodyText2: TextStyle( color: Colors.white ),
        ),
      ),

      home: const HomePage(),
    );
  }
}

