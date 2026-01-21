import 'package:flutter/material.dart';
import 'package:clinic/helpers/databasehelper.dart';

class PatientListView extends StatefulWidget {
  const PatientListView({super.key});

  @override
  State<PatientListView> createState() => _PatientListViewState();
}

class _PatientListViewState extends State<PatientListView> {
  Future<List<Map<String, dynamic>>> getPatients() async {
    final response = await DatabaseHelper.instance.readData(table: 'patients');
    return response.map((e) => Map<String, dynamic>.from(e)).toList();
  }

  // حذف مريض
  Future<void> deletePatient(int id) async {
    await DatabaseHelper.instance.deleteData(table: 'patients', id: id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Patient List",
          style: TextStyle(
            fontFamily: 'ShortBaby-Mg2w',
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 7, 189, 213),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const Text(
              "Patient List",
              style: TextStyle(fontSize: 40, fontFamily: 'ShortBaby-Mg2w'),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: getPatients(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  final patients = snapshot.data ?? [];
                  if (patients.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.people_outline,
                            size: 120,
                            color: Colors.grey,
                          ),
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
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: patients.length,
                    itemBuilder: (context, index) {
                      final p = patients[index];
                      final isMale =
                          (p['gender']?.toString() ?? 'Male') == 'Male';

                      // تحويل البيانات لتمريرها إلى صفحة التعديل
                      final normalized = <String, dynamic>{
                        'id': p['id'],
                        'name': p['name'],
                        'phone': p['phone'],
                        'age': p['age'],
                        'gender': p['gender'],
                        'medicalNotes': p['medical_notes'],
                      };

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
                              color: isMale ? Colors.white : Colors.black,
                            ),
                            title: Center(
                              child: Text(
                                p['name']?.toString() ?? '',
                                style: TextStyle(
                                  fontFamily: 'ShortBaby-Mg2w',
                                  fontSize: 30,
                                  color: isMale ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                            subtitle: Center(
                              child: Text(
                                p['phone']?.toString() ?? '',
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
                                  onPressed: () async {
                                    final result = await Navigator.pushNamed(
                                      context,
                                      '/edit',
                                      arguments: normalized,
                                    );
                                    if (result == true) setState(() {});
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    size: 30,
                                    color: Colors.red,
                                  ),
                                  onPressed:
                                      () => deletePatient(p['id'] as int),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
