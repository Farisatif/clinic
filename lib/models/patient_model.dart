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
class PatientModelData {
  final int? id;
  String? fullName;
  String? phoneNumber;
  int? age;
  String? medicalNotes;
  String? gender;

  PatientModelData({
    this.id,
    this.fullName,
    this.phoneNumber,
    this.age,
    this.medicalNotes,
    this.gender,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': fullName,
      'age': age,
      'gender': gender,
      'phone': phoneNumber,
      'medical_notes': medicalNotes,
    };
  }
// get data the Patient convent to PatientModelData
//mulitab constractor
  factory PatientModelData.fromMap(Map<String, dynamic> map) {
    return PatientModelData(
      id: map['id'] ,
      fullName: map['name'],
      phoneNumber: map['phone'] ,
      age: map['age'],
      medicalNotes: map['medical_notes'],
      gender: map['gender'] ,
    );
  }
}