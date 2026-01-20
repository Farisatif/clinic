import 'package:flutter/material.dart';

class PatientModel {
  final String Tx;
  final String routeName;
  final IconData icon;
  final Color color;
  final Color Bcolor;
  PatientModel({
    required this.color,
    required this.Tx,
    required this.Bcolor,
    required this.routeName,
    required this.icon,
  });
}

//------------------
// Patient Data Model
//------------------
class PatientModelData {
  String? fullName;
  String? phoneNumber;
  int? age;
  String? medicalNotes;
  String? gender;

  PatientModelData({
    required this.fullName,
    required this.phoneNumber,
    required this.age,
    required this.medicalNotes,
    required this.gender,
  });
}
