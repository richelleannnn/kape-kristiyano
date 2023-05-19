// main.dart
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kape_kristiyano/screens/splash_screen.dart';
import 'package:kape_kristiyano/screens/login_screen.dart';

void main() => runApp(CoffeeApp());

class CoffeeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        //primaryColor: Color.fromARGB(255, 159, 105, 56),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
      routes: {
        '/login': (context) => LoginScreen(),
      },
    );
  }
}
