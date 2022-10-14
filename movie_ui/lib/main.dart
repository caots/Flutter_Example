import 'package:flutter/material.dart';
import 'package:movie_ui/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Movie UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.black45,
      ),
      home: HomeScreen(),
    );
  }
}