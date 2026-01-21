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

  PatientModelData patientData = PatientModelData();

  insertPatientData() async {
    // ????? ?????? ??????
    patientData.fullName = fullName;
    patientData.phoneNumber = phoneNumber;
    patientData.age = int.tryParse(age ?? '0');
    patientData.medicalNotes = medicalNotes;
    patientData.gender = gender ?? (isMale ? 'Male' : 'Female');

    DatabaseHelper db = DatabaseHelper.instance;
    await db.insertData(table: 'patients', values: patientData.toMap());
  }

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
                          isMale
                              ? Icon(Icons.male, color: Colors.black, size: 60)
                              : Icon(
                                Icons.female,
                                color: Colors.pink,
                                size: 60,
                              ),
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
                          keyboardType: TextInputType.number,
                          onChanged: (value) => age = value,
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
                        onPressed: () async {
                          if (_formstate.currentState!.validate()) {
                            await insertPatientData();

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Patient $fullName saved successfully',
                                ),
                                backgroundColor: Colors.green,
                              ),
                            );

                            Navigator.pop(context);
                          } else {
                            setState(() {
                              _autoValidateMode = AutovalidateMode.always;
                            });
                          }
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
