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
        elevation: 10,
        shadowColor: const Color.fromARGB(255, 6, 201, 191),
        backgroundColor: const Color.fromARGB(255, 0, 255, 200),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Text(
              "Welcome to the clinic",
              style: TextStyle(fontSize: 30, fontFamily: "ShortBaby-Mg2w"),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                patient_card(
                  icon: Icons.person,
                  Tx: "Patient presentation",
                  Tb: "View",
                  onPressed: () {
                    Navigator.pushNamed(context, '/patient_view');
                  },
                ),
                patient_card(
                  icon: Icons.person,
                  Tx: "Quick addition",
                  Tb: "New",
                  onPressed: () {},
                ),
                patient_card(
                  icon: Icons.person,
                  Tx: "Appointments",
                  Tb: "View",
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
