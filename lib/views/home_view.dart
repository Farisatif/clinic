import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(
            fontFamily: 'ShortBaby-Mg2w',
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 5, 204, 161),
      ),
    );
  }
}
