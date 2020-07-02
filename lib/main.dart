import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/splashscreen.dart';
import 'pages/details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
