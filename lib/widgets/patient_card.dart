import 'package:flutter/material.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({
    super.key,
    required this.Tx,
    required this.icon,
    required this.routeName,
  });

  final String Tx;
  final String routeName;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      // ضروري للـ ripple effect
      borderRadius: BorderRadius.circular(20),
      elevation: 5,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Container(
          width: 500,
          height: 200,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 255, 200),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 10,
                spreadRadius: 1,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.black, size: 80),
              const SizedBox(height: 6),
              Text(
                Tx,
                style: const TextStyle(
                  fontSize: 30,
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
