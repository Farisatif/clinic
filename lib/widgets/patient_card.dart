import 'package:clinic/models/patient_model.dart';
import 'package:flutter/material.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({super.key, required this.model});

  final PatientModel model;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      elevation: 5,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.pushNamed(context, model.routeName);
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 40),
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            color: model.Bcolor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: model.color,
                blurRadius: 3,
                spreadRadius: 1,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(model.icon, color: model.color, size: 40),
              const SizedBox(height: 6),
              Text(
                model.Tx,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'ShortBaby-Mg2w',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
