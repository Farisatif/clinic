import 'package:flutter/material.dart';

class patient_card extends StatelessWidget {
  const patient_card({
    super.key,
    required this.onPressed,
    required this.Tx,
    required this.Tb,
    required this.icon,
  });
  final void Function() onPressed;
  final String Tx;
  final String Tb;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 0, 255, 200),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        spacing: 6,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: const Color.fromARGB(255, 0, 0, 0), size: 60),
          Text(
            Tx,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),

          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(1),
              backgroundColor: Colors.black,
            ),
            child: Text(
              Tb,
              style: TextStyle(fontSize: 10, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
