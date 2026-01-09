import 'package:clinic/widgets/patient_card.dart';
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
        centerTitle: true,
        elevation: 30,
        shadowColor: const Color.fromARGB(255, 6, 201, 191),
        backgroundColor: const Color.fromARGB(255, 0, 255, 200),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Text(
              "Welcome to the clinic",
              style: TextStyle(fontSize: 30, fontFamily: "ShortBaby-Mg2w"),
            ),
            SizedBox(height: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 20,
              children: [
                PatientCard(
                  icon: Icons.person,
                  Tx: "Patient presentation",
                  routeName: '/patient',
                ),
                PatientCard(
                  icon: Icons.person,
                  Tx: "Quick addition",
                  routeName: '/add',
                ),
                PatientCard(
                  icon: Icons.person,
                  Tx: "Appointments",
                  routeName: '/appointment',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
