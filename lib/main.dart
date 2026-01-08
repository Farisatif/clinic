import 'package:flutter/material.dart';

void main() {
  runApp(const Clinic());
}
class Clinic extends StatelessWidget {
  const Clinic({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Text("data"),
    );
  }
}