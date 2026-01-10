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
            color: Color.fromARGB(255, 255, 255, 255),
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
                padding: EdgeInsets.all(30),

                decoration: BoxDecoration(
                  color: const Color.fromARGB(0, 0, 0, 0),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 7, 189, 213),
                      blurRadius: 10,
                      spreadRadius: 450,
                      offset: Offset(0, 400),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text("Welcome ",
                      style: TextStyle(
                        fontSize: 60,
                        fontFamily: "ShortBaby-Mg2w",
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),),
                    Text(
                      "to the clinic",
                      style: TextStyle(
                        fontSize: 60,
                        fontFamily: "ShortBaby-Mg2w",
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
                width: 100,
                child: VerticalDivider(
                  indent: 0,
                  endIndent: 0,
                  color: Colors.black,
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PatientCard(
                    model: PatientModel(
                      Bcolor: const Color.fromARGB(255, 15, 154, 173),
                      color: const Color.fromARGB(255, 0, 0, 0),
                      Tx: "Appointments",
                      icon: Icons.person,
                      routeName: '/Patient_record',
                    ),
                  ),
                  const SizedBox(height: 20),
                  PatientCard(
                    model: PatientModel(
                      Bcolor: const Color.fromARGB(255, 7, 120, 213),
                      color:  const Color.fromARGB(255, 0, 0, 0),
                      Tx: "Add",
                      icon: Icons.add,
                      routeName: '/add',
                    ),
                  ),
                  const SizedBox(height: 20),
                  PatientCard(
                    model: PatientModel(
                      Bcolor: const Color.fromARGB(255, 255, 45, 45),
                      Tx: "Today",
                      color: const Color.fromARGB(255, 0, 0, 0),
                      icon: Icons.today,
                      routeName: '/patient',
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
