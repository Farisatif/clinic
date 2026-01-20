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
  final int? id;
  String? fullName;
  String? phoneNumber;
  int? age;
  String? medicalNotes;
  String? gender;

  PatientModelData({
    this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.age,
    required this.medicalNotes,
    required this.gender,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': fullName,
      'age': age,
      'phone': phoneNumber,
      'medical_notes': medicalNotes,
      'gender': gender,
    };
  }

  // Optional: fromMap if you later read from DB
  factory PatientModelData.fromMap(Map<String, dynamic> map) {
    return PatientModelData(
      id: map['id'] as int?,
      fullName: map['name'] as String?,
      age: map['age'] as int?,
      phoneNumber: map['phone'] as String?,
      medicalNotes: map['medical_notes'] as String?,
      gender: map['gender'] as String?,
    );
  }
}


