import 'package:clinic/helpers/databasehelper.dart';
import 'package:clinic/models/patient_model.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/custom_button.dart';

class EditPatientView extends StatefulWidget {
  const EditPatientView({super.key});

  @override
  State<EditPatientView> createState() => _EditPatientViewState();
}

class _EditPatientViewState extends State<EditPatientView> {
  final GlobalKey<FormState> _formstate = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  // بيانات الحقول (تُحدّث عبر onChanged)
  String? fullName, phoneNumber, age, medicalNotes, gender;
  int? patientId;
  bool isMale = true;

  // لضمان أن تهيئة القيم من الـ arguments تحصل مرة واحدة
  bool _isInit = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) return;

    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && args is Map<String, dynamic>) {
      final data = args;
      patientId = data['id'] as int?;
      fullName = data['name']?.toString() ?? '';
      phoneNumber = data['phone']?.toString() ?? '';
      age = data['age'] != null ? data['age'].toString() : '';
      medicalNotes = data['medicalNotes']?.toString() ?? '';
      gender = data['gender']?.toString() ?? 'Male';
      isMale = (gender == 'Male');
    }

    _isInit = true;
  }

  Future<void> updatePatientData() async {
    final patientData = PatientModelData();
    //patientData.id = patientId;
    patientData.fullName = fullName;
    patientData.phoneNumber = phoneNumber;
    patientData.age = int.tryParse(age ?? '0');
    patientData.medicalNotes = medicalNotes;
    patientData.gender = gender ?? (isMale ? 'Male' : 'Female');

    DatabaseHelper db = DatabaseHelper.instance;
    await db.updateData(
      table: 'patients',
      id: patientId!,

      /// Converts the Patient instance to a Map<String, dynamic> suitable for
      /// form initialization, JSON encoding, or database updates. The resulting
      /// map contains the patient's serializable fields (primitive values,
      /// lists, maps, and any nested objects converted to maps). This operation
      /// is non-destructive and does not mutate the original Patient object.
      values: patientData.toMap(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Patient',
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
              children: [
                const Text(
                  "Edit Patient",
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
                    children: [
                      // Full Name
                      CustomTextField(
                        label: 'Full Name',
                        icon: Icons.person,
                        initialValue: fullName,
                        onChanged: (value) => fullName = value,
                      ),
                      const SizedBox(height: 20),

                      // Phone
                      CustomTextField(
                        label: 'Phone Number',
                        icon: Icons.phone,
                        keyboardType: TextInputType.phone,
                        initialValue: phoneNumber,
                        onChanged: (value) => phoneNumber = value,
                      ),
                      const SizedBox(height: 20),

                      // Age (داخل Container كما طلبت سابقًا)
                      Container(
                        margin: const EdgeInsets.only(right: 150),
                        child: CustomTextField(
                          label: 'Age',
                          icon: Icons.access_time,
                          keyboardType: TextInputType.number,
                          initialValue: age,
                          onChanged: (value) => age = value,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Medical notes
                      CustomTextField(
                        label: 'Medical Notes',
                        icon: Icons.note,
                        maxLines: 3,
                        initialValue: medicalNotes,
                        onChanged: (value) => medicalNotes = value,
                      ),
                      const SizedBox(height: 30),
                      CustomButton(
                        text: 'Save Patient Data',
                        onPressed: () async {
                          if (_formstate.currentState!.validate()) {
                            gender = isMale ? 'Male' : 'Female';
                            await updatePatientData();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Patient $fullName updated'),
                                backgroundColor: Colors.green,
                              ),
                            );
                            Navigator.pop(context, true);
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
