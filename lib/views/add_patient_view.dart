import 'package:clinic/helpers/databasehelper.dart';
import 'package:clinic/models/patient_model.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/custom_button.dart';

class AddPatientView extends StatefulWidget {
  const AddPatientView({super.key});
  @override
  State<AddPatientView> createState() => _AddPatientViewState();
}

class _AddPatientViewState extends State<AddPatientView> {
  final GlobalKey<FormState> _formstate = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  String? fullName, phoneNumber, age, medicalNotes, gender;
  bool isMale = true;

  PatientModelData patientData = PatientModelData(
    fullName: null,
    phoneNumber: null,
    age: null,
    medicalNotes: null,
    gender: null,
  );

  // insertPatientData() async {
  //   DatabaseHelper db = DatabaseHelper.instance;
  //   int response = await db.insertData(
  //     table: 'patients',
  //     //values: patientData.toMap(),
  //   );
  //   return response;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add New Patient',
          style: TextStyle(
            fontFamily: 'ShortBaby-Mg2w',
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 7, 189, 213),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Add New Patient",
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'ShortBaby-Mg2w',
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 40),
                Form(
                  key: _formstate,
                  autovalidateMode: _autoValidateMode,
                  child: Column(
                    spacing: 40,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            isMale ? "Male" : "Female",
                            style: const TextStyle(
                              fontSize: 30,
                              fontFamily: 'ShortBaby-Mg2w',
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Switch(
                            value: isMale,
                            onChanged: (value) {
                              setState(() {
                                isMale = value;
                                gender = isMale ? 'Male' : 'Female';
                              });
                            },
                          ),
                        ],
                      ),
                      CustomTextField(
                        label: 'Full Name',
                        icon: Icons.person,
                        onChanged: (value) => fullName = value,
                      ),
                      CustomTextField(
                        label: 'Phone Number',
                        icon: Icons.phone,
                        keyboardType: TextInputType.phone,
                        onChanged: (value) => phoneNumber = value,
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 150),
                        child: CustomTextField(
                          label: 'Age',
                          icon: Icons.access_time,
                          keyboardType: TextInputType.datetime,
                          onChanged: (value) {
                            age = value;
                          },
                        ),
                      ),
                      CustomTextField(
                        label: 'Medical Notes',
                        icon: Icons.note,
                        maxLines: 3,
                        onChanged: (value) => medicalNotes = value,
                      ),
                      CustomButton(
                        text: 'Save Patient Data',
                        onPressed: () {
                          if (_formstate.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Saving $fullName Data...'),
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  6,
                                  6,
                                  6,
                                ),
                              ),
                            );
                          }
                          setState(() {
                            _autoValidateMode = AutovalidateMode.always;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
