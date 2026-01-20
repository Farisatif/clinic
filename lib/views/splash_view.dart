import 'dart:async';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: const AssetImage("assets/images/Clinic_img.jpg"),
              radius: 120, // حجم طبيعي
            ),
            const SizedBox(height: 20),
            const Text(
              'Clinic App',
              style: TextStyle(
                fontSize: 36,
                fontFamily: 'ShortBaby-Mg2w',
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 7, 189, 213),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Medical Appointment System',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'ShortBaby-Mg2w',
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
