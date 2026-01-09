import 'package:clinic/views/add_patient_view.dart';
import 'package:clinic/views/appointment_view.dart';
import 'package:clinic/views/edit_patient_view.dart';
import 'package:clinic/views/home_view.dart';
import 'package:clinic/views/patient_list_view.dart';
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

      initialRoute: '/',
      routes: {
        '/': (context) => SplashView(),
        '/home': (context) => HomeView(),
        '/add': (context) => AddPatientView(),
        '/edit': (context) => EditPatientView(),
        '/appointment': (context) => AppointmentView(),
        '/patient': (context) => PatientListView(),
      },
    );
  }
}
