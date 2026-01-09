import 'dart:ffi';

import 'package:flutter/material.dart';

class PatientListView extends StatefulWidget {
  const PatientListView({super.key});

  @override
  State<PatientListView> createState() => _PatientListViewState();
}

class _PatientListViewState extends State<PatientListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "patient list",
          style: TextStyle(
            fontFamily: 'ShortBaby-Mg2w',
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 10,
        shadowColor: const Color.fromARGB(255, 6, 201, 191),
        backgroundColor: const Color.fromARGB(255, 0, 255, 200),
      ),
      body: 
      
      Container(
        decoration: BoxDecoration(
        
        ),
        child:
         ListTile(
          
          tileColor:const Color.fromARGB(255, 6, 201, 191),
          title: Text("Hi"),
        ),
      ),
    );
  }
}