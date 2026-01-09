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

  String? fullName, phoneNumber, age, medicalNotes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Add New Patient'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formstate,
          autovalidateMode: _autoValidateMode,
          child: Column(
            spacing: 16,
            children: [
              CustomTextField(
                label: 'Full Name',
                icon: Icons.person,
                onChanged: (value) {
                  fullName = value;
                },
              ),
              CustomTextField(
                label: 'Phone Number',
                icon: Icons.phone,
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  phoneNumber = value;
                },
              ),
              Container(
                margin: const EdgeInsets.only(right: 300),
                child: CustomTextField(
                  label: 'Age',
                  icon: Icons.calendar_today,
                  keyboardType: TextInputType.number,
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
                  if (_formstate.currentState!.validate()) {
                    print('Name: $fullName, Phone: $phoneNumber, Age: $age');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Saving $fullName Data...'),
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
