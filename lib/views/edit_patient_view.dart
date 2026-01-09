import 'package:flutter/material.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/custom_button.dart';

class EditPatientView extends StatefulWidget {
  const EditPatientView({super.key});

  @override
  State<EditPatientView> createState() => _EditPatientViewState();
}

class _EditPatientViewState extends State<EditPatientView> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  String? patientName;
  String? phoneNumber;
  String? age;
  String? medicalNotes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Edit Patient'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formState,
          autovalidateMode: _autoValidateMode,
          child: Column(
            spacing: 16,
            children: [
              CustomTextField(
                label: 'Patient Name',
                icon: Icons.person,
                onChanged: (value) {
                  patientName = value;
                },
              ),
              CustomTextField(
                label: 'Phone Number',
                icon: Icons.calendar_today,
                keyboardType: TextInputType.datetime,
                onChanged: (value) {
                  phoneNumber = value;
                },
              ),
              Container(
                margin: const EdgeInsets.only(right: 300),
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
                onChanged: (value) {
                  medicalNotes = value;
                },
              ),
              CustomButton(
                text: 'Save Patient Data',
                onPressed: () {
                  if (_formState.currentState!.validate()) {
                    print('Name: $patientName, Phone: $phoneNumber, Age: $age');

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Saving $patientName Data...'),
                        backgroundColor: Colors.teal,
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
      ),
    );
  }
}
