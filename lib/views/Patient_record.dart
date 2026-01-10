import 'package:flutter/material.dart';

class Patientrecord extends StatelessWidget {
  Patientrecord({super.key});
  List<String> New = [
    "Fares",
    "Aroa",
    "Hifaa",
    "Adood",
    "Issa",
    "Mariam",
    "Ahmed",
    "Omar",
    "Hinata",
  ];
  List<bool> TorF = [true, false, false, true, true, false, true, true, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: 
      GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 1,
          mainAxisSpacing: 5,
        ),
        itemCount: New.length,

        itemBuilder: (context, index) {
          return Container(
          
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),

            decoration: BoxDecoration(
              
              boxShadow: const [
                
                BoxShadow(
                  color: Color.fromARGB(255, 101, 101, 101),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: Offset(2, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
              color:
                  TorF[index]
                      ? const Color.fromARGB(255, 0, 0, 0)
                      : const Color.fromARGB(255, 255, 186, 245),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TorF[index]
                    ? Icon(
                      Icons.male,
                      color: const Color.fromARGB(161, 255, 255, 255),
                      size: 60,
                    )
                    : Icon(
                      Icons.female,
                      color: const Color.fromARGB(158, 255, 64, 128),
                      size: 60,
                    ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      New[index],
                      style: TextStyle(
                        color:
                            TorF[index]
                                ? const Color.fromARGB(255, 255, 255, 255)
                                : const Color.fromARGB(255, 0, 0, 0),
                        fontFamily: 'ShortBaby-Mg2w',
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      "data",
                      style: TextStyle(
                        color:
                            TorF[index]
                                ? const Color.fromARGB(255, 221, 98, 207)
                                : const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    Text(
                      "data",
                      style: TextStyle(
                        color:
                            TorF[index]
                                ? const Color.fromARGB(255, 106, 106, 106)
                                : const Color.fromARGB(178, 221, 98, 207),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Row(
                    children: [
                      IconButton(
                        icon:  Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {
                          Navigator.pushNamed(context, '/edit');
                          
                        },
                      ),

                      SizedBox(width: 8),
                      Icon(Icons.delete, color: Colors.red),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
