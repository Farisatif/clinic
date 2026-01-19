import 'package:clinic/widgets/patient_card.dart';
import 'package:clinic/models/patient_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(
            fontFamily: 'ShortBaby-Mg2w',
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 30,
        shadowColor: Color.fromARGB(255, 0, 0, 0),
        backgroundColor: const Color.fromARGB(255, 7, 189, 213),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(30),
                color: Colors.transparent,
                child: Column(
                  children: const [
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 60,
                        fontFamily: "ShortBaby-Mg2w",
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "to the clinic",
                      style: TextStyle(
                        fontSize: 60,
                        fontFamily: "ShortBaby-Mg2w",
                        color: Color.fromARGB(255, 7, 189, 213),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PatientCard(
                    model: PatientModel(
                      Bcolor: const Color.fromARGB(255, 15, 154, 173),
                      color: const Color.fromARGB(255, 10, 10, 10),
                      Tx: "Add",
                      icon: Icons.add,
                      routeName: '/add',
                    ),
                  ),
                  PatientCard(
                    model: PatientModel(
                      Bcolor: const Color.fromARGB(255, 15, 154, 173),
                      color: const Color.fromARGB(255, 9, 9, 9),
                      Tx: "Today",
                      icon: Icons.today,
                      routeName: '/patient',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PatientCard(
                    model: PatientModel(
                      Bcolor: const Color.fromARGB(255, 15, 154, 173),
                      color: const Color.fromARGB(255, 7, 7, 7),
                      Tx: "Edit",
                      icon: Icons.edit,
                      routeName: '/edit',
                    ),
                  ),
                  PatientCard(
                    model: PatientModel(
                      Bcolor: const Color.fromARGB(255, 15, 154, 173),
                      color: const Color.fromARGB(255, 5, 5, 5),
                      Tx: "Appointment",
                      icon: Icons.book_online,
                      routeName: '/appointment',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PatientCard(
                    model: PatientModel(
                      Bcolor: const Color.fromARGB(255, 15, 154, 173),
                      color: const Color.fromARGB(255, 5, 5, 5),
                      Tx: "Appointment",
                      icon: Icons.book_online,
                      routeName: '/Patient_record',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
