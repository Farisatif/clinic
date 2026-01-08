import 'package:clinic/views/home_view.dart';
import 'package:clinic/views/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Clinic());
}
class Clinic extends StatelessWidget {
  const Clinic({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       initialRoute: 'home',
      routes: {
        '/': (context) => SplashView(),
        '/home': (context) => HomeView(),
       
      },
    );
  }
}