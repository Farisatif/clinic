import 'package:flutter/material.dart';
import 'package:clinic/helpers/databasehelper.dart';

class PatientListView extends StatefulWidget {
  const PatientListView({super.key});

  @override
  State<PatientListView> createState() => _PatientListViewState();
}

class _PatientListViewState extends State<PatientListView> {
  List<Map<String, dynamic>> patients = [];

  @override
  void initState() {
    super.initState();
    getPatients();
  }

  getPatients() async {
    DatabaseHelper db = DatabaseHelper.instance;
    List<Map> response = await db.readData(table: 'patients');

    setState(() {
      patients = response.cast<Map<String, dynamic>>();
    });
  }

  deletePatient(int id) async {
    DatabaseHelper db = DatabaseHelper.instance;
    await db.deleteData(table: 'patients', id: id);
    getPatients();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 7, 189, 213),
        centerTitle: true,
        title: const Text(
          "Patient List",
          style: TextStyle(
            fontFamily: 'ShortBaby-Mg2w',
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const Text(
              "Patient List",
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'ShortBaby-Mg2w',
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 30),

            if (patients.isEmpty)
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.people_outline, size: 120, color: Colors.grey),
                    SizedBox(height: 20),
                    Text(
                      "No patients found",
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'ShortBaby-Mg2w',
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Add a new patient to see them here",
                      style: TextStyle(fontSize: 16, color: Colors.black45),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            else
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(patients.length, (index) {
                      bool isMale = patients[index]['gender'] == 'Male';

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                isMale
                                    ? const Color.fromARGB(255, 7, 189, 213)
                                    : Colors.white,
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
                            leading: Icon(
                              Icons.person,
                              size: 40,
                              color:
                                  isMale
                                      ? Colors.white
                                      : const Color.fromARGB(255, 228, 52, 208),
                            ),
                            title: Center(
                              child: Text(
                                patients[index]['name'],
                                style: TextStyle(
                                  fontFamily: 'ShortBaby-Mg2w',
                                  fontSize: 30,
                                  color: isMale ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                            subtitle: Center(
                              child: Text(
                                patients[index]['phone'],
                                style: const TextStyle(
                                  fontFamily: 'ShortBaby-Mg2w',
                                  fontSize: 18,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    size: 30,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    deletePatient(patients[index]['id']);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
