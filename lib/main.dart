// import 'package:clinic/views/add_patient_view.dart';
import 'package:clinic/views/edit_patient_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( Clinic());
}

class Clinic extends StatelessWidget {
  const Clinic({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: 
      EditPatientView(),
      
    );
  }
} 