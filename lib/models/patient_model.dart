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
