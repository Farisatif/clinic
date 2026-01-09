import 'package:flutter/material.dart';

class Patientrecord extends StatelessWidget {
  const Patientrecord({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin:EdgeInsets.all(10),
            width: 230,
            height: 100,

            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 7, 255, 19),
            ),
            child: Row(
               crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
                Icon(Icons.person),
                Padding(padding: EdgeInsets.all(20)),
                Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("data"), Text("data"), Text("data")]),
                Icon(Icons.person),
              ],
            ),
          ),
          Container(
            width: 230,
            height: 100,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 7, 7),
            ),
            child: Row(
              children: [
                Icon(Icons.person),
                Column(children: [Text("data"), Text("data"), Text("data")]),
                Icon(Icons.person),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
