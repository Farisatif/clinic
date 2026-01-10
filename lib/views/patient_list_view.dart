import 'package:flutter/material.dart';

class PatientListView extends StatefulWidget {
  const PatientListView({super.key});

  @override
  State<PatientListView> createState() => _PatientListViewState();
}

class _PatientListViewState extends State<PatientListView> {
  List<String> patientNames = ['Issa', 'Alex', 'Maria', 'John'];
  List<String> patientPhones = ['55555', '44444', '33333', '22222'];
  List<bool> isMale = [true, false, false, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "patient list",
          style: TextStyle(
            fontFamily: 'ShortBaby-Mg2w',
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 30,
        shadowColor: const Color.fromARGB(255, 6, 201, 191),
        backgroundColor: const Color.fromARGB(255, 7, 189, 213),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: ListView.builder(
          itemCount: patientNames.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  color:
                      isMale[index]
                          ? const Color.fromARGB(255, 7, 189, 213)
                          : const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        patientNames[index],
                        style: TextStyle(
                          fontFamily: 'ShortBaby-Mg2w',
                          fontSize: 40,
                          color: isMale[index] ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text(patientPhones[index])],
                  ),
                  leading:
                      isMale[index]
                          ? Icon(
                            Icons.person,
                            size: 40,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          )
                          : Icon(
                            Icons.person,
                            size: 40,
                            color: const Color.fromARGB(255, 228, 52, 208),
                          ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.delete, color: Colors.red),
                      SizedBox(width: 10),
                      Icon(
                        Icons.done,
                        size: 40,
                        color: Color.fromARGB(255, 0, 255, 213),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
